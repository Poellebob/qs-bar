import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

Item {
  id: root

  PwObjectTracker {
    id: tracker
    objects: [ Pipewire.defaultAudioSink ]
  }

  property PwNode audioNode: tracker.objects.length > 0 ? tracker.objects[0] : null

  
  ColumnLayout {
    spacing: 12
    anchors.fill: parent

    RowLayout {
      anchors.fill: parent

      ColumnLayout {
        Layout.fillHeight: true
        implicitWidth: panel_hight * (1/3)

        Rectangle {
          Layout.fillHeight: true
          //Layout.
          implicitWidth: 6

          color: "black"


        }

        Text {
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.margins: 12

          horizontalAlignment: Text.AlignHCenter

          text: "N"
          font.family: "monospace"
          font.bold: true
          wrapMode: Text.WrapAnywhere
          textFormat: Text.RichText
          color: panel.colors.dark_on_surface_variant
        }
      }
    }
  }

  // Watch for external changes to volume to update slider, if needed
  Connections {
    target: audioNode && audioNode.audio
    function onVolumeChanged(newVolume) {
      // Prevent loops: only update slider if it's different
      if (Math.abs(volumeSlider.value - newVolume) > 0.001) {
        volumeSlider.value = newVolume
      }
    }
  }
}
