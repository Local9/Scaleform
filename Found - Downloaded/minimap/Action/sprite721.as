// Action script...

// [Initial MovieClip Action of sprite 721]
#initclip 16
class com.rockstargames.gtav.constants.SatNavIconsLUT
{
    static var _instance;
    function SatNavIconsLUT()
    {
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + "0"] = com.rockstargames.gtav.constants.SatNavIconsLUT.BLANK;
        HASHTABLE[PREFIX + "1"] = com.rockstargames.gtav.constants.SatNavIconsLUT.FORWARD;
        HASHTABLE[PREFIX + "2"] = com.rockstargames.gtav.constants.SatNavIconsLUT.BACK;
        HASHTABLE[PREFIX + "3"] = com.rockstargames.gtav.constants.SatNavIconsLUT.LEFT;
        HASHTABLE[PREFIX + "4"] = com.rockstargames.gtav.constants.SatNavIconsLUT.RIGHT;
        HASHTABLE[PREFIX + "5"] = com.rockstargames.gtav.constants.SatNavIconsLUT.SLIPROAD_LEFT;
        HASHTABLE[PREFIX + "6"] = com.rockstargames.gtav.constants.SatNavIconsLUT.SLIPROAD_RIGHT;
        HASHTABLE[PREFIX + "7"] = com.rockstargames.gtav.constants.SatNavIconsLUT.DIAGONAL_LEFT;
        HASHTABLE[PREFIX + "8"] = com.rockstargames.gtav.constants.SatNavIconsLUT.DIAGONAL_RIGHT;
        HASHTABLE[PREFIX + "9"] = com.rockstargames.gtav.constants.SatNavIconsLUT.MERGE_LEFT;
        HASHTABLE[PREFIX + "10"] = com.rockstargames.gtav.constants.SatNavIconsLUT.MERGE_RIGHT;
        HASHTABLE[PREFIX + "11"] = com.rockstargames.gtav.constants.SatNavIconsLUT.U_TURN;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.SatNavIconsLUT._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.SatNavIconsLUT();
        } // end if
        return (com.rockstargames.gtav.constants.SatNavIconsLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.SatNavIconsLUT._instance.PREFIX + i]);
    } // End of the function
    static var BLANK = new Array(0, "BLANK");
    static var FORWARD = new Array(1, "FORWARD");
    static var BACK = new Array(2, "BACK");
    static var LEFT = new Array(3, "LEFT");
    static var RIGHT = new Array(4, "RIGHT");
    static var SLIPROAD_LEFT = new Array(5, "SLIPROAD_LEFT");
    static var SLIPROAD_RIGHT = new Array(6, "SLIPROAD_RIGHT");
    static var DIAGONAL_LEFT = new Array(7, "DIAGONAL_LEFT");
    static var DIAGONAL_RIGHT = new Array(8, "DIAGONAL_RIGHT");
    static var MERGE_LEFT = new Array(9, "MERGE_LEFT");
    static var MERGE_RIGHT = new Array(10, "MERGE_RIGHT");
    static var U_TURN = new Array(11, "U_TURN");
    var HASHTABLE = new Object();
    var PREFIX = "sn";
} // End of Class
#endinitclip
