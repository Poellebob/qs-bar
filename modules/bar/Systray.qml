import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

Item {
    id: root

    anchors {
        verticalCenter: parent.verticalCenter
    }
    implicitWidth: rowLayout.implicitWidth

    RowLayout {
        id: rowLayout

        anchors.fill: parent
        spacing: 4

        Repeater {
            model: SystemTray.items

            SysTrayItem {
                required property SystemTrayItem modelData
                item: modelData
            }

        }

        Text {
            Layout.alignment: Qt.AlignVCenter
            font.pixelSize: Appearance.font.pixelSize.larger
            color: Appearance.colors.colSubtext
            text: "•"
            visible: {
                SystemTray.items.values.length > 0
            }
        }

    }

}
