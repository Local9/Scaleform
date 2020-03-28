// Action script...

// [Initial MovieClip Action of sprite 10]
#initclip 5
class com.rockstargames.gtav.levelDesign.OBSERVATORY_SCOPE extends com.rockstargames.ui.core.BaseScreenLayout
{
    var isWideScreen, safeTop, safeBottom, safeLeft, safeRight, isHiDef, CONTENT, positionToScreenLayout;
    function OBSERVATORY_SCOPE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
    {
        isWideScreen = _isWideScreen;
        var _loc3 = 0;
        var _loc2 = 0;
        if (!_isWideScreen)
        {
            var _loc9 = 1.777778;
            var _loc8 = 1.333333;
            var _loc4 = 1280;
            var _loc7 = 720;
            _loc3 = (_loc4 - Math.round(_loc4 / _loc9 * _loc8)) / 2;
            _loc2 = 0;
            _screenWidthPixels = _loc4 - _loc3 * 2;
            _screenHeightPixels = _loc7 - _loc2 * 2;
        } // end if
        safeTop = _loc2 + Math.round(_safeTopPercent * 100 * (_screenHeightPixels / 100));
        safeBottom = _loc2 + Math.round(_safeBottomPercent * 100 * (_screenHeightPixels / 100));
        safeLeft = _loc3 + Math.round(_safeLeftPercent * 100 * (_screenWidthPixels / 100));
        safeRight = _loc3 + Math.round(_safeRightPercent * 100 * (_screenWidthPixels / 100));
        if (!isWideScreen)
        {
            Stage.scaleMode = "noBorder";
        } // end if
        isHiDef = _isHiDef;
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        this.positionToScreenLayout(CONTENT.scopeMC, "CC", true);
    } // End of the function
} // End of Class
#endinitclip
