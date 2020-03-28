// Action script...

// [Initial MovieClip Action of sprite 144]
#initclip 23
class com.rockstargames.gtav.constants.PauseMenuComponentLUT
{
    static var _instance;
    function PauseMenuComponentLUT()
    {
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + "0"] = com.rockstargames.gtav.constants.PauseMenuComponentLUT.SP_HEADER;
        HASHTABLE[PREFIX + "1"] = com.rockstargames.gtav.constants.PauseMenuComponentLUT.SP_CONTENT;
        HASHTABLE[PREFIX + "2"] = com.rockstargames.gtav.constants.PauseMenuComponentLUT.STORE_CONTENT;
        HASHTABLE[PREFIX + "4"] = com.rockstargames.gtav.constants.PauseMenuComponentLUT.INSTRUCTIONAL;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.PauseMenuComponentLUT._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.PauseMenuComponentLUT();
        } // end if
        return (com.rockstargames.gtav.constants.PauseMenuComponentLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.PauseMenuComponentLUT._instance.PREFIX + i]);
    } // End of the function
    var PREFIX = "pm";
    var HASHTABLE = new Object();
    static var SP_HEADER = [0, "PAUSE_MENU_HEADER", "PAUSE_MENU_HEADER.swf", 48, 71, 1];
    static var SP_CONTENT = [1, "PAUSE_MENU_SP_CONTENT", "PAUSE_MENU_SP_CONTENT.swf", 48, 160, 2];
    static var STORE_CONTENT = [2, "PAUSE_MENU_STORE_CONTENT", "../Store/PAUSE_MENU_STORE_CONTENT.swf", 48, 160, 2];
    static var INSTRUCTIONAL = [3, "PAUSE_MENU_INSTRUCTIONAL_BUTTONS", "PAUSE_MENU_INSTRUCTIONAL_BUTTONS.swf", -300, 0, 2];
} // End of Class
#endinitclip
