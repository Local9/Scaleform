// Action script...

// [Initial MovieClip Action of sprite 63]
#initclip 7
class com.rockstargames.ui.components.GUIMenuItem extends MovieClip
{
    var __get__data, __get__labels, gotoAndStop, __get__highlighted, _height, __set__data, __set__highlighted, __set__labels;
    function GUIMenuItem()
    {
        super();
        _data = new Array();
        _labels = new Array();
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        //return (this.data());
        null;
    } // End of the function
    function get data()
    {
        return (_data);
    } // End of the function
    function set labels(_l)
    {
        _labels = _l;
        //return (this.labels());
        null;
    } // End of the function
    function get labels()
    {
        return (_labels);
    } // End of the function
    function set highlighted(_h)
    {
        if (!_h)
        {
            this.gotoAndStop(1);
        }
        else
        {
            this.gotoAndStop(2);
        } // end else if
        null;
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    function get highlighted()
    {
        return (_highlighted);
    } // End of the function
    function getHeight()
    {
        return (_height);
    } // End of the function
    var _data = new Array();
    var _highlighted = false;
    var _labels = new Array();
} // End of Class
#endinitclip
