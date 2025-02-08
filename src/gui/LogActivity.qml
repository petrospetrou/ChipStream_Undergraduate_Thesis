import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./data"
Rectangle {

    width: parent.width/2.1
    radius: 20
    Label {
        id: sectionLabel
        anchors {
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        text: qsTr("Log Activity")
        color: Properties.textColor
        font.pixelSize: 24
        font.bold: true
        font.family: "monospace"

    }

    Rectangle {
        id: seperator
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

    Rectangle {
        id: logsArea
        anchors {
            left: parent.left
            leftMargin: 40
            right: parent.right
            rightMargin: 20
            top: parent.top
            topMargin: 80
            bottom: parent.bottom
            bottomMargin: 20
            fill: parent
        }
        color: "transparent"
        radius: 20


        ListView {
            id: logListView
            anchors.fill: parent
            anchors.margins: 10
            model: logManager.logMessages // This should be a ListModel or an array of strings
            clip: true
            ScrollBar.vertical: ScrollBar { active: true }

            delegate: Item {
                width: ListView.view.width
                // Adjust the height to include the record label and the two columns of log data separately
                height: recordLabel.height + Math.max(columnLeft.implicitHeight, columnRight.implicitHeight) + spacingBetweenItems + recordLabelSpacing

                // Custom property for spacing between items and the record label
                property int spacingBetweenItems: 20
                property int recordLabelSpacing: 10 // Spacing after the record label

                Text {
                    id: recordLabel
                    text: "Record " + (index + 1)
                    color: "white"
                    font.pixelSize: 16
                    width: parent.width
                    anchors.top: parent.top
                }

                Row {
                    // Adjust the positioning to be below the record label
                    anchors.top: recordLabel.bottom
                    anchors.topMargin: recordLabelSpacing
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 10

                    Column {
                        id: columnLeft
                        width: parent.width / 2

                        function createStyledText(textContent) {
                            var textItem = Qt.createQmlObject('import QtQuick 2.15; Text { }', columnLeft);
                            textItem.text = textContent;
                            textItem.color = "white";
                            textItem.font.pixelSize = 16;
                            textItem.wrapMode = Text.WrapAnywhere;
                            return textItem;
                        }
                    }

                    Column {
                        id: columnRight
                        width: parent.width / 2

                        function createStyledText(textContent) {
                            var textItem = Qt.createQmlObject('import QtQuick 2.15; Text { }', columnRight);
                            textItem.text = textContent;
                            textItem.color = "white";
                            textItem.font.pixelSize = 16;
                            textItem.wrapMode = Text.WrapAnywhere;
                            return textItem;
                        }
                    }
                }

                Component.onCompleted: {
                    var logEntryParts = modelData.split(", ");
                    var halfIndex = Math.ceil(logEntryParts.length / 2);
                    for (var i = 0; i < halfIndex; i++) {
                        columnLeft.createStyledText(logEntryParts[i]);
                    }
                    for (i = halfIndex; i < logEntryParts.length; i++) {
                        columnRight.createStyledText(logEntryParts[i]);
                    }
                }
            }



        }

    }

}
