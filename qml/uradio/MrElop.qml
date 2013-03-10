import QtQuick 1.1
import Sailfish.Silica 1.0

Page {
    id: page1
    Column{

        id: column1
        anchors.centerIn: parent
        spacing: 5
        Label {
            font.pixelSize: 72
            color: "green"
            text: "Mr Elop!"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }


        Label {
           // width: 100
            height: 120
            font.pixelSize: 48
            color: "chocolate"
            text: "Nokia really should<br />consider purchasing"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WordWrap

        }
        Label {
            height: 120
            font.pixelSize: 48
            color: "cyan"
            anchors.horizontalCenter: parent.horizontalCenter
            text: "SailfishOS License"
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter

        }
        Label {
            font.pixelSize: 48
            color: "white"
            text: "On nextgen<br />Nokia devices!"
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }
    }
    MouseArea{
        anchors.fill: parent

        onClicked: pageStack.pop()
    }
    /*
    ToolBarLayout {
        id: backTools
        visible: true
        ToolIcon {
                 iconId: "toolbar-back";
                 onClicked: pageStack.pop()
        }
    }
    */
}
