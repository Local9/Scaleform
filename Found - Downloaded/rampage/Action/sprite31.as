// Action script...

// [Initial MovieClip Action of sprite 31]
#initclip 2
class com.rockstargames.gtav.levelDesign.RAMPAGE extends com.rockstargames.ui.core.BaseScriptUI
{
    var CONTENT;
    function RAMPAGE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function SHOW_RAMPAGE()
    {
        CONTENT.gotoAndStop(1);
        CONTENT._visible = true;
    } // End of the function
    function HIDE_RAMPAGE()
    {
        CONTENT.gotoAndStop(1);
        CONTENT._visible = false;
    } // End of the function
    function SHOW_RAMPAGE_INTRO(duration, rampage, description)
    {
        var _loc2 = duration / 4;
        CONTENT.gotoAndStop("INTRO");
        var _loc5 = CONTENT.INTRO.logoMC;
        var _loc4 = CONTENT.INTRO.titleMC;
        var _loc3 = CONTENT.INTRO.descriptionMC;
        _loc5._alpha = 0;
        _loc4._alpha = 0;
        _loc3._alpha = 0;
        _loc5._xscale = 300;
        _loc5._yscale = 300;
        _loc5._rotation = -5;
        _loc4._xscale = 300;
        _loc4._yscale = 300;
        _loc4._rotation = -5;
        _loc3._xscale = 300;
        _loc3._yscale = 300;
        _loc3._rotation = -5;
        _loc3.descriptionTF.text = description;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5, _loc2, {_alpha: 100, _xscale: 80, _yscale: 80, _rotation: 5, onCompleteScope: this, onComplete: bounceBack, onCompleteArgs: [_loc2, _loc5]});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4, _loc2, {_alpha: 100, _xscale: 80, _yscale: 80, _rotation: 5, delay: _loc2, onCompleteScope: this, onComplete: bounceBack, onCompleteArgs: [_loc2, _loc4]});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3, _loc2, {_alpha: 100, _xscale: 80, _yscale: 80, _rotation: 5, delay: _loc2 + _loc2, onCompleteScope: this, onComplete: bounceBack, onCompleteArgs: [_loc2, _loc3]});
    } // End of the function
    function SHOW_RAMPAGE_COUNTDOWN(duration, description)
    {
    } // End of the function
    function SHOW_RAMPAGE_OUTRO()
    {
        var _loc6 = arguments;
        var _loc18 = _loc6[0];
        var _loc16 = _loc6[1];
        if (_loc16)
        {
            var _loc11 = (_loc6.length - 5) / 2;
        }
        else
        {
            _loc11 = (_loc6.length - 2) / 2;
        } // end else if
        var _loc13 = _loc18 / 4;
        var _loc17 = [13395456, 10066329, 16776960];
        CONTENT.gotoAndStop("OUTRO");
        var _loc12 = CONTENT.OUTRO.logoMC;
        var _loc10 = CONTENT.OUTRO.passFailMC;
        if (CONTENT.OUTRO.statsMC != undefined)
        {
            CONTENT.OUTRO.statsMC.removeMovieClip();
        } // end if
        var _loc4 = CONTENT.OUTRO.createEmptyMovieClip("statsMC", CONTENT.OUTRO.getNextHighestDepth());
        _loc4._x = 0;
        _loc4._y = 62;
        _loc12._alpha = 0;
        _loc10._alpha = 0;
        _loc4._alpha = 0;
        _loc12._xscale = 500;
        _loc12._yscale = 500;
        _loc12._rotation = -5;
        _loc10._xscale = 300;
        _loc10._yscale = 300;
        _loc10._rotation = -5;
        _loc4._xscale = 300;
        _loc4._yscale = 300;
        _loc4._rotation = -5;
        var _loc3 = 2;
        var _loc9 = 11;
        for (var _loc7 = 0; _loc7 < _loc11; ++_loc7)
        {
            var _loc5;
            var _loc8 = "outroStatMC" + (_loc3 - 1);
            _loc5 = _loc4.attachMovie("outroStatMC", _loc8, _loc4.getNextHighestDepth(), {_x: 0, _y: _loc9});
            _loc5.s1TF.text = _loc6[_loc3];
            _loc5.s2TF.text = _loc6[_loc3 + 1];
            _loc3 = _loc3 + 2;
            _loc9 = _loc9 + 21;
        } // end of for
        if (_loc16)
        {
            var _loc20 = _loc6[_loc6.length - 3];
            var _loc19 = _loc6[_loc6.length - 2];
            var _loc15 = _loc6[_loc6.length - 1];
            var _loc14;
            _loc14 = _loc4.attachMovie("outroFooterMC", "outroFooterMC", _loc4.getNextHighestDepth(), {_x: 0, _y: _loc9});
            _loc14.ratingTF.text = _loc20;
            _loc14.medalTF.text = _loc19;
            _loc14.medalTF.textColor = _loc17[_loc15 - 1];
            _loc14.medalMC.gotoAndStop(_loc15);
            _loc10.gotoAndStop("PASSED");
        }
        else
        {
            _loc10.gotoAndStop("FAILED");
        } // end else if
        _loc12._alpha = 100;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc12, _loc13, {_xscale: 120, _yscale: 120, _rotation: 0, onCompleteScope: this, onComplete: setAlpha, onCompleteArgs: [_loc10]});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc10, _loc13, {_xscale: 100, _yscale: 100, _rotation: 0, delay: _loc13, onCompleteScope: this, onComplete: setAlpha, onCompleteArgs: [_loc4]});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4, _loc13, {_xscale: 100, _yscale: 100, _rotation: 0, delay: _loc13 + _loc13});
    } // End of the function
    function setAlpha(_mc)
    {
        _mc._alpha = 100;
    } // End of the function
    function swapAlpha(_mc1, _mc2)
    {
        _mc1._alpha = 0;
        _mc2._alpha = 100;
    } // End of the function
    function bounceBack(duration, _mc)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_mc, duration, {_xscale: 100, _yscale: 100, _rotation: 0});
    } // End of the function
    var fadeTime = 1;
} // End of Class
#endinitclip
