import QtQuick 2.0

Rectangle {
    width: parent.width
    height: parent.height
    color: model.index % 2 === 0 ? "#303045" : "#29293E"
    TableBorder
    {
        anchors.fill: parent
        commonBorder: false
        lBorderwidth: 0
        rBorderwidth: 0
        tBorderwidth: 1
        bBorderwidth: 1
        borderColor: "#434355"
    }
    MatchIdCell {
        id: matchIdCell
    }

    Rectangle {
        id: matchTimeCell
        height: parent.height
        width: parent.width * 0.15
        anchors.left: matchIdCell.right
        color: parent.color
        Text {
            text: getTime(model.duration)
            color: "#F5F5F5"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 10
        }
    }

    Item {
        id: matchRadiantCell
        height: parent.height
        width: parent.width * 0.2
        anchors.left: matchTimeCell.right
        AwardImage {
            id: matchRadiantAward
            visible: model.radiant_win
        }
        Text {
            id: matchRadiantText
            text: model.radiant_name
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: model.radiant_win ? matchRadiantAward.right : undefined
            anchors.leftMargin: 3
            color: "#66BB6A"
            font.pointSize: 8
        }
    }

    Rectangle {
        height: parent.height
        width: parent.width * 0.2
        anchors.left: matchRadiantCell.right
        color: parent.color
        AwardImage {
            id: matchDireAward
            visible: !model.radiant_win
        }
        Text {
            id: matchDireText
            text: model.dire_name
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: !model.radiant_win ? matchDireAward.right : undefined
            anchors.leftMargin: 3
            color: "#FF4C4C"
            font.pointSize: 8
        }
    }

    function str_pad_left(string,pad,length) {
        return (new Array(length+1).join(pad)+string).slice(-length);
    }

    function getTime(time){
        var minutes = Math.floor(time / 60);
        var seconds = time - minutes * 60;
        return str_pad_left(minutes,'0',2)+':'+str_pad_left(seconds,'0',2);
    }
}

