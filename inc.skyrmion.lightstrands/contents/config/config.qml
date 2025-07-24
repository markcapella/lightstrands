
import QtQuick 2.0

import org.kde.plasma.configuration 2.0


ConfigModel {
    ConfigCategory {
        name: "Lightstrands"
        icon: "braindump"
        source: "configLightstrands.qml"
    }
    ConfigCategory {
        name: i18n("Credits")
        icon: "resource-group"
        source: "configCredits.qml"
    }
}
