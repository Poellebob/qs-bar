import QtQuick
import QtQuick.Layouts
import Quickshell

Item {
  id: clockRoot
  implicitHeight: rect.implicitHeight
	implicitWidth: rect.implicitWidth

  property string clock: "00:00"

  Rectangle {
    id: rect
    implicitHeight: panel.module_height
    implicitWidth: text.implicitWidth +8
    color: "#636363"
		radius: 4

    Text {
      id: text
      text: clockRoot.clock
      color: "white"
      anchors {
        verticalCenter: parent.verticalCenter
        horizontalCenter: parent.horizontalCenter
      }
    }
  }
}