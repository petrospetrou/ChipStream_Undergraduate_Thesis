import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "./data"
Rectangle {
    width: parent.width/2.1
    radius: 20

    property var parentWindow

    Label {
        id: sectionLabel
        anchors {
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        text: qsTr("Asynchronous Chip Data Packet")
        color: Properties.textColor
        font.pixelSize: 24
        font.bold: true
        font.family: "monospace"

    }

    Rectangle {
        anchors {
            left: parent.left
            leftMargin: 40
            right: parent.right
            rightMargin: 40
            top: sectionLabel.bottom
            topMargin: 20
        }
        height: 1
        opacity: 0.5
        color: "grey"
    }

    // Start Sequence at the top center
    Row {
        id: row1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: inputGrid.top
        anchors.bottomMargin: 20
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        spacing: 10

        Label {
            text: qsTr("Start Sequence")
            font.pixelSize: 16
            anchors.verticalCenter: parent.verticalCenter
            color: Properties.textColor
        }
        TextField {
            id: textFieldStartSequence
            width: 150
            text: "10101010101"
            anchors.verticalCenter: parent.verticalCenter

            // Customize TextField appearance
            background: Rectangle {
                color: Properties.baseColor // Dark background color
                radius: 10 // Rounded corners
            }

            // Text color
            color: Properties.textColor // Set text color to white for contrast
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            inputMethodHints: Qt.ImhDigitsOnly
            validator: RegExpValidator { regExp: /[0-9]+/ }
        }
    }

    Column {
        id: inputGrid
        width: parent/2
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 15
        }
        spacing: 20

        Row {
            spacing: 35
            Label {
                text: "Fault Tolerant Bits"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldFaultTolerantBits
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                // Enforce number only input
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }

        Row {
            spacing: 35
            Label {
                text: "X - Address"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldXAddress
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
        Row {
            spacing: 35
            Label {
                text: "Y - Address"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldYAddress
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
        Row {
            spacing: 35
            Label {
                text: "DAC 8"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldDAC8
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
        Row {
            spacing: 35
            Label {
                text: "DAC 7"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldDAC7
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
        Row {
            spacing: 35
            Label {
                text: "DAC 6"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldDAC6
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
    }

    Column {
        width: parent/2
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 15
        }
        spacing: 20

        Row {
            spacing: 15
            Label {
                text: "DAC 5"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldDAC5
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }

        Row {
            spacing: 15
            Label {
                text: "DAC 4"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldDAC4
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
        Row {
            spacing: 15
            Label {
                text: "DAC 3"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldDAC3
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
        Row {
            spacing: 15
            Label {
                text: "DAC 2"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldDAC2
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
        Row {
            spacing: 15
            Label {
                text: "DAC 1"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldDAC1
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
        Row {
            spacing: 15
            Label {
                text: "ACK"
                font.pixelSize: 16
                anchors.verticalCenter: parent.verticalCenter
                width: 100 // Ensure labels have enough space
                color: Properties.textColor
            }
            TextField {
                id: textFieldAck
                width: 150
                placeholderText: qsTr("Enter value")

                background: Rectangle {
                    color: Properties.baseColor // Dark background color
                    radius: 10 // Rounded corners
                }

                // Text color
                color: Properties.textColor // Set text color to white for contrast
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                inputMethodHints: Qt.ImhDigitsOnly
                validator: RegExpValidator { regExp: /[0-9]+/ }
            }
        }
    }


    RoundButton {
        id: buttonStart
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.right: parent.right
        anchors.rightMargin: parent.width/3
        height: 50
        radius: 15

        background: Rectangle {
            anchors.fill: parent
            color: buttonStart.pressed ? Properties.buttonBaseColor : Properties.buttonClickedColor
            radius: buttonStart.radius
            Text {
                text: qsTr("Start Sending Bits")
                font.pixelSize: 16
                color: Properties.textColor
                font.bold: true
                font.family: "monospace"
                anchors.centerIn: parent
            }
        }

        onClicked: {
            // Collect all the text fields data and send them to C++ class Collector
            console.log(textFieldStartSequence.text)
            systemController.startSendingBitsProcess(parentWindow.saveData, parentWindow.startProtocol, parentWindow.enableSimulation,
                                                     textFieldStartSequence.text, textFieldFaultTolerantBits.text,
                                                     textFieldXAddress.text, textFieldYAddress.text,
                                                     textFieldDAC8.text, textFieldDAC7.text, textFieldDAC6.text,
                                                     textFieldDAC5.text, textFieldDAC4.text, textFieldDAC3.text, textFieldDAC2.text,
                                                     textFieldDAC1.text, textFieldAck.text);
            logManager.displayData(textFieldStartSequence.text, textFieldFaultTolerantBits.text,
                                   textFieldXAddress.text, textFieldYAddress.text,
                                   textFieldDAC8.text, textFieldDAC7.text, textFieldDAC6.text,
                                   textFieldDAC5.text, textFieldDAC4.text, textFieldDAC3.text, textFieldDAC2.text,
                                   textFieldDAC1.text, textFieldAck.text);

            isFieldsFilled = false;
            initialisationState();
        }
    }
    property bool isFieldsFilled: false

    RoundButton {
        id: buttonAuto
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.left: buttonStart.right
        anchors.leftMargin: 10
        height: 50
        radius: 15
        palette.button: "grey"
        font.pixelSize: 16
        Text {
            text: isFieldsFilled ? "Clear" : "Auto - Fill Sequence"
            color: "white"
            font.pixelSize: 16
            font.bold: true
            font.family: "monospace"
            anchors.centerIn: parent
        }
        //Uncommenct the following to test the Log Activity (For testing Purpose only)
        onClicked: {
            if (!isFieldsFilled) {
                updateFieldsWithRandomBinary(); // Fill with random binary values
            } else {
                // Clear all fields, can call the same function if adapted for toggling
                initialisationState();
                isFieldsFilled = false; // Ensure this is set correctly after clearing
            }
        }

        // JavaScript function within QML to Ramdomly fill the Inputs
        function updateFieldsWithRandomBinary() {
            var fields = [
                { id: textFieldDAC8, length: 8 },
                { id: textFieldDAC7, length: 8 },
                { id: textFieldDAC6, length: 8 },
                { id: textFieldDAC5, length: 8 },
                { id: textFieldDAC4, length: 8 },
                { id: textFieldDAC3, length: 8 },
                { id: textFieldDAC2, length: 9 },
                { id: textFieldDAC1, length: 9 },
            ];

            // Setting specific fields to '0' directly
            textFieldFaultTolerantBits.text = "00";
            textFieldXAddress.text = "000000000";
            textFieldYAddress.text = "000000000";
            textFieldAck.text = "000";

            function generateRandomBinary(length) {
                var result = '';
                for (var i = 0; i < length; i++) {
                    result += Math.floor(Math.random() * 2).toString();
                }
                return result;
            }

            for (var i = 0; i < fields.length; i++) {
                fields[i].id.text = generateRandomBinary(fields[i].length);
            }
            isFieldsFilled = !isFieldsFilled; // Toggle the state
        }

    }
    function initialisationState() {
        var fields = [
            { id: textFieldFaultTolerantBits},
            { id: textFieldXAddress},
            { id: textFieldYAddress},
            { id: textFieldDAC8},
            { id: textFieldDAC7},
            { id: textFieldDAC6},
            { id: textFieldDAC5},
            { id: textFieldDAC4},
            { id: textFieldDAC3},
            { id: textFieldDAC2},
            { id: textFieldDAC1},
            { id: textFieldAck},
        ];

        for (var i = 0; i < fields.length; i++) {
            fields[i].id.text = ""; // Clear the text for each TextField
        }

        parentWindow.saveData = false;
        parentWindow.startProtocol = false;
        parentWindow.enableSimulation = false;
    }
}
