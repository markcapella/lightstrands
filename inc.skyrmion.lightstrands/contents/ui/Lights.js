
/** ************************************************
 ** Bulb "class" definition imports.
 **/
.import "bulbs/AmericanBulb.js" as AmericanBulb
.import "bulbs/BalloonsBulb.js" as BalloonsBulb
.import "bulbs/CandleBulb.js" as CandleBulb
.import "bulbs/CloverBulb.js" as CloverBulb
.import "bulbs/ColonyHatBulb.js" as ColonyHatBulb
.import "bulbs/DottedEggBulb.js" as DottedEggBulb
.import "bulbs/DrinksBulb.js" as DrinksBulb
.import "bulbs/EasterBunnyBulb.js" as EasterBunnyBulb
.import "bulbs/EasterChickBulb.js" as EasterChickBulb
.import "bulbs/EasterEggBulb.js" as EasterEggBulb
.import "bulbs/EasterSignBulb.js" as EasterSignBulb
.import "bulbs/FancyCloverBulb.js" as FancyCloverBulb
.import "bulbs/FireworksBulb.js" as FireworksBulb
.import "bulbs/FlowerVaseBulb.js" as FlowerVaseBulb
.import "bulbs/GhostBulb.js" as GhostBulb
.import "bulbs/HalloweenBulb.js" as HalloweenBulb
.import "bulbs/HeartBulb.js" as HeartBulb
.import "bulbs/HeartsBulb.js" as HeartsBulb
.import "bulbs/HeartStarBulb.js" as HeartStarBulb
.import "bulbs/IrishBulb.js" as IrishBulb
.import "bulbs/IrishHatBulb.js" as IrishHatBulb
.import "bulbs/LobsterBulb.js" as LobsterBulb
.import "bulbs/LobsterUpBulb.js" as LobsterUpBulb
.import "bulbs/NewYearsBulb.js" as NewYearsBulb
.import "bulbs/PartyBulb.js" as PartyBulb
.import "bulbs/PlainEasterEggBulb.js" as PlainEasterEggBulb
.import "bulbs/PotOfGoldBulb.js" as PotOfGoldBulb
.import "bulbs/PumpkinBulb.js" as PumpkinBulb
.import "bulbs/PumpkinPieBulb.js" as PumpkinPieBulb
.import "bulbs/RibbonsBulb.js" as RibbonsBulb
.import "bulbs/RocketBulb.js" as RocketBulb
.import "bulbs/SantaBootsBulb.js" as SantaBootsBulb
.import "bulbs/SkullBulb.js" as SkullBulb
.import "bulbs/SnowFlakeBulb.js" as SnowFlakeBulb
.import "bulbs/SparklyCandleBulb.js" as SparklyCandleBulb
.import "bulbs/StarsBulb.js" as StarsBulb
.import "bulbs/TurkeyLeftBulb.js" as TurkeyLeftBulb
.import "bulbs/TurkeyRightBulb.js" as TurkeyRightBulb
.import "bulbs/WavyEggBulb.js" as WavyEggBulb
.import "bulbs/XmasBulb.js" as XmasBulb
.import "bulbs/XmasFancyBulb.js" as XmasFancyBulb
.import "bulbs/XmasHollyBulb.js" as XmasHollyBulb
.import "bulbs/XmasRoundBulb.js" as XmasRoundBulb
.import "bulbs/XmasStrandBulb.js" as XmasStrandBulb
.import "bulbs/XmasThreeBulb.js" as XmasThreeBulb
.import "bulbs/XmasWreathBulb.js" as XmasWreathBulb

/** ************************************************
 ** Module consts.
 **/
const CFG = plasmoid.configuration;

// Reference colors for twinkling.
const BRIGHT_COLOR = 252;
const NORMAL_COLOR = 176;
const DARK_COLOR = 132;

// Reference colors for grayed bulbs.
const BRIGHT_GRAY = 0xa8 / 255;
const NORMAL_GRAY = 0xdb / 255;
const DARK_GRAY = 0xb4 / 255;
const ALPHA_GRAY = 0xff / 255;

const BRIGHT_GRAYED_RGBA = Qt.rgba(
    BRIGHT_GRAY, BRIGHT_GRAY,
    BRIGHT_GRAY, ALPHA_GRAY
);
const NORMAL_GRAYED_RGBA = Qt.rgba(
    NORMAL_GRAY, NORMAL_GRAY,
    NORMAL_GRAY, ALPHA_GRAY
);
const DARK_GRAYED_RGBA = Qt.rgba(
    DARK_GRAY, DARK_GRAY,
    DARK_GRAY, ALPHA_GRAY
);

// Bulb color types.
const MAX_LIGHT_COLORS = 8;

const GRAYED = -1;
const RED = 0;
const LIME = 1;
const PURPLE = 2;
const CYAN = 3;
const GREEN = 4;
const ORANGE = 5;
const BLUE = 6;
const PINK = 7;

// Bulb shape list.
const mLightBulbShapesList = [
    AmericanBulb.BULB,
    BalloonsBulb.BULB,
    CandleBulb.BULB,
    CloverBulb.BULB,
    ColonyHatBulb.BULB,
    DottedEggBulb.BULB,
    DrinksBulb.BULB,
    EasterBunnyBulb.BULB,
    EasterChickBulb.BULB,
    EasterEggBulb.BULB,
    EasterSignBulb.BULB,
    FancyCloverBulb.BULB,
    FireworksBulb.BULB,
    FlowerVaseBulb.BULB,
    GhostBulb.BULB,
    HalloweenBulb.BULB,
    HeartBulb.BULB,
    HeartsBulb.BULB,
    HeartStarBulb.BULB,
    IrishBulb.BULB,
    IrishHatBulb.BULB,
    LobsterBulb.BULB,
    LobsterUpBulb.BULB,
    NewYearsBulb.BULB,
    PartyBulb.BULB,
    PlainEasterEggBulb.BULB,
    PotOfGoldBulb.BULB,
    PumpkinBulb.BULB,
    PumpkinPieBulb.BULB,
    RibbonsBulb.BULB,
    RocketBulb.BULB,
    SantaBootsBulb.BULB,
    SkullBulb.BULB,
    SnowFlakeBulb.BULB,
    SparklyCandleBulb.BULB,
    StarsBulb.BULB,
    TurkeyLeftBulb.BULB,
    TurkeyRightBulb.BULB,
    WavyEggBulb.BULB,
    XmasBulb.BULB,
    XmasFancyBulb.BULB,
    XmasHollyBulb.BULB,
    XmasRoundBulb.BULB,
    XmasStrandBulb.BULB,
    XmasThreeBulb.BULB,
    XmasWreathBulb.BULB
];


/** ************************************************
 ** Module globals.
 **/

// Bulb position, color, redraw attrs.
var mLightXPos = [ ];
var mLightYPos = [ ];

var mBulbColorBright = [ ];
var mBulbColorNormal = [ ];
var mBulbColorDark = [ ];

var mBulbNeedsDraw = [ ];

var mDebugMessagesCount = 0;
var mIsModuleResizing = false;


/** ************************************************
 ** This method sets each bulbs x/y positions.
 **/
function setAllBulbPositions() {
    mLightXPos = [ ];
    mLightYPos = [ ];

    isStrandHorizontal() ?
        setHorizontalBulbPositions() :
        setVerticalBulbPositions();
}

/** ************************************************
 ** This method sets each bulbs x/y position
 ** for horizontally oriented light strands.
 **/
function setHorizontalBulbPositions() {
    var xPos = getFirstHorizontalBulbXPos();
    const ONE_COLUMN_WIDTH =
        getLightsShapeWidth() + getBulbSpace();

    const BULB_COUNT = getBulbCount();
    for (var i = 0; i < BULB_COUNT; i++) {
        mLightXPos.push(xPos);
        mLightYPos.push(getYPosForHorizontalBulbNumber(i));
        xPos += ONE_COLUMN_WIDTH;
    }
}

/** ************************************************
 ** This method returns the X position of the first
 ** light for horizontally oriented light strands.
 **/
function getFirstHorizontalBulbXPos() {
    const BULB_COUNT = getBulbCount();

    const ALL_BULB_WIDTHS = BULB_COUNT *
        getLightsShapeWidth();
    const ALL_BULB_MARGINS = BULB_COUNT > 0 ?
         (BULB_COUNT - 1) * getBulbSpace() : 0;

    const WIDTH_FOR_MARGINS = mCanvas.width -
        (ALL_BULB_WIDTHS + ALL_BULB_MARGINS);
    const LEFT_MARGIN_WIDTH = Math.floor(
        WIDTH_FOR_MARGINS / 2);

    return LEFT_MARGIN_WIDTH;
}

/** ************************************************
 ** This method returns a bulbs Y position for each light
 ** for horizontally oriented light strands.
 **/
function getYPosForHorizontalBulbNumber(lightNumber) {
    const ALL_BULB_HEIGHTS = getLightsShapeHeight() +
        getStrandSpace();

    const HEIGHT_FOR_MARGINS = mCanvas.height -
        ALL_BULB_HEIGHTS;
    const TOP_MARGIN_HEIGHT = Math.floor(
        HEIGHT_FOR_MARGINS / 2);

    const IS_LIGHT_NUMBER_EVEN = Math.floor(
        lightNumber / 2) * 2 == lightNumber;

    return IS_LIGHT_NUMBER_EVEN ?
        TOP_MARGIN_HEIGHT : TOP_MARGIN_HEIGHT +
            getStrandSpace();
}

/** ************************************************
 ** This method sets each bulbs x/y position
 ** for vertically oriented light strands.
 **/
function setVerticalBulbPositions() {
    var yPos = getFirstVerticalBulbYPos();
    const ONE_COLUMN_HEIGHT =
        getLightsShapeHeight() + getBulbSpace();

    const BULB_COUNT = getBulbCount();
    for (var i = 0; i < BULB_COUNT; i++) {
        mLightYPos.push(yPos);
        mLightXPos.push(getXPosForVerticalBulbNumber(i));
        yPos += ONE_COLUMN_HEIGHT;
    }
}

/** ************************************************
 ** This method returns the Y position of the first
 ** light for horizontally oriented light strands.
 **/
function getFirstVerticalBulbYPos() {
    const BULB_COUNT = getBulbCount();

    const ALL_BULB_HEIGHTS = BULB_COUNT *
        getLightsShapeHeight();
    const ALL_BULB_MARGINS = BULB_COUNT > 0 ?
         (BULB_COUNT - 1) * getBulbSpace() : 0;

    const HEIGHT_FOR_MARGINS = mCanvas.height -
        (ALL_BULB_HEIGHTS + ALL_BULB_MARGINS);
    const TOP_MARGIN_WIDTH = Math.floor(
        HEIGHT_FOR_MARGINS / 2);

    return TOP_MARGIN_WIDTH;
}

/** ************************************************
 ** This method returns a bulbs X position for each light
 ** for vertically oriented light strands.
 **/
function getXPosForVerticalBulbNumber(lightNumber) {
    const ALL_BULB_WIDTHS = getLightsShapeWidth() +
        getStrandSpace();

    const WIDTH_FOR_MARGINS = mCanvas.width -
        ALL_BULB_WIDTHS;
    const TOP_MARGIN_WIDTH = Math.floor(
        WIDTH_FOR_MARGINS / 2);

    const IS_LIGHT_NUMBER_EVEN = Math.floor(
        lightNumber / 2) * 2 == lightNumber;

    return IS_LIGHT_NUMBER_EVEN ?
        TOP_MARGIN_WIDTH : TOP_MARGIN_WIDTH +
            getStrandSpace();
}

/** ************************************************
 ** This method sets each bulbs 3-color theme.
 **/
function setAllBulbColors() {
    mBulbColorBright = [ ];
    mBulbColorNormal = [ ];
    mBulbColorDark = [ ];

    var colorIndex =
        getFirstActiveLightsColorIndex();

    const BULB_COUNT = getBulbCount();
    for (var i = 0; i < BULB_COUNT; i++) {
        mBulbColorBright.push(
            getTwinkledBright(colorIndex));
        mBulbColorNormal.push(
            getTwinkledNormal(colorIndex));
        mBulbColorDark.push(
            getTwinkledDark(colorIndex));

        if (colorIndex != GRAYED) {
            colorIndex =
                getNextActiveLightsColorIndex(colorIndex);
        }
    }
}

/** ************************************************
 ** This method sets each bulbs draw state.
 **/
function setAllBulbsNeedDraw() {
    mBulbNeedsDraw = [ ];

    const BULB_COUNT = getBulbCount();
    for (var i = 0; i < BULB_COUNT; i++) {
        mBulbNeedsDraw.push(true);
    }
}

/** ************************************************
 ** This method returns the number of bulbs in the strand.
 **/
function getBulbCount() {
    return isStrandHorizontal() ?
        getHorizontalBulbCount() :
        getVerticalBulbCount();
}

/** ************************************************
 ** This method returns the number of bulbs in the strand
 ** for horizontally oriented light strands.
 **/
function getHorizontalBulbCount() {
    const ONE_BULB_AND_SPACE_WIDTH =
        getLightsShapeWidth() + getBulbSpace();

    const TOTAL_NUMBER_BULBS = Math.floor(
        mCanvas.width / ONE_BULB_AND_SPACE_WIDTH);

    return TOTAL_NUMBER_BULBS;
}

/** ************************************************
 ** This method returns the number of bulbs in the strand
 ** for vertically oriented light strands.
 **/
function getVerticalBulbCount() {
    const ONE_BULB_AND_SPACE_HEIGHT =
        getLightsShapeHeight() + getBulbSpace();

    const TOTAL_NUMBER_BULBS = Math.floor(
        mCanvas.height / ONE_BULB_AND_SPACE_HEIGHT);

    return TOTAL_NUMBER_BULBS;
}

/** ************************************************
 ** This method returns true if the user has selected
 ** at least one color for bulbs.
 **/
function areAnyLightColorsActive() {
    return CFG.showLightRed || CFG.showLightLime ||
        CFG.showLightPurple || CFG.showLightCyan ||
        CFG.showLightGreen || CFG.showLightOrange ||
        CFG.showLightBlue || CFG.showLightPink;
}

/** ************************************************
 ** This method determines if a colortype is available
 ** at a start point as selected by the user list.
 **/
function isLightColorActive(colorIndex) {
    switch (colorIndex) {
        case RED: return CFG.showLightRed;
        case LIME: return CFG.showLightLime;
        case PURPLE: return CFG.showLightPurple;
        case CYAN: return CFG.showLightCyan;
        case GREEN: return CFG.showLightGreen;
        case ORANGE: return CFG.showLightOrange;
        case BLUE: return CFG.showLightBlue;
        case PINK: return CFG.showLightPink;

        default:
            return false;
    }
}

/** ************************************************
 ** This method returns the first colortype available
 ** as selected by the user.
 **/
function getFirstActiveLightsColorIndex() {
    return !areAnyLightColorsActive() ? GRAYED :
        getNextActiveLightsColorIndex(GRAYED);
}

/** ************************************************
 ** This method returns any next colortype active other
 ** than the one mentioned, or itself if none other active.
 **/
function getNextActiveLightsColorIndex(colorIndex) {
    if (!areAnyLightColorsActive()) {
        return GRAYED;
    }

    // Search. We know @ least one exists.
    var resultIndex = colorIndex;
    while (true) {
        resultIndex++;
        if (resultIndex >= MAX_LIGHT_COLORS) {
            resultIndex =
                getFirstActiveLightsColorIndex();
        }

        if (isLightColorActive(resultIndex)) {
            return resultIndex;
        }
    }
}

/** ************************************************
 ** This method gets a "twinkled" version of a
 ** Bright light colorIndex.
 **/
function getTwinkledBright(colorIndex) {
    switch (colorIndex) {
        case RED: return getTwinkledRedBright();
        case LIME: return getTwinkledLimeBright();
        case PURPLE: return getTwinkledPurpleBright();
        case CYAN: return getTwinkledCyanBright();
        case GREEN: return getTwinkledGreenBright();
        case ORANGE: return getTwinkledOrangeBright();
        case BLUE: return getTwinkledBlueBright();
        case PINK: return getTwinkledPinkBright();

        case GRAYED:
        default:
            return BRIGHT_GRAYED_RGBA;
    }
}

/** ************************************************
 ** This method gets a "twinkled" version of a
 ** Normal light colorIndex.
 **/
function getTwinkledNormal(colorIndex) {
    switch (colorIndex) {
        case RED: return getTwinkledRedNormal();
        case LIME: return getTwinkledLimeNormal();
        case PURPLE: return getTwinkledPurpleNormal();
        case CYAN: return getTwinkledCyanNormal();
        case GREEN: return getTwinkledGreenNormal();
        case ORANGE: return getTwinkledOrangeNormal();
        case BLUE: return getTwinkledBlueNormal();
        case PINK: return getTwinkledPinkNormal();

        case GRAYED:
        default:
            return NORMAL_GRAYED_RGBA;
    }
}

/** ************************************************
 ** This method gets a "twinkled" version of a
 ** Dark light colorIndex.
 **/
function getTwinkledDark(colorIndex) {
    switch (colorIndex) {
        case RED: return getTwinkledRedDark();
        case LIME: return getTwinkledLimeDark();
        case PURPLE: return getTwinkledPurpleDark();
        case CYAN: return getTwinkledCyanDark();
        case GREEN: return getTwinkledGreenDark();
        case ORANGE: return getTwinkledOrangeDark();
        case BLUE: return getTwinkledBlueDark();
        case PINK: return getTwinkledPinkDark();

        case GRAYED:
        default:
            return DARK_GRAYED_RGBA;
    }
}

/** ************************************************
 ** Helper methods for Red bulb color shades.
 **/
function getTwinkledRedBright() {
    return getTwinkledColorFrom(
        BRIGHT_COLOR, 0x00, 0x00);
}
function getTwinkledRedNormal() {
    return getTwinkledColorFrom(
        NORMAL_COLOR, 0x00, 0x00);
}
function getTwinkledRedDark() {
    return getTwinkledColorFrom(
        DARK_COLOR, 0x00, 0x00);
}

/** ************************************************
 ** Helper methods for Lime bulb color shades.
 **/
function getTwinkledLimeBright() {
    return getTwinkledColorFrom(
        BRIGHT_COLOR, 0xff, 0x00);
}
function getTwinkledLimeNormal() {
    return getTwinkledColorFrom(
        NORMAL_COLOR, 0xff, 0x00);
}
function getTwinkledLimeDark() {
    return getTwinkledColorFrom(
        DARK_COLOR, 0xff, 0x00);
}

/** ************************************************
 ** Helper methods for Purple bulb color shades.
 **/
function getTwinkledPurpleBright() {
    return getTwinkledColorFrom(
        BRIGHT_COLOR, 0x00, 0xff);
}
function getTwinkledPurpleNormal() {
    return getTwinkledColorFrom(
        NORMAL_COLOR, 0x00, 0xff);
}
function getTwinkledPurpleDark() {
    return getTwinkledColorFrom(
        DARK_COLOR, 0x00, 0xff);
}

/** ************************************************
 ** Helper methods for Cyan bulb color shades.
 **/
function getTwinkledCyanBright() {
    return getTwinkledColorFrom(
        BRIGHT_COLOR, 0xff, 0xff);
}
function getTwinkledCyanNormal() {
    return getTwinkledColorFrom(
        NORMAL_COLOR, 0xff, 0xff);
}
function getTwinkledCyanDark() {
    return getTwinkledColorFrom(
        DARK_COLOR, 0xff, 0xff);
}

/** ************************************************
 ** Helper methods for Green bulb color shades.
 **/
function getTwinkledGreenBright() {
    return getTwinkledColorFrom(
        0x00, BRIGHT_COLOR, 0x00);
}
function getTwinkledGreenNormal() {
    return getTwinkledColorFrom(
        0x00, NORMAL_COLOR, 0x00);
}
function getTwinkledGreenDark() {
    return getTwinkledColorFrom(
        0x00, DARK_COLOR, 0x00);
}

/** ************************************************
 ** Helper methods for Orange bulb color shades.
 **/
function getTwinkledOrangeBright() {
    return getTwinkledColorFrom(
        0xff, BRIGHT_COLOR, 0x00);
}
function getTwinkledOrangeNormal() {
    return getTwinkledColorFrom(
        0xff, NORMAL_COLOR, 0x00);
}
function getTwinkledOrangeDark() {
    return getTwinkledColorFrom(
        0xff, DARK_COLOR, 0x00);
}

/** ************************************************
 ** Helper methods for Blue bulb color shades.
 **/
function getTwinkledBlueBright() {
    return getTwinkledColorFrom(
        0x00, BRIGHT_COLOR, 0xff);
}
function getTwinkledBlueNormal() {
    return getTwinkledColorFrom(
        0x00, NORMAL_COLOR, 0xff);
}
function getTwinkledBlueDark() {
    return getTwinkledColorFrom(
        0x00, DARK_COLOR, 0xff);
}

/** ************************************************
 ** Helper methods for Pink bulb color shades.
 **/
function getTwinkledPinkBright() {
    return getTwinkledColorFrom(
        0xff, BRIGHT_COLOR, 0xff);
}
function getTwinkledPinkNormal() {
    return getTwinkledColorFrom(
        0xff, NORMAL_COLOR, 0xff);
}
function getTwinkledPinkDark() {
    return getTwinkledColorFrom(
        0xff, DARK_COLOR, 0xff);
}

/** ************************************************
 ** Main "Twinkle method". Returns a slightly randomized
 ** bulb color from a seeded value.
 **
 ** Seed values for R, G,or B of: 0 and 255 are unchanged.
 **
 ** Other seed values are used as a midpoint to a
 ** randomized range above and below (fuzzy).
 **/
function getTwinkledColorFrom(r, g, b) {
    if (r != 0 && r != 0xff) {
        r = getFuzzyRGBValueFrom(r);
    }
    if (g != 0 && g != 0xff) {
        g = getFuzzyRGBValueFrom(g);
    }
    if (b != 0 && b != 0xff) {
        b = getFuzzyRGBValueFrom(b);
    }

    return Qt.rgba(r / 255, g / 255, b / 255, 1);
}

/** ************************************************
 ** Randomize an R, G, or B value from a range
 ** around a midpoint.
 **/
function getFuzzyRGBValueFrom(midpoint) {
    const RANGE = 45;

    const VALUE = randomIntegerUpTo(2) == 0 ?
        midpoint + randomIntegerUpTo(RANGE) :
        midpoint - randomIntegerUpTo(RANGE);

    return Math.min(Math.max(VALUE, 0x00), 0xff);
}

/** ************************************************
 ** This method returns a whole number from 0 up to
 ** but not including the max.
 **/
function randomIntegerUpTo(max) {
    if (max <= 0) {
        return 0;
    }
    return Math.floor(max * Math.random());
}

/** ************************************************
 ** Minimum app canvas size. Provide largest square
 ** one bulb can fit into.
 **/
function getMinimumCanvasSize() {
    var resultSize = 0;

    for (const BULB of mLightBulbShapesList) {
        const W = BULB.width + getBulbSpace();
        const H = BULB.height + getStrandSpace();

        resultSize = (W > resultSize) ? W : resultSize;
        resultSize = (H > resultSize) ? H : resultSize;
    }

    return resultSize;
}

/** ************************************************
 ** This method clears the drawn canvas.
 **/
function clearCanvas() {
    mCanvas.getContext("2d").clearRect(0, 0,
        mCanvas.width, mCanvas.height);
}

/** ************************************************
 ** This method draws the entire canvas.
 **/
function drawCanvas() {
    // Draws are ignored during re-sizing.
    if (isModuleResizing()) {
        return;
    }

    const BULB_COUNT = getBulbCount();
    for (var i = 0; i < BULB_COUNT; i++) {
        if (mBulbNeedsDraw[i] == true) {
            mBulbNeedsDraw[i] = false;
            drawBulb(i);
        }
    }
}

/** ************************************************
 ** This method draws an individual bulb on the canvas.
 **/
function drawBulb(bulbIndex) {
    const CC = mCanvas.getContext("2d");
    CC.lineWidth = 1;

    // Loop through bitmap.
    for (var w = 0; w < getLightsShapeWidth(); w++) {
        for (var h = 0; h < getLightsShapeHeight(); h++) {
            // Get color from bitmap.
            const bitmapColor = getColorFromBitmapAt(w, h);

            // None doesn't render.
            if (bitmapColor == "None") {
                continue;
            }

            // Black & white don't translate.
            if (bitmapColor == "black" ||
                bitmapColor == "white") {
                CC.fillStyle = bitmapColor;
                CC.fillRect(mLightXPos[bulbIndex] + w,
                    mLightYPos[bulbIndex] + h, 1, 1);
                continue;
            }

            // Set translated color.
            switch (bitmapColor) {
                case "BRIGHT":
                    CC.fillStyle = mBulbColorBright[bulbIndex];
                    break;
                case "NORMAL":
                    CC.fillStyle = mBulbColorNormal[bulbIndex];
                    break;
                case "DARK":
                    CC.fillStyle = mBulbColorDark[bulbIndex];
                    break;
                default:
                    CC.fillStyle = "black";
            }

            // Draw pixel.
            CC.fillRect(mLightXPos[bulbIndex] + w,
                mLightYPos[bulbIndex] + h, 1, 1);
        }
    }
}

/** ************************************************
 ** This method returns the color of a bitmap pixel
 ** at x,y in the bitmap.
 **/
function getColorFromBitmapAt(x, y) {
    const COLOR_CHAR = getColorIndexFromBitmapAt(x, y);
    const COLOR_INDEX = getLightsShape().colorsIndex.
        indexOf(COLOR_CHAR);

    if (COLOR_INDEX == -1) {
        console.log("lightstrands: Lights.js " +
            "getColorFromBitmapAt() Ignores " +
            "invalid Bitmap char [" + COLOR_CHAR +
            "] in BULB: [" + getLightsShapeId() + "]");
        return "None";
    }

    return getLightsShape().colors[COLOR_INDEX];
}

/** ************************************************
 ** This method returns the color index of a bitmap
 ** pixel at x,y in the bitmap.
 **/
function getColorIndexFromBitmapAt(x, y) {
    const X_SUBSTR_POS = x % getLightsShapeWidth();

    return getLightsShape().bitmap[y].
        substr(X_SUBSTR_POS, 1);
}

/** ************************************************
 ** This method updates the bulbs randomly to produce
 ** Twinkling effect. Change 1 out of 5 bulbs each time.
 **/
function updateCanvas() {
    var colorIndex =
        getFirstActiveLightsColorIndex();
    if (colorIndex == GRAYED) {
        return;
    }

    const BULB_COUNT = getBulbCount();
    for (var i = 0; i < BULB_COUNT; i++) {
        if (randomIntegerUpTo(5) == 0) {
            mBulbColorBright[i] =
                getTwinkledBright(colorIndex);
            mBulbColorNormal[i] =
                getTwinkledNormal(colorIndex);
            mBulbColorDark[i] =
                getTwinkledDark(colorIndex);
            mBulbNeedsDraw[i] = true;
        }
        colorIndex =
            getNextActiveLightsColorIndex(colorIndex);
    }
}

/** ************************************************
 ** Getter / Setters for module initialized value.
 **/
function isModuleResizing() {
    return mIsModuleResizing;
}
function setModuleIsResizing(value) {
    mIsModuleResizing = value;
}

/** ************************************************
 ** Getter / Setters for module initialized value.
 **/
function isModuleInitialized() {
    return CFG.isModuleInitialized;
}
function setModuleIsInitialized(value) {
    CFG.isModuleInitialized = value;
}

/** ************************************************
 ** Getter / Setters for strand orientation.
 **/
function isStrandHorizontal() {
    return mCanvas.width > mCanvas.height;
}
function isStrandVertical() {
    return !isStrandHorizontal();
}

/** ************************************************
 ** Getter for bulb spacing.
 **/
function getBulbSpace() {
    return CFG.bulbSpaceSlider;
}

/** ************************************************
 ** Getter for strand spacing.
 **/
function getStrandSpace() {
    return CFG.strandSpaceSlider;
}

/** ************************************************
 ** Getters for bulb shapes.
 **/
function getLightsShapeIndex() {
    return CFG.chosenBulb;
}

function getLightsShape() {
    return mLightBulbShapesList[
        getLightsShapeIndex()];
}

function getLightsShapeId() {
    return getLightsShape().id;
}

function getLightsShapeWidth() {
    return getLightsShape().width;
}

function getLightsShapeHeight() {
    return getLightsShape().height;
}
