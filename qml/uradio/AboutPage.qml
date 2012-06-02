import QtQuick 1.1
import com.nokia.meego 1.0



Page {
 //   tools: backTools
    orientationLock: PageOrientation.LockPortrait
        Column{
            id: column1
            anchors.fill: parent
            spacing: 15

            Image{
                source: "qrc:/uradio_large.png"
                height: 200
                width: 200
                fillMode: Image.PreserveAspectFit
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }

            }
//            anchors.centerIn: parent

            Text {
                font.pixelSize: 32
                color: "white"
                text: "Version: "+version
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Rectangle{
                gradient: Gradient {
                      GradientStop { position: 0.0; color: "#333333" }
                      GradientStop { position: 1.0; color: "#777777" }
                  }
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                height: 3
                width: parent.width-64
            }

            Text {
                width: 360
                font.pixelSize: 32
                color: "white"
                text: "<center>Copyright 2011-2012</center><center>Mikael Hermansson</center><center>with design help from</center><center>Sophie Wikström</center>"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                height: 200
            }

            Rectangle{
                gradient: Gradient {
                      GradientStop { position: 0.0; color: "#333333" }
                      GradientStop { position: 1.0; color: "#777777" }
                  }
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                height: 3
                width: parent.width-64
            }

            Text {
                width: parent.width-70
                font.pixelSize: 20
                color: "gray"
                text: "This app is public domain with one exception, You are not allowed to port this application to WP :)"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignHCenter
                height: 200
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
