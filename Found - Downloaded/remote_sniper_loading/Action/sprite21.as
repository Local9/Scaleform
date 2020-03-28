// Action script...

// [Initial MovieClip Action of sprite 21]
#initclip 5
class com.rockstargames.gtav.levelDesign.REMOTE_SNIPER_LOADING extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT;
    function REMOTE_SNIPER_LOADING()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function START_LOADING()
    {
        CONTENT.loadingMC.gotoAndPlay("in");
    } // End of the function
} // End of Class
#endinitclip
