
import QtQuick;
import QtQuick.Controls as QtControls;
import QtQuick.Layouts;

import org.kde.kcmutils as KCM;
import org.kde.kirigami as Kirigami;
import org.kde.plasma.plasmoid;


KCM.SimpleKCM {

    Kirigami.FormLayout {
        Item {
            Kirigami.FormData.label: i18n("Bulb Design Credits");
            Kirigami.FormData.isSection: true;
        }

        QtControls.Label {
            Layout.fillWidth: true;
            horizontalAlignment: Text.AlignHCenter;
            text: i18n("The majority of the Bulb shapes here");
        }
        QtControls.Label {
            Layout.fillWidth: true;
            horizontalAlignment: Text.AlignHCenter;
            text: i18n("were developed from images located at");
        }
        QtControls.Label {
            Layout.fillWidth: true;
            horizontalAlignment: Text.AlignHCenter;
            font.weight: Font.Bold;
            text: i18n("https://www.flaticon.com/");
        }

        Item {
            Kirigami.FormData.label: i18n("Available Bulbs");
            Kirigami.FormData.isSection: true;
        }

        // i18n("American Bulb"), i18n("Balloons Bulb"), i18n("Candle Bulb"), i18n("Clover Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/AmericanBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("American Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/BalloonsBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Balloons Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/CandleBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Candle Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/CloverBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Clover Bulb");
                }
            }
        }

        // i18n("Colony Hat Bulb"), i18n("Dotted Egg Bulb"), i18n("Drinks Bulb"), i18n("Easter Bunny Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/ColonyHatBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Colony Hat Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/DottedEggBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Dotted Egg Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/DrinksBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Drinks Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/EasterBunnyBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Easter Bunny Bulb");
                }
            }
        }

        // i18n("Easter Chick Bulb"), i18n("Easter Egg Bulb"), i18n("Easter Sign Bulb"), i18n("Fancy Clover Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/EasterChickBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Easter Chick Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/EasterEggBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Easter Egg Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/EasterSignBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Easter Sign Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/FancyCloverBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Fancy Clover Bulb");
                }
            }
        }

        // i18n("Fireworks Bulb"), i18n("Flower Vase Bulb"), i18n("Ghost Bulb"), i18n("Halloween Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/FireworksBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Fireworks Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/FlowerVaseBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Flower Vase Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/GhostBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Ghost Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/HalloweenBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Halloween Bulb");
                }
            }
        }

        // i18n("Heart Bulb"), i18n("Hearts Bulb"), i18n("Heart Star Bulb"), i18n("Irish Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/HeartBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Heart Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/HeartsBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Hearts Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/HeartStarBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Heart Star Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/IrishBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Irish Bulb");
                }
            }
        }

        // i18n("Irish Hat Bulb"), i18n("Lobster Bulb"), i18n("Lobster Up Bulb"), i18n("New Years Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/IrishHatBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Irish Hat Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/LobsterBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Lobster Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/LobsterUpBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Lobster Up Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/NewYearsBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("New Years Bulb");
                }
            }
        }

        // i18n("Party Bulb"), i18n("Plain Easter Egg Bulb"), i18n("Pot Of Gold Bulb"), i18n("Pumpkin Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/PartyBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Party Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/PlainEasterEggBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Plain Easter Egg Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/PotOfGoldBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Pot Of Gold Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/PumpkinBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Pumpkin Bulb");
                }
            }
        }

        // i18n("Pumpkin Pie Bulb"), i18n("Ribbons Bulb"), i18n("Rocket Bulb"), i18n("Santa Boots Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/PumpkinPieBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Pumpkin Pie Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/RibbonsBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Ribbons Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/RocketBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Rocket Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/SantaBootsBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Santa Boots Bulb");
                }
            }
        }

        // i18n("Skull Bulb"), i18n("Snow Flake Bulb"), i18n("Sparkly Candle Bulb"), i18n("Stars Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/SkullBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Skull Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/SnowFlakeBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Snow Flake Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/SparklyCandleBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Sparkly Candle Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/StarsBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Stars Bulb");
                }
            }
        }

        // i18n("Turkey Left Bulb"), i18n("Turkey Right Bulb"), i18n("Wavy Egg Bulb"), i18n("Xmas Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/TurkeyLeftBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Turkey Left Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/TurkeyRightBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Turkey Right Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/WavyEggBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Wavy Egg Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/XmasBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Xmas Bulb");
                }
            }
        }

        // i18n("Xmas Fancy Bulb"), i18n("Xmas Holly Bulb"), i18n("Xmas Round Bulb"), i18n("Xmas Strand Bulb"),
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/XmasFancyBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Xmas Fancy Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/XmasHollyBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Xmas Holly Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/XmasRoundBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Xmas Round Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/XmasStrandBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Xmas Strand Bulb");
                }
            }
        }

        // i18n("Xmas Three Bulb"), i18n("Xmas Wreath Bulb")
        Row {
            anchors{
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10;

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/XmasThreeBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                Text {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Xmas Three Bulb");
                }
            }

            Column {
                Image {
                    horizontalAlignment: Text.AlignHCenter;
                    source: "bulbPngs/XmasWreathBulb.png";
                    fillMode: Image.PreserveAspectFit;
                }
                QtControls.Label {
                    horizontalAlignment: Text.AlignHCenter;
                    font.weight: Font.Bold;
                    text: i18n("Xmas Wreath Bulb");
                }
            }
        }
    }
}
