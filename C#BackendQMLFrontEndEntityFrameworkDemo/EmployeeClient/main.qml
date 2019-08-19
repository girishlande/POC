import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("employees Info")
    color: "Black"


    EmployeeTable {
        id:employeeTable
    }

    Operations {
        anchors.right: parent.right
        anchors.top: parent.top
    }

}


