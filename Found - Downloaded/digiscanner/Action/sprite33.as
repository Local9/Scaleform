// Action script...

// [Initial MovieClip Action of sprite 33]
#initclip 2
class com.rockstargames.gtav.levelDesign.DIGISCANNER extends com.rockstargames.ui.core.BaseScriptUI
{
    var CONTENT, barsMC, lightsMC, barsRGB, lightsRGB, wrongWayRGB;
    function DIGISCANNER()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        barsMC = CONTENT.barsMC;
        lightsMC = CONTENT.lightsMC;
        this.SET_COLOUR(67, 200, 255, 255, 209, 67, 255, 0, 0);
        this.SET_DISTANCE(0);
        this.lightsManager();
    } // End of the function
    function SET_DISTANCE(distance)
    {
        var _loc3 = Math.abs(Math.round(distance / 10));
        if (distance >= 0)
        {
            wrongWay = false;
            if (distance > 100)
            {
                distance = 100;
            } // end if
            for (var _loc2 = 1; _loc2 < 11; ++_loc2)
            {
                if (_loc2 <= _loc3)
                {
                    barsMC["bar_" + _loc2]._alpha = 100;
                    continue;
                } // end if
                barsMC["bar_" + _loc2]._alpha = 25;
            } // end of for
        }
        else if (distance < 0)
        {
            if (distance < -100)
            {
                distance = -100;
            } // end if
            wrongWay = true;
            for (var _loc2 = 1; _loc2 < 11; ++_loc2)
            {
                if (_loc2 <= _loc3)
                {
                    barsMC["bar_" + _loc2]._alpha = 100;
                    continue;
                } // end if
                barsMC["bar_" + _loc2]._alpha = 25;
            } // end of for
        } // end else if
        var _loc5 = _loc3;
        if (_loc5 == 0)
        {
            _loc5 = 1;
        } // end if
        blinkSpeed = 1 / (_loc5 + 0.750000);
        if (wrongWay)
        {
            if (flashing == false)
            {
                this.flashOff();
            } // end if
        }
        else if (flashing == true)
        {
            this.stopFlash();
        } // end else if
        this.SET_COLOUR();
    } // End of the function
    function SET_COLOUR()
    {
        var _loc3 = arguments;
        if (_loc3.length > 0)
        {
            barsRGB = _loc3.splice(0, 3);
            lightsRGB = _loc3.splice(0, 3);
            wrongWayRGB = _loc3.splice(0, 3);
        } // end if
        if (wrongWay)
        {
            com.rockstargames.ui.utils.Colour.Colourise(barsMC, wrongWayRGB[0], wrongWayRGB[1], wrongWayRGB[2], 100);
            com.rockstargames.ui.utils.Colour.Colourise(lightsMC, wrongWayRGB[0], wrongWayRGB[1], wrongWayRGB[2], 100);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(barsMC, barsRGB[0], barsRGB[1], barsRGB[2], 100);
            com.rockstargames.ui.utils.Colour.Colourise(lightsMC, lightsRGB[0], lightsRGB[1], lightsRGB[2], 100);
        } // end else if
    } // End of the function
    function lightsManager()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(lightsMC["light_" + currentLight1], lightFade, {_alpha: 10, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteScope: this, onCompleteArgs: [lightsMC["light_" + currentLight1]]});
        ++currentLight1;
        if (currentLight1 > 14)
        {
            currentLight1 = 1;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(lightsMC["light_" + currentLight1], true);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(lightsMC["light_" + currentLight1]);
        lightsMC["light_" + currentLight1]._alpha = 100;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(lightsMC["light_" + currentLight2], lightFade, {_alpha: 10, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteScope: this, onCompleteArgs: [lightsMC["light_" + currentLight2]]});
        ++currentLight2;
        if (currentLight2 > 14)
        {
            currentLight2 = 1;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(lightsMC["light_" + currentLight2], true);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(lightsMC["light_" + currentLight2]);
        lightsMC["light_" + currentLight2]._alpha = 100;
        var _loc2 = lightsMC._x;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(lightsMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(lightsMC, blinkSpeed, {_x: _loc2, onCompleteScope: this, onComplete: lightsManager});
    } // End of the function
    function flashOn()
    {
        flashing = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(barsMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(barsMC, wrongWayDelay, {_alpha: 100, onCompleteScope: this, onComplete: flashOff});
    } // End of the function
    function flashOff(mc)
    {
        flashing = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(barsMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(barsMC, wrongWayDelay, {_alpha: 40, onCompleteScope: this, onComplete: flashOn});
    } // End of the function
    function stopFlash()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(barsMC);
        barsMC._alpha = 100;
        flashing = false;
    } // End of the function
    var wrongWay = false;
    var wrongWayDelay = 0.400000;
    var flashing = false;
    var currentLight1 = 1;
    var currentLight2 = 8;
    var lightFade = 0.400000;
    var blinkSpeed = 0.500000;
    var debugValue = 0;
} // End of Class
#endinitclip
