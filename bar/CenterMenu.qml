import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

PopupWindow {
  id: menuRoot
  anchor.window: panel
  anchor.rect.x: panel.width / 2 - width / 2
  anchor.rect.y: panel.height
  implicitHeight: 600
  implicitWidth: 800
  color: "transparent"
  
  property string fetchString
  property string fetchPath: Quickshell.shellDir + "/scripts/sysfetch.sh"
  
  Process {
    id: fetchRunner
    command: [fetchPath]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        menuRoot.fetchString = this.text
        console.log(this.text)
      }
    }
    stderr: StdioCollector {
      onStreamFinished: console.log(this.text)
    }
  }
  
  Timer {
    id: fetchTimer
    interval: 10000
    running: true
    repeat: true
    onTriggered: {
      fetchRunner.running = true
    }
  }
  
  Rectangle {
    id: menuIURoot
    anchors.fill: parent
    bottomLeftRadius: 18
    bottomRightRadius: 18
    color: panel.colors.dark_background
  }
  
  Timer {
    id: hideTimer
    interval: 1000
    running: false
    repeat: false
    onTriggered: {
      menuRoot.visible = false
    }
  }
  
  Item {
    anchors.fill: parent
    anchors.leftMargin: 12
    anchors.rightMargin: 12
    anchors.bottomMargin: 12
    anchors.topMargin: 8
    
    RowLayout {
      spacing: 12
      anchors.fill: parent
      
      // Left column
      ColumnLayout {
        spacing: 12
        Layout.fillHeight: true
        Layout.preferredWidth: parent.width * 0.8
        
        // Top row with small square and wide rectangle
        RowLayout {
          spacing: 12
          Layout.fillWidth: true
          Layout.preferredHeight: parent.height * 0.235
          
          Rectangle {
            id: profileIcon
            Layout.preferredWidth: parent.height
            Layout.preferredHeight: parent.height
            color: panel.colors.dark_inverse_on_surface
            radius: 12

            DateDisplay{
              anchors.fill: parent
            }
          }
          
          Rectangle {
            id: fetchOutput
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height
            color: panel.colors.dark_inverse_on_surface
            radius: 12
            
            Text {
              id: fetchText
              anchors.fill: parent
              anchors.margins: 8
              text: menuRoot.fetchString
              font.family: "monospace"
              font.bold: true
              wrapMode: Text.WrapAnywhere
              textFormat: Text.RichText
              color: panel.colors.dark_on_surface_variant
            }
          }
        }
        
        // Large middle rectangle
        Rectangle {
          id: mediaControls
          Layout.fillWidth: true
          Layout.fillHeight: true
          color: panel.colors.dark_inverse_on_surface
          radius: 12
          
          Text {
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 24
            text: "mediaplayer comming soon"
          }
        }
        
        // Bottom rectangle
        Rectangle {
          id: systemUsage
          Layout.fillWidth: true
          Layout.preferredHeight: parent.height * 0.2
          color: panel.colors.dark_inverse_on_surface
          radius: 12
        }
      }
      
      // Right tall rectangle with audio and brightness controls
      Rectangle {
        id: audioAndBrightness
        Layout.fillHeight: true
        Layout.preferredWidth: parent.width * 0.2
        color: panel.colors.dark_inverse_on_surface
        radius: 12
        
        SystemUsage {
          anchors.fill: parent
        }
      }
    }
  }

  MouseArea {
    id: menuMouseArea
    anchors.fill: parent
    hoverEnabled: true
    acceptedButtons: Qt.NoButton
    propagateComposedEvents: true
    
    onEntered: hideTimer.stop()
    onExited: hideTimer.restart()
  }
}