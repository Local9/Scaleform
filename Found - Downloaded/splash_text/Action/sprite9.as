// Action script...

// [Initial MovieClip Action of sprite 9]
#initclip 4
class com.rockstargames.gtav.levelDesign.SPLASH_TEXT extends com.rockstargames.ui.core.ScreenLayoutUI
{
    var SET_SAFE, SET_RATIO, CONTENT, txt_label, screenManager, _managedTween, _splashDuration, _delayDuration;
    function SPLASH_TEXT()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.SET_SAFE(com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[0]);
        this.SET_RATIO(com.rockstargames.ui.core.ScreenLayoutManager.SCREEN_FORMAT_WIDE);
        txt_label = CONTENT.txt_label;
        this.SPLASH_TEXT_COLOR();
        this.SPLASH_TEXT_TRANSITION_OUT(0);
        screenManager.positionToScreen(CONTENT, "xCC", true);
    } // End of the function
    function SET_SPLASH_TEXT(txt, duration, r, g, b, a)
    {
        this.SPLASH_TEXT_LABEL(txt, r, g, b, a);
        _managedTween = true;
        _splashDuration = duration;
        _delayDuration = _splashDuration - _defaultTransitionDuration * 2;
        this.SPLASH_TEXT_TRANSITION_IN(duration, true);
    } // End of the function
    function SPLASH_TEXT_LABEL(txt, r, g, b, a)
    {
        txt_label.text = txt;
        this.SPLASH_TEXT_COLOR(r, g, b, a);
    } // End of the function
    function SPLASH_TEXT_COLOR(r, g, b, a)
    {
        if (r != undefined && g != undefined && b != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT, r, g, b, a);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT, 253, 214, 83);
        } // end else if
        if (a != undefined)
        {
            CONTENT._alpha = a / 255 * 100;
        }
        else
        {
            CONTENT._alpha = 100;
        } // end else if
    } // End of the function
    function SPLASH_TEXT_TRANSITION_IN(duration, managed)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        CONTENT._visible = true;
        if (duration == undefined)
        {
            duration = _defaultTransitionDuration;
        }
        else if (duration == 0)
        {
            CONTENT._xscale = CONTENT._yscale = 100;
            CONTENT._alpha = 100;
            return;
        } // end else if
        CONTENT._xscale = CONTENT._yscale = _startingScale;
        CONTENT._alpha = 0;
        if (managed)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, _defaultTransitionDuration / 1000, {_alpha: 100, _xscale: 100, _yscale: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT, onComplete: _handleTransitionInComplete, onCompleteScope: this}, false);
        }
        else
        {
            _delayDuration = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, duration / 1000, {_alpha: 100, _xscale: 100, _yscale: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT}, false);
        } // end else if
    } // End of the function
    function _handleTransitionInComplete()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        this.SPLASH_TEXT_TRANSITION_OUT(_defaultTransitionDuration, true);
    } // End of the function
    function SPLASH_TEXT_TRANSITION_OUT(duration, managed)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        if (duration == undefined)
        {
            duration == _defaultTransitionDuration;
        }
        else if (duration == 0)
        {
            this._handleTransitionOutComplete();
            return;
        } // end else if
        if (managed)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, duration / 1000, {_alpha: 0, _xScale: 80, _yScale: 80, delay: _delayDuration / 1000, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN, onComplete: _handleTransitionOutComplete, onCompleteScope: this});
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, duration / 1000, {_alpha: 0, _xScale: 80, _yScale: 80, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN, onComplete: _handleTransitionOutComplete, onCompleteScope: this});
        } // end else if
    } // End of the function
    function _handleTransitionOutComplete()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        CONTENT._visible = false;
    } // End of the function
    function IS_SPLASH_TEXT_VISIBLE()
    {
        return (CONTENT._visible);
    } // End of the function
    var _startingScale = 90;
    var _defaultTransitionDuration = 300;
} // End of Class
#endinitclip
