
const FS = require('fs');
const path = require('path');

const WORKING_FOLDER = '.';


/** ************************************************
 ** exec:
 **     > node convertJSToXPM.js
 **
 ** This method converts all fooBulb.js files
 ** in a working folder to fooBulb.xpm format.
 **/
FS.readdir(WORKING_FOLDER, (err, files) => {
    // Sanity check working folder name.
    if (err) {
        console.log("Error reading directory:", err);
        return;
    }

    console.log("App starts.");

    // Convert each FOO-Bulb.js file in
    //  working folder to FOO-Bulb.xpm.
    files.forEach(file => {
        const FILE_PATH =
            path.join(WORKING_FOLDER, file);

        FS.stat(FILE_PATH, (err, stats) => {
            if (err) {
                console.log("Error stat-ing file [" + file +
                    "] : " + err);
                return;
            }

            // Only do files.
            if (stats.isFile()) {
                convertJStoXPM(file);
            }
        });
    });

    console.log("App finishes.\n");
});

/** ************************************************
 ** This method ...
 **/
function convertJStoXPM(file) {
    const BULB_JS_TAG = "Bulb.js";
    const BULB_XPM_TAG = "Bulb.xpm";
    const CLASS_DOT_TAG = ".";

    // Only .js files for input.
    const TAG_INDEX = file.indexOf(BULB_JS_TAG);
    if (TAG_INDEX == -1) {
        return;
    }

    // Determine new XPM output file name.
    const NEW_FILENAME = file.substr(0, TAG_INDEX) +
        BULB_XPM_TAG;
    const DOT_INDEX = file.indexOf(CLASS_DOT_TAG);
    const NEW_FILENAME_NOEXT= file.substr(0, DOT_INDEX);

    console.log("File [" + file +
        "] conversion starts.");

    writeXPMOpenSignature(file,
        NEW_FILENAME, NEW_FILENAME_NOEXT);
    appendXPMHeader(file, NEW_FILENAME);
    appendXPMColors(file, NEW_FILENAME);
    appendXPMBitmap(file, NEW_FILENAME);
    appendXPMCloseSignature(file, NEW_FILENAME);

    console.log("File [" + file +
        "] conversion finishes.\n");
}

/** ************************************************
 ** This method writes the XPM Object Signature.
 **/
function writeXPMOpenSignature(infile, outfile,
    newNameNoExt) {

    var data = "/* XPM */";
    writeXPMString(outfile, data);

    data = "XPM_TYPE* " + newNameNoExt +
        "[] = {";
    appendXPMString(outfile, data);

    data = "";
    appendXPMString(outfile, data);
}

/** ************************************************
 ** This method writes the XPM Object
 ** size-and-colors-count header line.
 **/
function appendXPMHeader(infile, outfile) {
    console.log("appendXPMHeader [" + outfile +
        "] starts.");

    const WIDTH = getBulbWidth(infile);
    var data = "    \"" + WIDTH + " " +
        getBulbHeight(infile) + " 6 1\",";
    appendXPMString(outfile, data);

    data = "";
    appendXPMString(outfile, data);

    console.log("appendXPMHeader [" + outfile +
        "] finishes.");
}

/** ************************************************
 ** This method ...
 **/
function getBulbWidth(infile) {
    var data = "";
    try {
        data = FS.readFileSync(infile, 'utf8');
    } catch (err) {
        console.log("getBulbWidth() Error reading " +
            infile + " : " + err);
        data = "";
    }

    const WIDTH_TAG = "width: ";
    const COMMA_TAG = ",";

    const WIDTH_INDEX = data.indexOf(WIDTH_TAG) +
        WIDTH_TAG.length;
    const WIDTH_STRING = data.substr(WIDTH_INDEX);

    const WIDTH_AMOUNT = WIDTH_STRING.substr(0,
        WIDTH_STRING.indexOf(COMMA_TAG));

    return WIDTH_AMOUNT;
}

/** ************************************************
 ** This method ...
 **/
function getBulbHeight(infile) {
    var data = "";
    try {
        data = FS.readFileSync(infile, 'utf8');
    } catch (err) {
        console.log("getBulbHeight() Error reading " +
            infile + " : " + err);
        data = "";
    }

    const HEIGHT_TAG = "height: ";
    const COMMA_TAG = ",";

    const HEIGHT_INDEX = data.indexOf(HEIGHT_TAG) +
        HEIGHT_TAG.length;
    const HEIGHT_STRING = data.substr(HEIGHT_INDEX);

    const HEIGHT_AMOUNT = HEIGHT_STRING.substr(0,
        HEIGHT_STRING.indexOf(COMMA_TAG));

    return HEIGHT_AMOUNT;
}

/** ************************************************
 ** This method writes the XPM Object Size &
 ** colors count header line.
 **/
function appendXPMColors(infile, outfile) {
    var indexArray = getBulbColorsIndexs(infile);

    var data = "    \"" + indexArray.substr(1, 1) +
         " c None\",";
    appendXPMString(outfile, data);

    data = "    \"" + indexArray.substr(6, 1) +
        " c black\",";
    appendXPMString(outfile, data);

    data = "    \"" + indexArray.substr(11, 1) +
        " c white\",";
    appendXPMString(outfile, data);

    data = "    \"" + indexArray.substr(16, 1) +
        " c #00a800\",";
    appendXPMString(outfile, data);

    data = "    \"" + indexArray.substr(21, 1) +
        " c #00db00\",";
    appendXPMString(outfile, data);

    data = "    \"" + indexArray.substr(26, 1) +
        " c #00b400\",";
    appendXPMString(outfile, data);

    console.log("appendXPMColors() data : " + data);
}

/** ************************************************
 ** This method ...
 **/
function getBulbColorsIndexs(infile) {
    console.log("getBulbColorsIndexs [" + infile +
        "] starts.");

    var data = "";
    try {
        data = FS.readFileSync(infile, 'utf8');
    } catch (err) {
        console.log("getBulbColorsIndexs() Error reading " +
            infile + " : " + err);
        data = "";
    }

    const COLORS_TAG = "colorsIndex:";
    const COLORS_INDEX = data.indexOf(COLORS_TAG) +
        COLORS_TAG.length;
    const COLORS_ARRAY = data.substr(COLORS_INDEX);

    const BRACKET_TAG = "[ ";
    const BRACKET_INDEX = COLORS_ARRAY.indexOf(BRACKET_TAG) +
        BRACKET_TAG.length;
    const BRACKET_STRING = COLORS_ARRAY.substr(BRACKET_INDEX);

    const BRACKETEND_TAG = "],";
    const BRACKETEND_INDEX = BRACKET_STRING.indexOf(BRACKETEND_TAG);
    const BRACKETEND_STRING = BRACKET_STRING.substr(0, BRACKETEND_INDEX);

    console.log("getBulbColorsIndexs BRACKETEND_STRING --" +
        BRACKETEND_STRING + "--");

    return BRACKETEND_STRING;
}

/** ************************************************
 ** Helpers to parse ColorsIndex attributes.
 **/
function getFirstIndexChar(indexArray) {
    return indexArray[0];
}

function removeFirstIndexChar(indexArray) {
    indexArray.shift();
    return indexArray;
}

/** ************************************************
 ** This method writes the XPM Object Size &
 ** colors count header line.
 **/
function appendXPMBitmap(infile, outfile) {
    var data = "";
    try {
        data = FS.readFileSync(infile, 'utf8');
    } catch (err) {
        console.log("appendXPMBitmap() Error reading " +
            infile + " : " + err);
        data = "";
    }

    const BITMAP_TAG = "bitmap: [";
    const BITMAP_INDEX = data.indexOf(BITMAP_TAG) +
        BITMAP_TAG.length;
    const BITMAP_STRING = data.substr(BITMAP_INDEX);

    const BRACKETEND_TAG = "]";
    const BRACKETEND_INDEX = BITMAP_STRING.indexOf(BRACKETEND_TAG);
    const BITMAP = BITMAP_STRING.substr(0, BRACKETEND_INDEX);

    appendXPMString(outfile, BITMAP);
}

/** ************************************************
 ** This method writes the XPM Object Size &
 ** colors count header line.
 **/
function appendXPMCloseSignature(infile, outfile) {
    var data = "};";
    appendXPMString(outfile, data);

    data = "";
    appendXPMString(outfile, data);
}

/** ************************************************
 ** Helper methods to write & append a string
 ** to the XPM output file.
 **/
function writeXPMString(file, data) {
    try {
        FS.writeFileSync(file, data + "\n");
    } catch (err) { }
}

function appendXPMString(file, data) {
    try {
        FS.appendFileSync(file, data + "\n");
    } catch (err) { }
}
