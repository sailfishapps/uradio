import QtQuick 1.1
import Sailfish.Silica 1.0
import QtMultimediaKit 1.1
import QtMobility.feedback 1.1
Page {

    property int retrys
    property int whatx

    SilicaFlickable {
        anchors.fill: parent
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About URadio"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: qsTr("Mr Elop!")
                onClicked: pageStack.push(Qt.resolvedUrl("MrElop.qml"))
            }
        }

        contentHeight: childrenRect.height

        // Tell SilicaFlickable the height of its content.

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            spacing: 12
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            Image{
                source: "qrc:/uradio_large.png"
                height: 200
                width: 200
                fillMode: Image.PreserveAspectFit
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: openFile("AboutPage.qml");
                }

            }
//            anchors.centerIn: parent
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

            Label {
                id: labelStatus
                color: theme.primaryColor
                horizontalAlignment: Text.AlignHCenter
                height: 80
                width: parent.width
                font.pixelSize: theme.fontSizeMedium
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Stop")
                onClicked:
                {
                    channel=""
                    vib.start()
                    playMusic.stop()
                }
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

            Item{
                /* dumy item */
                height: 10
                width: parent.width
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
        //        checkable: true
                text: qsTr("SR P1")
                onClicked:     play(text, "http://http-live.sr.se/p1-ogg-vbr.ogg", this)
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
      //          checkable: true
                text: qsTr("SR P2")
                onClicked:     play(text, "http://http-live.sr.se/p2-ogg-vbr.ogg", this)
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
    //            checkable: true
                text: qsTr("SR P3")
                onClicked:     play(text, "http://http-live.sr.se/p3-ogg-vbr.ogg", this)
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
  //              checkable: true
                text: qsTr("SR P4 Sporten")
                onClicked:     play(text, "http://http-live.sr.se/p4sport-ogg-vbr.ogg", this)
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
//                checkable: true
                text: qsTr("SR Världen")
                onClicked:     play(text, "http://http-live.sr.se/srvarlden-ogg-vbr.ogg", this)
            }
            Rectangle{
                height: 20
                width: parent.width
                opacity: 0.001
            }
            /*
            Rectangle {
                width: parent.width
                height: 100
                MouseArea {
                    anchors.fill: parent
                    onPressed:
                    {
                        parent.whatx=mouse.x+100
                        console.log("hello\n");
                    }

                    onReleased:
                    {
                        console.log("hello\n");
                      // if (mouse.x>parent.whatx)
                             pageStack.pop()
                    }
                }
             }
             */
        //}

        }
    }

    HapticsEffect {
        id: vib
        attackIntensity: 0.0
        attackTime: 250
        intensity: 1.0
        duration: 100
        fadeTime: 250
        fadeIntensity: 0.0
    }


    Audio {
        id: playMusic
        onStarted: {
            /* because QML is broken */
        //    labelStatus.text="Please wait..."
        }
        onStopped:{
            //curSelButton.checked=false;
            if (channel!="" && retrys==100)
            {
                labelStatus.text="retry "+retrys+" times, gave up :-("
            }
            else if (channel!="") {
                labelStatus.text="retry in 2 seconds"
                retrys++
                timer.start()
            }
            else {
                /* user actually stoped player so we reset retry */
                retrys=0;
                labelStatus.text=""
            }
        }
        onError: labelStatus.text="broken pipe"

        onStatusChanged: {
            if (playMusic.status==Audio.Buffered)
            {
                labelStatus.text="<u>Listen to:</u></center><center><b>"+channel+"</b>"
            }
        }

    }


    Timer
    {
        id: timer
        interval: 1000; running: false; repeat: false
        onTriggered:{
            playMusic.play()
        }
    }


    function f(err, str)
    {
       /* sometimes radio disconnect here we try again
            this is a bit quick&dirty we need to check better
            what type of connection etc... */
/*        if (err==NetworkError){
            playMusic.play();
        }
        */


    }

    function play(ch, url, b)
    {
        /* user actually changed channel using button, so retrys will reset */
      //  vib.start()
        retrys=0
        channel=""
        playMusic.stop()
        labelStatus.text="please wait...\nBuffering..."
        playMusic.source=url
        channel=ch
        playMusic.play()
        curSelButton=b
    }

//    Rectangle{
    //      anchors.fill: parent
      //  opacity: 0.0
        //        color: "black"
/*
        gradient: Gradient {
              GradientStop { position: 0.0; color: "#001155" }
              GradientStop { position: 1.0; color: "#001122" }
          }
*/

/*
        Splash{
            id: splash
            anchors.centerIn: parent
            visible: platformWindow.viewMode==WindowState.Thumbnail ? true : false
        }
*/

}
