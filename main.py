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

import argparse
from pathlib import Path
import sys

from PySide6.QtCore import Slot, QObject, QAbstractListModel, Qt
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from colours import Colours


class App():
    def __init__(self, device_manager, argv):
        self.gui = QGuiApplication(argv)
        self.engine = QQmlApplicationEngine()
        self.qmlpath = Path(__file__).parent / "main.qml"
        self.device_manager = device_manager

    def exec(self):
        root_context = self.engine.rootContext()
        root_context.setContextProperty("deviceManager", self.device_manager)
        root_context.setContextProperty("colours", Colours(self.gui))
        self.engine.quit.connect(self.gui.quit)
        self.engine.load(self.qmlpath)
        exit_code = self.gui.exec()
        return exit_code


class ClipsModel(QAbstractListModel):
    def __init__(self):
        super(ClipsModel, self).__init__()
        self.clips = []

    def data(self, index, role):
        if not index.isValid():
            return None

        if role == Qt.DisplayRole:
            return self.clips[index.row()]

    def rowCount(self, index):
        return len(self.clips)
    
    def setClips(self, clips):
        self.layoutAboutToBeChanged.emit()
        self.clips = clips
        self.layoutChanged.emit()


class Hyperdeck(QObject):
    def __init__(self, id):
        super(Hyperdeck, self).__init__()
        self.id = id
        self.ip = None
        self.clips_model = ClipsModel()

    @Slot(result=str)
    def title(self):
        return f"HYPERDECK {self.id + 1}"

    @Slot(str)
    def connect(self, ip):
        self.ip = ip
        # TODO(f0rmiga): implement
        print(f"connecting {self.id}/{self.ip}")

    @Slot(result=ClipsModel)
    def clips(self):
        return self.clips_model

    @Slot()
    def reload_clips(self):
        # TODO(f0rmiga): implement
        print(f"reloading {self.id}/{self.ip}")
        clips = [
            "clip_1.mov",
            "clip_2.mov",
            "clip_3.mov",
        ]
        self.clips_model.setClips(clips)


class DeviceManager(QObject):
    def __init__(self, devices):
        super(DeviceManager, self).__init__()
        self._devices = devices
    
    @Slot(result=list)
    def devices(self):
        return self._devices


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        usage="%(prog)s [OPTION]...",
        description="A multi-HyperDeck GUI controller."
    )
    # TODO(f0rmiga): add a git tag version.
    # parser.add_argument(
    #     "-v", "--version", action="version",
    #     version = f"{parser.prog} version 1.0.0"
    # )

    devices = [
        Hyperdeck(id)
        for id in range(6)
    ]
    device_manager = DeviceManager(devices)
    app = App(device_manager, sys.argv)
    sys.exit(app.exec())
