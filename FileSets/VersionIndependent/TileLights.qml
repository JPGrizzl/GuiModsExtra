// New for GuiMods to display and control relays on separate overview page

import QtQuick 1.1
import "utils.js" as Utils

Tile {
	id: root

    Component.onCompleted: updateFunction ()

    color: "#d9d9d9"

    property int lightIp: (lightNumber === 0 || lightNumber === 1) ? 91 : (lightNumber === 2 || lightNumber === 3) ? 71 : 0
    property int lightApiPath: (lightNumber === 0 || lightNumber === 2) ? 2 : (lightNumber === 1 || lightNumber === 3) ? 3 : 0
    

	values: Item
    {
        Column
        {
            width: root.width
            height: contentHeight + 4
            x: 3
            spacing: 4
            visible: true
            anchors
            {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
            }
            Text
            {
                font.pixelSize: 12
                font.bold: true
                color: "black"
                anchors
                {
                    horizontalCenter: parent.horizontalCenter
                }
                horizontalAlignment: Text.AlignHCenter
                text: "Light " + (lightNumber + 1)
            }
            Button
            {
                id: onButton
                baseColor: "green"
                pressedColor: "#979797"
                height: 30
                width: parent.width - 6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "http://172.24.24." + lightIp + "/white/" + lightApiPath);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send("turn=on&brightness=100");
                }
                content: TileText
                {
                    text: "I"; font.bold: true;
                    color: "black"
                }
            }
            Button
            {
                id: eightyButton
                baseColor: "#b2b2b2"
                pressedColor: "#979797"
                height: 30
                width: parent.width - 6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "http://172.24.24." + lightIp + "/white/" + lightApiPath);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send("turn=on&brightness=80");
                }
                content: TileText
                {
                    text: "80%"; font.bold: true;
                    color: "black"
                }
            }
            Button
            {
                id: fortyButton
                baseColor: "#7f7f7f"
                pressedColor: "#979797"
                height: 30
                width: parent.width - 6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "http://172.24.24." + lightIp + "/white/" + lightApiPath);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send("turn=on&brightness=40");
                }
                content: TileText
                {
                    text: "40%"; font.bold: true;
                    color: "black"
                }
            }
            Button
            {
                id: twentyButton
                baseColor: "#4c4c4c"
                pressedColor: "#979797"
                height: 30
                width: parent.width - 6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "http://172.24.24." + lightIp + "/white/" + lightApiPath);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send("turn=on&brightness=20");
                }
                content: TileText
                {
                    text: "20%"; font.bold: true;
                    color: "black"
                }
            }
            Button
            {
                id: oneButton
                baseColor: "#191919"
                pressedColor: "#979797"
                height: 30
                width: parent.width - 6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "http://172.24.24." + lightIp + "/white/" + lightApiPath);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send("turn=on&brightness=1");
                }
                content: TileText
                {
                    text: "1%"; font.bold: true;
                    color: "#b2b2b2"
                }
            }
            Button
            {
                id: offButton
                baseColor: "red"
                pressedColor: "#979797"
                height: 30
                width: parent.width - 6
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "http://172.24.24." + lightIp + "/white/" + lightApiPath);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send("turn=off");
                }
                content: TileText
                {
                    text: "O"; font.bold: true;
                    color: "black"
                }
            }
        }
	}

    function updateFunction ()
    {
        onButton.visible = true 
        offButton.visible = true
        lightSlider.visible = true 
    }
}