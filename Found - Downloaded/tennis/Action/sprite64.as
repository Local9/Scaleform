// Action script...

// [Initial MovieClip Action of sprite 64]
#initclip 2
class com.rockstargames.ui.core.BaseScreenLayout extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    function BaseScreenLayout()
    {
        super();
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
    {
        isWideScreen = _isWideScreen;
        if (isWideScreen)
        {
            screenWidthPixels = 1280;
            screenHeightPixels = 720;
        }
        else
        {
            screenWidthPixels = 960;
            screenHeightPixels = 720;
        } // end else if
        safeLeft = Math.round(screenWidthPixels * _safeLeftPercent);
        safeRight = Math.round(screenWidthPixels * _safeRightPercent);
        safeTop = Math.round(screenHeightPixels * _safeTopPercent);
        safeBottom = Math.round(screenHeightPixels * _safeBottomPercent);
        if (!isWideScreen)
        {
            Stage.scaleMode = "noBorder";
        } // end if
        isHiDef = _isHiDef;
        this.initScreenLayout();
    } // End of the function
    function getDisplayConfig(shouldSet)
    {
        if (shouldSet == undefined)
        {
            shouldSet = true;
        } // end if
        var _loc2 = new com.rockstargames.ui.utils.DisplayConfig();
        com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, _loc2);
        if (shouldSet)
        {
            this.SET_DISPLAY_CONFIG(_loc2.screenWidth, _loc2.screenHeight, _loc2.safeTop, _loc2.safeBottom, _loc2.safeLeft, _loc2.safeRight, _loc2.isWideScreen, _loc2.isCircleAccept, _loc2.isAsian);
        } // end if
        return (_loc2);
    } // End of the function
    function initScreenLayout()
    {
    } // End of the function
    function addMCToScreenLayout(linkageID, instanceName, containerMC, position, onPixel)
    {
        var _loc3 = containerMC.getNextHighestDepth();
        var _loc2 = containerMC.attachMovie(linkageID, instanceName, _loc3);
        this.positionToScreenLayout(_loc2, position, onPixel);
        return (_loc2);
    } // End of the function
    function positionToScreenLayout(mc, position, onPixel)
    {
        var _loc4 = mc._width;
        var _loc5 = mc._height;
        var _loc3 = 0;
        var _loc2 = 0;
        switch (position)
        {
            case "LT":
            case "xLT":
            {
                _loc3 = safeLeft;
                _loc2 = safeTop;
                break;
            } 
            case "RT":
            {
                _loc3 = safeRight - _loc4;
                _loc2 = safeTop;
                break;
            } 
            case "LB":
            {
                _loc3 = safeLeft;
                _loc2 = safeBottom - _loc5;
                break;
            } 
            case "RB":
            {
                _loc3 = safeRight - _loc4;
                _loc2 = safeBottom - _loc5;
                break;
            } 
            case "CC":
            {
                _loc3 = FILE_WIDTH / 2 - _loc4 / 2;
                _loc2 = safeTop + (safeBottom - safeTop) / 2 - _loc5 / 2;
                break;
            } 
            case "CB":
            {
                _loc3 = safeLeft + (safeRight - safeLeft) / 2 - _loc4 / 2;
                _loc2 = safeBottom - _loc5;
                break;
            } 
            case "CT":
            {
                _loc3 = safeLeft + (safeRight - safeLeft) / 2 - _loc4 / 2;
                _loc2 = safeTop;
                break;
            } 
            case "xRT":
            {
                _loc3 = safeRight;
                _loc2 = safeTop;
                break;
            } 
            case "xLB":
            {
                _loc3 = safeLeft;
                _loc2 = safeBottom;
                break;
            } 
            case "xRB":
            {
                _loc3 = safeRight;
                _loc2 = safeBottom;
                break;
            } 
            case "xCC":
            {
                _loc3 = FILE_WIDTH / 2 - _loc4 / 2;
                _loc2 = safeTop + (safeBottom - safeTop) / 2;
                break;
            } 
            case "xCB":
            {
                _loc3 = FILE_WIDTH / 2 - _loc4 / 2;
                _loc2 = safeBottom;
                break;
            } 
            case "xCT":
            {
                _loc3 = FILE_WIDTH / 2 - _loc4 / 2;
                _loc2 = safeTop;
                break;
            } 
        } // End of switch
        if (onPixel)
        {
            _loc3 = Math.round(_loc3);
            _loc2 = Math.round(_loc2);
        } // end if
        mc._x = _loc3;
        mc._y = _loc2;
    } // End of the function
    var FILE_WIDTH = 1280;
    var screenWidthPixels = 1280;
    var screenHeightPixels = 720;
    var safeTop = 54;
    var safeBottom = 666;
    var safeLeft = 96;
    var safeRight = 1184;
    var isWideScreen = true;
    var isHiDef = true;
    var isMultiplayer = false;
    var FOUR_THREE_PADDING = 0;
    var SD_CLIPPING = 0.125000;
} // End of Class
#endinitclip
