// Action script...

// [Initial MovieClip Action of sprite 12]
#initclip 5
class com.rockstargames.gtav.levelDesign.TV_FRAME extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, frameMC, safeMC, safeRight, safeLeft, safeBottom, safeTop, isWideScreen, isHiDef, FILE_WIDTH, FOUR_THREE_PADDING;
    function TV_FRAME()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        frameMC = CONTENT.frameMC;
        safeMC = frameMC.safeMC;
        safeMC._visible = false;
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        frameMC._xscale = (safeRight - safeLeft) / safeMC._width * 100;
        frameMC._yscale = (safeBottom - safeTop) / safeMC._height * 100;
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
        this.initScreenLayout();
    } // End of the function
} // End of Class
#endinitclip
