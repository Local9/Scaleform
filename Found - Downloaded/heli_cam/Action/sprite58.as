// Action script...

// [Initial MovieClip Action of sprite 58]
#initclip 5
class com.rockstargames.gtav.levelDesign.HELI_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
    var DispConf, getDisplayConfig, CONTENT, compassMC, altitudeMC, cWords, hdAutoMC, logoMC, fovMC, tMC, bMC, FOUR_THREE_PADDING, FILE_WIDTH, safeTop, screenHeightPixels, safeLeft, safeRight;
    function HELI_CAM()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        DispConf = new com.rockstargames.ui.utils.DisplayConfig();
        DispConf = this.getDisplayConfig(true);
        compassPointList = [];
        var _loc5 = ["N", "E", "S", "W"];
        for (var _loc4 = 0; _loc4 < _loc5.length; ++_loc4)
        {
            mc = CONTENT.camMC.compassWordsMC.attachMovie("compassletter", "compassletter" + _loc5[_loc4], CONTENT.camMC.compassWordsMC.getNextHighestDepth());
            mc.blendMode = 8;
            mc.letterTF.text = _loc5[_loc4];
            mc._alpha = 0;
            compassPointList.push(mc);
        } // end of for
        compassMC = CONTENT.camMC.compassMC;
        altitudeMC = CONTENT.camMC.altitudeMC;
        cWords = CONTENT.camMC.compassWordsMC;
        hdAutoMC = CONTENT.camMC.hdAutoMC;
        logoMC = CONTENT.camMC.logoMC;
        fovMC = CONTENT.camMC.fovMC;
        tMC = CONTENT.camMC.topMarginMC;
        bMC = CONTENT.camMC.botMarginMC;
        halfWidth = compassMC._width / 2;
        angleSteps = compassMC._width * 2;
        this.SET_AUDIO_STATES(false, false, false);
        this.initScreenLayout();
        this.SET_CAM_ALT(0);
        this.SET_CAM_FOV(0);
    } // End of the function
    function initScreenLayout()
    {
        if (!DispConf.isWideScreen)
        {
            Stage.scaleMode = "noBorder";
            DispConf.screenWidth = 960;
            FOUR_THREE_PADDING = 160;
        } // end if
        var _loc2 = FILE_WIDTH / 2;
        CONTENT.camMC.crosshairOutlineMC._x = _loc2 - CONTENT.camMC.crosshairOutlineMC._width / 2;
        compassMC._y = safeTop;
        cWords._y = compassMC._y + compassMC._height + 20;
        hdAutoMC._y = safeTop;
        tMC._height = Math.round(hdAutoMC._y + hdAutoMC._height + borderpadding);
        bMC._height = tMC._height + 32;
        bMC._y = screenHeightPixels - bMC._height;
        altitudeMC._x = FOUR_THREE_PADDING + safeLeft;
        altitudeMC._y = (bMC._y - tMC._height - altitudeMC._height) / 2 + tMC._height;
        logoMC._x = FOUR_THREE_PADDING + safeRight - logoMC._width;
        hdAutoMC._x = FOUR_THREE_PADDING + safeRight - hdAutoMC._width;
        fovMC._x = FOUR_THREE_PADDING + safeRight - fovMC.barMC._width;
        logoMC._y = tMC._y + tMC._height + borderpadding;
        logoMC._y = tMC._y + tMC._height + borderpadding;
        fovMC._y = logoMC._y + logoMC._height + 10;
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
        fovMC.arrowMC._x = (1 - a) * (fovMC.barMC._width - 2);
    } // End of the function
    function SET_CAM_ALT(a)
    {
        var _loc2 = 400;
        var _loc4 = Math.max(0, Math.min(a, _loc2));
        var _loc5 = 372;
        var _loc3 = 12;
        altitudeMC.arrowMC._y = (_loc2 - _loc4) * ((_loc5 - _loc3) / _loc2) + _loc3;
    } // End of the function
    function SET_ALT_FOV_HEADING(a, f, h)
    {
        if (a != undefined)
        {
            this.SET_CAM_ALT(a);
        } // end if
        if (f != undefined)
        {
            this.SET_CAM_FOV(f);
        } // end if
        if (h != undefined)
        {
            this.SET_CAM_HEADING(h);
        } // end if
    } // End of the function
    function SET_CAM_LOGO(value)
    {
        logoState = value;
        logoMC.gotoAndStop(logoState + 1);
    } // End of the function
    function SET_AUDIO_STATES(smallLine, mediumLine, largeLine)
    {
        CONTENT.audioWaveSmallMC._visible = smallLine;
        CONTENT.audioWaveMediumMC._visible = mediumLine;
        CONTENT.audioWaveBigMC._visible = largeLine;
    } // End of the function
    static var MAX_ARROW_DX = 169;
    var afactor = 57.295780;
    var compassPointList = new Array();
    var halfWidth = 196;
    var angleSteps = 676;
    var angle = 0;
    var szone = 0.150000;
    var borderpadding = 16;
    var logoState = 0;
} // End of Class
#endinitclip
