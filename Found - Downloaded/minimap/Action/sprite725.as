// Action script...

// [Initial MovieClip Action of sprite 725]
#initclip 20
class com.rockstargames.gtav.minimap.WantedRadiusBlip extends MovieClip
{
    var wantedBlue, wantedRadiusInterval, wantedRed;
    function WantedRadiusBlip()
    {
        super();
        wantedBlue._visible = false;
        wantedRadiusInterval = setInterval(this, "wantedColour", 500);
    } // End of the function
    function wantedColour()
    {
        var _loc2;
        if (redVis)
        {
            _loc2 = true;
            redVis = false;
        }
        else
        {
            _loc2 = false;
            redVis = true;
        } // end else if
        wantedRed._visible = redVis;
        wantedBlue._visible = _loc2;
    } // End of the function
    var redVis = true;
} // End of Class
#endinitclip
