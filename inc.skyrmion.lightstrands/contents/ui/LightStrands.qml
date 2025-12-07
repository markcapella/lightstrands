
import QtQuick;
import QtQuick.Layouts;

import org.kde.plasma.plasmoid;

import "Lights.js" as Lights;


Item {
    id: lightstrands

    // Form bounds.
    anchors.fill: parent;

    Layout.minimumWidth: Lights.getMinimumCanvasSize();
    Layout.minimumHeight: Lights.getMinimumCanvasSize();

    Layout.maximumWidth: Infinity;
    Layout.maximumHeight: Infinity;

    readonly property var mCFG: plasmoid.configuration;

    /** ************************************************
     ** onDestruction listener.
     **/

    Component.onDestruction: {
        updateCanvasTimer.stop();
        resizingCancelTimer.stop();
    }

    /** ************************************************
     ** Configuration pref change listeners.
     **/

    property int chosenBulb: mCFG.chosenBulb;
    onChosenBulbChanged: handleAllPrefChanges();

    property int bulbSpaceSlider: mCFG.bulbSpaceSlider;
    onBulbSpaceSliderChanged: handleAllPrefChanges();

    property int strandSpaceSlider: mCFG.strandSpaceSlider;
    onStrandSpaceSliderChanged: handleAllPrefChanges();

    property bool showLightRed: mCFG.showLightRed;
    onShowLightRedChanged: handleColorPrefChanges();

    property bool showLightLime: mCFG.showLightLime;
    onShowLightLimeChanged: handleColorPrefChanges();

    property bool showLightPurple: mCFG.showLightPurple;
    onShowLightPurpleChanged: handleColorPrefChanges();

    property bool showLightCyan: mCFG.showLightCyan;
    onShowLightCyanChanged: handleColorPrefChanges();

    property bool showLightGreen: mCFG.showLightGreen;
    onShowLightGreenChanged: handleColorPrefChanges();

    property bool showLightOrange: mCFG.showLightOrange;
    onShowLightOrangeChanged: handleColorPrefChanges();

    property bool showLightBlue: mCFG.showLightBlue;
    onShowLightBlueChanged: handleColorPrefChanges();

    property bool showLightPink: mCFG.showLightPink;
    onShowLightPinkChanged: handleColorPrefChanges();

    // All prefs changes initialization helper.
    function handleAllPrefChanges() {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.setAllBulbPositions();
            Lights.setAllBulbColors();
            Lights.setAllBulbsNeedPaint();
            mCanvas.requestPaint();
        }
    }

    // Color prefs changes initialization helper.
    function handleColorPrefChanges() {
        if (isCanvasAvailable) {
            Lights.clearCanvas();
            Lights.setAllBulbColors();
            Lights.setAllBulbsNeedPaint();
            mCanvas.requestPaint();
        }
    }

    /** ************************************************
     ** Canvas definition.
     **/

    property bool isCanvasAvailable: false;
    property var screenModel: "";

    Canvas {
        id: mCanvas
        anchors.fill: parent

        // Canvas first-time initialization.
        onAvailableChanged: {
            isCanvasAvailable = available;
            if (isCanvasAvailable) {
                handleAllPrefChanges();
                screenModel = Screen.model;
                Lights.setModuleIsInitialized(true);
                return;
            }
        }
        onPaint: {
            Lights.paintCanvas();
        }
    }

    /** ************************************************
     ** resizingCancelTimer timer definition.
     **
     ** This allows us to suppress jaggy draw frames
     ** during rapid applet resizes.
     **/

    onWidthChanged: handleResizeStart();
    onHeightChanged: handleResizeStart();

    property var resizingStartTime;

    function handleResizeStart() {
        if (isCanvasAvailable) {
            if (!Lights.isModuleResizing()) {
                Lights.clearCanvas();
                Lights.setModuleIsResizing(true);
            }
            resizingStartTime = Date.now();
        }
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

            // Resizing stops after duration.
            var resizingNowTime = Date.now();
            const DURATION = resizingNowTime -
                resizingStartTime;

            if (DURATION < 0 ||
                DURATION > mCFG.resizingCancelTimeMS) {
                handleAllPrefChanges();
                Lights.setModuleIsResizing(false);
                return;
            }
        }
    }}

    /** ************************************************
     ** updateCanvasTimer timer definition.
     **
     ** Performs periodic bulb-color changes.
     **
     ** No updates when resizing, canvas not yet
     ** drawn, when in "add widgets" Desktop editMode,
     ** or when Desktop rubberband selector is being
     ** streched. (Avoid desktop jag).
     **/

    Item { Timer {
        id: updateCanvasTimer;

        interval: 500;
        repeat: true;
        running: true;

        onTriggered: {
            if (Lights.isModuleResizing() ||
                !isCanvasAvailable ||
                Plasmoid.containment.corona.editMode ||
                isRubberBandActive()) {
                return;
            }

            // On screen change, redraw all immed.
            if (screenModel != Screen.model) {
                screenModel = Screen.model;
                Lights.setAllBulbsNeedPaint();
                mCanvas.requestPaint();
                return;
            }

            // Do the update.
            Lights.setSomeBulbsNeedPaint();
            mCanvas.requestPaint();
        }
    }}

    /** ************************************************
     ** User click & dragging on desktop displays
     ** selection-box "rubberband" for dragging desktop
     ** icons. This is also jaggy unless we avoid
     ** update draws.
     **/

    property var rubberBandNode: null;

    function isRubberBandActive() {
        if (!rubberBandNode) {
            rubberBandNode = getRubberBandNode();
        }
        return rubberBandNode ?
            rubberBandNode.rubberBand : null;
    }

    function getRubberBandNode() {
        const APPS = getParentOf(lightstrands, "AppletsLayout");
        if (!APPS) { return null; }

        const QL = getChildOf(APPS,"QQuickLoader");
        if (!QL) { return null; }

        const FVL = getChildOf(QL, "FolderViewLayer");
        if (!FVL) { return null; }

        return getChildOf(FVL, "FolderView");
    }

    /** ************************************************
     ** Helper method to get an ancester of a
     ** node with a particular type.
     **/

    function getParentOf(node, type) {
        var temp = node;

        while (temp) {
            if (temp.toString().indexOf(type) >= 0) {
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
            if (temp.toString().indexOf(type) >= 0) {
                return temp;
            }
        }
        return null;
    }
}
