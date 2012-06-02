// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0
Page {
    Column{
        anchors.fill: parent
        spacing: 6
        Slider{
            id: slide
            minimumValue:0
            maximumValue:19
            width:400
            value: 1
            onValueChanged: {
                theme.color = slide.value
            }

        }

        Button {
            text: "Done"
            onClicked: pageStack.pop();
        }
    }
}
