// Action script...

// [Initial MovieClip Action of sprite 6]
#initclip 2
class com.rockstargames.gtav.Multiplayer.MP_FREEMODE_CHECKPOINT_BASE extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT;
    function MP_FREEMODE_CHECKPOINT_BASE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        CONTENT._width = 1280;
        this.SET_CHECKPOINT_TEXT("1");
    } // End of the function
    function SET_CHECKPOINT_TEXT(str)
    {
        CONTENT.checkpointTF.htmlText = str;
        CONTENT.checkpointTF.autoSize = true;
    } // End of the function
} // End of Class
#endinitclip
