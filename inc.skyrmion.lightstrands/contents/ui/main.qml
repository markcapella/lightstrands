
import QtQuick;
import QtQuick.Layouts;

import org.kde.plasma.core as PlasmaCore;
import org.kde.plasma.plasmoid;


PlasmoidItem {
    id: mApplication;

    Plasmoid.backgroundHints:
        PlasmaCore.Types.NoBackground |
        PlasmaCore.Types.ConfigurableBackground;

    preferredRepresentation: compactRepresentation;
    toolTipMainText: Plasmoid.metaData.name;
    toolTipSubText: Plasmoid.metaData.description;

    compactRepresentation: LightStrands { }
    fullRepresentation: LightStrands { }

    width: {
        const CFG = plasmoid.configuration;
        if (CFG.isModuleInitialized) {
            return width;
        }
        return (CFG.initialOrientation == "horizontal") ?
            CFG.initialWidth : CFG.initialHeight;
    }

    height: {
        const CFG = plasmoid.configuration;
        if (CFG.isModuleInitialized) {
            return height;
        }
        return (CFG.initialOrientation == "horizontal") ?
            CFG.initialHeight : CFG.initialWidth;
    }
}
