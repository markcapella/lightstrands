
// Gray themed LightShapes.
.import "XmasBulb.js" as XmasBulb
.import "PlainEasterEggBulb.js" as PlainEasterEggBulb
.import "EasterEggBulb.js" as EasterEggBulb
.import "AmericanBulb.js" as AmericanBulb
.import "RocketBulb.js" as RocketBulb
.import "PumpkinBulb.js" as PumpkinBulb

.import "BalloonsBulb.js" as BalloonsBulb
.import "CandleBulb.js" as CandleBulb
.import "ColonyHatBulb.js" as ColonyHatBulb
.import "DrinksBulb.js" as DrinksBulb
.import "FireworksBulb.js" as FireworksBulb
.import "GhostBulb.js" as GhostBulb
.import "HalloweenBulb.js" as HalloweenBulb
.import "LobsterBulb.js" as LobsterBulb
.import "LobsterUpBulb.js" as LobsterUpBulb
.import "NewYearsBulb.js" as NewYearsBulb
.import "PartyBulb.js" as PartyBulb
.import "PumpkinPieBulb.js" as PumpkinPieBulb
.import "RibbonsBulb.js" as RibbonsBulb
.import "SkullBulb.js" as SkullBulb
.import "StarsBulb.js" as StarsBulb
.import "TurkeyLeftBulb.js" as TurkeyLeftBulb
.import "TurkeyRightBulb.js" as TurkeyRightBulb

.import "CloverBulb.js" as CloverBulb
.import "FancyCloverBulb.js" as FancyCloverBulb
.import "FlowerVaseBulb.js" as FlowerVaseBulb
.import "HeartBulb.js" as HeartBulb
.import "HeartsBulb.js" as HeartsBulb
.import "HeartStarBulb.js" as HeartStarBulb
.import "IrishBulb.js" as IrishBulb
.import "IrishHatBulb.js" as IrishHatBulb
.import "PotOfGoldBulb.js" as PotOfGoldBulb


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
const GRAYED = -1;
const RED = 0;
const LIME = 1;
const PURPLE = 2;
const CYAN = 3;
const GREEN = 4;
const ORANGE = 5;
const BLUE = 6;
const PINK = 7;
const MAX_LIGHT_COLORS = 8;


/** ************************************************
 ** Module globals.
 **/

// Bulb position, color, redraw attrs.
var mLightXPos = [ ];
var mLightYPos = [ ];

var mBulbColorBright = [ ];
var mBulbColorNormal = [ ];
var mBulbColorDark = [ ];
var mBulbNeedsRedraw = [ ];

// Bulb shape list.
var mLightBulbShapesList = [
    XmasBulb.XmasBulb,
    PlainEasterEggBulb.PlainEasterEggBulb,
    EasterEggBulb.EasterEggBulb,
    AmericanBulb.AmericanBulb,
    RocketBulb.RocketBulb,
    PumpkinBulb.PumpkinBulb,

    BalloonsBulb.BalloonsBulb,
    CandleBulb.CandleBulb,
    ColonyHatBulb.ColonyHatBulb,
    DrinksBulb.DrinksBulb,
    FireworksBulb.FireworksBulb,
    GhostBulb.GhostBulb,
    HalloweenBulb.HalloweenBulb,
    LobsterBulb.LobsterBulb,
    LobsterUpBulb.LobsterUpBulb,
    NewYearsBulb.NewYearsBulb,
    PartyBulb.PartyBulb,
    PumpkinPieBulb.PumpkinPieBulb,
    RibbonsBulb.RibbonsBulb,
    SkullBulb.SkullBulb,
    StarsBulb.StarsBulb,
    TurkeyLeftBulb.TurkeyLeftBulb,
    TurkeyRightBulb.TurkeyRightBulb,

    CloverBulb.CloverBulb,
    FancyCloverBulb.FancyCloverBulb,
    FlowerVaseBulb.FlowerVaseBulb,
    HeartBulb.HeartBulb,
    HeartsBulb.HeartsBulb,
    HeartStarBulb.HeartStarBulb,
    IrishBulb.IrishBulb,
    IrishHatBulb.IrishHatBulb,
    PotOfGoldBulb.PotOfGoldBulb,
];


/** ************************************************
 ** This method initializes the module.
 **/
function initLightsModule() {
    setAllBulbPositions();
    setAllBulbColors();

    setModuleInitialized();
}

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
        getLightsShapeWidth() + getBulbSpacingValue();

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
         (BULB_COUNT - 1) * getBulbSpacingValue() : 0;

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
        CFG.bulbAlternatingOffset;

    const HEIGHT_FOR_MARGINS = mCanvas.height -
        ALL_BULB_HEIGHTS;
    const TOP_MARGIN_HEIGHT = Math.floor(
        HEIGHT_FOR_MARGINS / 2);

    const IS_LIGHT_NUMBER_EVEN = Math.floor(
        lightNumber / 2) * 2 == lightNumber;

    return IS_LIGHT_NUMBER_EVEN ?
        TOP_MARGIN_HEIGHT : TOP_MARGIN_HEIGHT +
            CFG.bulbAlternatingOffset;
}

/** ************************************************
 ** This method sets each bulbs x/y position
 ** for vertically oriented light strands.
 **/
function setVerticalBulbPositions() {
    var yPos = getFirstVerticalBulbYPos();
    const ONE_COLUMN_HEIGHT =
        getLightsShapeHeight() + getBulbSpacingValue();

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
         (BULB_COUNT - 1) * getBulbSpacingValue() : 0;

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
        CFG.bulbAlternatingOffset;

    const WIDTH_FOR_MARGINS = mCanvas.width -
        ALL_BULB_WIDTHS;
    const TOP_MARGIN_WIDTH = Math.floor(
        WIDTH_FOR_MARGINS / 2);

    const IS_LIGHT_NUMBER_EVEN = Math.floor(
        lightNumber / 2) * 2 == lightNumber;

    return IS_LIGHT_NUMBER_EVEN ?
        TOP_MARGIN_WIDTH : TOP_MARGIN_WIDTH +
            CFG.bulbAlternatingOffset;
}

/** ************************************************
 ** This method sets each bulbs 3-color theme.
 **/
function setAllBulbColors() {
    mBulbColorBright = [ ];
    mBulbColorNormal = [ ];
    mBulbColorDark = [ ];
    mBulbNeedsRedraw = [ ];

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
        mBulbNeedsRedraw.push(true);

        if (colorIndex != GRAYED) {
            colorIndex =
                getNextActiveLightsColorIndex(colorIndex);
        }
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
        getLightsShapeWidth() + getBulbSpacingValue();

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
        getLightsShapeHeight() + getBulbSpacingValue();

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
function getMinimumSquareCanvasSize() {
    var resultSize = 0;

    for (const BULB of mLightBulbShapesList) {
        if (BULB.width > resultSize) {
            resultSize = BULB.width;
        }
        if (BULB.height > resultSize) {
            resultSize = BULB.height;
        }
    }

    return resultSize + 1;
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
function drawCanvasFrame() {
    // First draw requires first init.
    if (!getIsModuleInitialized()) {
        initLightsModule();
    }

    const BULB_COUNT = getBulbCount();
    for (var i = 0; i < BULB_COUNT; i++) {
        if (mBulbNeedsRedraw[i]) {
            drawBulb(i);
            mBulbNeedsRedraw[i] = false;
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
    return getLightsShape().colors[
        getLightsShape().colorsIndex.indexOf(
            getColorIndexFromBitmapAt(x, y))];
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
function updateCanvasFrame() {
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
            mBulbNeedsRedraw[i] = true;
        }
        colorIndex =
            getNextActiveLightsColorIndex(colorIndex);
    }
}

/** ************************************************
 ** Getter / Setters for module initialized value.
 **/
function getIsModuleInitialized() {
    return CFG.isModuleInitialized;
}
function setModuleInitialized() {
    CFG.isModuleInitialized = true;
}

/** ************************************************
 ** Getter / Setters for strand orientation.
 **/
function isStrandHorizontal() {
    return mCanvas.width > mCanvas.height;
}
function isStrandVertical() {
    return mCanvas.height >= mCanvas.width;
}

/** ************************************************
 ** Getter for bulb spacing.
 **/
function getBulbSpacingValue() {
    return CFG.bulbSpaceWidthSlider;
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

/** ************************************************
 ** Getters for bulb shape sizes.
 **/
function getLightsShapeWidth() {
    return getLightsShape().width;
}
function getLightsShapeHeight() {
    return getLightsShape().height;
}
