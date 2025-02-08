import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "./data"

ApplicationWindow {
    id: appWindow
        width: 1280
        height: 960
        visible: true
        title: qsTr("ChipStream")
        flags: Qt.FramelessWindowHint

        property bool saveData: false
        property bool startProtocol: false
        property bool enableSimulation: false

        // Right edge for horizontal resize
        MouseArea {
            id: rightResizeArea
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 10 // Width of the resizable area
            cursorShape: Qt.SizeHorCursor // Change cursor shape

            property point lastMousePosition: Qt.point(0, 0)

            onPressed: {
                lastMousePosition = Qt.point(mouse.x, mouse.y)
            }

            onMouseXChanged: {
                if (rightResizeArea.pressed) {
                    var dx = mouse.x - lastMousePosition.x
                    appWindow.width += dx
                    lastMousePosition = Qt.point(mouse.x, mouse.y)
                }
            }
        }

        // Bottom edge for vertical resize
        MouseArea {
            id: bottomResizeArea
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 10 // Height of the resizable area
            cursorShape: Qt.SizeVerCursor // Change cursor shape

            property point lastMousePosition: Qt.point(0, 0)

            onPressed: {
                lastMousePosition = Qt.point(mouse.x, mouse.y)
            }

            onMouseYChanged: {
                if (bottomResizeArea.pressed) {
                    var dy = mouse.y - lastMousePosition.y
                    appWindow.height += dy
                    lastMousePosition = Qt.point(mouse.x, mouse.y)
                }
            }
        }


    //TODO: Darker color palette select
    //TODO: Folded corner design
    //TODO: Give client different color schemes
    //TODO: Input fields information

    TopBar {
        id: topBar
        rootWindow: appWindow
    }


    // Application content goes here
    Rectangle {
        id: mainRectangle
        y: topBar.height
        color: Properties.baseColor
        anchors.fill: parent
        anchors.topMargin: topBar.height

        InputParam {
            anchors {
                top: parent.top
                topMargin: 20
                bottom: terminalWindow.top
                bottomMargin: 20
                left: parent.left
                leftMargin: 20
            }
            color: Properties.topColor
            parentWindow: appWindow
        }

        ConfigurationSettings {
            id: configurationSettings
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: logActivity.right  // Match the right side of LogActivity
            anchors.left: logActivity.left  // Match the left side of LogActivity
            height: 70 // Example height, adjust as needed
            color: Properties.topColor
            parentWindow: appWindow
        }

        LogActivity {
            id: logActivity
            // Adjust LogActivity positioning to accommodate ConfigurationSettings above it
            anchors {
                top: configurationSettings.bottom
                topMargin: 20  // Adjust this margin as needed for visual spacing
                right: parent.right
                rightMargin: 20
                bottom: terminalWindow.top
                bottomMargin: 20
            }
            color: Properties.topColor
            // You may need to explicitly set the height if it's not automatically adjusted
        }

        Terminal {
            id: terminalWindow
            anchors {
                bottom: parent.bottom
                bottomMargin: 20
                horizontalCenter: parent.horizontalCenter
            }
            color: Properties.topColor
            width: parent.width - 40
            height: parent.height / 3

        }
    }
}
