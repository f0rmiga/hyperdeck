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
    property string name
    property string hours: "00"
    property string minutes: "00"
    property string seconds: "00"
    property string frames: "00"

    Text {
        id: title
        anchors.left: parent.left
        anchors.right: parent.right
        color: colours.decToHex(220, 176, 23)
        font.pixelSize: 14
        font.letterSpacing: 0.5
        font.wordSpacing: 1
        font.bold: true
        text: name
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: timer
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.pixelSize: 52
        font.letterSpacing: -2
        font.bold: true
        font.family: "Courier"
        text: hours + " " + minutes + " " + seconds + " " + frames
    }
}
