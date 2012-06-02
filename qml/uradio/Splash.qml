import QtQuick 1.0

Rectangle {
//    width:  parent.width
  //  height: parent.height
    id: rect
    color: "black"
    opacity: 0.7
    z: 1
    rotation: channel.replace("SR ", "").length>4 ? 90 : 0
    Text {
        id: idText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: channel=="" ? 76 : 128
        color: "hotpink"
        text: channel=="" ? "URadio<br /><center>v"+version+"</center>" : channel.replace("SR ", "")
    }

    states: [
        State{
            name: "normal"
            PropertyChanges {
                target: rect
                width:  parent.width
                height:  parent.height
            }
        },
        State{
            name: "rotated"
            when: (rect.rotation==90)
            PropertyChanges {
                target: rect
                width:  parent.height
                height:  parent.width
            }
        }
    ]
}
