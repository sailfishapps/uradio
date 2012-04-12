import QtQuick 1.1
import com.nokia.meego 1.0
import QtMultimediaKit 1.1
import QtMobility.feedback 1.1
Page {
    tools: commonTools

    property int retrys
    orientationLock: PageOrientation.LockPortrait

    HapticsEffect {
        id: vib
        attackIntensity: 0.0
        attackTime: 250
        intensity: 1.0
        duration: 100
        fadeTime: 250
        fadeIntensity: 0.0
    }


    Timer
    {
        id: timer
        interval: 1000; running: false; repeat: false
        onTriggered:{
            playMusic.play()
        }
    }

    Audio {
        id: playMusic
        onStarted: labelStatus.text="<center><u>Listen to:</u></center><center><b>"+channel+"</center></b>"
        onStopped:{
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

    function play(ch, url)
    {
        /* user actually changed channel using button, so retrys will reset */
        vib.start()
        retrys=0
        channel=ch
        labelStatus.text="please wait..."
        playMusic.source=url
        playMusic.play()
    }

    Rectangle{
        anchors.fill: parent
//        color: "black"
        gradient: Gradient {
              GradientStop { position: 0.0; color: "#050505" }
              GradientStop { position: 1.0; color: "#333333" }
          }


        TopPanel{
            anchors.top: parent.top
        }
        Splash{
            id: splash
            anchors.centerIn: parent
            visible: platformWindow.viewMode==WindowState.Thumbnail ? true : false
        }

        Column {
            spacing: 12
            anchors.centerIn: parent

            Label {
                id: labelStatus
                color: "magenta"
                height: 50
                width: parent.width
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Sveriges Radio - P1")
                onClicked:     play(text, "http://http-live.sr.se/p1-aac-96")
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Sveriges Radio - P2")
                onClicked:     play(text, "http://http-live.sr.se/p2-aac-96")
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Sveriges Radio - P3")
                onClicked:     play(text, "http://http-live.sr.se/p3-aac-96")
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Sveriges Radio - P4 Sporten")
                onClicked:     play(text, "http://http-live.sr.se/p4sport-aac-96")
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Sveriges Radio - Världen")
                onClicked:     play(text, "http://http-live.sr.se/srvarlden-aac-96")
            }
            Rectangle{
                height: 20
                width: parent.width
                opacity: 0.001
            }
            Button{
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Stop player")
                onClicked:
                {
                    channel=""
                    vib.start()
                    playMusic.stop()
                }
            }
        }
    }
}
