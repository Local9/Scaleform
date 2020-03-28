// Action script...

// [Initial MovieClip Action of sprite 75]
#initclip 22
class com.rockstargames.ui.utils.textfieldAutoScroll extends MovieClip
{
    var targetTF, prevMaxscr, maxscr;
    function textfieldAutoScroll()
    {
        super();
        var _loc3 = this;
        targetTF = _loc3.txtString;
        prevMaxscr = targetTF.maxhscroll;
    } // End of the function
    function onEnterFrame()
    {
        maxscr = targetTF.maxhscroll;
        if (prevMaxscr != maxscr)
        {
            targetTF.hscroll = 0;
            direction = -1;
            delay = 0;
            prevMaxscr = maxscr;
        } // end if
        if (maxscr > 4)
        {
            targetTF.hscroll = targetTF.hscroll + direction;
            var _loc2 = targetTF.hscroll;
            if (_loc2 == maxscr || _loc2 == 0)
            {
                ++delay;
            } // end if
            if (delay > delayTimeout)
            {
                direction = -direction;
                delay = 0;
            } // end if
        } // end if
    } // End of the function
    function resetDelay()
    {
        delay = 0;
    } // End of the function
    function setDelayTimeout(newDelayTimeout)
    {
        delayTimeout = newDelayTimeout;
    } // End of the function
    var direction = -1;
    var delay = 0;
    var delayTimeout = 150;
} // End of Class
#endinitclip
