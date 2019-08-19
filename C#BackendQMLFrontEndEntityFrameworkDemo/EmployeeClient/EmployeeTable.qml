import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Item {
    id: root

    signal refresh

    onRefresh: {
        root.refreshTable();
        tableView.update();
    }

    function refreshTable()
    {
        var url = "http://192.168.60.140:61360/api/employee";
        root.getInfo(url);
        tableView.update();
    }

    function getInfo(url) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                buildemployeeModel(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    function buildemployeeModel(json) {
        employeeModel.clear();
        var obj = JSON.parse(json);
        for(var i = 0; i < obj.length ; i++){
            employeeModel.append(obj[i]);
        }
    }

    Component.onCompleted: {
        root.refreshTable();
    }

    ListModel {
        id: employeeModel
    }

    Rectangle {
        width: 300
        height: 200
        TableView {
            id:tableView
            TableViewColumn {
                role: "EmpId"
                title: "EmpId"
                width: 100
            }
            TableViewColumn {
                role: "EmpName"
                title: "EmpName"
                width: 100
            }
            TableViewColumn {
                role: "EmpCity"
                title: "EmpCity"
                width: 100
            }
            model: employeeModel
            anchors.fill: parent
        }
    }
}
