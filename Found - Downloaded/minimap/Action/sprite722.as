// Action script...

// [Initial MovieClip Action of sprite 722]
#initclip 17
class com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES
{
    function ROUND_DECIMAL_PLACES()
    {
    } // End of the function
    static function roundDecimals(numIn, decimalPlaces)
    {
        if (decimalPlaces == undefined)
        {
            decimalPlaces = 2;
        } // end if
        var _loc1 = numIn.toString();
        var _loc2 = _loc1.lastIndexOf(".");
        if (_loc2 == -1)
        {
            return (parseFloat(_loc1));
        }
        else
        {
            return (parseFloat(_loc1.substring(0, _loc2 + decimalPlaces + 1)));
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
