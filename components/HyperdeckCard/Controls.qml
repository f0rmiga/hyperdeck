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
    RowLayout {
        anchors.centerIn: parent

        Image {
            source: "../../images/rec_enabled.svg"

            MouseArea {
                anchors.fill: parent
                // onClicked: ...
            }
        }
        Image {
            source: "../../images/start_enabled.svg"

            MouseArea {
                anchors.fill: parent
                // onClicked: ...
            }
        }
        Image {
            source: "../../images/play_enabled.svg"

            MouseArea {
                anchors.fill: parent
                // onClicked: ...
            }
        }
        Image {
            source: "../../images/end_enabled.svg"

            MouseArea {
                anchors.fill: parent
                // onClicked: ...
            }
        }
        Image {
            source: "../../images/stop_enabled.svg"

            MouseArea {
                anchors.fill: parent
                // onClicked: ...
            }
        }
        Image {
            source: "../../images/loop_enabled.svg"

            MouseArea {
                anchors.fill: parent
                // onClicked: ...
            }
        }
        Image {
            source: "../../images/clip_enabled.svg"

            MouseArea {
                anchors.fill: parent
                // onClicked: ...
            }
        }
    }
}
