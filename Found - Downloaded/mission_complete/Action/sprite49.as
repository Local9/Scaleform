// Action script...

// [Initial MovieClip Action of sprite 49]
#initclip 16
class com.rockstargames.ui.utils.MathStar
{
    function MathStar()
    {
    } // End of the function
    static function getRandomNumber(min, max)
    {
        var _loc1 = Math.floor(Math.random() * (max - min + 1)) + min;
        return (_loc1);
    } // End of the function
    static function toFixedRound(num, fractionDigits)
    {
        return (com.rockstargames.ui.utils.MathStar.toFixed(num, fractionDigits, true));
    } // End of the function
    static function toFixed(num, fractionDigits, round)
    {
        var _loc2 = 1;
        for (var _loc1 = 0; _loc1 < fractionDigits; ++_loc1)
        {
            _loc2 = _loc2 * 10;
        } // end of for
        return ((round ? (Math.round(num * _loc2)) : (Math.floor(num * _loc2))) / _loc2);
    } // End of the function
} // End of Class
#endinitclip
