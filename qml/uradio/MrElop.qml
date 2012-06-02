import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: page1
    orientationLock: PageOrientation.LockPortrait
    Column{

        id: column1
        anchors.centerIn: parent
        spacing: 5
        Text {
            font.pixelSize: 72
            color: "green"
            text: "Mr Elop!"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }


        Text {
           // width: 100
            height: 120
            font.pixelSize: 48
            color: "chocolate"
            text: "Maemo6 Harmattan<br />and QtQuick"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.NoWrap

        }
        Text {
            height: 120
            font.pixelSize: 48
            color: "cyan"
            anchors.horizontalCenter: parent.horizontalCenter
            text: "is a great platform!"
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter

        }
        Text {
            font.pixelSize: 48
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            text: "It <b>must</b> stay!"

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
