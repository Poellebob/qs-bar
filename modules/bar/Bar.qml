//import qs.modules.common
//import qs.modules.common.functions
import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
  id: panel

  property int icon_size: 24
  
  implicitHeight: 30
  
  anchors {
    top: true
    left: true
    right: true
  }
  
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
        font.pixelSize: panel.icon_size
        anchors.verticalCenter: parent.verticalCenter
      }

      Systray {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 38 // adjust margin as needed
      }
    }

    Row {
      anchors {
        right: parent.right
        rightMargin: 8
        verticalCenter: parent.verticalCenter
      }
      spacing: 16

      Text {
        text: "idk"
        color: "white"
        font.pixelSize: panel.icon_size
        anchors.verticalCenter: parent.verticalCenter
      }

      // Add other items like clock, battery, etc. here
    }
  }
}
