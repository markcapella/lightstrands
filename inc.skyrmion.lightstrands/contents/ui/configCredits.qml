
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
                    source: "AmericanBulb.png";
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
                    source: "BalloonsBulb.png";
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
                    source: "CandleBulb.png";
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
                    source: "CloverBulb.png";
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
                    source: "ColonyHatBulb.png";
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
                    source: "DottedEggBulb.png";
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
                    source: "DrinksBulb.png";
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
                    source: "EasterBunnyBulb.png";
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
                    source: "EasterChickBulb.png";
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
                    source: "EasterEggBulb.png";
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
                    source: "EasterSignBulb.png";
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
                    source: "FancyCloverBulb.png";
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
                    source: "FireworksBulb.png";
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
                    source: "FlowerVaseBulb.png";
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
                    source: "GhostBulb.png";
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
                    source: "HalloweenBulb.png";
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
                    source: "HeartBulb.png";
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
                    source: "HeartsBulb.png";
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
                    source: "HeartStarBulb.png";
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
                    source: "IrishBulb.png";
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
                    source: "IrishHatBulb.png";
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
                    source: "LobsterBulb.png";
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
                    source: "LobsterUpBulb.png";
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
                    source: "NewYearsBulb.png";
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
                    source: "PartyBulb.png";
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
                    source: "PlainEasterEggBulb.png";
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
                    source: "PotOfGoldBulb.png";
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
                    source: "PumpkinBulb.png";
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
                    source: "PumpkinPieBulb.png";
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
                    source: "RibbonsBulb.png";
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
                    source: "RocketBulb.png";
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
                    source: "SantaBootsBulb.png";
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
                    source: "SkullBulb.png";
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
                    source: "SnowFlakeBulb.png";
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
                    source: "SparklyCandleBulb.png";
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
                    source: "StarsBulb.png";
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
                    source: "TurkeyLeftBulb.png";
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
                    source: "TurkeyRightBulb.png";
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
                    source: "WavyEggBulb.png";
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
                    source: "XmasBulb.png";
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
                    source: "XmasFancyBulb.png";
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
                    source: "XmasHollyBulb.png";
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
                    source: "XmasRoundBulb.png";
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
                    source: "XmasStrandBulb.png";
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
                    source: "XmasThreeBulb.png";
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
                    source: "XmasWreathBulb.png";
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
