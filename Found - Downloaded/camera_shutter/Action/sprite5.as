// Action script...

// [Initial MovieClip Action of sprite 5]
#initclip 1
class com.rockstargames.gtav.cutscenes.CAMERA_SHUTTER
{
    var TIMEINE, shutter, numberOfBlades;
    function CAMERA_SHUTTER(mc)
    {
        TIMEINE = mc;
        shutter = TIMEINE.shutter;
        numberOfBlades = 9;
    } // End of the function
    function OPEN_SHUTTER()
    {
        this.goTo("openShutter");
    } // End of the function
    function CLOSE_SHUTTER()
    {
        this.goTo("closeShutter");
    } // End of the function
    function CLOSE_THEN_OPEN_SHUTTER()
    {
        this.goTo("close_then_open");
    } // End of the function
    function goTo(whichFrame)
    {
        var _loc2 = 0;
        for (var _loc2 = 0; _loc2 < numberOfBlades; ++_loc2)
        {
            var _loc3 = shutter["blade" + _loc2];
            _loc3.gotoAndPlay(whichFrame);
        } // end of for
    } // End of the function
} // End of Class
#endinitclip
