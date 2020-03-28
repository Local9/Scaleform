// Action script...

// [Initial MovieClip Action of sprite 14]
#initclip 1
class com.rockstargames.gtav.levelDesign.STAT_UPDATE_ICON extends MovieClip
{
    var TIMELINE, CONTENT, BOUNDING_BOX, ICON, STAT_TEXT;
    function STAT_UPDATE_ICON()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
        ICON = CONTENT.statInnerMC.icon;
        STAT_TEXT = CONTENT.statInnerMC.statText;
        ICON._visible = false;
        CONTENT.backgroundMC._visible = false;
        TIMELINE.isDaytime = false;
    } // End of the function
    function GET_DAY_NIGHT()
    {
        com.rockstargames.ui.game.GameInterface.call("SHOULD_DISPLAY_BOX_BACKGROUNDS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, TIMELINE);
    } // End of the function
    function DISPLAY_STAT(statType, isPositive, displayText, colour)
    {
        ICON._visible = true;
        if (isPositive)
        {
            ICON.gotoAndStop("positive");
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.statInnerMC, 87, 124, 88);
        }
        else
        {
            ICON.gotoAndStop("negative");
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.statInnerMC, 153, 69, 69);
        } // end else if
        STAT_TEXT.text = displayText;
        STAT_TEXT.autoSize = "left";
        STAT_TEXT.multiline = false;
        STAT_TEXT.wordWrap = false;
        this.DISPLAY_BG();
    } // End of the function
    function DISPLAY_BG()
    {
        this.GET_DAY_NIGHT();
        if (TIMELINE.isDaytime)
        {
            var _loc2 = CONTENT.backgroundMC;
            com.rockstargames.ui.utils.Colour.Colourise(_loc2, backgroundColours[0], backgroundColours[1], backgroundColours[2], backgroundColours[3]);
            _loc2._width = STAT_TEXT._width + STAT_TEXT._x + 10;
            _loc2._height = ICON._height + 13;
            _loc2._visible = true;
        } // end if
    } // End of the function
    function HIDE()
    {
        TIMELINE._visible = false;
    } // End of the function
    function SHOW()
    {
        TIMELINE._visible = true;
    } // End of the function
    var backgroundColours = new Array(0, 0, 0, 80);
    var isDaytime = false;
} // End of Class
#endinitclip
