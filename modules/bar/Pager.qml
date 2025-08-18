import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import Quickshell.Hyprland
import Qt5Compat.GraphicalEffects

Item {
  id: pagerRoot
  implicitHeight: rect.implicitHeight
  implicitWidth: rect.implicitWidth

  Rectangle {
    id: rect
    color: "#636363"
    radius: 4
    implicitWidth: row.implicitWidth + 8
    implicitHeight: panel.module_height

    RowLayout {
      id: row
      anchors.fill: parent
      anchors.margins: 4
      spacing: 4

      Repeater {
        model: Hyprland.workspaces
        delegate: Rectangle {
          visible: (panel.screen.name === modelData.monitor.name) && modelData.id >= 1
          color: modelData.active ? "#aaaaaa" : "#ffffff"
          
          implicitHeight: panel.module_height - 4
          implicitWidth: implicitHeight
          anchors.verticalCenter: parent.verticalCenter
          radius: panel.module_radius

          Text{
            font.pixelSize: panel.text_size
            text: modelData.id
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
          }
          
          MouseArea {
            anchors.fill: parent
            onClicked: modelData.activate()
          }
        }
      }
    }
  }
}
