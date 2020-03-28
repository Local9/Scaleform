// Action script...

// [Initial MovieClip Action of sprite 723]
#initclip 18
class com.rockstargames.gtav.minimap.StealthBlip extends MovieClip
{
    var onEnterFrame, _currentframe, _totalframes, removeMovieClip;
    function StealthBlip()
    {
        super();
        onEnterFrame = mx.utils.Delegate.create(this, mainLoop);
    } // End of the function
    function mainLoop()
    {
        if (_currentframe >= _totalframes)
        {
            this.killSelf();
        } // end if
    } // End of the function
    function killSelf()
    {
        this.removeMovieClip();
    } // End of the function
} // End of Class
#endinitclip
