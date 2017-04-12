import QtQuick 2.0
import QtQuick.Controls 2.0

Page{
    anchors.margins: 10
    anchors.fill: parent
    Rectangle{
        anchors.fill: parent
        color:  "#2D2D44"
        SwipeView {
            anchors.topMargin: 15
            clip: true
            id: swipeView
            currentIndex: tabBar.currentIndex
            anchors.fill: parent
            Page{
                MatchesPro{

                }
            }
            Page{
                MatchesPro{

                }
            }
            Page{
                MatchesPro{

                }
            }
        }
    }
    header: TabBar {
            id: tabBar
            currentIndex: swipeView.currentIndex
            background: Rectangle {
               color: "#2D2D44"
            }
            OdTabButton {
                text: "Professional"
                tabIndex: 0
                ptabBar: tabBar
            }
            OdTabButton {
                text: "High MMR"
                tabIndex: 1
                ptabBar: tabBar
            }
            OdTabButton {
                text: "Low MMR"
                tabIndex: 2
                ptabBar: tabBar
            }
        }

}
