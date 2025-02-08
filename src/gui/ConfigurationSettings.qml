import QtQuick 2.15
import QtQuick.Controls 2.15
import "./data"

Rectangle {
    id: activityOverlay
    width: parent.width  // Assuming you want the width to match the parent width
    color: "lightgrey"
    radius: 20

    // Calculate the height of the rectangle based on the implicit height of the checkboxes
    height: checkBoxContainer.implicitHeight + 20 // Additional margin


    property var parentWindow

    Row {
        id: checkBoxContainer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 15
        spacing: 10

        Button {
            id: saveButton
            text: "Save Data to Non-Volatile Storage"
            height: 40 // Set the button's height
            onClicked: parentWindow.saveData = !parentWindow.saveData

            // Customizing the button background to include rounded corners
            background: Rectangle {
                radius: 10 // Sets the corner radius
                // Change color based on down state and parentWindow.saveData
                color: (saveButton.down || parentWindow.saveData) ? "#d3d3d3" : "grey"
                anchors.fill: parent // Ensure the background fills the button
            }
        }



        Button {
            id: transferButton
            text: "Start Transferring Protocol"
            height: 40 // Set the button's height
            onClicked: parentWindow.startProtocol = !parentWindow.startProtocol

            // Customizing the button background to include rounded corners
            background: Rectangle {
                radius: 10 // Sets the corner radius
                color: (transferButton.down || parentWindow.startProtocol) ? "#d3d3d3" : "grey" // Change color when pressed
                anchors.fill: parent // Ensure the background fills the button
            }
        }

        Button {
            id: enableSimulationButton
            text: "Enable Simulation Mode"
            height: 40 // Set the button's height
            onClicked: parentWindow.enableSimulation = !parentWindow.enableSimulation

            // Customizing the button background to include rounded corners
            background: Rectangle {
                radius: 10 // Sets the corner radius
                color: (enableSimulationButton.down || parentWindow.enableSimulation) ? "#d3d3d3" : "grey" // Change color when pressed
                anchors.fill: parent // Ensure the background fills the button
            }
        }

    }
}
