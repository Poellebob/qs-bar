import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import Quickshell.DBusMenu
import Qt5Compat.GraphicalEffects

MouseArea {
  id: sysTrayItem

  required property var bar
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
        if (item.hasMenu) {
          menu.visible = !menu.visible;
          hideTimer.restart();
        }
      break;
    }
    event.accepted = true;
  }

  QsMenuOpener {
    id: menuOpen
    menu: sysTrayItem.item.menu
  }

  PopupWindow {
    id: menu
    anchor.window: bar
    anchor.rect.x: sysTrayItem.x
    anchor.rect.y: bar.implicitHeight
    anchor.edges: Edges.Top
    color: "transparent"
    implicitWidth: 200
    implicitHeight: items.height + 8
    
    Timer {
      id: hideTimer
      interval: 1000
      running: false
      repeat: false
      onTriggered: menu.visible = false
    }
    
    MouseArea {
      id: menuMouseArea
      anchors.fill: parent
      hoverEnabled: true
      
      onEntered: hideTimer.stop()
      onExited: hideTimer.restart()
    }

    Rectangle {
      id: rect
      color: panel.colors.dark_background
      implicitWidth: parent.width
      implicitHeight: parent.height
      bottomLeftRadius: 16
      bottomRightRadius: 16
      
      ColumnLayout {
        id: items
        spacing: 6
        anchors.horizontalCenter: parent.horizontalCenter
        
        Repeater {
          model: menuOpen.children
          
          Rectangle {
            required property QsMenuEntry modelData
            color: mouseArea.containsMouse && !modelData.isSeparator ? panel.colors.dark_surface_container_high : panel.colors.dark_inverse_on_surface
            anchors.horizontalCenter: parent.horizontalCenter
            implicitWidth: menu.width - 12
            implicitHeight: modelData.isSeparator ? 2 : 25
            radius: 12
            
            // Smooth color transition
            Behavior on color {
              ColorAnimation {
                duration: 150
                easing.type: Easing.OutCubic
              }
            }
            
            Text {
              visible: !modelData.isSeparator
              anchors.fill: parent
              color: panel.colors.dark_on_background
              text: modelData.text
              anchors.left: parent.left
              anchors.leftMargin: 10
              anchors.verticalCenter: parent.verticalCenter
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignLeft
            }
            
            MouseArea {
              id: mouseArea
              anchors.fill: parent
              hoverEnabled: true
              
              onClicked: (event) => {
                if (event.button == Qt.LeftButton) {
                  modelData.triggered()
                  menu.visible = false
                }
              }
            }
          }
        }
      }
    }
  }

  IconImage {
    id: trayIcon
    visible: true
    source: sysTrayItem.item.icon
    anchors.centerIn: parent
    width: parent.width
    height: parent.height
  }
}
