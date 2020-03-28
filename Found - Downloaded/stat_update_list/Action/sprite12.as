// Action script...

// [Initial MovieClip Action of sprite 12]
#initclip 1
class com.rockstargames.gtav.levelDesign.STAT_UPDATE_LIST extends MovieClip
{
    var statsToDisplay, TIMELINE, CONTENT, BOUNDING_BOX;
    function STAT_UPDATE_LIST()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        statsToDisplay = new Array();
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
    } // End of the function
    function DISPLAY_STAT_LIST()
    {
        var _loc2 = 0;
        var _loc7 = statsToDisplay.length;
        for (var _loc2 = 0; _loc2 < _loc7; ++_loc2)
        {
            var _loc4 = statHeight * _loc2 + margin;
            var _loc3 = "statBar1";
            CONTENT[_loc3] = CONTENT.attachMovie("statBar", _loc3, CONTENT.getNextHighestDepth(), {_y: _loc4, _x: margin});
            CONTENT[_loc3].percentageBar._xscale = statsToDisplay[_loc2][1];
            CONTENT[_loc3].statText.text = statsToDisplay[_loc2][2];
        } // end of for
        CONTENT.background._height = _loc4 + statHeight + margin;
    } // End of the function
    function SET_DATA_SLOT(slotID, statType, percentageValue, displayText)
    {
        statsToDisplay[slotID] = new Array(statType, percentageValue, displayText);
    } // End of the function
    function SET_DATA_SLOT_EMPTY()
    {
        var _loc2 = 0;
        var _loc4 = statsToDisplay.length;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            var _loc3 = "statBar1";
            CONTENT[_loc3].removeMovieClip();
        } // end of for
        statsToDisplay = new Array();
    } // End of the function
    var IS_PAUSED = false;
    var statHeight = 24;
    var margin = 10;
} // End of Class
#endinitclip
