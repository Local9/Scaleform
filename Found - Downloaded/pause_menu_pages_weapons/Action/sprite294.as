// Action script...

// [Initial MovieClip Action of sprite 294]
#initclip 3
class com.rockstargames.ui.components.GUIScroll extends MovieClip
{
    var _x, _y, gutter, scrubber, __get__scrollpercent, __set__scrollpercent;
    function GUIScroll()
    {
        super();
    } // End of the function
    function init(newX, newY, height)
    {
        _x = newX;
        _y = newY;
        Height = height;
        if (Height != undefined)
        {
            gutter._height = Height;
        } // end if
    } // End of the function
    function setGutterHeight(_visibleItems, _maxlItems)
    {
        scrubber._height = _visibleItems * (Height / _maxlItems);
    } // End of the function
    function set scrollpercent(_s)
    {
        _scrollpercent = Math.max(0, Math.min(_s, 100));
        scrubber._y = Height / 100 * _scrollpercent;
        //return (this.scrollpercent());
        null;
    } // End of the function
    function get scrollpercent()
    {
        return (_scrollpercent);
    } // End of the function
    var _scrollpercent = 0;
    var Height = 0;
} // End of Class
#endinitclip
