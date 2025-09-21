import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.format
import qs.colors

PanelWindow {
  id: panel

  readonly property Format format: Format {}
  readonly property Colors colors: Colors {}

  implicitHeight: format.panel_hight

  anchors {
    top: true
    left: true
    right: true
  }
  
  Rectangle {
    anchors.fill: parent
    color: panel.colors.dark_background

    RowLayout {
      anchors {
        left: parent.left
        leftMargin: 8
        verticalCenter: parent.verticalCenter
      }
      spacing: 8

      Text {
        text: "󰣇"
        color: panel.colors.dark_on_background
        font.pixelSize: panel.format.icon_size
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
      spacing: 8

      Audio {
        Layout.alignment: Qt.AlignCenter
      }

      Battery {
        Layout.alignment: Qt.AlignVCenter
      }

      Bluetooth {
        Layout.alignment: Qt.AlignVCenter
      }

      Network {
        Layout.alignment: Qt.AlignVCenter
      }

      Clock {
        Layout.alignment: Qt.AlignVCenter
      }

      MouseArea {
        onClicked: (event) => {
          if (event.button == Qt.LeftButton) {
            centerMenu.visible = !centerMenu.visible
          }
        }
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        implicitHeight: panel.height
      }
    }

    RowLayout {
      anchors {
        right: parent.right
        rightMargin: 8
        verticalCenter: parent.verticalCenter
      }
      spacing: 8

      Pager {
        Layout.alignment: Qt.AlignVCenter
      }
    }
  }

  CenterMenu {
    id: centerMenu
  }
}
