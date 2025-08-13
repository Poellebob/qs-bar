import QtQuick
import QtQuick.Layouts
import Quickshell

Variants {
  model: Quickshell.screens

  PanelWindow {
    id: panel
    required property var modelData
    screen: modelData

    implicitHeight: 30

    property int icon_size: 24
    property int text_size: 13
    property int module_height: implicitHeight - 8
    property int module_radius: 4

    anchors {
      top: true
      left: true
      right: true
    }
    
    Rectangle {
      anchors.fill: parent
      color: "#161616"

      RowLayout {
        anchors {
          left: parent.left
          leftMargin: 8
          verticalCenter: parent.verticalCenter
        }
        spacing: 16

        Text {
          text: "󰣇"
          color: "white"
          font.pixelSize: panel.text_size + 12
          Layout.alignment: Qt.AlignVCenter
        }

        Systray {
          Layout.alignment: Qt.AlignVCenter
        }
      }

      RowLayout {
        anchors {
          horizontalCenter: parent.horizontalCenter
          verticalCenter: parent.verticalCenter
        }
        spacing: 16

        Clock {
          Layout.alignment: Qt.AlignVCenter
        }
      }

      RowLayout {
        anchors {
          right: parent.right
          rightMargin: 8
          verticalCenter: parent.verticalCenter
        }
        spacing: 16

        Pager {
          Layout.alignment: Qt.AlignVCenter
        }
      }
    }
  }
}