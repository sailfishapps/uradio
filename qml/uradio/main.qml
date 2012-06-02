import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    property Button curSelButton
    property string channel
    property string version: "0.9.7"
    Component.onCompleted: {
        theme.inverted=true;
    }

    function openFile(file) {
        var component = Qt.createComponent(file)
        console.log("yeah")
           if (component.status == Component.Ready)
                  pageStack.push(component);
         //  else
           //    labelStatus.text=component.errorString();


     }

    platformStyle: PageStackWindowStyle {
//             landscapeBackground: "backgroundImageLandscape.png"
       //      portraitBackground: "file://opt/uglyradio/images/cross.png"
             background: "file://opt/uglyradio/images/stripes.png"
             backgroundFillMode: Image.Stretch
         }

    MainPage {
        id: mainPage
    }


    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
/*
            MenuItem {
                text: qsTr("Settings")
                onClicked: openFile("Settings.qml")
            }
      */
            MenuItem {
                text: qsTr("Mr Elop!")
                onClicked: openFile("MrElop.qml")
            }
            MenuItem {
                text: qsTr("About URadio")
                onClicked: openFile("AboutPage.qml")
            }
        }
    }

}
