import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower

Item {
  id: batteryRoot
  implicitHeight: rect.implicitHeight
  implicitWidth: rect.implicitWidth
  visible: UPower.displayDevice.percentage == 0 ? false : true

  Rectangle {
    id: rect
    anchors.centerIn: parent
    implicitHeight: panel.format.module_height
    implicitWidth: column.implicitWidth + 16
    color: panel.colors.dark_surface_variant
    radius: 4
    border.color: panel.colors.dark_primary
    border.width: UPower.onBattery ? 0 : 1

    RowLayout {
      id: column
      anchors.centerIn: parent
      spacing: 2

      Text {
        text: batteryRoot.batteryIcon(UPower.displayDevice.iconName)
        color: panel.colors.dark_on_surface_variant
        font.pixelSize: panel.format.text_size
        horizontalAlignment: Text.AlignHCenter
      }

      Text {
        id: percentageText
        text: "NaN%"
        color: panel.colors.dark_on_surface_variant
        font.pixelSize: panel.format.text_size
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
  function batteryIcon(name) {
    switch (name) {
    case "battery-empty-symbolic":
        return "󰂎";
    case "battery-caution-symbolic":
        return "󰂃";
    case "battery-low-symbolic":
        return "󱊡";
    case "battery-good-symbolic":
        return "󱊢";
    case "battery-full-symbolic":
        return "󱊣";
    case "battery-charging-symbolic":
        return "󰂄";
    default:
        return "󰁹";
    }
  }
}
