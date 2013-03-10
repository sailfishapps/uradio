import QtQuick 1.1
import Sailfish.Silica 1.0

ApplicationWindow {
    property Button curSelButton
    property string channel: ""
    property string version: "0.9.9"
    // To enable PullDownMenu, place our content in a SilicaFlickable
    initialPage: MainPage {
        id: first
        width: parent.width
        height: parent.height
    }
}


