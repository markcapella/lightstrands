
import QtQuick;
import QtQuick.Layouts;

import org.kde.plasma.plasmoid;

import "Lights.js" as Lights;


Item {
    id: lightstrands

    // Form bounds.
    anchors.fill: parent;

    Layout.minimumWidth:
        Lights.getMinimumCanvasSize();
    Layout.minimumHeight:
        Lights.getMinimumCanvasSize();

    Layout.maximumWidth: Infinity;
    Layout.maximumHeight: Infinity;

    readonly property var mCFG:
        plasmoid.configuration;

    // Configuration pref change listener.
    property int chosenBulb:
        mCFG.chosenBulb;

    onChosenBulbChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbPositions();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listener.
    property int bulbSpaceSlider:
        mCFG.bulbSpaceSlider;

    onBulbSpaceSliderChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbPositions();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listener.
    property int strandSpaceSlider:
        mCFG.strandSpaceSlider;

    onStrandSpaceSliderChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbPositions();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listeners.
    property bool showLightRed:
        mCFG.showLightRed;

    onShowLightRedChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listeners.
    property bool showLightLime:
        mCFG.showLightLime;

    onShowLightLimeChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listeners.
    property bool showLightPurple:
        mCFG.showLightPurple;

    onShowLightPurpleChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listeners.
    property bool showLightCyan:
        mCFG.showLightCyan;

    onShowLightCyanChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listeners.
    property bool showLightGreen:
        mCFG.showLightGreen;

    onShowLightGreenChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listeners.
    property bool showLightOrange:
        mCFG.showLightOrange;

    onShowLightOrangeChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listeners.
    property bool showLightBlue:
        mCFG.showLightBlue;

    onShowLightBlueChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    // Configuration pref change listeners.
    property bool showLightPink:
        mCFG.showLightPink;

    onShowLightPinkChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        Lights.clearCanvas();
        Lights.setAllBulbColors();
        Lights.setAllBulbsNeedDraw();
        mCanvas.requestPaint();
    }

    /** ************************************************
     ** onDestruction listener.
     **/
    Component.onDestruction: {
        updateCanvasTimer.stop();
        resizingCancelTimer.stop();
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
            if (!isCanvasAvailable) {
                return;
            }

            // Canvas first-time initialization.
            Lights.setAllBulbPositions();
            Lights.setAllBulbColors();
            Lights.setAllBulbsNeedDraw();

            Lights.setModuleIsInitialized(true);
        }
        onPaint: {
            Lights.drawCanvas();
        }
    }

    /** ************************************************
     ** resizingCancelTimer timer definition.
     **
     ** This allows us to suppress jaggy draw frames
     ** during rapid applet resizes.
     **/
    property var resizingStartTime;

    onWidthChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        if (!Lights.isModuleResizing()) {
            Lights.clearCanvas();
            Lights.setModuleIsResizing(true);
        }
        resizingStartTime = Date.now();
    }

    onHeightChanged: {
        if (!isCanvasAvailable) {
            return;
        }
        if (!Lights.isModuleResizing()) {
            Lights.clearCanvas();
            Lights.setModuleIsResizing(true);
        }
        resizingStartTime = Date.now();
    }

    Item { Timer {
        id: resizingCancelTimer;

        interval: 100;
        repeat: true;
        running: true;

        onTriggered: {
            // Timer inactive.
            if (!Lights.isModuleResizing()) {
                return;
            }

            // Resizing stops on edge case rollover.
            var resizingNowTime = Date.now();
            const DURATION = resizingNowTime -
                resizingStartTime;

            if (DURATION < 0) {
                Lights.setAllBulbPositions();
                Lights.setAllBulbColors();
                Lights.setAllBulbsNeedDraw();
                mCanvas.requestPaint();
                Lights.setModuleIsResizing(false);
                return;
            }

            // Resizing stops after duration.
            if (DURATION > mCFG.resizingCancelTimeMS) {
                Lights.setAllBulbPositions();
                Lights.setAllBulbColors();
                Lights.setAllBulbsNeedDraw();
                mCanvas.requestPaint();
                Lights.setModuleIsResizing(false);
                return;
            }
        }
    }}

    /** ************************************************
     ** updateCanvasTimer timer definition.
     **
     ** Performs periodic bulb-color changes.
     **/
    Item { Timer {
        id: updateCanvasTimer;

        interval: 500;
        repeat: true;
        running: true;

        onTriggered: {
            // No updates when resizing or canvas
            // not yet drawn.
            if (Lights.isModuleResizing() ||
                !isCanvasAvailable) {
                return;
            }

            // No updates when in "add widgets" Desktop
            // editMode, or when Desktop rubberband selector
            // being streched for desktop performance jag.
            if (Plasmoid.containment.corona.editMode ||
                isRubberBandActive()) {
                return;
            }

            // Do the update.
            Lights.updateCanvas();
            mCanvas.requestPaint();
        }
    }}

    /** ************************************************
     ** User click & dragging on desktop displays
     ** selection-box "rubberband" for dragging desktop
     ** icons. This is also jaggy unless we avoid
     ** update draws.
     **/
    property bool rubberBandNodeSet: false;
    property var rubberBandNode: null;

    function isRubberBandActive() {
        if (!rubberBandNodeSet) {
            rubberBandNode = getRubberBandNode();
            rubberBandNodeSet = true;
        }

        return rubberBandNode ?
            rubberBandNode.rubberBand : null;
    }

    function getRubberBandNode() {
        const APP = lightstrands;

        const APPS = getParentOf(APP, "AppletsLayout");
        if (!APPS) { return null; }

        const QL = getChildOf(APPS,"QQuickLoader");
        if (!QL) { return null; }

        const FVL = getChildOf(QL, "FolderViewLayer");
        if (!FVL) { return null; }

        const FV = getChildOf(FVL, "FolderView");
        if (!FV) { return null; }

        return FV;
    }

    /** ************************************************
     ** Helper method to get an ancester of a
     ** node with a particular type.
     **/
    function getParentOf(node, type) {
        var temp = node;

        while (temp) {
            if (temp.toString().indexOf(type) != -1) {
                return temp;
            }
            temp = temp.parent;
        }

        return null;
    }

    /** ************************************************
     ** Helper method to get a child of a
     ** node with a particular type.
     **/
    function getChildOf(node, type) {
        for (var temp of node.children) {
            if (temp.toString().indexOf(type) != -1) {
                return temp;
            }
        }
        return null;
    }
}
