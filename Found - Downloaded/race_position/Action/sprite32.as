// Action script...

// [Initial MovieClip Action of sprite 32]
#initclip 3
class com.rockstargames.ui.core.ScreenLayoutManager
{
    var __get__SR, __get__SB, __get__SL, __get__ST;
    function ScreenLayoutManager(_screenSize)
    {
        this.setSafeZone();
        screenSize = _screenSize;
    } // End of the function
    function addToScreen(linkageID, instanceName, containerMC, position, onPixel)
    {
        var _loc3 = containerMC.getNextHighestDepth();
        var _loc2 = containerMC.attachMovie(linkageID, instanceName, _loc3);
        var _loc4 = _loc2._width * ratio;
        var _loc6 = _loc2._height * ratio;
        _loc2._width = _loc4;
        this.positionToScreen(_loc2, position, onPixel);
        return (_loc2);
    } // End of the function
    function positionToScreen(mc, position, onPixel)
    {
        switch (position)
        {
            case "LT":
            case "xLT":
            {
                mc._x = SL;
                mc._y = ST;
                break;
            } 
            case "RT":
            {
                mc._x = this.__get__SR() - mc._width;
                mc._y = ST;
                break;
            } 
            case "LB":
            {
                mc._x = SL;
                mc._y = this.__get__SB() - mc._height;
                break;
            } 
            case "RB":
            {
                mc._x = this.__get__SR() - mc._width;
                mc._y = this.__get__SB() - mc._height;
                break;
            } 
            case "CC":
            {
                mc._x = (this.__get__SR() + safearea.width) * 0.500000 - mc._width * 0.500000;
                mc._y = (this.__get__SB() + safearea.height) * 0.500000 - mc._height * 0.500000;
                break;
            } 
            case "CB":
            {
                mc._x = (this.__get__SR() + safearea.width) * 0.500000 - mc._width * 0.500000;
                mc._y = this.__get__SB() - mc._height;
                break;
            } 
            case "CT":
            {
                mc._x = (this.__get__SR() + safearea.width) * 0.500000 - mc._width * 0.500000;
                mc._y = ST;
                break;
            } 
            case "xRT":
            {
                mc._x = SR;
                mc._y = ST;
                break;
            } 
            case "xLB":
            {
                mc._x = SL;
                mc._y = SB;
                break;
            } 
            case "xRB":
            {
                mc._x = SR;
                mc._y = SB;
                break;
            } 
            case "xCC":
            {
                mc._x = (this.__get__SR() + safearea.width) * 0.500000;
                mc._y = (this.__get__SB() + safearea.height) * 0.500000;
                break;
            } 
            case "xCB":
            {
                mc._x = (this.__get__SR() + safearea.width) * 0.500000;
                mc._y = SB;
                break;
            } 
            case "xCT":
            {
                mc._x = (this.__get__SR() + safearea.width) * 0.500000;
                mc._y = ST;
                break;
            } 
        } // End of switch
        if (onPixel)
        {
            mc._x = Math.round(mc._x);
            mc._y = Math.round(mc._y);
        } // end if
    } // End of the function
    function setRatio(ratioEnum)
    {
        switch (ratioEnum)
        {
            case com.rockstargames.ui.core.ScreenLayoutManager.SCREEN_FORMAT_WIDE:
            {
                ratio = screenRatioWide;
                break;
            } 
            case com.rockstargames.ui.core.ScreenLayoutManager.SCREEN_FORMAT_NON_WIDE:
            {
                ratio = screenRatioNonWide;
                break;
            } 
        } // End of switch
    } // End of the function
    function setSafeZone()
    {
        var _loc3 = arguments[0];
        switch (Number(_loc3[0]))
        {
            case com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[0]:
            {
                safearea.width = com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[1];
                safearea.height = com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[2];
                break;
            } 
            case com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_B[0]:
            {
                safearea.width = com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_B[1];
                safearea.height = com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_B[2];
                break;
            } 
            case com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_C[0]:
            {
                safearea.width = _loc3[1];
                safearea.height = _loc3[2];
                break;
            } 
            default:
            {
                safearea.width = 0;
                safearea.height = 0;
                break;
            } 
        } // End of switch
    } // End of the function
    function get ST()
    {
        return (0 + safearea.height);
    } // End of the function
    function get SB()
    {
        return (720 - safearea.height);
    } // End of the function
    function get SR()
    {
        return (1280 - safearea.width);
    } // End of the function
    function get SL()
    {
        return (0 + safearea.width);
    } // End of the function
    var safearea = new Object();
    var screenRatioWide = 1;
    var screenRatioNonWide = 1.333330;
    var ratio = 1;
    static var SAFE_ZONE_A = new Array(0, 64, 36);
    static var SAFE_ZONE_B = new Array(1, 96, 54);
    static var SAFE_ZONE_C = new Array(2, 0, 0);
    static var SCREEN_FORMAT_WIDE = 0;
    static var SCREEN_FORMAT_NON_WIDE = 1;
    var screenSize = 0;
} // End of Class
#endinitclip
