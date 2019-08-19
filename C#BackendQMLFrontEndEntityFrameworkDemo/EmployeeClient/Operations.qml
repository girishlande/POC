import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

Item {
    id:root

    property string baseUrl: "http://192.168.60.140:61360/api/employee"

    function addInfo() {

        var EmpId = txtEmpId.text;
        var EmpName = txtEmpName.text;
        var EmpCity = txtEmpCity.text;
        if (EmpId.length==0 || EmpName.length==0 || EmpCity.length==0) {
            alert("Employee details are mandatory!");
            return;
        }
        var url = baseUrl;

        var data = {};
        data.EmpId = EmpId;
        data.EmpName  = EmpName;
        data.EmpCity = EmpCity;
        var json = JSON.stringify(data);

        var xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.setRequestHeader('Content-type','application/json; charset=utf-8');
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                employeeTable.refreshTable();
            }
        }
        xhr.send(json);
        timerForRefresh.start();
    }

    function editInfo() {

        var EmpId = txtEmpId.text;
        var EmpName = txtEmpName.text;
        var EmpCity = txtEmpCity.text;
        if (EmpId.length==0 || EmpName.length==0 || EmpCity.length==0) {
            alert("employee details are mandatory!");
            return;
        }
        var url = baseUrl + "/" + EmpId;

        var data = {};
        data.EmpId = EmpId;
        data.EmpName  = EmpName;
        data.EmpCity = EmpCity;
        var json = JSON.stringify(data);

        var xhr = new XMLHttpRequest();
        xhr.open("PUT", url, true);
        xhr.setRequestHeader('Content-type','application/json; charset=utf-8');
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                employeeTable.refreshTable();
            }
        }
        xhr.send(json);
        timerForRefresh.start();
    }

    function deleteInfo() {

        var EmpId = txtEmpId.text;
        var EmpName = txtEmpName.text;
        var EmpCity = txtEmpCity.text;
        if (EmpId.length==0) {
            alert("Employee details are mandatory!");
            return;
        }
        var url = baseUrl + "/" + EmpId;

        var xhr = new XMLHttpRequest();
        xhr.open("DELETE", url, true);
        xhr.setRequestHeader('Content-type','application/json; charset=utf-8');
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                employeeTable.refreshTable();
            }
        }
        xhr.send();
        timerForRefresh.start();
    }

    function searchInfo() {
        var url = baseUrl;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                displayEmployee(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
        timerForRefresh.start();
    }

    function displayEmployee(json) {
        var obj = JSON.parse(json);
        var EmpId = txtEmpId.text;
        for(var i = 0; i < obj.length ; i++){
            if (obj[i].EmpId == EmpId) {
                txtEmpId.text = obj[i].EmpId;
                txtEmpName.text = obj[i].EmpName;
                txtEmpCity.text = obj[i].EmpCity;
            }
        }
    }

    Timer {
        id: timerForRefresh
        interval: 500;
        running: false;
        repeat: false
        onTriggered: employeeTable.refreshTable();
    }

    ColumnLayout {
        id:operationButtonColumn
        anchors.right: parent.right
        anchors.top: controlBack.bottom
        anchors.topMargin: 10
        Button {
            id:btnAddEmployee
            text: "Add Employee"
            Layout.fillWidth: true
            onClicked: {
                root.addInfo();
            }
        }

        Button {
            id:btnSearchEmployee
            text: "Search Employee"
            Layout.fillWidth: true
            onClicked: {
                root.searchInfo();
            }
        }

        Button {
            id:btnEditEmployee
            text: "Edit Employee"
            Layout.fillWidth: true
            onClicked: {
                root.editInfo();
            }
        }

        Button {
            id:btnRemoveEmployee
            text: "Remove Employee"
            Layout.fillWidth: true
            onClicked: {
                root.deleteInfo();
            }
        }

    }

    Rectangle {
        id: controlBack
        width: 200
        height: 100
        color: "gray"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 20

        Grid {
            id: operationControls
            anchors.fill: parent
            anchors.margins: 10
            spacing: 5
            columns: 2
            Text {
                id: labelEmpId
                text: qsTr("EmpId:")
                height: 20
            }
            TextField {
                id:txtEmpId
                width: 100
                height: 20
            }
            Text {
                id: labelEmpName
                text: qsTr("EmpName:")
                height: 20
            }
            TextField {
                id:txtEmpName
                width: 100
                height: 20
            }
            Text {
                id: labelEmpCity
                text: qsTr("EmpCity:")
                height: 20
            }
            TextField {
                id:txtEmpCity
                width: 100
                height: 20
            }
        }
    }
}
