// Action script...

// [Initial MovieClip Action of sprite 29]
#initclip 8
class com.rockstargames.gtav.cellphone.apps.APP_MISSION_STATS_VIEW extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingView
{
    var scrollBar, gutterHeight, isLandscape, scrollerX, contentOriginX, TIMELINE, CONTENT, dataProviderUI, scrollBarTimeout, currentStyle, linkageID, content, container;
    function APP_MISSION_STATS_VIEW()
    {
        super();
        scrollBar = new com.rockstargames.ui.controls.ScrollBar();
        gutterHeight = 240;
        isLandscape = false;
        scrollerX = 250;
        contentOriginX = 0;
        contentOriginY = 64;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.missionStatsDataProviderUI;
        clearInterval(scrollBarTimeout);
        var _loc3 = TIMELINE.bg;
        com.rockstargames.ui.utils.Colour.Colourise(_loc3, currentStyle[4][0], currentStyle[4][1], currentStyle[4][2], 100);
        linkageID = "missionstatsView";
        super.construct(CONTENT, linkageID, dataProviderUI);
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.missionStatsDataProviderUI;
        var _loc20 = dataProviderUI[0][0];
        var _loc19 = dataProviderUI[0][1];
        if (_loc20 != undefined)
        {
            content.missionTitle.text = com.rockstargames.ui.utils.FitToTextfield.capText(content.missionTitle, _loc20);
        } // end if
        if (_loc19 != undefined)
        {
            content.areYouSure.text = _loc19;
        } // end if
        var _loc11 = 1;
        var _loc13 = dataProviderUI.length - 2;
        for (var _loc5 = 0; _loc5 < _loc13; ++_loc5)
        {
            var _loc4 = _loc5 + 1;
            var _loc10 = dataProviderUI[_loc4][0];
            var _loc7 = dataProviderUI[_loc4][1];
            var _loc6 = dataProviderUI[_loc4][2];
            var _loc3 = dataProviderUI[_loc4][3];
            var _loc2 = "listItem" + _loc11;
            if (content[_loc2] != undefined)
            {
                content[_loc2].removeMovieClip();
            } // end if
            content[_loc2] = content.attachMovie("missionStatsListItemMC", _loc2, content.getNextHighestDepth());
            content[_loc2]._name = _loc2;
            content[_loc2]._x = 0;
            content[_loc2]._y = 50 + _loc5 * 26;
            if (_loc10 == 1)
            {
                content[_loc2].tickMC._alpha = 100;
            }
            else
            {
                content[_loc2].tickMC._alpha = 0;
            } // end else if
            if (_loc7 != undefined)
            {
                content[_loc2].missionTask.text = com.rockstargames.ui.utils.FitToTextfield.capText(content[_loc2].missionTask, _loc7);
            } // end if
            if (_loc6 != undefined && _loc3 != undefined)
            {
                var _loc9 = _loc6.toString();
                var _loc8 = _loc3.toString();
                if (_loc6 < 10)
                {
                    _loc9 = "0" + _loc6.toString();
                } // end if
                if (_loc3 < 10)
                {
                    _loc8 = "0" + _loc3.toString();
                } // end if
                content[_loc2].missionTime.text = _loc9 + ":" + _loc8;
            } // end if
            ++_loc11;
        } // end of for
        var _loc15 = 215;
        if (_loc11 > 7)
        {
            _loc15 = 24 + 26 * _loc11;
            content.background._height = _loc15 + 25;
        } // end if
        if (content.missionStatsFooterMC != undefined)
        {
            content.missionStatsFooterMC.removeMovieClip();
        } // end if
        var _loc12 = content.attachMovie("missionStatsFooterMC", "missionStatsFooterMC", content.getNextHighestDepth());
        _loc12._x = 0;
        _loc12._y = _loc15;
        var _loc14 = _loc11;
        var _loc17 = dataProviderUI[_loc14][0];
        var _loc16 = dataProviderUI[_loc14][1];
        if (_loc17 != undefined)
        {
            _loc12.completion.text = _loc17;
        } // end if
        if (_loc16 != undefined)
        {
            _loc12.percentComplete.text = _loc16.toString() + "%";
            var _loc22 = dataProviderUI[_loc14][2];
            var _loc25 = dataProviderUI[_loc14][3];
            var _loc23 = dataProviderUI[_loc14][4];
            com.rockstargames.ui.utils.Colour.Colourise(_loc12.missionStatusMC, _loc22, _loc25, _loc23);
        } // end if
        if (_loc12._y + _loc12._height > gutterHeight)
        {
            content.background._height = _loc12._y + _loc12._height;
        } // end if
        var _loc18 = content._height;
        var _loc24 = _loc18 - gutterHeight;
        var _loc21 = _loc24 / _loc18;
        scrollBar.scrollBarContainer.scrubber._height = Math.round((1 - _loc21) * gutterHeight);
    } // End of the function
    function CLEAN_UP_DATA()
    {
        dataProviderUI = [];
        container.removeMovieClip();
    } // End of the function
    var offsetY = 64;
    var offsetX = 0;
    var contentOriginY = 64;
} // End of Class
#endinitclip
