// Action script...

// [Initial MovieClip Action of sprite 15]
#initclip 2
class com.rockstargames.gtav.levelDesign.BLOW_TORCH extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT;
    function BLOW_TORCH()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function SET_BLOW_TORCH_METER(percentageValue)
    {
        var _loc2 = 1 + Math.max(0, Math.min(percentageValue, 100));
        CONTENT.ProgressBarMC.animMC.gotoAndStop(_loc2);
    } // End of the function
} // End of Class
#endinitclip
