// Action script...

// [Initial MovieClip Action of sprite 105]
#initclip 1
class com.rockstargames.gtav.levelDesign.BaseScriptUI extends MovieClip
{
    var TIMELINE, CONTENT, BOUNDING_BOX;
    function BaseScriptUI()
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
} // End of Class
#endinitclip
