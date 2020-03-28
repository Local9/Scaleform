// Action script...

// [Initial MovieClip Action of sprite 52]
#initclip 12
class com.rockstargames.gtav.constants.ShopBrandLUT
{
    static var _instance;
    function ShopBrandLUT()
    {
        var _loc3 = new Array(0, "SHOP_BRAND_01", "brand01");
        var _loc4 = new Array(1, "SHOP_BRAND_02", "brand02");
        var _loc5 = new Array(2, "SHOP_BRAND_03", "brand03");
        var _loc2 = new Array(3, "SHOP_BRAND_04", "brand04");
        HASHTABLE = new Object();
        HASHTABLE[PREFIX + "0"] = _loc3;
        HASHTABLE[PREFIX + "1"] = _loc4;
        HASHTABLE[PREFIX + "2"] = _loc5;
        HASHTABLE[PREFIX + "3"] = _loc2;
    } // End of the function
    static function lookUp(i)
    {
        if (com.rockstargames.gtav.constants.ShopBrandLUT._instance == undefined)
        {
            _instance = new com.rockstargames.gtav.constants.ShopBrandLUT();
        } // end if
        return (com.rockstargames.gtav.constants.ShopBrandLUT._instance.HASHTABLE[com.rockstargames.gtav.constants.ShopBrandLUT._instance.PREFIX + i]);
    } // End of the function
    var PREFIX = "sb";
    var HASHTABLE = new Object();
} // End of Class
#endinitclip
