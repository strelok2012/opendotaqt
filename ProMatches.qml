import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4

Item {
    anchors.fill: parent
    property bool listLoaded: false
    Component.onCompleted: {
        request("https://api.opendota.com/api/proMatches",function(o){
            for(var i=0;i<o.length;i++){
                proMatchesModel.append(o[i]);
            }
            listLoaded = true;
        });
    }

    ListModel {
        id: proMatchesModel
    }

    Rectangle{
        color: "#2D2D44"
        anchors.fill: parent
        Rectangle{
            anchors.fill : parent
            color: parent.color
            anchors.margins: 15
            Rectangle {
                visible: listLoaded
                color: "#20202F"
                width: parent.width
                height: 60
                Rectangle {
                    color: parent.color
                    height: parent.height
                    width: parent.width*0.3
                    id: thId
                    Rectangle {
                        color: parent.color
                        anchors.fill : parent
                        anchors.leftMargin: 5
                        Text {
                             text: "ID"
                             color: "white"
                             anchors.verticalCenter: parent.verticalCenter
                             font.pointSize: 9
                        }
                    }



                }
                Rectangle {
                    id: thDuration
                    anchors.left: thId.right
                    color: parent.color
                    height: parent.height
                    width: parent.width*0.15
                    Text {
                         text: "DURATION"
                         color: "white"
                         anchors.verticalCenter: parent.verticalCenter
                         font.pointSize: 9
                    }
                }
                Rectangle {
                    id: thRadiant
                    anchors.left: thDuration.right
                    color: parent.color
                    height: parent.height
                    width: parent.width*0.2
                    Text {
                         text: "RADIANT"
                         color: "#66BB6A"
                         anchors.verticalCenter: parent.verticalCenter
                         font.pointSize: 9
                    }
                }

                Rectangle {
                    id: thDire
                    anchors.left: thRadiant.right
                    color: parent.color
                    height: parent.height
                    width: parent.width*0.2
                    Text {
                         text: "DIRE"
                         color: "#FF4C4C"
                         anchors.verticalCenter: parent.verticalCenter
                         font.pointSize: 9
                    }
                }


            }

            ListView {
                visible: listLoaded
                id: matchesListView
                anchors.topMargin: 60
                anchors.fill: parent
                model: proMatchesModel
                delegate: Item {
                    height: 40
                    width: parent.width
                    MatchesTableRow {
                    }
                }
            }
        }
        BusyIndicator {
            running: !listLoaded
            anchors.centerIn: parent
        }
    }

    function request(url, callback) {
        var req = new XMLHttpRequest;
        var status;
        req.open("GET", url);
        req.onreadystatechange = function() {
            status = req.readyState;
            if (status === XMLHttpRequest.DONE) {
                var ret = JSON.parse(req.responseText);
                callback(ret);
            }
        }
        req.send();
    }
}
