import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    property string channel
    property string version: "0.9.3"
    Component.onCompleted: { theme.inverted = true }

    function openFile(file) {
        var component = Qt.createComponent(file)

           if (component.status == Component.Ready)
                  pageStack.push(component);
         //  else
           //    labelStatus.text=component.errorString();


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
            MenuItem {
                text: qsTr("Mr Elop!")
                onClicked: openFile("MrElop.qml")
            }
            MenuItem {
                text: qsTr("About Ugly Radio")
                onClicked: openFile("AboutPage.qml")
            }
        }
    }

}
