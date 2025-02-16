Here's a reference guide structured as a README.md file for your project. This guide includes instructions for setting up the project, which utilizes both Qt Widgets and Qt Quick, and integrates with external libraries like qmltermwidget.

---

# ChipStream

This project demonstrates a Qt application that integrates Qt Widgets and Qt Quick for a comprehensive user interface experience. It includes four main QML pages: `Terminal.qml`, `InputParam.qml`, `LogActivity.qml`, and `TopBar.qml`, with the `TopBar` incorporating title, close, and minimize buttons.

## Built With

- Qt 5.15.2
- QMake (not CMake)
- Qt Widgets
- Qt Quick

## External Dependencies

This project uses the `qmltermwidget` library for embedding a terminal within the Qt Quick application. To incorporate this library:

1. Clone the `qmltermwidget` repository from GitHub:

    ```sh
    git clone https://github.com/Swordfish90/qmltermwidget.git
    ```

2. Build and install the library:

    - Navigate to the `qmltermwidget` directory.
    - Use qmake to prepare the build configuration:

        ```sh
        qmake
        ```

    - Build the project:

        ```sh
        make
        ```

    - Install the library (might require superuser privileges):

        ```sh
        make install
        ```

## Setting Up the Project

To set up this project for development:

1. Ensure Qt 5.15.2 and QMake are installed on your system.

2. Clone the project repository to your local machine.

3. Follow the instructions in the "External Dependencies" section to install `qmltermwidget`.

4. Open the project file (`project.pro`) in Qt Creator or via the command line with QMake to generate the build configuration.

5. Build the project:
    - In Qt Creator, use the build option.
    - Or, in the terminal, navigate to the project directory and run:

        ```sh
        qmake
        make
        ```

6. Run the application.

## Project Structure

The project includes four main QML pages:

- `Terminal.qml`: Integrates `qmltermwidget` for terminal functionality.
- `InputParam.qml`: Manages input parameters with text fields and buttons.
- `LogActivity.qml`: Displays log messages in a scrollable view.
- `TopBar.qml`: Provides a custom title bar with close and minimize buttons, along with drag functionality.

Each QML file is designed to be modular, allowing easy integration and reuse within the project.

## Usage

After launching the application, navigate through the different QML pages via the navigation provided in the UI. Each page serves a specific function:

- **Terminal**: Interact with a shell terminal embedded within the application.
- **Input Parameters**: Enter data through text fields and submit them for processing.
- **Log Activity**: View real-time log messages generated by the application.
- **Top Bar**: Utilize the custom title bar to move, close, or minimize the application window.

## Contributing

Contributions to enhance the application or fix bugs are welcome. Please follow these steps to contribute:

1. Fork the project repository.
2. Create a feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.

---
