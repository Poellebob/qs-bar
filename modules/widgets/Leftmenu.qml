import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects

Rectangle {
  id: menu

  required property model menu

  anchors {
    horizontalCenter: parent.horizontalCenter
    left: panel.left
  }
}