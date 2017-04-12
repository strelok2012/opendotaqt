import QtQuick 2.0
import QtQuick.Controls 2.0

TabButton {
    id: control
    property int tabIndex: 0
    property var ptabBar: undefined
    contentItem: Text {
        text: control.text
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    background: Item{
        implicitWidth: 100
        implicitHeight: 40
        TableBorder
        {
            anchors.fill: parent
            commonBorder: false
            lBorderwidth: 0
            rBorderwidth: 0
            tBorderwidth: 0
            bBorderwidth: tabBar.currentIndex === tabIndex ? 2 : 1
            borderColor: tabBar.currentIndex === tabIndex ? "#6bf" : "#434355"
        }
        Rectangle {
            anchors.fill: parent
            color: "#2D2D44"
        }

    }
    text: "Professional"
}
