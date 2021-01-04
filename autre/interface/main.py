import sys
import sqlite3
import bddAccess as api
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    access = api.Api()
    access.getAll()

    engine.rootContext().setContextProperty("api", access)
    #engine.rootContext().setContextProperty("numberGenerator", number_generator)
    
    engine.load(QUrl("app.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
    
    sys.exit(app.exec_())
