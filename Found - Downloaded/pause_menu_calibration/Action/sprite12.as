// Action script...

// [Initial MovieClip Action of sprite 12]
#initclip 2
class com.rockstargames.gtav.pauseMenu.PAUSE_MENU_CALIBRATION extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT;
    function PAUSE_MENU_CALIBRATION()
    {
        super();
    } // End of the function
    function SET_ARROW_ALPHA(arrowID, a)
    {
        var _loc4 = [CONTENT.lArrowMC, CONTENT.rArrowMC];
        var _loc2 = _loc4[arrowID];
        if (_loc2 != undefined)
        {
            var _loc3 = Math.max(0, Math.min(a, 100));
            _loc2._alpha = _loc3;
        } // end if
    } // End of the function
} // End of Class
#endinitclip
