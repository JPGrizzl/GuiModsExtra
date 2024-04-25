// New for GuiMods to show relay info on a separate Overview page

import QtQuick 1.1
import com.victron.velib 1.0
import "utils.js" as Utils
import "tanksensor.js" as TankSensor

OverviewPage
{
	id: root

    property int lightsWidth: 0
    property int maxLights: 4
    property int numberOfLightsShown: 0
    property int horizontalMargin: 8
    property int tileWidth: (root.width - (horizontalMargin * 2)) / root.maxLights
    property int listWidth: tileWidth * numberOfLightsShown
    property int listHeight: root.height - 30

    // Synchronise name text scroll start
    Timer
    {
        id: marqueeTimer
        interval: 5000
        repeat: true
        running: root.active
   }

	title: qsTr("Lights Overview")
	clip: true

    Component.onCompleted: updateLights ()

    // background
    Rectangle
    {
        anchors
        {
            fill: parent
        }
        color: "#b3b3b3"
    }

    ListModel { id: lightsModel}

    Text
    {
        font.pixelSize: 14
        font.bold: true
        color: "black"
        anchors
        {
            top: parent.top
            topMargin: 7
            horizontalCenter: parent.horizontalCenter
        }
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Lights")
    }

	ListView
    {
        id: lightsColumn

        anchors.horizontalCenter: root.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30
        width: listWidth
        height: listHeight
        orientation: ListView.Horizontal
        visible: true
        interactive: false
        model: lightsModel
        delegate: TileLights
        {
            width: tileWidth
            height: root.height - 40
        }
    }

    function updateLights ()
    {
        numberOfLightsShown = 0
        lightsModel.clear()
        for (var i = 0; i < maxLights; i++)
        {
            numberOfLightsShown++ // increment before append so ListView centers properly
            lightsModel.append ({lightNumber: i})
        }
    }
}