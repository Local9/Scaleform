// Action script...

// [Initial MovieClip Action of sprite 125]
#initclip 12
class com.rockstargames.ui.tweenStar.TweenStarLite
{
    var target, vars, duration, startTime, ease, props, updateMC, tweenStarUpdateRef;
    function TweenStarLite(_mytarget, _duration, _vars, _isTween)
    {
        _global.gfxExtensions = true;
        target = _mytarget;
        vars = _vars;
        duration = _duration * 1000;
        startTime = getTimer() + (vars.delay * 1000 || 0);
        ease = com.rockstargames.ui.tweenStar.Ease.EaseTable[com.rockstargames.ui.tweenStar.Ease.LINEAR];
        props = [];
        if (_isTween)
        {
            for (var _loc3 in vars)
            {
                if (_loc3 == "_x" || _loc3 == "_y" || _loc3 == "_alpha" || _loc3 == "_xscale" || _loc3 == "_yscale" || _loc3 == "_width" || _loc3 == "_height" || _loc3 == "_rotation" || _loc3 == "_xrotation" || _loc3 == "_yrotation" || _loc3 == "_zscale")
                {
                    props.push([_loc3, target[_loc3], vars[_loc3]]);
                } // end if
            } // end of for...in
            if (vars.ease != undefined)
            {
                if (typeof(vars.ease) == "number")
                {
                    ease = com.rockstargames.ui.tweenStar.Ease.EaseTable[vars.ease];
                }
                else
                {
                    trace ("Invalid type for ease. It has to be a number now!");
                } // end if
            } // end if
        } // end else if
        updateMC = (MovieClip)(target).createEmptyMovieClip("TSLContainerMC", com.rockstargames.ui.tweenStar.TweenStarLite.tweenMCDepth);
        updateMC.tweenStarUpdateRef = this;
        updateMC.onEnterFrame = function ()
        {
            tweenStarUpdateRef.updateAll();
        };
        target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef] = new com.rockstargames.ui.tweenStar.TweenStarLiteRef(updateMC, props, vars);
    } // End of the function
    function updateAll()
    {
        var _loc4 = getTimer() - startTime;
        var _loc2 = _loc4 / duration;
        _loc2 = Math.min(_loc2, 1);
        for (var _loc3 in props)
        {
            if (_loc2 > 0)
            {
                target[props[_loc3][0]] = this.ease(_loc2, props[_loc3][1], props[_loc3][2] - props[_loc3][1], 1);
            } // end if
        } // end of for...in
        if (_loc2 == 1)
        {
            for (var _loc3 in props)
            {
                target[props[_loc3][0]] = props[_loc3][2];
            } // end of for...in
            delete updateMC.onEnterFrame;
            updateMC.removeMovieClip();
            if (vars.onComplete)
            {
                vars.onComplete.apply(vars.onCompleteScope, vars.onCompleteArgs);
            } // end if
            false;
        } // end if
    } // End of the function
    static function to(target, duration, vars)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(target);
        var _loc1 = new com.rockstargames.ui.tweenStar.TweenStarLite(target, duration, vars, true);
        return (_loc1);
    } // End of the function
    static function delayCall(target, duration, vars)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(target);
        var _loc1 = new com.rockstargames.ui.tweenStar.TweenStarLite(target, duration, vars, false);
        return (_loc1);
    } // End of the function
    static function setDelay(target, _duration)
    {
        var _loc1 = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
        _loc1.updateMC.tweenStarUpdateRef.startTime = 0;
        _loc1.updateMC.tweenStarUpdateRef.duration = _duration * com.rockstargames.ui.tweenStar.TweenStarLite.frameRate;
    } // End of the function
    static function removeAllTweens()
    {
    } // End of the function
    static function removeTweenOf(target)
    {
        var _loc1 = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
        if (_loc1.updateMC != undefined)
        {
            delete _loc1.updateMC.onEnterFrame;
            _loc1.updateMC.removeMovieClip();
        } // end if
    } // End of the function
    static function endTweenOf(target, forceComplete)
    {
        var _loc1 = target[com.rockstargames.ui.tweenStar.TweenStarLite.tweenStarLiteRef];
        if (_loc1 != undefined)
        {
            for (var _loc3 in _loc1.props)
            {
                target[_loc1.props[_loc3][0]] = _loc1.props[_loc3][2];
            } // end of for...in
            if (_loc1.vars.onComplete && forceComplete)
            {
                _loc1.vars.onComplete.apply(_loc1.vars.onCompleteScope, _loc1.vars.onCompleteArgs);
            } // end if
            delete _loc1.updateMC.onEnterFrame;
            _loc1.updateMC.removeMovieClip();
        } // end if
    } // End of the function
    static function endAllTweens(forceComplete)
    {
    } // End of the function
    static function linearEase(t, b, c, d)
    {
        return (c * t / d + b);
    } // End of the function
    static var version = 1.010000;
    static var tweenMCDepth = 99999;
    static var frameRate = 30;
    static var tweenStarLiteRef = "TweenStarLiteRef";
} // End of Class
#endinitclip
