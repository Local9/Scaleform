// Action script...

// [Initial MovieClip Action of sprite 49]
#initclip 5
class com.rockstargames.gtav.levelDesign.REMOTE_SNIPER_HUD extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, windGaugeMC, zoomLevelTF, SET_DISPLAY_CONFIG, ref, screenWidthPixels, screenHeightPixels, positionToScreenLayout, safeLeft, safeRight;
    function REMOTE_SNIPER_HUD()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.loadingAnimation();
        windGaugeMC = CONTENT.scopeMC.windGaugeMC.circleMC.handMC;
        zoomLevelTF = CONTENT.zoomLevel;
        compassPointList = [];
        var _loc5 = ["N", "E", "S", "W"];
        for (var _loc3 = 0; _loc3 < _loc5.length; ++_loc3)
        {
            mc = CONTENT.scopeMC.compassWordsMC.attachMovie("compassletter", "compassletter" + _loc5[_loc3], CONTENT.scopeMC.compassWordsMC.getNextHighestDepth());
            mc.letterTF.text = _loc5[_loc3];
            mc._alpha = 0;
            compassPointList.push(mc);
        } // end of for
        halfWidth = CONTENT.scopeMC.compassMC._width / 2;
        angleSteps = CONTENT.scopeMC.compassMC._width * 2;
        this.loadingAnimation();
    } // End of the function
    function loadingAnimation()
    {
        CONTENT._visible = false;
        var _loc11 = 0.250000;
        var _loc10 = 0.500000;
        var _loc8 = 0.750000;
        var _loc7 = 1;
        CONTENT.scopeMC.blackGradMC._alpha = 0;
        CONTENT.scopeMC.circlesMC._alpha = 0;
        CONTENT.scopeMC.circlesMC._xscale = 0;
        CONTENT.scopeMC.circlesMC.outerRing._alpha = 0;
        CONTENT.scopeMC.circlesMC.outerRing._xscale = 0;
        CONTENT.scopeMC.circlesMC.outerRing._yscale = 0;
        CONTENT.scopeMC.circlesMC.circMC._alpha = 0;
        CONTENT.scopeMC.circlesMC.circMC._xscale = 0;
        CONTENT.scopeMC.circlesMC.circMC._yscale = 0;
        CONTENT.scopeMC.circlesMC.ringMC._alpha = 0;
        CONTENT.scopeMC.circlesMC.ringMC._xscale = 150;
        CONTENT.scopeMC.circlesMC.ringMC._yscale = 150;
        CONTENT.scopeMC.circlesMC.ringMC._rotation = -20;
        CONTENT.scopeMC.compassMC._alpha = 0;
        CONTENT.scopeMC.compassWordsMC._alpha = 0;
        CONTENT.scopeMC.windGaugeMC._alpha = 0;
        CONTENT.scopeMC.windGaugeMC._xscale = 0;
        CONTENT.scopeMC.windGaugeMC._yscale = 0;
        CONTENT.scopeMC.crosshairMC._alpha = 0;
        CONTENT.scopeMC.crosshairMC._xscale = 50;
        CONTENT.scopeMC.crosshairMC._yscale = 50;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.blackGradMC, 0.500000, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.circlesMC, 0.500000, {_alpha: 100, _xscale: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_IN, delay: 0.250000});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.circlesMC.outerRing, 0.500000, {_alpha: 100, _xscale: 100, _yscale: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_IN, delay: 0.750000});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.circlesMC.circMC, 0.500000, {_alpha: 100, _xscale: 100, _yscale: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT, delay: 1});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.circlesMC.ringMC, 0.500000, {_alpha: 100, _xscale: 100, _yscale: 100, _rotation: 0, ease: com.rockstargames.ui.tweenStar.Ease.SINE_IN, delay: 1.250000});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.compassMC, 0.500000, {_alpha: 100, delay: 1.500000});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.compassWordsMC, 0.750000, {_alpha: 100, delay: 1.750000});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.windGaugeMC, 0.500000, {_alpha: 100, _xscale: 100, _yscale: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT, delay: 1.500000});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.scopeMC.crosshairMC, 0.500000, {_alpha: 100, _xscale: 100, _yscale: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT, delay: 2});
        CONTENT._visible = true;
    } // End of the function
    function debug()
    {
        var _loc2 = 0.150000;
        this.SET_DISPLAY_CONFIG(960, 720, _loc2, 1 - _loc2, _loc2, 1 - _loc2, false, true);
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
            angle = angle - aspeed;
            if (angle < 0)
            {
                angle = angle + 360;
            } // end if
            this.SET_COMPASS(angle);
        } // end if
        if (Key.isDown(39))
        {
            angle = angle + aspeed;
            if (angle > 360)
            {
                angle = angle - 360;
            } // end if
            this.SET_COMPASS(angle);
        } // end if
        if (Key.isDown(38))
        {
            zoom = zoom + aspeed;
            if (zoom > 100)
            {
                zoom = zoom - 100;
            } // end if
            this.SET_WIND(zoom, true);
            szone = szone + 0.050000;
        } // end if
        if (Key.isDown(40))
        {
            zoom = zoom - aspeed;
            if (zoom < 0)
            {
                zoom = zoom + 100;
            } // end if
            this.SET_WIND(zoom, false);
            szone = szone - 0.050000;
        } // end if
    } // End of the function
    function initScreenLayout()
    {
        var _loc3 = CONTENT.scopeMC.blackGradMC;
        _loc3._width = screenWidthPixels;
        _loc3._height = screenHeightPixels;
        var _loc5 = CONTENT.scopeMC.circlesMC;
        this.positionToScreenLayout(_loc5, "xCC", true);
        var _loc7 = CONTENT.scopeMC.crosshairMC;
        this.positionToScreenLayout(_loc7, "xCC", true);
        var _loc2 = CONTENT.scopeMC.compassMC;
        this.positionToScreenLayout(_loc2, "xCT", true);
        var _loc4 = CONTENT.scopeMC.compassWordsMC;
        _loc4._x = safeLeft + (safeRight - safeLeft) / 2;
        _loc4._y = _loc2._y + _loc2._height + 16;
        var _loc6 = CONTENT.scopeMC.windGaugeMC;
        _loc6._x = safeRight - 127;
    } // End of the function
    function SET_ZOOM_LEVEL(zoomLevel)
    {
    } // End of the function
    function SET_WIND(windValue, directionIsRight)
    {
        var _loc2 = Math.max(0, Math.min(windValue, 100));
        if (directionIsRight)
        {
            windGaugeMC._xscale = 100;
        }
        else
        {
            windGaugeMC._xscale = -100;
        } // end else if
        windGaugeMC.maskMC._xScale = _loc2;
        windGaugeMC.maskMC._yScale = _loc2;
    } // End of the function
    function SET_COMPASS(a)
    {
        angle = a;
        var _loc6 = Math.max(0, Math.min(angle, 360));
        var _loc4 = -_loc6 / 360 * angleSteps;
        var _loc5 = _loc4 % 28;
        for (var _loc3 in compassPointList)
        {
            var _loc2 = (angle + 90 * _loc3) % 360;
            this.setCompassPointPos(compassPointList[_loc3], _loc2, _loc3);
        } // end of for...in
        CONTENT.scopeMC.compassMC.compassInnerMC._x = 14 + _loc5;
    } // End of the function
    function setCompassPointPos(mc, a, index)
    {
        var _loc2 = a / afactor;
        mc._x = Math.sin(_loc2) * halfWidth;
        mc._alpha = Math.abs(a - 180) / 1.800000;
    } // End of the function
    var zoom = 0;
    var angle = 0;
    var aspeed = 4;
    var afactor = 57.295780;
    var compassPointList = new Array();
    var halfWidth = 196;
    var angleSteps = 676;
    var szone = 0.150000;
} // End of Class
#endinitclip
