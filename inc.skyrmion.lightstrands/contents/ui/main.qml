
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

    readonly property var mCFG:
        plasmoid.configuration;

    width: {
        if (mCFG.isModuleInitialized) {
            return width;
        }
        return (mCFG.initialOrientation == "horizontal") ?
            mCFG.initialWidth : mCFG.initialHeight;
    }

    height: {
        if (mCFG.isModuleInitialized) {
            return height;
        }
        return (mCFG.initialOrientation == "horizontal") ?
            mCFG.initialHeight : mCFG.initialWidth;
    }
}
