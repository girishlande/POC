import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Rectangle {
    width: 400
    height: 400
    color: "gray"

    Row {
        spacing: 10
        Rectangle {
            width: 40
            height: 40
            color: "red"
            radius: 5
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("Red button clicked")
                }
            }
        }
        Rectangle {
            width: 40
            height: 40
            color: "green"
            radius: 5
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("Green button clicked")
                }
            }
        }
    }

}
