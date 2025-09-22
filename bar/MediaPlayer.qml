import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

Item {
  id: mediaPlayerRoot

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: panel.format.spacing_large
    spacing: panel.format.spacing_large

    RowLayout {
      id: tabLayout
      spacing: panel.format.spacing_medium
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.top: parent.top

      Repeater {
        model: Mpris

        Rectangle {
          id: tabRoot

          required property MprisPlayer modelData

          width: 32
          height: 32
          color: "white"

          IconImage {
            anchors.centerIn: parent
            width: 28
            height: 28
            //fillMode: Image.PreserveAspectFit

            source: modelData.desktopEntry

            //source: "media-playback-start"
          }
        }
      }
    }
  }
}
