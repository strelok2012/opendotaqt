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
        Component{
            id : proMatchesHeader
            Rectangle {
                id: tHead
                visible: listLoaded
                color: "#20202F"
                width: parent.width
                height: 60
                Item {
                    height: parent.height
                    width: parent.width*0.3
                    id: thId
                    Item {
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
                Item {
                    id: thDuration
                    anchors.left: thId.right
                    height: parent.height
                    width: parent.width*0.15
                    Text {
                         text: "DURATION"
                         color: "white"
                         anchors.verticalCenter: parent.verticalCenter
                         font.pointSize: 9
                    }
                }
                Item {
                    id: thRadiant
                    anchors.left: thDuration.right
                    height: parent.height
                    width: parent.width*0.2
                    Text {
                         text: "RADIANT"
                         color: "#66BB6A"
                         anchors.verticalCenter: parent.verticalCenter
                         font.pointSize: 9
                    }
                }

                Item {
                    id: thDire
                    anchors.left: thRadiant.right
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
        }

        Item{
            anchors.fill : parent
            ListView {
                visible: listLoaded
                id: matchesListView
                model: proMatchesModel
                width: parent.width
                height: parent.height
                header: proMatchesHeader
                delegate: Item {
                    height: 40
                    width: parent.width
                    MatchesProTableRow {
                    }
                }
                ScrollBar.vertical: ScrollBar { }
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
