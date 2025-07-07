
import QtQuick;
import QtQuick.Layouts;

import org.kde.plasma.plasmoid;

import "Lights.js" as Lights;


Item {
    id: lightstrands

    // Form bounds.
    anchors.fill: parent;

    Layout.minimumWidth:
        Lights.getMinimumSquareCanvasSize();
    Layout.minimumHeight:
        Lights.getMinimumSquareCanvasSize();

    Layout.maximumWidth: Infinity;
    Layout.maximumHeight: Infinity;

    readonly property var mCFG:
        plasmoid.configuration;

    // Resize listeners.
    property bool isResizing: false;
    property var resizingStartTime;

    onWidthChanged: {
        if (!isResizing) {
            if (isCanvasAvailable) {
                Lights.clearCanvas();
            }
        }
        isResizing = true;
        resizingStartTime = Date.now();
    }
    onHeightChanged: {
        if (!isResizing) {
            if (isCanvasAvailable) {
                Lights.clearCanvas();
            }
        }
        isResizing = true;
        resizingStartTime = Date.now();
    }

    // Configuration pref change listener.
    property int chosenBulb:
        mCFG.chosenBulb;

    onChosenBulbChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listener.
    property int bulbSpaceSlider:
        mCFG.bulbSpaceSlider;

    onBulbSpaceSliderChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listener.
    property int strandSpaceSlider:
        mCFG.strandSpaceSlider;

    onStrandSpaceSliderChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listeners.
    property bool showLightRed:
        mCFG.showLightRed;

    onShowLightRedChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listeners.
    property bool showLightLime:
        mCFG.showLightLime;

    onShowLightLimeChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listeners.
    property bool showLightPurple:
        mCFG.showLightPurple;

    onShowLightPurpleChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listeners.
    property bool showLightCyan:
        mCFG.showLightCyan;

    onShowLightCyanChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listeners.
    property bool showLightGreen:
        mCFG.showLightGreen;

    onShowLightGreenChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listeners.
    property bool showLightOrange:
        mCFG.showLightOrange;

    onShowLightOrangeChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listeners.
    property bool showLightBlue:
        mCFG.showLightBlue;

    onShowLightBlueChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    // Configuration pref change listeners.
    property bool showLightPink:
        mCFG.showLightPink;

    onShowLightPinkChanged: {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.initLightsModule();
            mCanvas.requestPaint();
        }
    }

    /** ************************************************
     ** onDestruction listener.
     **/
    Component.onDestruction: {
        updateLightsTimer.stop();
        isResizingCancelTimer.stop();
    }

    /** ************************************************
     ** Canvas definition.
     **/
    property bool isCanvasAvailable: false

    Canvas {
        id: mCanvas
        anchors.fill: parent

        onAvailableChanged: {
            isCanvasAvailable = available;
        }
        onPaint: {
            Lights.drawCanvasFrame();
        }
    }

    /** ************************************************
     ** isResizingCancel timer definition.
     **/
    property int appletPrevXPos: -1;
    property int appletPrevYPos: -1;

    Item {
        Timer {
            id: isResizingCancelTimer;

            interval: 100;
            repeat: true;
            running: true;

            onTriggered: {
                // Timer inactive.
                if (!isResizing) {
                    return;
                }

                // Resizing stops on edge case rollover.
                var resizingNowTime = Date.now();
                const DURATION = resizingNowTime -
                    resizingStartTime;

                if (DURATION < 0) {
                    Lights.initLightsModule();
                    mCanvas.requestPaint();
                    isResizing = false;
                    return;
                }

                // Resizing stops after duration.
                if (DURATION > mCFG.resizingCancelTimeMS) {
                    Lights.initLightsModule();
                    mCanvas.requestPaint();
                    isResizing = false;
                    return;
                }
            }
        }
    }

    /** ************************************************
     ** updateCanvasFrame timer definition.
     **/
    Item {
        Timer {
            id: updateLightsTimer;

            interval: 500;
            repeat: true;
            running: true;

            onTriggered: {
                if (!isCanvasAvailable) {
                    return;
                }

                // Avoid screen jag on sizing.
                if (isResizing) {
                    return;
                }

                // Find parent node that has our applet X/Y pos;
                var appletXPos = -1;
                var appletYPos = -1;

                var node = lightstrands;
                while (node) {
                    if (node.toString().indexOf(
                        "BasicAppletContainer") != -1) {
                        appletXPos = node.x;
                        appletYPos = node.y;
                        break;
                    }
                    node = node.parent;
                }

                // If applet has moved, user is dragging it, so we
                // skip color update (& draw), avoiding mouse jag.
                if (appletPrevXPos != appletXPos ||
                    appletPrevYPos != appletYPos) {
                    appletPrevXPos = appletXPos;
                    appletPrevYPos = appletYPos;
                    return;
                }

                Lights.updateCanvasFrame();
                mCanvas.requestPaint();
            }
        }
    }
}
