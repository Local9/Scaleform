// Action script...

// [Initial MovieClip Action of sprite 39]
#initclip 5
class com.rockstargames.gtav.levelDesign.SECURITY_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
    var isWideScreen, screenWidthPixels, screenHeightPixels, safeTop, safeBottom, safeLeft, safeRight, layoutType, timeMC, locationMC, outerFrameMC, innerFrameMC, positionToScreenLayout, extraMC, camMC, CONTENT;
    function SECURITY_CAM()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.SET_LAYOUT(com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_SECURITY);
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
    {
        var _loc3 = 0;
        var _loc2 = 0;
        isWideScreen = _isWideScreen;
        if (!isWideScreen)
        {
            var _loc7 = 1.777778;
            var _loc6 = 1.333333;
            var _loc4 = 1280;
            var _loc5 = 720;
            _loc3 = (_loc4 - Math.round(_loc4 / _loc7 * _loc6)) / 2;
            _loc2 = 0;
            screenWidthPixels = _loc4 - _loc3 * 2;
            screenHeightPixels = _loc5 - _loc2 * 2;
        } // end if
        safeTop = _loc2 + Math.round(_safeTopPercent * 100 * (_screenHeightPixels / 100));
        safeBottom = _loc2 + Math.round(_safeBottomPercent * 100 * (_screenHeightPixels / 100));
        safeLeft = Math.round(_safeLeftPercent * 100 * (_screenWidthPixels / 100)) + _loc3;
        safeRight = Math.round(_safeRightPercent * 100 * (_screenWidthPixels / 100)) - _loc3;
        if (!isWideScreen)
        {
            Stage.scaleMode = "noBorder";
        } // end if
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        switch (layoutType)
        {
            case com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_DSLR:
            {
                timeMC._x = safeLeft;
                timeMC._y = safeBottom - timeMC._height;
                locationMC._x = safeLeft;
                locationMC._y = safeTop - 5;
                outerFrameMC._x = safeLeft - framePadding * 1.500000;
                outerFrameMC._y = safeTop - framePadding;
                outerFrameMC._width = safeRight - safeLeft + framePadding * 3;
                outerFrameMC._height = safeBottom - safeTop + framePadding * 2;
                innerFrameMC._width = outerFrameMC._width / 3;
                innerFrameMC._height = outerFrameMC._height / 3;
                this.positionToScreenLayout(innerFrameMC, "CC", true);
                break;
            } 
            case com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_SECURITY:
            default:
            {
                timeMC._x = safeLeft;
                timeMC._y = safeTop;
                locationMC._x = safeRight - locationMC._width;
                locationMC._y = safeTop;
                extraMC._x = safeRight - extraMC._width;
                extraMC._y = safeTop + locationMC.bgMC._height + 4;
            } 
        } // End of switch
    } // End of the function
    function SET_LAYOUT(type)
    {
        layoutType = type;
        if (camMC != undefined)
        {
            camMC.removeMovieClip();
        } // end if
        switch (layoutType)
        {
            case com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_DSLR:
            {
                camMC = CONTENT.attachMovie("lesterCam", "camMC", CONTENT.getNextHighestDepth(), {_alpha: 70});
                innerFrameMC = camMC.innerFrameMC;
                outerFrameMC = camMC.outerFrameMC;
                break;
            } 
            case com.rockstargames.gtav.levelDesign.SECURITY_CAM.CAMERA_TYPE_SECURITY:
            default:
            {
                camMC = CONTENT.attachMovie("securityCam", "camMC", CONTENT.getNextHighestDepth());
                extraMC = camMC.extraMC;
            } 
        } // End of switch
        locationMC = camMC.locationMC;
        timeMC = camMC.timeMC;
        locationMC.labelTF.autoSize = "left";
        extraMC.labelTF.autoSize = "left";
        timeMC.tt.autoSize = "left";
        this.initScreenLayout();
    } // End of the function
    function SET_LOCATION(loc)
    {
        if (loc != undefined)
        {
            locationMC.labelTF.htmlText = loc.toUpperCase();
            locationMC.bgMC._width = locationMC.labelTF._width + 5;
        } // end if
    } // End of the function
    function SET_DETAILS(details)
    {
        if (details != undefined)
        {
            extraMC.labelTF.htmlText = details.toUpperCase();
            extraMC.bgMC._width = extraMC.labelTF._width + 5;
        } // end if
        this.initScreenLayout();
    } // End of the function
    function SET_TIME(hh, mm, ss, tt)
    {
        var _loc5 = hh > 9 ? (String(hh)) : ("0" + hh);
        var _loc4 = mm > 9 ? (String(mm)) : ("0" + mm);
        timeMC.hh.htmlText = _loc5;
        timeMC.mm.htmlText = _loc4;
        if (tt != undefined)
        {
            timeMC.tt.htmlText = tt.toUpperCase();
        } // end if
        timeMC.bgMC._width = timeMC.tt._x + timeMC.tt._width;
        if (tt != undefined && tt != "")
        {
            timeMC.bgMC._width = timeMC.bgMC._width + 6;
        } // end if
    } // End of the function
    static var CAMERA_TYPE_SECURITY = 0;
    static var CAMERA_TYPE_DSLR = 1;
    var szone = 0;
    var framePadding = 15;
} // End of Class
#endinitclip
