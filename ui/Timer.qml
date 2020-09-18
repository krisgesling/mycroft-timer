import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft

import "timer-util.js" as Util

Mycroft.ProportionalDelegate {
    id: timerFrame
    skillBackgroundColorOverlay: sessionData.expired ? "#DB406B" : "#40DBB0"
    property bool hasTitle: sessionData.title.length > 0 ? true : false
    property var timeRemaining: sessionData.time_remaining

    Component.onCompleted: {
        console.log(hasTitle)
    }

    Mycroft.AutoFitLabel {
        id: timerName
        Layout.fillWidth: true
        Layout.preferredHeight: proportionalGridUnit * 20
        wrapMode: Text.Wrap
        visible: hasTitle
        enabled: hasTitle
        font.family: "Noto Sans"
        font.weight: Font.Bold
        text: sessionData.title
    }

    Mycroft.AutoFitLabel {
        id: timerCountdown
        Layout.fillWidth: true
        Layout.preferredHeight: proportionalGridUnit * 30
        wrapMode: Text.Wrap
        font.family: "Noto Sans"
        font.weight: Font.Bold
        text: Util.formatTime(timerFrame.timeRemaining)
    }

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: timerCountdown.text = Util.countdown(timeRemaining)
    }
}
