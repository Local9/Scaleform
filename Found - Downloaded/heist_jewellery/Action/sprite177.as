// Action script...

// [Initial MovieClip Action of sprite 177]
#initclip 29
class com.rockstargames.gtav.constants.HeistCrewMemberLUT
{
    static var _instance;
    function HeistCrewMemberLUT()
    {
        var _loc26 = new Array(0, "CM_EMPTY", "Empty");
        var _loc19 = new Array(1, "CM_GUNMAN_G_GUSTAV", "Gunman");
        var _loc22 = new Array(2, "CM_GUNMAN_G_KARL", "Gunman");
        var _loc12 = new Array(3, "CM_GUNMAN_M_HUGH", "Gunman");
        var _loc5 = new Array(4, "CM_GUNMAN_B_NORM", "Gunman");
        var _loc13 = new Array(5, "CM_GUNMAN_B_DARYL", "Gunman");
        var _loc23 = new Array(6, "CM_HACKER_G_PAIGE", "Hacker");
        var _loc7 = new Array(7, "CM_HACKER_M_CHRIS", "Hacker");
        var _loc8 = new Array(8, "CM_DRIVER_G_EDDIE", "Driver");
        var _loc4 = new Array(9, "CM_DRIVER_M_KARIM", "Driver");
        var _loc27 = new Array(10, "CM_GUNMAN_G_PACKIE_UNLOCK", "Gunman");
        var _loc28 = new Array(11, "CM_GUNMAN_G_CHEF_UNLOCK", "Gunman");
        var _loc17 = new Array(12, "CM_HACKER_B_RICKIE_UNLOCK", "Hacker");
        var _loc24 = new Array(13, "CM_DRIVER_G_TALINA_UNLOCK", "Driver");
        var _loc25 = new Array(14, "CM_GUNMAN_G_GUSTAV_S", "Gunman");
        var _loc20 = new Array(15, "CM_GUNMAN_G_KARL_S", "Gunman");
        var _loc2 = new Array(16, "CM_GUNMAN_M_HUGH_S", "Gunman");
        var _loc15 = new Array(17, "CM_GUNMAN_B_NORM_S", "Gunman");
        var _loc9 = new Array(18, "CM_GUNMAN_B_DARYL_S", "Gunman");
        var _loc3 = new Array(19, "CM_HACKER_G_PAIGE_S", "Hacker");
        var _loc6 = new Array(20, "CM_HACKER_M_CHRIS_S", "Hacker");
        var _loc11 = new Array(21, "CM_DRIVER_G_EDDIE_S", "Driver");
        var _loc10 = new Array(22, "CM_DRIVER_M_KARIM_S", "Driver");
        var _loc18 = new Array(23, "CM_GUNMAN_G_PACKIE_UNLOCK_S", "Gunman");
        var _loc16 = new Array(24, "CM_GUNMAN_G_CHEF_UNLOCK_S", "Gunman");
        var _loc14 = new Array(25, "CM_HACKER_B_RICKIE_UNLOCK_S", "Hacker");
        var _loc21 = new Array(26, "CM_DRIVER_G_TALINA_UNLOCK_S", "Driver");
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + _loc26[0].toString()] = _loc26;
        HASHTABLE[PREFIX + _loc19[0].toString()] = _loc19;
        HASHTABLE[PREFIX + _loc22[0].toString()] = _loc22;
        HASHTABLE[PREFIX + _loc12[0].toString()] = _loc12;
        HASHTABLE[PREFIX + _loc5[0].toString()] = _loc5;
        HASHTABLE[PREFIX + _loc13[0].toString()] = _loc13;
        HASHTABLE[PREFIX + _loc23[0].toString()] = _loc23;
        HASHTABLE[PREFIX + _loc7[0].toString()] = _loc7;
        HASHTABLE[PREFIX + _loc8[0].toString()] = _loc8;
        HASHTABLE[PREFIX + _loc4[0].toString()] = _loc4;
        HASHTABLE[PREFIX + _loc27[0].toString()] = _loc27;
        HASHTABLE[PREFIX + _loc28[0].toString()] = _loc28;
        HASHTABLE[PREFIX + _loc17[0].toString()] = _loc17;
        HASHTABLE[PREFIX + _loc24[0].toString()] = _loc24;
        HASHTABLE[PREFIX + _loc25[0].toString()] = _loc25;
        HASHTABLE[PREFIX + _loc20[0].toString()] = _loc20;
        HASHTABLE[PREFIX + _loc2[0].toString()] = _loc2;
        HASHTABLE[PREFIX + _loc15[0].toString()] = _loc15;
        HASHTABLE[PREFIX + _loc9[0].toString()] = _loc9;
        HASHTABLE[PREFIX + _loc3[0].toString()] = _loc3;
        HASHTABLE[PREFIX + _loc6[0].toString()] = _loc6;
        HASHTABLE[PREFIX + _loc11[0].toString()] = _loc11;
        HASHTABLE[PREFIX + _loc10[0].toString()] = _loc10;
        HASHTABLE[PREFIX + _loc18[0].toString()] = _loc18;
        HASHTABLE[PREFIX + _loc16[0].toString()] = _loc16;
        HASHTABLE[PREFIX + _loc14[0].toString()] = _loc14;
        HASHTABLE[PREFIX + _loc21[0].toString()] = _loc21;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.HeistCrewMemberLUT._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.HeistCrewMemberLUT();
        } // end if
        return (com.rockstargames.gtav.constants.HeistCrewMemberLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.HeistCrewMemberLUT._instance.PREFIX + i]);
    } // End of the function
    var PREFIX = "cm";
    var HASHTABLE = new Object();
} // End of Class
#endinitclip
