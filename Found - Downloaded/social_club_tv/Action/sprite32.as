// Action script...

// [Initial MovieClip Action of sprite 32]
#initclip 6
class com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTicker extends MovieClip
{
    var ticks, getNextHighestDepth, createEmptyMovieClip, container, mask, onEnterFrame, bg;
    function SocialClubTicker()
    {
        super();
        ticks = [];
        container = this.createEmptyMovieClip("container", this.getNextHighestDepth());
        container.beginFill(16711935);
        container.lineTo(0, mask._height);
        container.setMask(mask);
    } // End of the function
    function ADD_TICKER_TEXT(enum, str)
    {
        if (ticks.length == 0)
        {
            container._x = mask._width;
        } // end if
        var _loc3 = (com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick)(container.attachMovie("Tick", "t" + tickCount++, container.getNextHighestDepth(), {_x: mask._width - container._x}));
        _loc3.setLabel.apply(_loc3, arguments);
        ticks.push(_loc3);
        if (onEnterFrame != updateDisplay)
        {
            onEnterFrame = updateDisplay;
        } // end if
    } // End of the function
    function SET_TICKER_SPEED(speed)
    {
        speedCur = speed;
    } // End of the function
    function SET_DEFAULT_SPEED()
    {
        speedCur = speedDefault;
    } // End of the function
    function updateWidth(value)
    {
        var _loc2 = mask._width - value;
        mask._width = bg._width = value;
        container._x = container._x - _loc2;
    } // End of the function
    function updateDisplay()
    {
        container._x = Math.round(container._x - speedCur);
        var _loc2;
        if (ticks.length == 0)
        {
            container._x = mask._width;
            onEnterFrame = undefined;
            return;
        }
        else
        {
            if (container._x < -ticks[0]._x - ticks[0]._width)
            {
                _loc2 = (com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick)(ticks.shift());
                _loc2.removeMovieClip();
                if (ticks.length == 0)
                {
                    container._x = mask._width;
                    return;
                } // end if
                var _loc5 = ticks[0]._x;
                container._x = container._x + _loc5;
                for (var _loc4 = 0; _loc4 < ticks.length; ++_loc4)
                {
                    _loc2 = ticks[_loc4];
                    _loc2._x = _loc2._x - _loc5;
                } // end of for
            } // end if
            var _loc3 = 0;
            for (var _loc4 = 0; _loc4 < ticks.length; ++_loc4)
            {
                _loc2 = ticks[_loc4];
                if (_loc2._x != _loc3)
                {
                    if (_loc2._x < _loc3 + 1)
                    {
                        _loc2._x = _loc3;
                    }
                    else if (_loc2._x - _loc3 < mask._width / 3)
                    {
                        _loc2._x = _loc2._x - (_loc2._x - _loc3) / 10;
                    } // end if
                } // end else if
                _loc3 = _loc2._x + _loc2.__get__tickWidth();
            } // end of for
        } // end else if
    } // End of the function
    var tickCount = 0;
    var speedDefault = 3;
    var speedCur = com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTicker.prototype.speedDefault;
} // End of Class
#endinitclip
