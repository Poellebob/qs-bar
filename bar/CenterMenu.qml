import Quickshell
import QtQuick

PopupWindow {
  id: menuRoot

  anchor.window: panel
  anchor.rect.x: panel.width / 2 - width / 2
  anchor.rect.y: panel.height

  implicitHeight: 400
  implicitWidth: 650

  color: "transparent"

  Rectangle {
    id: menuIURoot

    anchors.fill: parent

    bottomLeftRadius: 18
    bottomRightRadius: 18

    color: panel.colors.dark_background
  }
}