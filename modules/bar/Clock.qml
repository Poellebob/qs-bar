import QtQuick
import QtQuick.Layouts
import Quickshell

Item {
  id: clockRoot
  implicitHeight: rect.implicitHeight
  implicitWidth: rect.implicitWidth

  Rectangle {
    id: rect
    implicitHeight: panel.module_height
    implicitWidth: text.implicitWidth + 8
    color: "#636363"
    radius: 4

    Text {
      id: text
      text: Qt.formatDateTime(clock.date, "HH:mm")
      color: "white"
      anchors.centerIn: parent
    }
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}