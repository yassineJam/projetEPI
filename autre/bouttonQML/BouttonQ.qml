import QtQuick 2.9
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0


Rectangle {
    id: redRect
    width: container.width
    height: container.height
    color: "red"

    MouseArea {
        id: mouseArea;
        anchors.fill: parent
        onClicked: {
            container.clicked();
        }
    }

    Text {
        color: "#fff"
        anchors.centerIn: redRect
        font.pixelSize: 12
        text: "START !"
    }

    states: State {
        name: "pressed"; when: mouseArea.pressed
        PropertyChanges { target: redRect; scale: 1.2 }
    }

    transitions: Transition {
        NumberAnimation { properties: "scale"; duration: 200; easing.type: Easing.InOutQuad }
    }
}