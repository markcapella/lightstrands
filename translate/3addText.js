
const FS = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const WORKING_FOLDER = '.';


/** ************************************************
 ** This method adds translated versions of strings
 ** to each base translated language .po file.
 **/
FS.readdir(WORKING_FOLDER, (err, files) => {
    // Sanity check working folder name.
    if (err) {
        console.log("Error reading directory:", err);
        return;
    }

    const POFILE_TAG = ".po";
    const NEW_POFILE_TAG = "Translated.po";

    // Convert each file in working folder.
    files.forEach(file => {
        const FILE_PATH = path.join(WORKING_FOLDER, file);

        FS.stat(FILE_PATH, (err, stats) => {
            if (err) {
                return;
            }

            // Only do files, not folders.
            if (!stats.isFile()) {
                return;
            }

            // Only do .po files.
            if (!file.endsWith(POFILE_TAG)) {
                return;
            }

            // Don't do already-converted .po files.
            if (file.endsWith(NEW_POFILE_TAG)) {
                return;
            }

            // Determine "new .po" output file name.
            const POFILE_TAG_INDEX = file.lastIndexOf(
                POFILE_TAG);
            const NEW_FILENAME = file.substr(0,
                POFILE_TAG_INDEX) + NEW_POFILE_TAG;

            console.log("\nCreating new .po file : ",
                NEW_FILENAME + "\n");
            convertFile(file, NEW_FILENAME);
        });
    });
});

/** ************************************************
 ** This method Converts each file in working folder
 ** parsing backwards.
 **/
function convertFile(infile, outfile) {
    console.log("File [" + infile + "] conversion starts.");

    setInfileData(infile);

    var msgidNameIndex = getLastMsgidIndex();
    var msgidName = getLastMsgid();
    writeNewPoString(outfile, "");

    while (msgidName) {
        // Don't translate links.
        if (msgidName.startsWith("http")) {
            console.log("Translation ignored for link:  " +
                msgidName);
            msgidNameIndex = getMsgidIndexBeforeIndex(
                msgidNameIndex);
            msgidName = getMsgidAtIndex(msgidNameIndex);
            continue;
        }

        // Don't translate if already translated.
        const MSGSTR = getMsgstrAfterIndex(msgidNameIndex);
        if (MSGSTR) {
            console.log("Translation already provided " +
                "for msgid:  " + msgidName);
            msgidNameIndex = getMsgidIndexBeforeIndex(
                msgidNameIndex);
            msgidName = getMsgidAtIndex(msgidNameIndex);
            continue;
        }

        console.log("translating : [" + msgidName + "]");
        const I18N = getI18nForText(msgidName);
        console.log("translated  : [" + I18N + "]");

        const INDEX = getMsgstrIndexAfterIndex(msgidNameIndex) +
                getMSGSTR_TAG().length;
        const NEW_DATA = this.mInfileData.substr(0, INDEX) +
            I18N + this.mInfileData.substr(INDEX);

        this.mInfileData = NEW_DATA;
        msgidNameIndex = getMsgidIndexBeforeIndex(
            msgidNameIndex);
        msgidName = getMsgidAtIndex(msgidNameIndex);
    }

    appendNewPoString(outfile, this.mInfileData);
    console.log("File [" + infile + "] conversion finishes.");
}

/** ************************************************
 ** This method gets index of the last MSGID string.
 **/
function getLastMsgidIndex() {
    const R = this.mInfileData.
        lastIndexOf(getMSGID_TAG());

    //console.log("getLastMsgidIndex : [" + getMSGID_TAG() +
    //    "] : " + R);
    return R;
}

/** ************************************************
 ** This method gets the last MSGID string.
 **/
function getLastMsgid() {
    const MSGID_TAG_INDEX =
        getLastMsgidIndex(this.mInfileData);
    if (MSGID_TAG_INDEX == -1) {
        //console.log("getLastMsgid : [!]");
        return "";
    }

    const MSGID_NAME_INDEX = MSGID_TAG_INDEX +
        getMSGID_TAG().length;
    const MSGID_TEMP_NAME = this.mInfileData.substr(
        MSGID_NAME_INDEX);

    const MSGID_NAME = MSGID_TEMP_NAME.substr(0,
        MSGID_TEMP_NAME.indexOf(getEND_QUOTE_TAG()));

    //console.log("getLastMsgid : [" + MSGID_NAME + "]");
    return MSGID_NAME;
}

/** ************************************************
 ** This method gets the index of a msgid before
 ** a starting point.
 **/
function getMsgidIndexBeforeIndex(index) {
    const R = this.mInfileData.substr(0, index).
        lastIndexOf(getMSGID_TAG());
    //console.log("getMsgidIndexBeforeIndex : [" + R + "]");

    return R;
}

/** ************************************************
 ** This method gets msgid at a starting point.
 **/
function getMsgidAtIndex(index) {
    //const R = this.mInfileData.
    //    indexOf(getMSGID_TAG(), index);

    //console.log("getMsgidAtIndex : [" + R + "]");
    //return R;

    const MSGID_NAME_INDEX = index +
        getMSGID_TAG().length;
    const MSGID_TEMP_NAME = this.mInfileData.substr(
        MSGID_NAME_INDEX);

    const MSGID_NAME = MSGID_TEMP_NAME.substr(0,
        MSGID_TEMP_NAME.indexOf(getEND_QUOTE_TAG()));

    //console.log("getMsgidAtIndex : [" + MSGID_NAME + "]");
    return MSGID_NAME;
}

/** ************************************************
 ** This method gets the index of a msgstr after
 ** a starting point.
 **/
function getMsgstrIndexAfterIndex(index) {
    //console.log("getMsgstrIndexAfterIndex : [ index " +
    //    index + "]");

    const R = this.mInfileData.
        indexOf(getMSGSTR_TAG(), index);

    //console.log("getMsgstrIndexAfterIndex : [ R " +
    //    R + "]");
    return R;
}

/** ************************************************
 ** This method gets the msgstr after a
 ** starting point.
 **/
function getMsgstrAfterIndex(index) {
    const MSGSTR_TAG_INDEX =
        getMsgstrIndexAfterIndex(index);
    if (MSGSTR_TAG_INDEX == -1) {
        //console.log("getMsgstrAfterIndex : [!]");
        return "";
    }

    const MSGSTR_NAME_INDEX = MSGSTR_TAG_INDEX +
        getMSGSTR_TAG().length;

    const MSGSTR_TEMP_NAME = this.mInfileData.substr(
        MSGSTR_NAME_INDEX);

    const MSGSTR_NAME = MSGSTR_TEMP_NAME.substr(0,
        MSGSTR_TEMP_NAME.indexOf(getEND_QUOTE_TAG()));

    //console.log("getMsgstrAfterIndex : [" + MSGSTR_NAME + "]");
    return MSGSTR_NAME;
}

/** ************************************************
 ** Helper methods to write & append strings
 ** to the new .po output file.
 **/
function writeNewPoString(outfile, string) {
    try {
        FS.writeFileSync(outfile, string + "\n");
    } catch (err) { }
}

function appendNewPoString(outfile, string) {
    try {
        FS.appendFileSync(outfile, string + "\n");
    } catch (err) { }
}


/** ************************************************
 ** This method reads the input .po file & makes
 ** it parseable.
 **/
function setInfileData(infile) {
    this.mInfileName = infile;
    this.mInfileLang = this.mInfileName.substr(0, 2);

    this.mInfileData = "";
    try {
        this.mInfileData = FS.readFileSync(infile, 'utf8');
    } catch (err) {
        console.log("getInfileData() Error reading [" +
            infile + "] : " + err);
    }
}

/** ************************************************
 ** Getters /setters for global consts.
 **/
function getMSGID_TAG() {
    return "msgid \"";
}

function getMSGSTR_TAG() {
    return "msgstr \"";
}

function getEND_QUOTE_TAG() {
    return "\"";
}

/** ************************************************
 ** This method converts a msgid string to a
 ** string in another language.
 **/
function getI18nForText(text) {
    const CMD = "trans -b :" + this.mInfileLang +
        " \"" + text + "\"";

    try {
        // Execute a command and capture its stdout
        const stdoutBuffer = execSync(CMD); 
        var result = stdoutBuffer.toString();
        //console.log("CONVERT CMD result length : [" +
        //    result.length + "]");

        if (result.endsWith("\n")) {
            result = result.substr(0, result.length - 1);
            //console.log("CONVERT CMD result length : [" +
            //    result.length + "]");
        }

        //console.log("CONVERT CMD result : [" +
        //    result + "]");
        return result;

    } catch (error) { }
}
