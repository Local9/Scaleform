// Action script...

// [Initial MovieClip Action of sprite 15]
#initclip 1
class com.rockstargames.ui.hud.HUD_COMPONENT extends MovieClip
{
    var TIMELINE, CONTENT, BOUNDING_BOX, _enumID;
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
    var IS_PAUSED = false;
    var FADE_DURATION = 800;
    var ON_SCREEN_DURATION = 5000;
    var firstRunFlag = true;
    var MP_IS_ACTIVE = false;
} // End of Class
#endinitclip
