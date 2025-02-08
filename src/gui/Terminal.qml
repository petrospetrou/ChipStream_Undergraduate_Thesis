import QtQuick 2.15
import QtQuick.Controls 2.15
import QMLTermWidget 1.0
Rectangle {

        radius: 15 // Set the corner radius
        clip: true // Ensure that the contents are clipped to the rounded corners

    Action{
        onTriggered: terminal.copyClipboard();
        shortcut: "Ctrl+Shift+C"
    }

    Action{
        onTriggered: terminal.pasteClipboard();
        shortcut: "Ctrl+Shift+V"
    }

    Action{
        onTriggered:{
            console.log('open new terminal window in:'+mainsession.currentDir)
        }
        shortcut: "Ctrl+Shift+T"
    }

    QMLTermWidget {
        id: terminal
        anchors.fill: parent
        anchors.margins: 5
        font.family: "Monospace"
        font.pointSize: 15
        colorScheme: "cool-retro-term"
        session: QMLTermSession{
            id: mainsession
            initialWorkingDirectory: "$HOME"
            onMatchFound: {
                console.log("found at: %1 %2 %3 %4".arg(startColumn).arg(startLine).arg(endColumn).arg(endLine));
            }
            onNoMatchFound: {
                console.log("not found");
            }
        }
        onTerminalUsesMouseChanged: console.log(terminalUsesMouse);
        onTerminalSizeChanged: console.log(terminalSize);
        Component.onCompleted: mainsession.startShellProgram();

        QMLTermScrollbar {
            terminal: terminal
            width: 20
            Rectangle {
                opacity: 0.4
                anchors.margins: 5
                radius: width * 0.5
                anchors.fill: parent
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: terminal.forceActiveFocus();
        }

    }

    Component.onCompleted: terminal.forceActiveFocus();

}
