// Action script...

// [Initial MovieClip Action of sprite 130]
#initclip 17
class com.rockstargames.ui.utils.Colour
{
    function Colour()
    {
    } // End of the function
    static function Colourise(movieClip, r, g, b, a)
    {
        r = (255 - r) * -1;
        g = (255 - g) * -1;
        b = (255 - b) * -1;
        var _loc1 = new flash.geom.Transform(movieClip);
        var _loc4 = new flash.geom.ColorTransform(1, 1, 1, 1, r, g, b, 0);
        _loc1.colorTransform = _loc4;
        movieClip._alpha = a;
    } // End of the function
    static function setHudColour(hudColourEnum, hudColourObject)
    {
        com.rockstargames.ui.game.GameInterface.call("GET_HUD_COLOUR", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, hudColourEnum, hudColourObject);
    } // End of the function
    static function ColouriseB(my_mc, r, g, b, a)
    {
        var _loc1 = new Color(my_mc);
        var _loc2 = {ra: 100, rb: r, ga: 100, gb: g, ba: 100, bb: b, aa: 100, ab: 100};
        _loc1.setTransform(_loc2);
    } // End of the function
    static function RGBToHex(r, g, b)
    {
        var _loc2 = r.toString(16);
        var _loc1 = g.toString(16);
        var _loc3 = b.toString(16);
        if (_loc2 == "0")
        {
            _loc2 = "00";
        } // end if
        if (_loc1 == "0")
        {
            _loc1 = "00";
        } // end if
        if (_loc3 == "0")
        {
            _loc3 = "00";
        } // end if
        var _loc4 = "0x" + _loc2 + _loc1 + _loc3;
        return (Number(_loc4));
    } // End of the function
    static function HexToRGB(hex)
    {
        var _loc1 = hex >> 16;
        var _loc2 = hex - (_loc1 << 16);
        var _loc3 = _loc2 >> 8;
        var _loc4 = _loc2 - (_loc3 << 8);
        return ({r: _loc1, g: _loc3, b: _loc4});
    } // End of the function
} // End of Class
#endinitclip
