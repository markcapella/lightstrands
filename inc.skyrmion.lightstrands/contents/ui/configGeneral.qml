
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

    property alias cfg_bulbSpaceWidthSlider:
        bulbSpaceWidthSlider.value;

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
                i18n("      Xmas Lights"),
                i18n("  Plain Easter Eggs"),
                i18n("  Fancy Easter Eggs"),
                i18n("    American Flag"),
                i18n("   Shooting Rockets"),
                i18n(" Halloween Pumpkins"),

                i18n("    Scary Balloons"),
                i18n("    Castle Candles"),
                i18n("    Colonist Hat"),
                i18n("   New Years Drinks"),
                i18n("     Fireworks"),
                i18n("     Ghost Bulb"),
                i18n("    Halloween Bulbs"),
                i18n("     Lobster Bulb"),
                i18n("   Standing Lobster"),
                i18n("    New Years Clock"),
                i18n("    New Years Party"),
                i18n("   Thanksgiving Pie"),
                i18n("       Ribbons"),
                i18n("      Skull Bulb"),
                i18n("      Stars Bulb"),
                i18n("     Turkey Bulb"),
                i18n(" Turkey Facing Right")
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
                id: bulbSpaceWidthSlider;
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
