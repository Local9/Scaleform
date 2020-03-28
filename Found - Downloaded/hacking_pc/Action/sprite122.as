// Action script...

// [Initial MovieClip Action of sprite 122]
#initclip 6
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
        mc._x = xp;
        mc._y = yp;
    } // End of the function
    var currCursor = 0;
    static var ARROW = 0;
    static var HAND = 1;
} // End of Class
#endinitclip
