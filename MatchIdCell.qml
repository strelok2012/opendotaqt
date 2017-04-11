import QtQuick 2.0

Rectangle {
    color: parent.color
    width: parent.width*0.3
    clip: true
    height: parent.height
    Item {
        anchors.fill : parent
        anchors.margins: 5
        Text {
            id: matchId
            anchors.left : parent.left
            anchors.topMargin: 20
            color: matchMouseArea.containsMouse ? "blue" : "#6bf"
            text: model.match_id+" >"
        }
        Text {
            anchors.top:matchId.bottom
            text: model.league_name
            color: "#b3b3b3"
            font.pointSize: 8
        }
    }



    MouseArea {
        id: matchMouseArea
        anchors.fill: parent
        hoverEnabled: true
    }

}
