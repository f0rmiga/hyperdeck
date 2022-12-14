# Copyright (C) 2022 Thulio Ferraz Assis
# 
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Lesser Public License for more
# details.
# 
# You should have received a copy of the GNU Lesser General Public License along
# with this program.  If not, see <http://www.gnu.org/licenses/>.

from PySide6.QtCore import Slot, QObject


class Colours(QObject):
    @Slot(int, int, int, result=str)
    def decToHex(self, r, g, b):
        return f"#{hex(r)[2:]}{hex(g)[2:]}{hex(b)[2:]}"
