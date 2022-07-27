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

import "HyperdeckCard"

Rectangle {
    property variant device

    color: colours.decToHex(79, 79, 79)

    GridLayout {
        anchors.fill: parent
        anchors.margins: 5
        columns: 1
        rows: 2
        columnSpacing: 0
        rowSpacing: 0

        GridLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            columns: 2
            rows: 1
            columnSpacing: 0
            rowSpacing: 0

            GridLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true
                columns: 1
                rows: 2
                columnSpacing: 0
                rowSpacing: 0

                Title {
                    Layout.bottomMargin: 15
                    Layout.fillWidth: true
                    Layout.maximumHeight: 60
                    Layout.minimumHeight: 60
                    title: device != null ? device.title() : ""
                }

                TimerDisplay {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    name: "REMAINING TIME"
                }

                TimerDisplay {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    name: "TIME ELAPSED"
                }
            }

            GridLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true
                columns: 1
                rows: 2
                columnSpacing: 0
                rowSpacing: 0

                Connection {
                    Layout.fillWidth: true
                    Layout.maximumHeight: 60
                    Layout.minimumHeight: 60
                }

                ClipList {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }

        Controls {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumHeight: 80
            Layout.minimumHeight: 80
        }
    }
}
