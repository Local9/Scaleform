// Action script...

// [Initial MovieClip Action of sprite 7]
#initclip 2
class com.rockstargames.ui.core.ScreenLayoutUI extends com.rockstargames.ui.core.BaseScriptUI
{
    var screenManager;
    function ScreenLayoutUI()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        screenManager = new com.rockstargames.ui.core.ScreenLayoutManager();
    } // End of the function
    function SET_SAFE(value)
    {
        screenManager.setSafeZone(arguments);
    } // End of the function
    function SET_RATIO(r)
    {
        screenManager.setRatio(r);
    } // End of the function
} // End of Class
#endinitclip
