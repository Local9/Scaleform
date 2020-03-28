// Action script...

// [Initial MovieClip Action of sprite 129]
#initclip 30
class com.rockstargames.ui.loadingScreens.UOBBAMenuItem extends com.rockstargames.ui.components.GUIMenuItem
{
    var bugAges, bugAgeFrames, origin, _data, textMC, getNextHighestDepth, attachMovie, __get__data, _highlighted, bgMC, __get__highlighted, __set__data, __set__highlighted;
    function UOBBAMenuItem()
    {
        super();
        bugAges = [];
        bugAgeFrames = [999, 273, 182, 140, 112, 84, 56, 42, 28, 14, 7, 1];
        origin = new flash.geom.Point(430, 32);
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        textMC.jobTitleTF.text = _data[0];
        textMC.noOfBugsTF.text = _data[1];
        textMC.oldestBugTF.text = _data[2];
        textMC.ownerTF.text = _data[3];
        var _loc10 = _data[_data.length - 1];
        bugAges = _data.slice(4);
        bugAges.pop();
        var _loc3;
        var _loc2;
        var _loc6;
        var _loc4;
        var _loc5 = origin.x;
        for (var _loc2 = 0; _loc2 < bugAges.length; ++_loc2)
        {
            _loc6 = bugAges[_loc2] / _loc10 * 100;
            _loc4 = "UOBBA_age" + bugAgeFrames[_loc2];
            if (_loc3 != undefined)
            {
                _loc5 = _loc3._x + _loc3._width;
            } // end if
            _loc3 = this.attachMovie(_loc4, _loc4, this.getNextHighestDepth(), {_x: _loc5, _y: origin.y, _xscale: _loc6});
        } // end of for
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        if (_highlighted)
        {
            com.rockstargames.ui.utils.Colour.Colourise(textMC, 255, 255, 255, 100);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(textMC, 0, 0, 0, 100);
        } // end else if
        bgMC.highlightMC.gotoAndStop(_h ? (2) : (1));
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
