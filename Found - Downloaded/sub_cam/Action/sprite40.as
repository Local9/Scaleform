// Action script...

// [Initial MovieClip Action of sprite 40]
#initclip 5
class com.rockstargames.gtav.levelDesign.SUB_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, SET_DISPLAY_CONFIG, ref, safeLeft, safeTop, safeRight, safeBottom, positionToScreenLayout, screenWidthPixels, screenHeightPixels;
    function SUB_CAM()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        compassPointList = [];
        var _loc5 = ["N", "E", "S", "W"];
        for (var _loc3 = 0; _loc3 < _loc5.length; ++_loc3)
        {
            mc = CONTENT.camMC.compassWordsMC.attachMovie("compassletter", "compassletter" + _loc5[_loc3], CONTENT.camMC.compassWordsMC.getNextHighestDepth());
            mc.letterTF.text = _loc5[_loc3];
            mc._alpha = 0;
            compassPointList.push(mc);
        } // end of for
        halfWidth = CONTENT.camMC.compassMC._width / 2;
        angleSteps = CONTENT.camMC.compassMC._width * 2;
    } // End of the function
    function debug()
    {
        var _loc2 = 0.150000;
        this.SET_DISPLAY_CONFIG(960, 720, _loc2, _loc2, _loc2, _loc2, true, true);
        CONTENT.ref = this;
        CONTENT.onEnterFrame = function ()
        {
            ref.update();
        };
    } // End of the function
    function update()
    {
        if (Key.isDown(37))
        {
            angle = angle - 2;
            if (angle < 0)
            {
                angle = angle + 360;
            } // end if
            this.SET_CAM_HEADING(angle);
            this.SET_CAM_CURSOR_POS(szone = szone - 0.100000);
        } // end if
        if (Key.isDown(39))
        {
            angle = angle + 2;
            if (angle > 360)
            {
                angle = angle - 360;
            } // end if
            this.SET_CAM_HEADING(angle);
            this.SET_CAM_CURSOR_POS(szone = szone + 0.100000);
        } // end if
        if (Key.isDown(38))
        {
            szone = szone + 0.050000;
            this.SET_DISPLAY_CONFIG(1280, 720, szone, szone, szone, szone, true, true);
        } // end if
        if (Key.isDown(40))
        {
            szone = szone - 0.050000;
            this.SET_DISPLAY_CONFIG(1280, 720, szone, szone, szone, szone, true, true);
        } // end if
    } // End of the function
    function initScreenLayout()
    {
        var _loc4 = CONTENT.camMC.borderMC;
        _loc4._x = safeLeft;
        _loc4._y = safeTop;
        _loc4._width = safeRight - safeLeft;
        _loc4._height = safeBottom - safeTop;
        var _loc3 = 8;
        var _loc5 = CONTENT.camMC.fovMC;
        _loc5._x = safeRight - _loc5._width - _loc3;
        _loc5._y = safeTop + _loc3;
        this.positionToScreenLayout(CONTENT.camMC.crosshairMC, "xCC", true);
        var _loc2 = CONTENT.camMC.compassMC;
        _loc2._x = safeLeft + (safeRight - safeLeft) / 2;
        _loc2._y = safeTop + _loc3;
        var _loc6 = CONTENT.camMC.compassWordsMC;
        _loc6._x = safeLeft + (safeRight - safeLeft) / 2;
        _loc6._y = _loc2._y + _loc2._height + 20;
        var _loc8 = CONTENT.camMC.altitudeMC;
        _loc8._x = safeLeft + _loc3;
        var _loc7 = CONTENT.camMC.footerMC;
        _loc7._x = safeLeft + (safeRight - safeLeft) / 2;
        _loc7._y = safeBottom - 20;
    } // End of the function
    function SET_COMPASS_POINT_POS(mc, a, index)
    {
        mc._x = Math.sin(a / afactor) * halfWidth;
        mc._alpha = Math.abs(a - 180) / 1.800000;
    } // End of the function
    function SET_CAM_HEADING(a)
    {
        var _loc8 = Math.max(0, Math.min(a, 360));
        var _loc6 = -_loc8 / 360 * angleSteps;
        var _loc7 = _loc6 % 28;
        for (var _loc5 in compassPointList)
        {
            var _loc3 = (a + 90 * _loc5) % 360;
            var _loc2 = compassPointList[_loc5];
            _loc2._x = Math.sin(_loc3 / afactor) * halfWidth;
            _loc2._alpha = Math.abs(_loc3 - 180) / 1.800000;
        } // end of for...in
        CONTENT.camMC.compassMC.compassInnerMC._x = 14 + _loc7;
    } // End of the function
    function SET_CAM_FOV(a)
    {
        var _loc2 = Math.max(5, Math.min(a, 50));
        CONTENT.camMC.fovMC.arrowMC._x = 4 + (_loc2 - 5) * 3.755556;
    } // End of the function
    function SET_CAM_ALT(a)
    {
        var _loc2 = Math.max(0, Math.min(a, 400));
        CONTENT.camMC.altitudeMC.arrowMC._y = -_loc2 * 0.875000;
    } // End of the function
    function SET_CAM_CURSOR_POS(x, y)
    {
        CONTENT.cursorMC._x = x * screenWidthPixels;
        CONTENT.cursorMC._y = y * screenHeightPixels;
    } // End of the function
    var afactor = 57.295780;
    var compassPointList = new Array();
    var halfWidth = 196;
    var angleSteps = 676;
    var angle = 0;
    var szone = 0.150000;
} // End of Class
#endinitclip
