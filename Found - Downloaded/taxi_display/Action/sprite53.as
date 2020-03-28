// Action script...

// [Initial MovieClip Action of sprite 53]
#initclip 16
class com.rockstargames.gtav.minimap.InvertedBlip extends MovieClip
{
    function InvertedBlip()
    {
        super();
        var _loc3 = new flash.geom.Transform(this);
        var _loc4 = new flash.geom.ColorTransform(-1, -1, -1, 1, 255, 255, 255, 0);
        _loc3.colorTransform = _loc4;
    } // End of the function
} // End of Class
#endinitclip
