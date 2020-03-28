// Action script...

// [Initial MovieClip Action of sprite 206]
#initclip 16
class com.rockstargames.gtav.cellphone.IconLabels
{
    static var _instance;
    function IconLabels()
    {
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + "0"] = null;
        HASHTABLE[PREFIX + "1"] = com.rockstargames.gtav.cellphone.IconLabels.CAMERA;
        HASHTABLE[PREFIX + "2"] = com.rockstargames.gtav.cellphone.IconLabels.TEXT_MESSAGE;
        HASHTABLE[PREFIX + "3"] = com.rockstargames.gtav.cellphone.IconLabels.CALENDAR;
        HASHTABLE[PREFIX + "4"] = com.rockstargames.gtav.cellphone.IconLabels.EMAIL;
        HASHTABLE[PREFIX + "5"] = com.rockstargames.gtav.cellphone.IconLabels.CALL;
        HASHTABLE[PREFIX + "6"] = com.rockstargames.gtav.cellphone.IconLabels.EYEFIND;
        HASHTABLE[PREFIX + "7"] = com.rockstargames.gtav.cellphone.IconLabels.MAP;
        HASHTABLE[PREFIX + "8"] = com.rockstargames.gtav.cellphone.IconLabels.APPS;
        HASHTABLE[PREFIX + "9"] = com.rockstargames.gtav.cellphone.IconLabels.MEDIA;
        HASHTABLE[PREFIX + "10"] = com.rockstargames.gtav.cellphone.IconLabels.ATTACHMENT;
        HASHTABLE[PREFIX + "11"] = com.rockstargames.gtav.cellphone.IconLabels.NEW_CONTACT;
        HASHTABLE[PREFIX + "12"] = com.rockstargames.gtav.cellphone.IconLabels.SIDE_TASKS;
        HASHTABLE[PREFIX + "13"] = com.rockstargames.gtav.cellphone.IconLabels.BAWSAQ;
        HASHTABLE[PREFIX + "14"] = com.rockstargames.gtav.cellphone.IconLabels.MULTIPLAYER;
        HASHTABLE[PREFIX + "15"] = com.rockstargames.gtav.cellphone.IconLabels.MUSIC;
        HASHTABLE[PREFIX + "16"] = com.rockstargames.gtav.cellphone.IconLabels.GPS;
        HASHTABLE[PREFIX + "17"] = com.rockstargames.gtav.cellphone.IconLabels.SPARE;
        HASHTABLE[PREFIX + "18"] = com.rockstargames.gtav.cellphone.IconLabels.RINGTONE;
        HASHTABLE[PREFIX + "19"] = com.rockstargames.gtav.cellphone.IconLabels.TEXT_TONE;
        HASHTABLE[PREFIX + "20"] = com.rockstargames.gtav.cellphone.IconLabels.VIBRATE_ON;
        HASHTABLE[PREFIX + "21"] = com.rockstargames.gtav.cellphone.IconLabels.VIBRATE_OFF;
        HASHTABLE[PREFIX + "22"] = com.rockstargames.gtav.cellphone.IconLabels.VOLUME;
        HASHTABLE[PREFIX + "23"] = com.rockstargames.gtav.cellphone.IconLabels.SETTINGS_1;
        HASHTABLE[PREFIX + "24"] = com.rockstargames.gtav.cellphone.IconLabels.SETTINGS_2;
        HASHTABLE[PREFIX + "25"] = com.rockstargames.gtav.cellphone.IconLabels.PROFILE;
        HASHTABLE[PREFIX + "26"] = com.rockstargames.gtav.cellphone.IconLabels.SLEEP_MODE;
        HASHTABLE[PREFIX + "27"] = com.rockstargames.gtav.cellphone.IconLabels.MISSED_CALL;
        HASHTABLE[PREFIX + "28"] = com.rockstargames.gtav.cellphone.IconLabels.UNREAD_EMAIL;
        HASHTABLE[PREFIX + "29"] = com.rockstargames.gtav.cellphone.IconLabels.READ_EMAIL;
        HASHTABLE[PREFIX + "30"] = com.rockstargames.gtav.cellphone.IconLabels.REPLY_EMAIL;
        HASHTABLE[PREFIX + "31"] = com.rockstargames.gtav.cellphone.IconLabels.REPLAYMISSION;
        HASHTABLE[PREFIX + "32"] = com.rockstargames.gtav.cellphone.IconLabels.SHITSKIP;
        HASHTABLE[PREFIX + "33"] = com.rockstargames.gtav.cellphone.IconLabels.UNREAD_SMS;
        HASHTABLE[PREFIX + "34"] = com.rockstargames.gtav.cellphone.IconLabels.READ_SMS;
        HASHTABLE[PREFIX + "35"] = com.rockstargames.gtav.cellphone.IconLabels.PLAYER_LIST;
        HASHTABLE[PREFIX + "36"] = com.rockstargames.gtav.cellphone.IconLabels.COP_BACKUP;
        HASHTABLE[PREFIX + "37"] = com.rockstargames.gtav.cellphone.IconLabels.GANG_TAXI;
        HASHTABLE[PREFIX + "38"] = com.rockstargames.gtav.cellphone.IconLabels.REPEAT_PLAY;
        HASHTABLE[PREFIX + "39"] = com.rockstargames.gtav.cellphone.IconLabels.CHECKLIST;
        HASHTABLE[PREFIX + "40"] = com.rockstargames.gtav.cellphone.IconLabels.SNIPER;
        HASHTABLE[PREFIX + "41"] = com.rockstargames.gtav.cellphone.IconLabels.ZIT_IT;
        HASHTABLE[PREFIX + "42"] = com.rockstargames.gtav.cellphone.IconLabels.TRACKIFY;
        HASHTABLE[PREFIX + "43"] = com.rockstargames.gtav.cellphone.IconLabels.SAVE;
        HASHTABLE[PREFIX + "44"] = com.rockstargames.gtav.cellphone.IconLabels.ADD_TAG;
        HASHTABLE[PREFIX + "45"] = com.rockstargames.gtav.cellphone.IconLabels.REMOVE_TAG;
        HASHTABLE[PREFIX + "46"] = com.rockstargames.gtav.cellphone.IconLabels.LOCATION;
        HASHTABLE[PREFIX + "47"] = com.rockstargames.gtav.cellphone.IconLabels.PARTY;
        HASHTABLE[PREFIX + "48"] = com.rockstargames.gtav.cellphone.IconLabels.TICKED;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.cellphone.IconLabels._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.cellphone.IconLabels();
        } // end if
        return (com.rockstargames.gtav.cellphone.IconLabels._instance.HASHTABLE[com.rockstargames.gtav.cellphone.IconLabels._instance.PREFIX + i]);
    } // End of the function
    static var CAMERA = new Array(1, "CAMERA");
    static var TEXT_MESSAGE = new Array(2, "TEXT_MESSAGE");
    static var CALENDAR = new Array(3, "CALENDAR");
    static var EMAIL = new Array(4, "EMAIL");
    static var CALL = new Array(5, "CALL");
    static var EYEFIND = new Array(6, "EYEFIND");
    static var MAP = new Array(7, "MAP");
    static var APPS = new Array(8, "APPS");
    static var MEDIA = new Array(9, "MEDIA");
    static var ATTACHMENT = new Array(10, "ATTACHMENT");
    static var NEW_CONTACT = new Array(11, "NEW_CONTACT");
    static var SIDE_TASKS = new Array(12, "SIDE_TASKS");
    static var BAWSAQ = new Array(13, "BAWSAQ");
    static var MULTIPLAYER = new Array(14, "MULTIPLAYER");
    static var MUSIC = new Array(15, "MUSIC");
    static var GPS = new Array(16, "GPS");
    static var SPARE = new Array(17, "SPARE");
    static var RINGTONE = new Array(18, "RINGTONE");
    static var TEXT_TONE = new Array(19, "TEXT_TONE");
    static var VIBRATE_ON = new Array(20, "VIBRATE_ON");
    static var VIBRATE_OFF = new Array(21, "VIBRATE_OFF");
    static var VOLUME = new Array(22, "VOLUME");
    static var SETTINGS_1 = new Array(23, "SETTINGS_1");
    static var SETTINGS_2 = new Array(24, "SETTINGS_2");
    static var PROFILE = new Array(25, "PROFILE");
    static var SLEEP_MODE = new Array(26, "SLEEP_MODE");
    static var MISSED_CALL = new Array(27, "MISSED_CALL");
    static var UNREAD_EMAIL = new Array(28, "UNREAD_EMAIL");
    static var READ_EMAIL = new Array(29, "READ_EMAIL");
    static var REPLY_EMAIL = new Array(30, "REPLY_EMAIL");
    static var REPLAYMISSION = new Array(31, "REPLAYMISSION");
    static var SHITSKIP = new Array(32, "SHITSKIP");
    static var UNREAD_SMS = new Array(33, "UNREAD_SMS");
    static var READ_SMS = new Array(34, "READ_SMS");
    static var PLAYER_LIST = new Array(35, "PLAYER_LIST");
    static var COP_BACKUP = new Array(36, "COP_BACKUP");
    static var GANG_TAXI = new Array(37, "GANG_TAXI");
    static var REPEAT_PLAY = new Array(38, "REPEAT_PLAY");
    static var CHECKLIST = new Array(39, "CHECKLIST");
    static var SNIPER = new Array(40, "SNIPER");
    static var ZIT_IT = new Array(41, "ZIT_IT");
    static var TRACKIFY = new Array(42, "TRACKIFY");
    static var SAVE = new Array(43, "SAVE");
    static var ADD_TAG = new Array(44, "ADD_TAG");
    static var REMOVE_TAG = new Array(45, "REMOVE_TAG");
    static var LOCATION = new Array(46, "LOCATION");
    static var PARTY = new Array(47, "PARTY");
    static var TICKED = new Array(48, "TICKED");
    var HASHTABLE = new Object();
    var PREFIX = "il";
} // End of Class
#endinitclip
