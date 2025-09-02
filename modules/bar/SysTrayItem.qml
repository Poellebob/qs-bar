import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects
import "../widgets"

MouseArea {
  id: sysTrayItem

  property var bar: sysTrayItem.QsWindow.window
  required property SystemTrayItem item
  property bool targetMenuOpen: false
  property int trayItemWidth: 16

  anchors {
    verticalCenter: parent.verticalCenter
  }

  acceptedButtons: Qt.LeftButton | Qt.RightButton
  Layout.fillHeight: true
  implicitWidth: trayItemWidth

  onClicked: (event) => {
    switch (event.button) {
      case Qt.LeftButton:
        item.activate();
      break; 

      case Qt.RightButton:
        if (item.hasMenu) menu.open();
      break;
    }
    event.accepted = true;
  }

  QsMenuAnchor {
    id: menu

    menu: sysTrayItem.item.menu
    anchor.window: bar
    anchor.rect.x: sysTrayItem.x 
    anchor.rect.y: sysTrayItem.y + rowLayout.implicitHeight + 12
    anchor.rect.height: systrayRow.height
    anchor.edges: Edges.Top
  }

  IconImage {
    id: trayIcon
    visible: true
    source: sysTrayItem.item.icon
    anchors.centerIn: parent
    width: parent.width
    height: parent.height
  }

  Loader {
    active: true
    anchors.fill: trayIcon
    sourceComponent: Item {
    Desaturate {
        id: desaturatedIcon
        visible: true
        anchors.fill: parent
        source: trayIcon
        desaturation: 0.8
      }
      ColorOverlay {
        anchors.fill: desaturatedIcon
        source: desaturatedIcon
        color: panel.colors.dark_on_surface_variant
      }
    }
  }
}
