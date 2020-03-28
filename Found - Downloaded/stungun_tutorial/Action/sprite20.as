// Action script...

// [Initial MovieClip Action of sprite 20]
#initclip 8
class com.rockstargames.ui.tweenStar.easing.Sine
{
    function Sine()
    {
    } // End of the function
    static function easeIn(t, b, c, d)
    {
        return (-c * Math.cos(t / d * 1.570796) + c + b);
    } // End of the function
    static function easeOut(t, b, c, d)
    {
        return (c * Math.sin(t / d * 1.570796) + b);
    } // End of the function
    static function easeInOut(t, b, c, d)
    {
        return (-c / 2 * (Math.cos(3.141593 * t / d) - 1) + b);
    } // End of the function
} // End of Class
#endinitclip
