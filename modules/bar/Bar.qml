//import qs.modules.common
//import qs.modules.common.functions
import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
  id: panel
  
  anchors {
    top: true
    left: true
    right: true
  }
  
  implicitHeight: 30
  
  Rectangle {
    anchors.fill: parent
    color: "#161616"

    Row {
      anchors{
        left: parent.left
        leftMargin: 8
        verticalCenter: parent.verticalCenter
      }
      spacing: 16

      Text {
        text: "󰣇"
        color: "white"
        font.pixelSize: 22
      }

      Systray {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 38 // adjust margin as needed
      }
    }
  }
}
