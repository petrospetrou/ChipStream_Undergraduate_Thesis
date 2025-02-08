#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_log.h"
#include "driver/uart.h"
#include "driver/gpio.h"
#include "nvs.h"
#include "nvs_flash.h"
#include "string.h"

#define BUF_SIZE (1024)
#define DATA_PIN_0 GPIO_NUM_21
#define DATA_PIN_1 GPIO_NUM_22
#define ACK_PIN GPIO_NUM_23

// Function to print a byte in binary format
void print_byte_in_binary(uint8_t byte) {
    for (int i = 7; i >= 0; i--) {
        putchar((byte & (1 << i)) ? '1' : '0');
    }
}

// Function to read and print data from NVS
void read_and_print_data_from_nvs() {
    nvs_handle_t my_handle;
    esp_err_t err;

    err = nvs_open("storage", NVS_READONLY, &my_handle);
    if (err != ESP_OK) {
        printf("Error (%s) opening NVS handle!\n", esp_err_to_name(err));
        return;
    }

    size_t required_size = 0;
    err = nvs_get_blob(my_handle, "data_key", NULL, &required_size);
    if (err == ESP_OK && required_size > 0) {
        uint8_t* data = malloc(required_size);
        if (data != NULL) {
            err = nvs_get_blob(my_handle, "data_key", data, &required_size);
            if (err == ESP_OK) {
                printf("Data from NVS: ");
                for (int i = 0; i < required_size; i++) {
                    print_byte_in_binary(data[i]);
                    printf(" ");
                }
                printf("\n");
            } else {
                printf("Failed to read data from NVS (%s).\n", esp_err_to_name(err));
            }
            free(data);
        } else {
            printf("Failed to allocate memory for data.\n");
        }
    } else {
        printf("No data found in NVS under 'data_key'.\n");
    }

    nvs_close(my_handle);
}

// Initialize NVS
void init_nvs(void) {
    // Initialize Non - Volatile Storage
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);
}

// Initialize UART
void init_uart(void) {
    const uart_config_t uart_config = {
            .baud_rate = 115200,
            .data_bits = UART_DATA_8_BITS,
            .parity = UART_PARITY_DISABLE,
            .stop_bits = UART_STOP_BITS_1,
            .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
    };
    uart_driver_install(UART_NUM_0, BUF_SIZE * 2, 0, 0, NULL, 0);
    uart_param_config(UART_NUM_0, &uart_config);
}

// Initialize GPIO for dual-rail protocol
void init_dual_rail_protocol() {
    gpio_set_direction(DATA_PIN_1, GPIO_MODE_OUTPUT);
    gpio_set_direction(DATA_PIN_0, GPIO_MODE_OUTPUT);
    gpio_set_direction(ACK_PIN, GPIO_MODE_INPUT);
}

// Task to handle UART communication
void uart_task(void *pvParameters) {
    uint8_t data[BUF_SIZE];
    nvs_handle_t my_handle;
    esp_err_t err;

    // Open NVS handle
    err = nvs_open("storage", NVS_READWRITE, &my_handle);
    if (err != ESP_OK) {
        printf("Error (%s) opening NVS handle!\n", esp_err_to_name(err));
        vTaskDelete(NULL); // Stop task if unable to open NVS
    }

    while (1) {
        int len = uart_read_bytes(UART_NUM_0, data, BUF_SIZE, pdMS_TO_TICKS(100));
        if (len > 0) {
            // Print received data
            printf("Received %d bytes: ", len);
            for (int i = 0; i < len; i++) {
                print_byte_in_binary(data[i]);
                printf(" ");
            }
            printf("\n");

            // Save received data to NVS
            err = nvs_set_blob(my_handle, "data_key", data, len);
            if (err == ESP_OK) {
                err = nvs_commit(my_handle); // Commit the write
                if (err != ESP_OK) {
                    printf("Failed to commit data to NVS (%s).\n", esp_err_to_name(err));
                }
            } else {
                printf("Failed to write data to NVS (%s).\n", esp_err_to_name(err));
            }
        }

        vTaskDelay(pdMS_TO_TICKS(100));
    }

    nvs_close(my_handle);
}

// Main application - Entry Point
void app_main(void) {

    init_nvs(); // Initialise NVS
    init_uart(); // Initialize UART for communication
    init_dual_rail_protocol(); // Initialise Async Communication Protocol

    printf("\n");
    read_and_print_data_from_nvs(); // Check for and print any previously stored data

    // Start the UART task
    xTaskCreate(uart_task, "uart_task", 4096, NULL, 10, NULL);

}
