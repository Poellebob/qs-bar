import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

Item {
  id: systray
  implicitHeight: rect.implicitHeight
  implicitWidth: rect.implicitWidth

  Rectangle {
    id: rect
    color: "#636363"
    radius: 4
    anchors.centerIn: parent

    // Let size follow RowLayout + margins
    implicitWidth: rowLayout.implicitWidth + 8
    implicitHeight: panel.module_height

    RowLayout {
      id: rowLayout
      anchors.margins: 4
      anchors.fill: parent
      spacing: 4

      Repeater {
        model: SystemTray.items
        SysTrayItem {
          required property SystemTrayItem modelData
          item: modelData
        }
      }

      Text {
        Layout.alignment: Qt.AlignVCenter
        font.pixelSize: Appearance.font.pixelSize.larger
        color: Appearance.colors.colSubtext
        visible: SystemTray.items.values.length > 0
      }
    }
  }
}
