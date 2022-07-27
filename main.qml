// Copyright (C) 2022 Thulio Ferraz Assis
// 
// This program is free software: you can redistribute it and/or modify it under
// the terms of the GNU Lesser General Public License as published by the Free
// Software Foundation, either version 3 of the License, or (at your option) any
// later version.
// 
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Lesser Public License for more
// details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "components"

ApplicationWindow {
    visible: true
    title: "Hyperdeck"
    visibility: Qt.WindowFullScreen

    Rectangle {
        anchors.fill: parent
        color: colours.decToHex(39, 40, 40)

        GridLayout {
            anchors.fill: parent
            anchors.margins: 2
            columns: 2
            rows: 3
            columnSpacing: 2
            rowSpacing: 2

            Repeater {
                model: deviceManager != null ? deviceManager.devices() : []
                delegate: HyperdeckCard {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    device: modelData
                }
            }
        }
    }
}
