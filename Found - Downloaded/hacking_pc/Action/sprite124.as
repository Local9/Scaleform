// Action script...

// [Initial MovieClip Action of sprite 124]
#initclip 8
class com.rockstargames.gtav.pc.applications.App_Base extends MovieClip
{
    var _desktopRef, __get__desktopRef, __set__desktopRef;
    function App_Base()
    {
        super();
        var _loc4 = Math.round(screenWidthPixels * 0.150000 / 2);
        var _loc3 = Math.round(screenHeightPixels * 0.150000 / 2);
        safeLeft = _loc4;
        safeRight = screenWidthPixels - _loc4;
        safeTop = _loc3;
        safeBottom = screenHeightPixels - _loc3;
    } // End of the function
    function ready()
    {
    } // End of the function
    function set desktopRef(d)
    {
        _desktopRef = d;
        //return (this.desktopRef());
        null;
    } // End of the function
    function get desktopRef()
    {
        return (_desktopRef);
    } // End of the function
    var screenWidthPixels = 1280;
    var screenHeightPixels = 720;
    var safeTop = 54;
    var safeBottom = 666;
    var safeLeft = 96;
    var safeRight = 1184;
} // End of Class
#endinitclip
