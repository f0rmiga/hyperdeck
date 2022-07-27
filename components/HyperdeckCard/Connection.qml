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

Item {
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

                TextInput {
                    id: ip
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    text: ""
                    color: colours.decToHex(220, 176, 23)
                    font.pixelSize: 24
                    font.letterSpacing: 1
                    cursorVisible: false
                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignLeft
                }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.maximumWidth: 60
            Layout.minimumWidth: 60

            Image {
                source: "../../images/enter_enabled.svg"
                width: 50
                height: 50
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5

                MouseArea {
                    anchors.fill: parent
                    onClicked: device.connect(ip.text)
                }
            }
        }
    }
}
