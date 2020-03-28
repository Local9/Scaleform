// Action script...

// [Initial MovieClip Action of sprite 31]
#initclip 3
class com.rockstargames.gtav.web.buttons.WebButton extends MovieClip
{
    var browser, _visible, _x;
    function WebButton()
    {
        super();
        browser = _level0.TIMELINE;
    } // End of the function
    function buttonEvent()
    {
    } // End of the function
    function SHOW(xPos)
    {
        _visible = true;
        disabled = false;
        _x = xPos;
    } // End of the function
    function HIDE()
    {
        _visible = false;
        disabled = true;
        _x = 1300;
    } // End of the function
    var buttonType = -1;
    var isBrowserButton = false;
    var disabled = false;
    var topLevel = false;
} // End of Class
#endinitclip
