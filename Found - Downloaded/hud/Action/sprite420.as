// Action script...

// [Initial MovieClip Action of sprite 420]
#initclip 8
class com.rockstargames.ui.hud.HUD_COMPONENT extends MovieClip
{
    var TIMELINE, CONTENT, BOUNDING_BOX, _enumID, _HUD;
    function HUD_COMPONENT()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
    } // End of the function
    function READY(id)
    {
        _enumID = id;
    } // End of the function
    function getTopCompOffset()
    {
        return (0);
    } // End of the function
    function getBottomCompOffset()
    {
        return (0);
    } // End of the function
    function SET_HUD(hud)
    {
        _HUD = hud;
    } // End of the function
    function destroy()
    {
        _HUD = null;
        delete this._HUD;
    } // End of the function
    var IS_PAUSED = false;
    var FADE_DURATION = 100;
    var ON_SCREEN_DURATION = 5000;
    var firstRunFlag = true;
    var MP_IS_ACTIVE = false;
} // End of Class
#endinitclip
