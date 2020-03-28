// Action script...

// [Initial MovieClip Action of sprite 152]
#initclip 14
class com.rockstargames.gtav.constants.HeistGameplayLUT
{
    static var _instance;
    function HeistGameplayLUT()
    {
        var _loc3 = new Array(0, "GP_EMPTY", "empty");
        var _loc5 = new Array(1, "PBC_JEWEL_STEALTH", "stealth");
        var _loc8 = new Array(2, "PBC_JEWEL_HIGH_IMPACT", "highimpact");
        var _loc11 = new Array(3, "PBC_DOCKS_SELL_TO_A", "selltoa");
        var _loc2 = new Array(4, "PBC_DOCKS_SELL_TO_B", "selltob");
        var _loc6 = new Array(5, "PBC_RURAL_NO_TANK", "notank");
        var _loc10 = new Array(6, "PBC_AGENCY_FIRETRUCK", "firetruck");
        var _loc9 = new Array(7, "PBC_AGENCY_HELICOPTER", "heli");
        var _loc4 = new Array(8, "PBC_FINALE_TRAFFCONT", "traffic");
        var _loc7 = new Array(9, "PBC_FINALE_HELI", "heli");
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + "0"] = _loc3;
        HASHTABLE[PREFIX + "1"] = _loc5;
        HASHTABLE[PREFIX + "2"] = _loc8;
        HASHTABLE[PREFIX + "3"] = _loc11;
        HASHTABLE[PREFIX + "4"] = _loc2;
        HASHTABLE[PREFIX + "5"] = _loc6;
        HASHTABLE[PREFIX + "6"] = _loc10;
        HASHTABLE[PREFIX + "7"] = _loc9;
        HASHTABLE[PREFIX + "8"] = _loc4;
        HASHTABLE[PREFIX + "9"] = _loc7;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.HeistGameplayLUT._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.HeistGameplayLUT();
        } // end if
        return (com.rockstargames.gtav.constants.HeistGameplayLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.HeistGameplayLUT._instance.PREFIX + i]);
    } // End of the function
    var PREFIX = "gp";
    var HASHTABLE = new Object();
} // End of Class
#endinitclip
