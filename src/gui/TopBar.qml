import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QMLTermWidget 1.0
import "./data"
Item {
    required property Window rootWindow
    property var dragStartPosition
    readonly property string closeButtonColor: "#FF6961"
    readonly property string minimizeButtonColor: "#FFD400"
    readonly property string topBarButtonTextColor: "#0f0e0e"
    width: parent.width
    height: 30

    Rectangle {
        id: topBar
        anchors.fill: parent
        color: "#0d0d0d"

        Label {
            text: "ChipStream"
            anchors.centerIn: parent
            font.pixelSize: 18
            color: Properties.textColor
        }

        // Drag handling
        MouseArea {
            id: dragArea
            anchors.fill: parent
            cursorShape: Qt.DragMoveCursor

            onPressed: {
                dragStartPosition = Qt.point(mouseX, mouseY)
            }

            onPositionChanged: {
                if (dragArea.pressed) {
                    rootWindow.x += mouseX - dragStartPosition.x
                    rootWindow.y += mouseY - dragStartPosition.y
                }
            }
        }

        // Close Button
        RoundButton {
            id: closeButton // Added ID for clarity
            palette.button: closeButtonColor
            palette.buttonText: Properties.baseColor
            width: 17
            height: 17
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            onClicked: rootWindow.close()
            Text {
                anchors.centerIn: parent
                text: "X"
                color: topBarButtonTextColor
            }
        }

        // Minimize Button
        RoundButton {
            id: minimizeButton // Added ID for clarity
            palette.button: minimizeButtonColor
            palette.buttonText: Properties.baseColor
            width: 17
            height: 17
            anchors.right: closeButton.left // Adjusted for clarity
            anchors.rightMargin: 10 // Adjusted spacing to make room for fullScreenButton
            anchors.verticalCenter: parent.verticalCenter
            onClicked: rootWindow.showMinimized()
            Text {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 2
                anchors.horizontalCenter: parent.horizontalCenter
                text: "_"
                color: topBarButtonTextColor
            }
        }

        // Full Screen Toggle Button
        RoundButton {
            id: fullScreenButton
            palette.button: "#00FF00" // Set your preferred color
            palette.buttonText: Properties.baseColor
            width: 17
            height: 17
            anchors.right: minimizeButton.left
            anchors.rightMargin: 10 // Space between this and minimize button
            anchors.verticalCenter: parent.verticalCenter
            Text {
                anchors.centerIn: parent
                text: rootWindow.visibility === Window.FullScreen ? "M" : "F" // Change icon based on state
                color: topBarButtonTextColor
            }
            onClicked: {
                if (rootWindow.visibility === Window.FullScreen) {
                    rootWindow.showNormal();
                } else {
                    rootWindow.showFullScreen();
                }
            }
        }

    }

}
