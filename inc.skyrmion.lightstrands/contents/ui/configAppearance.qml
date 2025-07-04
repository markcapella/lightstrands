
import QtQuick;
import QtQuick.Controls as QtControls;
import QtQuick.Layouts;

import org.kde.kcmutils as KCM;
import org.kde.kirigami as Kirigami;
import org.kde.plasma.plasmoid;


KCM.SimpleKCM {

    property bool cfg_isModuleInitialized:
        isModuleInitialized;

    property alias cfg_chosenBulb:
        chosenBulbComboBox.currentIndex;

    property alias cfg_bulbSpaceSlider:
        bulbSpaceSlider.value;
    property alias cfg_strandSpaceSlider:
        strandSpaceSlider.value;

    property alias cfg_showLightRed: showLightRed.checked;
    property alias cfg_showLightLime: showLightLime.checked;
    property alias cfg_showLightPurple: showLightPurple.checked;
    property alias cfg_showLightCyan: showLightCyan.checked;
    property alias cfg_showLightGreen: showLightGreen.checked;
    property alias cfg_showLightOrange: showLightOrange.checked;
    property alias cfg_showLightBlue: showLightBlue.checked;
    property alias cfg_showLightPink: showLightPink.checked;

    property int cfg_resizingCancelTimeMS:
        resizingCancelTimeMS;


    Kirigami.FormLayout {
         Item {
            Kirigami.FormData.label: "Bulb Selection";
            Kirigami.FormData.isSection: true;
        }

        QtControls.ComboBox {
            id: chosenBulbComboBox;
            anchors.horizontalCenter:
                parent.horizontalCenter;

            model: [
                i18n("American Bulb"),
                i18n("Balloons Bulb"),
                i18n("Candle Bulb"),
                i18n("Clover Bulb"),
                i18n("Colony Hat Bulb"),
                i18n("Dotted Egg Bulb"),
                i18n("Drinks Bulb"),
                i18n("Easter Bunny Bulb"),
                i18n("Easter Chick Bulb"),
                i18n("Easter Egg Bulb"),
                i18n("Easter Sign Bulb"),
                i18n("Fancy Clover Bulb"),
                i18n("Fireworks Bulb"),
                i18n("Flower Vase Bulb"),
                i18n("Ghost Bulb"),
                i18n("Halloween Bulb"),
                i18n("Heart Bulb"),
                i18n("Hearts Bulb"),
                i18n("Heart Star Bulb"),
                i18n("Irish Bulb"),
                i18n("Irish Hat Bulb"),
                i18n("Lobster Bulb"),
                i18n("Lobster Up Bulb"),
                i18n("New Years Bulb"),
                i18n("Party Bulb"),
                i18n("Plain Easter Egg Bulb"),
                i18n("Pot Of Gold Bulb"),
                i18n("Pumpkin Bulb"),
                i18n("Pumpkin Pie Bulb"),
                i18n("Ribbons Bulb"),
                i18n("Rocket Bulb"),
                i18n("Santa Boots Bulb"),
                i18n("Skull Bulb"),
                i18n("Snow Flake Bulb"),
                i18n("Sparkly Candle Bulb"),
                i18n("Stars Bulb"),
                i18n("Turkey Left Bulb"),
                i18n("Turkey Right Bulb"),
                i18n("Wavy Egg Bulb"),
                i18n("Xmas Bulb"),
                i18n("Xmas Fancy Bulb"),
                i18n("Xmas Holly Bulb"),
                i18n("Xmas Round Bulb"),
                i18n("Xmas Strand Bulb"),
                i18n("Xmas Three Bulb"),
                i18n("Xmas Wreath Bulb")
            ];

            onCurrentIndexChanged:
                cfg_chosenBulb = currentIndex;
        }


        Item {
            Kirigami.FormData.label: "Bulb Spacing";
            Kirigami.FormData.isSection: true;
        }

        RowLayout {
            Layout.fillWidth: true;

            QtControls.Slider {
                id: bulbSpaceSlider;
                Layout.fillWidth: true;
                from: 0;
                to: 50;
                stepSize: 1;
            }
        }


        Item {
            Kirigami.FormData.label: "Strand Spacing";
            Kirigami.FormData.isSection: true;
        }

        RowLayout {
            Layout.fillWidth: true;

            QtControls.Slider {
                id: strandSpaceSlider;
                Layout.fillWidth: true;
                from: 0;
                to: 50;
                stepSize: 1;
            }
        }


        Item {
            Kirigami.FormData.label: "Bulb Colors";
            Kirigami.FormData.isSection: true;
        }

        RowLayout {
            anchors.horizontalCenter:
                parent.horizontalCenter;

            QtControls.CheckBox {
                id: showLightRed;
            }
            Rectangle {
                width: plasmoid.configuration.colorBoxWidth;
                height: plasmoid.configuration.colorBoxHeight;
                radius: plasmoid.configuration.colorBoxRadius;
                color: plasmoid.configuration.lightColorRed;
            }

            QtControls.CheckBox {
                id: showLightLime;
            }
            Rectangle {
                width: plasmoid.configuration.colorBoxWidth;
                height: plasmoid.configuration.colorBoxHeight;
                radius: plasmoid.configuration.colorBoxRadius;
                color: plasmoid.configuration.lightColorLime;
            }

            QtControls.CheckBox {
                id: showLightPurple;
            }
            Rectangle {
                width: plasmoid.configuration.colorBoxWidth;
                height: plasmoid.configuration.colorBoxHeight;
                radius: plasmoid.configuration.colorBoxRadius;
                color: plasmoid.configuration.lightColorPurple;
            }

            QtControls.CheckBox {
                id: showLightCyan;
            }
            Rectangle {
                width: plasmoid.configuration.colorBoxWidth;
                height: plasmoid.configuration.colorBoxHeight;
                radius: plasmoid.configuration.colorBoxRadius;
                color: plasmoid.configuration.lightColorCyan;
            }
        }

        RowLayout {
            anchors.horizontalCenter:
                parent.horizontalCenter;

            QtControls.CheckBox {
                id: showLightGreen;
            }
            Rectangle {
                width: plasmoid.configuration.colorBoxWidth;
                height: plasmoid.configuration.colorBoxHeight;
                radius: plasmoid.configuration.colorBoxRadius;
                color: plasmoid.configuration.lightColorGreen;
            }

            QtControls.CheckBox {
                id: showLightOrange;
            }
            Rectangle {
                width: plasmoid.configuration.colorBoxWidth;
                height: plasmoid.configuration.colorBoxHeight;
                radius: plasmoid.configuration.colorBoxRadius;
                color: plasmoid.configuration.lightColorOrange;
            }

            QtControls.CheckBox {
                id: showLightBlue;
            }
            Rectangle {
                width: plasmoid.configuration.colorBoxWidth;
                height: plasmoid.configuration.colorBoxHeight;
                radius: plasmoid.configuration.colorBoxRadius;
                color: plasmoid.configuration.lightColorBlue;
            }

            QtControls.CheckBox {
                id: showLightPink;
            }
            Rectangle {
                width: plasmoid.configuration.colorBoxWidth;
                height: plasmoid.configuration.colorBoxHeight;
                radius: plasmoid.configuration.colorBoxRadius;
                color: plasmoid.configuration.lightColorPink;
            }
        }
    }
}
