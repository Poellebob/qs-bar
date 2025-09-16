import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Item {
  id: controllRoot

  property PwNode node

  PwObjectTracker { objects: [ node ] }
  ColumnLayout {
    anchors.fill: parent
    ColumnLayout {
      anchors.top: parent.top
      implicitWidth: parent.width / 2
      Slider {
        orientation: Qt.Vertical
        Layout.fillHeight: true
        value: node.audio.volume
        onValueChanged: node.audio.volume = value
      }
      Text {
        
      }
    }
  }
}