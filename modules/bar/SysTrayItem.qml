import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects

MouseArea {
    id: root

    property var bar: root.QsWindow.window
    required property SystemTrayItem item
    property bool targetMenuOpen: false
    property int trayItemWidth: 16

    anchors {
        verticalCenter: parent.verticalCenter
    }
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    Layout.fillHeight: true
    implicitWidth: trayItemWidth
    onClicked: (event) => {
        switch (event.button) {
        case Qt.LeftButton:
            item.activate();
            break;
        case Qt.RightButton:
            if (item.hasMenu) menu.open();
            break;
        }
        event.accepted = true;
    }

    QsMenuAnchor {
        id: menu

        menu: root.item.menu
        anchor.window: bar
        anchor.rect.x: root.x 
        anchor.rect.y: rowLayout.y + rowLayout.implicitHeight
        anchor.rect.height: systrayRow.height
        anchor.edges: Edges.Top
    }

    IconImage {
        id: trayIcon
        visible: true
        source: root.item.icon
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }

    Loader {
        active: true
        anchors.fill: trayIcon
        sourceComponent: Item {
            Desaturate {
                id: desaturatedIcon
                visible: false
                anchors.fill: parent
                source: trayIcon
                desaturation: 0.8
            }
            ColorOverlay {
                anchors.fill: desaturatedIcon
                source: desaturatedIcon
                color: "transparent"
            }
        }
    }

}
