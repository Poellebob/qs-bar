import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower

Item {
  id: batteryRoot
  implicitHeight: rect.implicitHeight
  implicitWidth: rect.implicitWidth

  Rectangle {
    id: rect
    anchors.centerIn: parent
    implicitHeight: panel.module_height
    implicitWidth: column.implicitWidth + 16
    color: "#636363"
    radius: 4
    border.color: "#ffff00"
    border.width: UPower.onBattery ? 0 : 1

    RowLayout {
      id: column
      anchors.centerIn: parent
      spacing: 2

      Text {
        text: "󰁹"
        color: "white"
        horizontalAlignment: Text.AlignHCenter
      }

      Text {
        id: percentageText
        font.bold: true
        text: UPower.displayDevice.ready
              ? Math.round(UPower.displayDevice.percentage) + "%"
              : "—"
        color: "white"
        horizontalAlignment: Text.AlignHCenter
      }
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      // Force property refresh
      percentageText.text = UPower.displayDevice.ready
        ? Math.round(UPower.displayDevice.percentage * 100) + "%" : "—"
    }
  }
}
