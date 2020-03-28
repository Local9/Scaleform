// Action script...

// [Initial MovieClip Action of sprite 56]
#initclip 2
class com.rockstargames.gtav.loadingScreens.LANGUAGE_SELECT extends com.rockstargames.ui.core.BaseScriptUI
{
    var CONTENT;
    function LANGUAGE_SELECT()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        highlightIndex = 0;
        CONTENT.highlightMC.innerMC._height = highlightHeight;
        CONTENT.highlightMC.acceptMC._y = highlightHeight / 2;
        CONTENT.highlightMC._visible = CONTENT.languagesMC._visible = false;
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept, _isAsian)
    {
        if (_isCircleAccept != undefined)
        {
            var _loc2 = _isCircleAccept == true ? (2) : (1);
            CONTENT.highlightMC.acceptMC.gotoAndStop(_loc2);
        } // end if
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (languageList[highlightIndex]);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc2 = 0;
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
        {
            _loc2 = highlightIndex - 1;
            if (_loc2 < 0)
            {
                _loc2 = languageCount - 1;
            } // end if
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
        {
            _loc2 = highlightIndex + 1;
            if (_loc2 > languageCount - 1)
            {
                _loc2 = 0;
            } // end if
        } // end if
        highlightIndex = _loc2;
        this.SET_HIGHLIGHT();
    } // End of the function
    function clearLanguages()
    {
        var _loc4 = ["LANGUAGE_UNDEFINED", "LANGUAGE_ENGLISH", "LANGUAGE_FRENCH", "LANGUAGE_GERMAN", "LANGUAGE_ITALIAN", "LANGUAGE_SPANISH", "LANGUAGE_PORTUGUESE", "LANGUAGE_POLISH", "LANGUAGE_RUSSIAN", "LANGUAGE_KOREAN", "LANGUAGE_CHINESE", "LANGUAGE_JAPANESE", "LANGUAGE_MEXICAN"];
        var _loc5 = CONTENT.languagesMC;
        for (var _loc2 = 0; _loc2 < _loc4.length; ++_loc2)
        {
            var _loc3 = _loc5[_loc4[_loc2]];
            _loc3._visible = false;
            _loc3._y = 0;
        } // end of for
    } // End of the function
    function SET_LANGUAGES()
    {
        var _loc8 = arguments;
        this.clearLanguages();
        var _loc7 = ["LANGUAGE_UNDEFINED", "LANGUAGE_ENGLISH", "LANGUAGE_FRENCH", "LANGUAGE_GERMAN", "LANGUAGE_ITALIAN", "LANGUAGE_SPANISH", "LANGUAGE_PORTUGUESE", "LANGUAGE_POLISH", "LANGUAGE_RUSSIAN", "LANGUAGE_KOREAN", "LANGUAGE_CHINESE", "LANGUAGE_JAPANESE", "LANGUAGE_MEXICAN"];
        languageList = _loc8;
        var _loc6 = CONTENT.languagesMC;
        languageCount = 0;
        for (var _loc3 = 0; _loc3 < languageList.length; ++_loc3)
        {
            var _loc4 = languageList[_loc3];
            if (_loc4 != 0 && _loc4 != undefined)
            {
                var _loc5 = _loc6[_loc7[_loc4]];
                _loc5._y = languageCount * rowSpace;
                _loc5._visible = true;
                ++languageCount;
            } // end if
        } // end of for
        _loc6._y = 360 - _loc6._height / 2;
        CONTENT.highlightMC._visible = CONTENT.languagesMC._visible = true;
        this.SET_HIGHLIGHT();
    } // End of the function
    function SET_HIGHLIGHT()
    {
        var _loc3 = CONTENT.highlightMC;
        var _loc2 = CONTENT.languagesMC._y;
        _loc3._y = _loc2 + highlightIndex * rowSpace + highlightOffset;
    } // End of the function
    var rowSpace = 40;
    var highlightOffset = 0;
    var highlightHeight = 32;
    var highlightIndex = 0;
    var languageList = new Array();
    var languageCount = 0;
} // End of Class
#endinitclip
