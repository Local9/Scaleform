// Action script...

// [Initial MovieClip Action of sprite 21]
#initclip 7
class com.rockstargames.gtav.utils.GTAVUIUtils
{
    function GTAVUIUtils()
    {
    } // End of the function
    static function getAdjustedSegmentPct(pct, segmentW, gapW, numSegments)
    {
        var _loc1 = segmentW * numSegments;
        var _loc2 = _loc1 + gapW * (numSegments - 1);
        var _loc5 = 100 / numSegments;
        var _loc4 = pct / 100;
        var _loc6 = (Math.floor(pct / _loc5) * gapW + _loc4 * _loc1) / _loc2 * 100;
        return (_loc6);
    } // End of the function
} // End of Class
#endinitclip
