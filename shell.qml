//@ pragma UseQApplication
import QtQuick
import Quickshell

import "./modules/bar/";

ShellRoot {
  id: root

  property bool bar: true

  LazyLoader {active: bar; component: Bar{}}
  
}
