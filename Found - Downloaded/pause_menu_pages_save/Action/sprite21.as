// Action script...

// [Initial MovieClip Action of sprite 21]
#initclip 9
class com.rockstargames.gtav.constants.PauseMenuColoursLUT
{
    static var _instance;
    function PauseMenuColoursLUT()
    {
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + "0"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK;
        HASHTABLE[PREFIX + "1"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_30;
        HASHTABLE[PREFIX + "2"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_50;
        HASHTABLE[PREFIX + "4"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
        HASHTABLE[PREFIX + "5"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.GREYED;
        HASHTABLE[PREFIX + "14"] = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_DEFAULT;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.PauseMenuColoursLUT._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.PauseMenuColoursLUT();
        } // end if
        return (com.rockstargames.gtav.constants.PauseMenuColoursLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.PauseMenuColoursLUT._instance.PREFIX + i]);
    } // End of the function
    var PREFIX = "cl";
    var HASHTABLE = new Object();
    static var BLACK = [0, 0, 0, 0, 100];
    static var BLACK_ALPHA_30 = [1, 0, 0, 0, 30];
    static var BLACK_ALPHA_50 = [2, 0, 0, 0, 50];
    static var WHITE = [4, 225, 225, 225, 100];
    static var GREYED = [5, 160, 160, 160, 100];
    static var BLACK_ALPHA_DEFAULT = [14, 0, 0, 0, 50];
} // End of Class
#endinitclip
