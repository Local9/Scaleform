// Action script...

// [Initial MovieClip Action of sprite 168]
#initclip 6
class com.rockstargames.gtav.minigames.components.SwingMeter extends MovieClip
{
    var _visible, _parent, parentClass, mc_hBar, mc_vBar, mc_bg, mc_apexHBar, mc_apexVBar, mc_target, mc_fill, _x, _y, _xscale, _yscale, _alpha;
    function SwingMeter()
    {
        super();
        _visible = false;
        parentClass = _parent.ref;
        this.setMarker(true, _hBarPosition, true, _vBarPosition);
        this.setApexMarker(false, _apexhBarPosition, false, _apexvBarPosition);
        this.setTarget(_targetSpan, _targetPosition);
        this.setTargetColor(254, 207, 12, 100);
        this.setFill(_fillSpan, _fillState, _fillFromTop);
    } // End of the function
    function setMarker(hVisible, hPosition, vVisible, vPosition)
    {
        _hBarPosition = hPosition;
        _vBarPosition = vPosition;
        mc_hBar._visible = hVisible;
        mc_vBar._visible = vVisible;
        mc_hBar._y = mc_vBar._y = (mc_bg._height - _markerVerticalPadding * 2) * _hBarPosition + _markerVerticalPadding;
        mc_vBar._x = mc_hBar._x + mc_hBar._width * vPosition / 2;
        this._vMarkerCropping(mc_vBar);
    } // End of the function
    function setApexMarker(hVisible, hPosition, vVisible, vPosition)
    {
        _apexhBarPosition = hPosition;
        _apexvBarPosition = vPosition;
        mc_apexHBar._visible = hVisible;
        mc_apexVBar._visible = vVisible;
        mc_apexHBar._y = mc_apexVBar._y = (mc_bg._height - _markerVerticalPadding * 2) * _apexhBarPosition + _markerVerticalPadding;
        mc_apexVBar._x = mc_apexHBar._x + mc_apexHBar._width * vPosition / 2;
        this._vMarkerCropping(mc_apexVBar);
    } // End of the function
    function _vMarkerCropping(target)
    {
        target._rotation = -90;
        var _loc3 = 1;
        if (target._y < 14 - _markerVerticalPadding)
        {
            _loc3 = 30 - 30 * target._y / 14;
        }
        else if (target._y > mc_bg._height - 14 - _markerVerticalPadding)
        {
            _loc3 = 30 - 30 * (mc_bg._height - target._y) / 14;
            target._rotation = 90;
        } // end else if
        _loc3 = Math.round(_loc3) + 1 + _markerVerticalPadding * 2;
        target.gotoAndStop(Math.round(_loc3));
    } // End of the function
    function setTarget(span, hPosition)
    {
        _targetSpan = span;
        _targetPosition = hPosition;
        mc_target._height = mc_bg._height * _targetSpan;
        mc_target._y = mc_bg._height * hPosition;
    } // End of the function
    function setTargetColor(r, g, b, a)
    {
        if (a == undefined)
        {
            a = 100;
        } // end if
        com.rockstargames.ui.utils.Colour.Colourise(mc_target, r, g, b, a);
    } // End of the function
    function setFill(span, state, fromTop)
    {
        _fillSpan = span;
        _fillState = state;
        _fillFromTop = fromTop != undefined ? (fromTop) : (true);
        mc_fill._height = mc_bg._height * _fillSpan;
        if (_fillFromTop)
        {
            mc_fill._y = 0;
        }
        else
        {
            mc_fill._y = mc_bg._height - mc_fill._height;
        } // end else if
        if (state >= 0)
        {
            mc_fill.gotoAndStop(Math.round((mc_fill._totalframes - _fillStateFrameOffset) * _fillState + _fillStateFrameOffset));
        }
        else
        {
            mc_fill.gotoAndStop(1);
        } // end else if
    } // End of the function
    function setPosition(x, y, center)
    {
        var _loc3 = center ? ((mc_bg._width + mc_bg._x) / 2) : (0);
        var _loc2 = center ? ((mc_bg._height + mc_bg._y) / 2) : (0);
        screenWidth = parentClass.isWideScreen ? (1280) : (960);
        _x = screenWidth * x - _loc3;
        if (!parentClass.isWideScreen)
        {
            _x = _x + 160;
        } // end if
        _y = screenHeight * y - _loc2;
    } // End of the function
    function setScale(w, h)
    {
        _xscale = w * 100;
        if (h == undefined)
        {
            h = w;
        } // end if
        _yscale = h * 100;
    } // End of the function
    function isTransitioing()
    {
        return (_transitioning);
    } // End of the function
    function transitionIn()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(this, true);
        _transitioning = true;
        _visible = true;
        _alpha = 100;
        _transitioning = false;
    } // End of the function
    function transitionOut(duration)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this);
        _transitioning = true;
        if (duration == 0 || duration == undefined)
        {
            _alpha = 0;
            this._handleTransitionOutComplete();
            return;
        }
        else if (duration == undefined)
        {
            duration = 1000;
        } // end else if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(this, duration / 1000, {_alpha: 0, onComplete: _handleTransitionOutComplete, onCompleteScope: this});
    } // End of the function
    function _handleTransitionOutComplete()
    {
        _visible = false;
        _transitioning = false;
    } // End of the function
    var _hBarPosition = 0;
    var _vBarPosition = 0;
    var _apexhBarPosition = 0;
    var _apexvBarPosition = 0;
    var _targetSpan = 0.200000;
    var _targetPosition = 0.800000;
    var _fillSpan = com.rockstargames.gtav.minigames.components.SwingMeter.prototype._hBarPosition;
    var _fillState = -1;
    var _fillFromTop = true;
    var _transitioning = false;
    var _markerVerticalPadding = 1;
    var _fillStateFrameOffset = 2;
    var screenWidth = 1280;
    var screenHeight = 720;
} // End of Class
#endinitclip
