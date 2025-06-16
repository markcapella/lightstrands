
import QtQuick;
import QtQuick.Layouts;

import org.kde.plasma.plasmoid;

import "code/Lights.js" as Lights;


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
        // Lights.initLightsModule();
        // mCanvas.requestPaint();
    }
    onHeightChanged: {
        if (!isResizing) {
            if (isCanvasAvailable) {
                Lights.clearCanvas();
            }
        }
        isResizing = true;
        resizingStartTime = Date.now();
        // Lights.initLightsModule();
        // mCanvas.requestPaint();
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
    property int bulbSpaceWidthSlider:
        mCFG.bulbSpaceWidthSlider;

    onBulbSpaceWidthSliderChanged: {
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
     ** mouseArea definition.
     **/
    readonly property alias mouseArea: mouseArea

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
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
                if (isResizing) {
                    return;
                }

                Lights.updateCanvasFrame();
                mCanvas.requestPaint();
            }
        }
    }

    /** ************************************************
     ** isResizingCancel timer definition.
     **/
    Item {
        Timer {
            id: isResizingCancelTimer;

            interval: 100;
            repeat: true;
            running: true;

            onTriggered: {
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
}
