import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Item {
  id: audioRoot

  implicitHeight: rect.implicitHeight
  implicitWidth: rect.implicitWidth
  property PwNode defaultNode: Pipewire.defaultAudioSink

  Rectangle {
    id: rect
    color: panel.colors.dark_surface_variant
    radius: 4
    implicitHeight: panel.format.module_height
    implicitWidth: row.implicitWidth + 8

    RowLayout {
      id: row
      anchors.centerIn: parent
      anchors.horizontalCenter: parent.horizontalCenter
      spacing: 4
      PwObjectTracker { objects: [ Pipewire.defaultAudioSink ] }
      Text {
        id: volumeIcon
        text: defaultNode && defaultNode.audio.muted
          ? " 󰖁"
          : (defaultNode && defaultNode.audio.volume >= 0.66
            ? " 󰕾"
            : defaultNode && defaultNode.audio.volume >= 0.33
            ? " 󰖀"
            : " 󰕿")
        font.pixelSize: panel.format.text_size
        color: panel.colors.dark_on_surface_variant
      }

      Text {
        id: volumeText
        text: defaultNode
          ? Math.round(defaultNode.audio.volume * 100) + "%"
          : "—"
        font.pixelSize: panel.format.text_size
        color: panel.colors.dark_on_surface_variant
      }

      MouseArea {
        anchors.fill: parent
        onClicked: if (defaultNode) defaultNode.audio.muted = !defaultNode.audio.muted
        onWheel: {
          if (!defaultNode) return
          const delta = wheel.angleDelta.y > 0 ? 0.05 : -0.05
          defaultNode.audio.volume = Math.max(0.0, Math.min(1.0, defaultNode.audio.volume + delta))
        }
      }
    }
  }

}
