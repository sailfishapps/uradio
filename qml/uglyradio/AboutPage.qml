import QtQuick 1.1
import com.nokia.meego 1.0



Page {
 //   tools: backTools
    Rectangle{
        gradient: Gradient {
              GradientStop { position: 0.0; color: "#050505" }
              GradientStop { position: 1.0; color: "#333333" }
          }


        width: parent.width
        height: parent.height
        Column{
            anchors.centerIn: parent
            spacing: 15
            Text {
                font.pixelSize: 72
                color: "magenta"
                text: "Ugly Radio!"
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Text {
                font.pixelSize: 48
                color: "white"
                text: "Version: "+version
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Text {
                font.pixelSize: 48
                color: "cyan"
                text: "<center>Copyright 2011</center><center>Mikael Hermansson</center>"
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Text {
                font.pixelSize: 32
                color: "gray"
                text: "This app is public domain with one exception, You are not allowed to port this application to WP platform :)"
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                height: 70
                width: parent.width-16
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
