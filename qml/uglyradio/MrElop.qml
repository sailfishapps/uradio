import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    Rectangle{
        gradient: Gradient {
              GradientStop { position: 0.0; color: "#050505" }
              GradientStop { position: 1.0; color: "#333333" }
          }


        width: parent.width
        height: parent.height
        Column{

            id: column1
            anchors.centerIn: parent
            spacing: 5
            Text {
                font.pixelSize: 72
                color: "green"
                text: "Mr Elop!"
                anchors.horizontalCenter: parent.horizontalCenter

            }


            Text {
                font.pixelSize: 48
                color: "magenta"
                anchors.horizontalCenter: parent.horizontalCenter
                text: "<center>Maemo</center><center>Harmattan</center><center>and</center><center>Qt</center>"

            }
            Text {
                font.pixelSize: 48
                color: "cyan"
                anchors.horizontalCenter: parent.horizontalCenter
                text: "<u>ROCKS!</u>"

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
