
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
        }
        onPaint: {
            Lights.drawCanvasFrame();
        }
    }

    /** ************************************************
     ** resizingCancelTimer timer definition.
     **
     ** This allows us to suppress jaggy draw frames
     ** during rapid applet resizes.
     **/
    Item { Timer {
        id: resizingCancelTimer;

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
    }}

    /** ************************************************
     ** updateCanvasTimer timer definition.
     **
     ** This allows us to suppress update/draw jag
     ** while applet in editMode or user is drag-
     ** selecting on the plasma desktop.
     **/
    Item { Timer {
        id: updateCanvasTimer;

        interval: 500;
        repeat: true;
        running: true;

        onTriggered: {
            if (!isCanvasAvailable) {
                return;
            }
            // Desktop edit mode for "add widgets".
            if (Plasmoid.containment.corona.editMode) {
                return;
            }
            // Long-press widget edit w/ handles.
            if (isAppletInEditMode()) {
                return;
            }
            // Plasmashell desktop rubberband.
            if (isRubberBandActive()) {
                return;
            }
            // Timer inactive.
            if (isResizing) {
                return;
            }

            // Update lights / twinkle.
            Lights.updateCanvasFrame();
            mCanvas.requestPaint();
        }
    }}

    /** ************************************************
     ** If applet in editMode, user could be dragging
     ** or sizing it, so we skip color update draws to
     ** avoid screen jag.
     **/
    property var editModeNode: null;
    property bool editModeNodeSet: false;

    function isAppletInEditMode() {
        if (!editModeNodeSet) {
            editModeNode = getEditNode();
            editModeNodeSet = true;
        }

        return editModeNode ?
            editModeNode.editMode : null;
    }

    function getEditNode() {
        return getAncesterNode(lightstrands,
            "BasicAppletContainer");
    }

    /** ************************************************
     ** User click & dragging on desktop displays
     ** selection-box "rubberband" for dragging desktop
     ** icons. This is also jaggy unless we avoid
     ** update draws.
     **/
    property var rubberBandNode: null;
    property bool rubberBandNodeSet: false;

    function isRubberBandActive() {
        if (!rubberBandNodeSet) {
            rubberBandNode = getRubberBandNode();
            rubberBandNodeSet = true;
        }

        return rubberBandNode ?
            rubberBandNode.rubberBand : null;
    }

    function getRubberBandNode() {
        const LAYOUT = getAncesterNode(
            lightstrands, "AppletsLayout");
        if (!LAYOUT) {
            return null;
        }

        const LOADER = getChildNode(
            LAYOUT, "QQuickLoader");
        if (!LOADER) {
            return null;
        }

        const FOLDERLAYER = getChildNode(
            LOADER, "FolderViewLayer");
        if (!FOLDERLAYER) {
            return null;
        }

        return getChildNode(FOLDERLAYER,
            "FolderView");
    }

    /** ************************************************
     ** Helper method to get an ancester of a
     ** node with a particular type.
     **/
    function getAncesterNode(node, type) {
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
    function getChildNode(node, type) {
        for (var temp of node.children) {
            if (temp.toString().indexOf(type) != -1) {
                return temp;
            }
        }

        return null;
    }
}
