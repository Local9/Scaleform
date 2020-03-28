// Action script...

// [Initial MovieClip Action of sprite 35]
#initclip 8
class com.rockstargames.gtav.Multiplayer.MP_UNLOCKS_FREEMODE extends com.rockstargames.gtav.Multiplayer.MP_AWARD_BASE
{
    var TIMELINE, FILE_NAME, CONTENT;
    function MP_UNLOCKS_FREEMODE()
    {
        super();
    } // End of the function
    function INITIALISE(mc, fileName)
    {
        TIMELINE = mc;
        FILE_NAME = fileName;
        CONTENT = TIMELINE.attachMovie("GENERIC_SECONDARY_INFO", "GENERIC_SECONDARY_INFO", 10);
        CONTENT._x = 640;
        CONTENT.BLACK_BAR._visible = false;
        CONTENT.line_top._visible = false;
        CONTENT.line_bottom._visible = false;
    } // End of the function
    function RESET_AWARDS_MOVIE()
    {
        if (typeof(CONTENT) == "movieclip")
        {
            CONTENT.removeMovieClip();
            this.INITIALISE(TIMELINE, FILE_NAME);
        } // end if
    } // End of the function
    function SHOW_UNLOCK_AND_MESSAGE(awTitle, awDesc, txd, texture, awDesc2, colEnum)
    {
        CONTENT.BIG_TEXT.htmlText = awTitle;
        CONTENT.MESSAGE_TEXT.autoSize = "center";
        CONTENT.MESSAGE_TEXT.htmlText = awDesc;
        if (awDesc2 != undefined && awDesc2 != "")
        {
            CONTENT.INFO_TEXT.htmlText = awDesc2;
            CONTENT.BLACK_BAR._height = 52;
            var _loc3 = Math.max(CONTENT.INFO_TEXT.textWidth, CONTENT.MESSAGE_TEXT.textWidth);
            CONTENT.BLACK_BAR._width = _loc3 + 100;
        }
        else
        {
            CONTENT.BLACK_BAR._width = CONTENT.MESSAGE_TEXT.textWidth + 100;
            CONTENT.BLACK_BAR._height = CONTENT.MESSAGE_TEXT.textHeight + 10;
        } // end else if
        CONTENT.line_top._width = CONTENT.BLACK_BAR._width;
        CONTENT.line_bottom._width = CONTENT.BLACK_BAR._width;
        CONTENT.line_bottom._y = CONTENT.BLACK_BAR._height + CONTENT.BLACK_BAR._y;
        CONTENT.BLACK_BAR._visible = true;
        CONTENT.line_top._visible = true;
        CONTENT.line_bottom._visible = true;
    } // End of the function
    function SHOW_COLLECTION_PROGRESS(title, completed, totalToDo, message, info)
    {
        var _loc2 = String(completed) + " / " + String(totalToDo) + " " + info;
        this.SHOW_UNLOCK_AND_MESSAGE(title, message, "", "", _loc2);
    } // End of the function
    function SHOW_BRIDGES_KNIVES_PROGRESS(title, totalToDo, message, info, completed)
    {
        var _loc2 = String(completed) + " / " + String(totalToDo) + " " + info;
        this.SHOW_UNLOCK_AND_MESSAGE(title, message, "", "", _loc2);
    } // End of the function
    function debug()
    {
    } // End of the function
} // End of Class
#endinitclip
