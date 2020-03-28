// Action script...

// [Initial MovieClip Action of sprite 33]
#initclip 5
class com.rockstargames.gtav.constants.WebBrowserButtonLUT
{
    static var _instance;
    function WebBrowserButtonLUT()
    {
        var _loc7 = new Array(-1, "NOTHING", "OFF", "ARROW", -1);
        var _loc12 = new Array(1, "HOME_BUTTON", "ON", "HAND", -2);
        var _loc14 = new Array(2, "BACK_BUTTON", "ON", "HAND", -2);
        var _loc18 = new Array(3, "FORWARD_BUTTON", "ON", "HAND", -2);
        var _loc2 = new Array(4, "ADDRESS_BOX", "ON", "TEXT", -2);
        var _loc3 = new Array(5, "SEARCH_BOX", "ON", "TEXT", -2);
        var _loc4 = new Array(6, "ADVERT", "ON", "HAND", null);
        var _loc13 = new Array(7, "WEB_BUTTON", "ON", "HAND", null);
        var _loc15 = new Array(8, "TEXT_BOX", "ON", "TEXT", null);
        var _loc8 = new Array(9, "PASSWORD_TEXT_BOX", "ON", "TEXT", null);
        var _loc16 = new Array(10, "PLUS_BUTTON", "ON", "HAND", null);
        var _loc11 = new Array(11, "MINUS_BUTTON", "ON", "HAND", null);
        var _loc17 = new Array(12, "LIST_ITEM", "ON", "HAND", null);
        var _loc5 = new Array(13, "HISTORY_BUTTON", "ON", "HAND", -2);
        var _loc6 = new Array(14, "FAVORITES_BUTTON", "ON", "HAND", -2);
        var _loc9 = new Array(15, "BROWSER_LIST_ITEM", "ON", "HAND", -2);
        var _loc10 = new Array(16, "ANCHOR_BUTTON", "ON", "HAND", null);
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + "-1"] = _loc7;
        HASHTABLE[PREFIX + "1"] = _loc12;
        HASHTABLE[PREFIX + "2"] = _loc14;
        HASHTABLE[PREFIX + "3"] = _loc18;
        HASHTABLE[PREFIX + "4"] = _loc2;
        HASHTABLE[PREFIX + "5"] = _loc3;
        HASHTABLE[PREFIX + "6"] = _loc4;
        HASHTABLE[PREFIX + "7"] = _loc13;
        HASHTABLE[PREFIX + "8"] = _loc15;
        HASHTABLE[PREFIX + "9"] = _loc8;
        HASHTABLE[PREFIX + "10"] = _loc16;
        HASHTABLE[PREFIX + "11"] = _loc11;
        HASHTABLE[PREFIX + "12"] = _loc17;
        HASHTABLE[PREFIX + "13"] = _loc5;
        HASHTABLE[PREFIX + "14"] = _loc6;
        HASHTABLE[PREFIX + "15"] = _loc9;
        HASHTABLE[PREFIX + "16"] = _loc10;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.WebBrowserButtonLUT._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.WebBrowserButtonLUT();
        } // end if
        return (com.rockstargames.gtav.constants.WebBrowserButtonLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.WebBrowserButtonLUT._instance.PREFIX + i]);
    } // End of the function
    var PREFIX = "wb";
    var HASHTABLE = new Object();
    static var NOTHING = -1;
    static var HOME_BUTTON = 1;
    static var BACK_BUTTON = 2;
    static var FORWARD_BUTTON = 3;
    static var ADDRESS_BOX = 4;
    static var SEARCH_BOX = 5;
    static var ADVERT = 6;
    static var WEB_BUTTON = 7;
    static var TEXT_BOX = 8;
    static var PASSWORD_TEXT_BOX = 9;
    static var PLUS_BUTTON = 10;
    static var MINUS_BUTTON = 11;
    static var LIST_ITEM = 12;
    static var HISTORY_BUTTON = 13;
    static var FAVORITES_BUTTON = 14;
    static var BROWSER_LIST_ITEM = 15;
    static var ANCHOR_BUTTON = 16;
} // End of Class
#endinitclip
