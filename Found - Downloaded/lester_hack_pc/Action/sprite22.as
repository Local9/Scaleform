// Action script...

// [Initial MovieClip Action of sprite 22]
#initclip 5
class com.rockstargames.gtav.levelDesign.LESTER_HACK_PC extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT;
    function LESTER_HACK_PC()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.HIDE_IFINDER_POPUP();
    } // End of the function
    function SHOW_IFINDER_POPUP()
    {
        CONTENT.EyeFinderMC._visible = true;
    } // End of the function
    function HIDE_IFINDER_POPUP()
    {
        CONTENT.EyeFinderMC._visible = false;
    } // End of the function
    var isFinished = false;
} // End of Class
#endinitclip
