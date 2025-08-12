Overall Architecture
Systray.qml serves as the container that manages the layout and displays all system tray items, while SysTrayItem.qml handles the individual tray icons and their interactions.
How Systray.qml Works
This is the main container component that:

Creates a horizontal row layout (RowLayout) to arrange tray items
Uses a Repeater to automatically generate SysTrayItem components for each item in SystemTray.items
Adds a bullet point separator ("•") that only appears when there are tray items present
Applies consistent spacing (15 pixels) between items
Sets appropriate margins using the appearance system's rounding values

How SysTrayItem.qml Works
Each individual tray item is a MouseArea that provides:
Visual Representation:

Displays the tray item's icon using IconImage
Supports two visual modes:

Normal colored icons (default)
Monochrome icons (when Config.options.bar.tray.monochromeIcons is enabled)


For monochrome mode, it desaturates the icon and applies a color overlay for consistent theming

User Interactions:

Left-click: Calls item.activate() to trigger the application's primary action
Right-click: Opens the context menu (if the item has one) using QsMenuAnchor

Menu System:

Uses QsMenuAnchor to position context menus properly
Anchors menus to the bottom edge of the tray item
Automatically handles menu positioning relative to the bar window

Key Features

Dynamic Content: The tray automatically updates as applications add/remove tray items
Theming Support: Integrates with the appearance system for consistent colors and sizing
Configurable Visuals: Can switch between colored and monochrome icon styles
Proper Menu Handling: Context menus are positioned correctly and behave as expected
Responsive Layout: Items are sized consistently and adapt to the available space

The system leverages Quickshell's SystemTray service to interface with the actual system tray functionality, making it a clean abstraction over the underlying platform's tray implementation.
