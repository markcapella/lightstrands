
import QtQuick 2.0

import org.kde.plasma.configuration 2.0


ConfigModel {
    ConfigCategory {
        name: "Lightstrands"
        icon: "adjustrgb"
        source: "configLightstrands.qml"
    }
    ConfigCategory {
        name: i18n("Credits")
        icon: "author"
        source: "configCredits.qml"
    }
}
