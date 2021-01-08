import sys
import sqlite3
import apiXmlQmlLink as axql
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    access = axql.Link()

    engine.rootContext().setContextProperty("api", access)
    
    engine.load(QUrl("../QML/main.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
    
    sys.exit(app.exec_())
