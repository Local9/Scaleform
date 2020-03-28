// Action script...

// [Initial MovieClip Action of sprite 123]
#initclip 7
class com.rockstargames.gtav.pc.PCButtonBase
{
    var mc, type, id, args, __get__active, __get__highlight, __set__active, __set__highlight;
    function PCButtonBase()
    {
    } // End of the function
    function init(_mc, _type, _args)
    {
        mc = _mc;
        type = _type;
        var _loc3 = String(_mc).split(".").slice(3);
        var _loc2 = _loc3.join("_");
        id = _loc2 + type;
        if (_args != undefined)
        {
            args = _args;
        } // end if
    } // End of the function
    function set highlight(h)
    {
        _highlight = h;
        if (mc.highlightMC != undefined)
        {
            if (this.__get__active())
            {
                mc.highlightMC.gotoAndStop(h ? ("over") : ("off"));
            } // end if
        } // end if
        //return (this.highlight());
        null;
    } // End of the function
    function get highlight()
    {
        return (_highlight);
    } // End of the function
    function set active(a)
    {
        _active = a;
        if (mc.highlightMC != undefined)
        {
            if (a)
            {
                mc.highlightMC.gotoAndStop("off");
            }
            else
            {
                mc.highlightMC.gotoAndStop("inactive");
            } // end if
        } // end else if
        //return (this.active());
        null;
    } // End of the function
    function get active()
    {
        return (_active);
    } // End of the function
    var _active = true;
    var _highlight = false;
} // End of Class
#endinitclip
