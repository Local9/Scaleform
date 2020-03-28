// Action script...

// [Initial MovieClip Action of sprite 15]
#initclip 5
class com.rockstargames.gtav.Multiplayer.MIDSIZED_MESSAGE extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, BOUNDING_BOX, TIMELINE;
    function MIDSIZED_MESSAGE()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function SHOW_MIDSIZED_MESSAGE(title, description)
    {
        CONTENT.removeMovieClip();
        BOUNDING_BOX.removeMovieClip();
        this.INITIALISE(TIMELINE);
        if (title != undefined)
        {
            CONTENT.MASTER_SCREEN.TITLE.textAutoSize = CONTENT.MASTER_SCREEN.TITLE_OUTLINE.textAutoSize = "shrink";
            CONTENT.MASTER_SCREEN.TITLE.htmlText = CONTENT.MASTER_SCREEN.TITLE_OUTLINE.htmlText = title;
            CONTENT.MASTER_SCREEN.TITLE_OUTLINE.textColor = 0;
            CONTENT.MASTER_SCREEN.TITLE_OUTLINE.outline = 14;
        } // end if
        if (description != undefined)
        {
            CONTENT.MASTER_SCREEN.DESCRIPTION.htmlText = description;
            CONTENT.MASTER_SCREEN.DESCRIPTION_BLACK.htmlText = description;
        } // end if
    } // End of the function
    function SHOW_BRIDGES_KNIVES_PROGRESS(title, totalToDo, message, info, completed)
    {
        var _loc2 = String(completed) + " / " + String(totalToDo) + " " + info;
        this.SHOW_MIDSIZED_MESSAGE(title, _loc2);
    } // End of the function
} // End of Class
#endinitclip
