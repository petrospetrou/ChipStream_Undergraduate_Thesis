import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: logPopup
    width: 300
    height: 200
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#f0f0f0"
        radius: 8

        Column {
            anchors.centerIn: parent
            spacing: 10

            Label {
                text: "Log Entry"
                font.pixelSize: 18
            }

            TextArea {
                id: logContent
                width: 280
                height: 100
            }

            Button {
                text: "Close"
                onClicked: logPopup.close()
            }
        }
    }

    // Function to open the popup and display a message
    function showLog(message) {
        logContent.text = message;
        logPopup.open();
    }
}
