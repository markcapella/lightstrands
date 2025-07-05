
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

        Image {
            id: allBulbsImage
            source: "AllBulbs.png";
            fillMode: Image.PreserveAspectFit;
            horizontalAlignment: Text.AlignHCenter;
        }
    }
}
