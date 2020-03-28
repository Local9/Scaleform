// Action script...

// [Initial MovieClip Action of sprite 70]
#initclip 1
class com.rockstargames.gtav.pc.MousePointer extends MovieClip
{
    var mc;
    function MousePointer(_mc)
    {
        super();
        mc = _mc;
    } // End of the function
    function changeCursor(id)
    {
        mc.gotoAndStop(id + 1);
        currCursor = id;
    } // End of the function
    function moveCursor(xp, yp)
    {
        var _loc3 = xp;
        var _loc2 = yp;
        mc._x = _loc3;
        mc._y = _loc2;
    } // End of the function
    var currCursor = 0;
    static var ARROW = 0;
    static var HAND = 1;
} // End of Class
#endinitclip
