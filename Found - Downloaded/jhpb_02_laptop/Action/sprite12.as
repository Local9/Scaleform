// Action script...

// [Initial MovieClip Action of sprite 12]
#initclip 2
class com.rockstargames.gtav.cutscenes.CELLPHONE_CUTSCENE extends com.rockstargames.ui.core.BaseScriptUI
{
    var CONTENT;
    function CELLPHONE_CUTSCENE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.DISPLAY_VIEW(0);
    } // End of the function
    function DISPLAY_VIEW(viewID)
    {
        if (viewID == undefined)
        {
            viewID = 0;
        } // end if
        CONTENT.gotoAndStop(viewID + 1);
    } // End of the function
} // End of Class
#endinitclip
