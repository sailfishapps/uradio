import QtQuick 1.1

Rectangle{
    height: 50
    width: parent.width
    color: "lightsteelblue"
  //  radius: 10
    anchors.topMargin: 0
    anchors.bottomMargin: 10
    gradient: Gradient {
          GradientStop { position: 0.0; color: "hotpink" }
          GradientStop { position: 1.0; color: "lightpink" }
      }
    property string strLogo: "Ugly Radio v"+version
    Text {
        text: strLogo
        color: "#111111"
        font.pixelSize: 32
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

}
