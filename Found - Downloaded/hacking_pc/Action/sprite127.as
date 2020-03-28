// Action script...

// [Initial MovieClip Action of sprite 127]
#initclip 11
class com.rockstargames.gtav.constants.PCAppLUT
{
    static var _instance;
    function PCAppLUT()
    {
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + "0"] = com.rockstargames.gtav.constants.PCAppLUT.PC_EMPTY;
        HASHTABLE[PREFIX + "1"] = com.rockstargames.gtav.constants.PCAppLUT.PC_MY_COMPUTER;
        HASHTABLE[PREFIX + "2"] = com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS;
        HASHTABLE[PREFIX + "3"] = com.rockstargames.gtav.constants.PCAppLUT.PC_VIRUS;
        HASHTABLE[PREFIX + "4"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING;
        HASHTABLE[PREFIX + "5"] = com.rockstargames.gtav.constants.PCAppLUT.PC_SUB;
        HASHTABLE[PREFIX + "6"] = com.rockstargames.gtav.constants.PCAppLUT.PC_QUIT;
        HASHTABLE[PREFIX + "7"] = com.rockstargames.gtav.constants.PCAppLUT.PC_USB;
        HASHTABLE[PREFIX + "8"] = com.rockstargames.gtav.constants.PCAppLUT.PC_FOLDER;
        HASHTABLE[PREFIX + "9"] = com.rockstargames.gtav.constants.PCAppLUT.PC_PRINT;
        HASHTABLE[PREFIX + "10"] = com.rockstargames.gtav.constants.PCAppLUT.PC_TRASH;
        HASHTABLE[PREFIX + "40"] = com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW;
        HASHTABLE[PREFIX + "50"] = com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_START;
        HASHTABLE[PREFIX + "51"] = com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLEAN;
        HASHTABLE[PREFIX + "60"] = com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE;
        HASHTABLE[PREFIX + "70"] = com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_OPEN_SLUICE;
        HASHTABLE[PREFIX + "71"] = com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_RELEASE_SUB;
        HASHTABLE[PREFIX + "80"] = com.rockstargames.gtav.constants.PCAppLUT.PC_ERROR;
        HASHTABLE[PREFIX + "81"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_MENU;
        HASHTABLE[PREFIX + "82"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP01;
        HASHTABLE[PREFIX + "83"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP02;
        HASHTABLE[PREFIX + "84"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_SUCCESS;
        HASHTABLE[PREFIX + "85"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_FAIL;
        HASHTABLE[PREFIX + "86"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_WIN;
        HASHTABLE[PREFIX + "87"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_FAIL;
        HASHTABLE[PREFIX + "88"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_RETRY;
        HASHTABLE[PREFIX + "89"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_NORETRY;
        HASHTABLE[PREFIX + "90"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_RETRY;
        HASHTABLE[PREFIX + "91"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_NORETRY;
        HASHTABLE[PREFIX + "92"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_SUCCESS;
        HASHTABLE[PREFIX + "93"] = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_DOWNLOAD;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.PCAppLUT._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.PCAppLUT();
        } // end if
        return (com.rockstargames.gtav.constants.PCAppLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.PCAppLUT._instance.PREFIX + i]);
    } // End of the function
    var PREFIX = "pc";
    var HASHTABLE = new Object();
    static var PC_EMPTY = new Array(0, "PC_EMPTY");
    static var PC_MY_COMPUTER = new Array(1, "PC_MY_COMPUTER");
    static var PC_ANTIVIRUS = new Array(2, "PC_ANTIVIRUS");
    static var PC_VIRUS = new Array(3, "PC_VIRUS");
    static var PC_HACKING = new Array(4, "PC_HACKING");
    static var PC_SUB = new Array(5, "PC_SUB");
    static var PC_QUIT = new Array(6, "PC_QUIT");
    static var PC_USB = new Array(7, "PC_USB");
    static var PC_FOLDER = new Array(8, "PC_FOLDER");
    static var PC_PRINT = new Array(9, "PC_PRINT");
    static var PC_TRASH = new Array(10, "PC_TRASH");
    static var PC_WINDOW = new Array(40, "PC_WINDOW");
    static var PC_ANTIVIRUS_START = new Array(50, "PC_ANTIVIRUS_START");
    static var PC_ANTIVIRUS_CLEAN = new Array(51, "PC_ANTIVIRUS_CLEAN");
    static var PC_ANTIVIRUS_CLOSE = new Array(52, "PC_ANTIVIRUS_CLOSE");
    static var PC_POPUP_CLOSE = new Array(60, "PC_POPUP_CLOSE");
    static var PC_SUB_OPEN_SLUICE = new Array(70, "PC_SUB_OPEN_SLUICE");
    static var PC_SUB_RELEASE_SUB = new Array(71, "PC_SUB_RELEASE_SUB");
    static var PC_ERROR = new Array(80, "PC_ERROR");
    static var PC_HACKING_MENU = new Array(81, "PC_HACKING_MENU");
    static var PC_HACKING_APP01 = new Array(82, "PC_HACKING_APP01");
    static var PC_HACKING_APP02 = new Array(83, "PC_HACKING_APP02");
    static var PC_HACKING_IP_SUCCESS = new Array(84, "PC_HACKING_IP_SUCCESS");
    static var PC_HACKING_IP_FAIL = new Array(85, "PC_HACKING_IP_FAIL");
    static var PC_HACKING_ROULETTE_WIN = new Array(86, "PC_HACKING_ROULETTE_WIN");
    static var PC_HACKING_ROULETTE_FAIL = new Array(87, "PC_HACKING_ROULETTE_FAIL");
    static var PC_HACKING_ROULETTE_RETRY = new Array(88, "PC_HACKING_ROULETTE_RETRY");
    static var PC_HACKING_ROULETTE_NORETRY = new Array(89, "PC_HACKING_ROULETTE_NORETRY");
    static var PC_HACKING_IP_RETRY = new Array(90, "PC_HACKING_IP_RETRY");
    static var PC_HACKING_IP_NORETRY = new Array(91, "PC_HACKING_IP_NORETRY");
    static var PC_HACKING_ROULETTE_SUCCESS = new Array(92, "PC_HACKING_ROULETTE_SUCCESS");
    static var PC_HACKING_DOWNLOAD = new Array(93, "PC_HACKING_DOWNLOAD");
} // End of Class
#endinitclip
