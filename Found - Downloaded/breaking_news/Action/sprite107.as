// Action script...

// [Initial MovieClip Action of sprite 107]
#initclip 5
class com.rockstargames.gtav.levelDesign.BREAKING_NEWS extends com.rockstargames.ui.core.BaseScreenLayout
{
    var topStrings, bottomStrings, storedStrings, CONTENT, lowerThirdMC, topMC, bottomMC, titleTextTF, rimMC, logoMC, mainBarMC, liveMC, safeLeft, safeBottom, safeRight, FILE_WIDTH, isWideScreen, isHiDef, FOUR_THREE_PADDING, safeTop, staticMC, screenWidthPixels;
    function BREAKING_NEWS()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        topStrings = [];
        bottomStrings = [];
        storedStrings = [];
        storedStrings[com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_TOP] = topStrings;
        storedStrings[com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_BOTTOM] = bottomStrings;
        lowerThirdMC = CONTENT.attachMovie("lowerThird", "lowerThirdMC", CONTENT.getNextHighestDepth());
        topMC = (com.rockstargames.gtav.levelDesign.BreakingNewsTicker)(lowerThirdMC.attachMovie("tickerTop", "topMC", lowerThirdMC.getNextHighestDepth()));
        bottomMC = (com.rockstargames.gtav.levelDesign.BreakingNewsTicker)(lowerThirdMC.attachMovie("tickerBottom", "bottomMC", lowerThirdMC.getNextHighestDepth(), {_y: 80}));
        lowerThirdMC.logoMC.swapDepths(lowerThirdMC.getNextHighestDepth());
        lowerThirdMC.titleTextMC.swapDepths(lowerThirdMC.getNextHighestDepth());
        titleTextTF.fauxBold = true;
        titleTextTF = lowerThirdMC.titleTextMC.titleTextTF;
        rimMC = lowerThirdMC.rimMC;
        rimMC.swapDepths(lowerThirdMC.getNextHighestDepth());
        logoMC = lowerThirdMC.logoMC;
        logoMC.swapDepths(lowerThirdMC.getNextHighestDepth());
        mainBarMC = lowerThirdMC.mainBarMC;
        liveMC = lowerThirdMC.liveMC;
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        topMC.setLabelSafeZone(safeLeft);
        bottomMC.setLabelSafeZone(safeLeft);
        lowerThirdMC._y = safeBottom - 150 - _buttonYClearance;
        liveMC._x = safeRight;
        liveMC.barMC._width = FILE_WIDTH - safeRight + 1;
        logoMC._x = safeRight;
        mainBarMC.barMC._width = mainBarMC.tipMC._x = safeRight - 256;
        titleTextTF._x = safeLeft;
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
    {
        isWideScreen = _isWideScreen;
        isHiDef = _isHiDef;
        if (!isWideScreen)
        {
            Stage.scaleMode = "noBorder";
            var _loc4 = 1.777778;
            var _loc3 = 1.333333;
            FOUR_THREE_PADDING = (FILE_WIDTH - Math.round(FILE_WIDTH / _loc4 * _loc3)) / 2;
            _screenWidthPixels = FILE_WIDTH - FOUR_THREE_PADDING * 2;
        } // end if
        safeLeft = FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
        safeRight = FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
        safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
        safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
        topMC.setLabelSafeZone(safeLeft);
        bottomMC.setLabelSafeZone(safeLeft);
        this.initScreenLayout();
    } // End of the function
    function SET_TEXT(titleT, subT)
    {
        if (titleT != undefined)
        {
            titleTextTF.text = titleT;
        } // end if
        if (subT != undefined)
        {
            var _loc2 = bottomStrings.length;
            this.SET_SCROLL_TEXT(com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_BOTTOM, _loc2, subT);
            this.DISPLAY_SCROLL_TEXT(com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_BOTTOM, _loc2);
        } // end if
    } // End of the function
    function SET_SCROLL_TEXT(slot, id, str)
    {
        storedStrings[slot][id] = str;
    } // End of the function
    function DISPLAY_SCROLL_TEXT(slot, id, scrollSpeed)
    {
        var _loc2 = storedStrings[slot][id];
        if (_loc2 != undefined && _loc2 != "")
        {
            var _loc3 = this.getTicker(slot);
            _loc3.DISPLAY_SCROLL_TEXT(_loc2, scrollSpeed);
        }
        else
        {
            this.CLEAR_SCROLL_TEXT(slot);
        } // end else if
    } // End of the function
    function CLEAR_SCROLL_TEXT(slot)
    {
        var _loc2 = this.getTicker(slot);
        _loc2.CLEAR_SCROLL_TEXT();
    } // End of the function
    function getTicker(slot)
    {
        return (slot == com.rockstargames.gtav.levelDesign.BREAKING_NEWS.TICKER_BOTTOM ? (bottomMC) : (topMC));
    } // End of the function
    function SHOW_STATIC(staticType)
    {
        lowerThirdMC._visible = false;
        switch (staticType)
        {
            case com.rockstargames.gtav.levelDesign.BREAKING_NEWS.SCREEN_STATIC_NONE:
            {
                staticMC.removeMovieClip();
                staticMC = undefined;
                lowerThirdMC._visible = true;
                break;
            } 
            case com.rockstargames.gtav.levelDesign.BREAKING_NEWS.SCREEN_STATIC_BLUE:
            {
                staticMC = CONTENT.attachMovie("noise_animation_blue", "staticMC", 1000, {_width: screenWidthPixels});
                break;
            } 
            case com.rockstargames.gtav.levelDesign.BREAKING_NEWS.SCREEN_STATIC_NOISE:
            default:
            {
                staticMC = CONTENT.attachMovie("noise_animation", "staticMC", 1000, {_width: screenWidthPixels});
            } 
        } // End of switch
    } // End of the function
    static var SCREEN_STATIC_NONE = -1;
    static var SCREEN_STATIC_NOISE = 0;
    static var SCREEN_STATIC_BLUE = 1;
    static var TICKER_TOP = 0;
    static var TICKER_BOTTOM = 1;
    var _buttonYClearance = 20;
    var subTitleText = "";
} // End of Class
#endinitclip
