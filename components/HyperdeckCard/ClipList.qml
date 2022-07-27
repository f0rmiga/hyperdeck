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

Rectangle {
    color: colours.decToHex(79, 79, 79)

    GridLayout {
        anchors.fill: parent
        columns: 2
        rows: 1
        columnSpacing: 0
        rowSpacing: 0

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.margins: 5

            color: colours.decToHex(71, 71, 72)

            Rectangle {
                anchors.fill: parent
                anchors.margins: 5

                color: colours.decToHex(39, 40, 40)

                ListView {
                    anchors.fill: parent
                    anchors.leftMargin: 5

                    model: device != null ? device.clips() : []
                    delegate: Text {
                        text: model.display
                        color: colours.decToHex(220, 176, 23)
                        font.pixelSize: 22
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.maximumWidth: 60
            Layout.minimumWidth: 60

            Image {
                source: "../../images/reload_enabled.svg"
                width: 50
                height: 50
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5

                MouseArea {
                    anchors.fill: parent
                    onClicked: device.reload_clips()
                }
            }
        }
    }
}
