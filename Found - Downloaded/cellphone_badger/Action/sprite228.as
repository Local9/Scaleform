// Action script...

// [Initial MovieClip Action of sprite 228]
#initclip 14
class com.rockstargames.ui.utils.FitToTextfield
{
    function FitToTextfield()
    {
    } // End of the function
    static function capText()
    {
        var _loc10 = arguments[0];
        var _loc11 = arguments[1];
        var _loc4 = _loc11;
        var _loc6 = _loc10.getNewTextFormat();
        var _loc3 = _loc6.getTextExtent(_loc4);
        var _loc5 = _loc3.textFieldWidth;
        var _loc7 = _loc10._width;
        if (_loc5 < _loc7)
        {
            return (_loc4);
        }
        else
        {
            var _loc9 = _loc4.length;
            _loc3 = _loc6.getTextExtent("...");
            var _loc8 = _loc3.textFieldWidth;
            for (var _loc2 = 0; _loc2 < _loc9; ++_loc2)
            {
                _loc3 = _loc6.getTextExtent(_loc4.slice(0, _loc2));
                _loc5 = _loc3.textFieldWidth;
                if (_loc5 > _loc7 - _loc8)
                {
                    return (_loc4.slice(0, _loc2 - 1) + "...");
                    break;
                } // end if
            } // end of for
        } // end else if
    } // End of the function
    static function scaleText()
    {
        var _loc7 = arguments[0];
        var _loc2 = arguments[1];
        var _loc12 = _loc2;
        var _loc11 = arguments[2];
        var _loc9 = arguments[3];
        if (_loc9 == undefined)
        {
            _loc9 = "left";
        } // end if
        var _loc15 = arguments[4];
        var _loc8 = false;
        for (var _loc5 = 0; _loc5 < 3; ++_loc5)
        {
            var _loc4 = _loc2.indexOf("<");
            if (_loc4 == -1)
            {
                break;
                continue;
            } // end if
            var _loc3 = _loc2.indexOf(">");
            if (_loc3 == -1)
            {
                break;
                continue;
            } // end if
            _loc8 = true;
            var _loc6 = _loc2.substr(0, _loc4) + _loc2.substr(_loc3 + 1);
            _loc2 = _loc6;
        } // end of for
        var _loc13 = _loc7.getNewTextFormat();
        var _loc14 = _loc13.getTextExtent(_loc2);
        var _loc10 = _loc14.textFieldWidth;
        _loc7.autoSize = _loc9;
        _loc7.wordWrap = false;
        if (_loc10 > _loc11)
        {
            _loc7._xscale = _loc11 / _loc10 * 100;
        }
        else
        {
            _loc7._xscale = 100;
        } // end else if
        if (_loc8 == true)
        {
            _loc7.htmlText = _loc12;
        }
        else
        {
            _loc7.text = _loc2;
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
