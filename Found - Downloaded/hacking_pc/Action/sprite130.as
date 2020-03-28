// Action script...

// [Initial MovieClip Action of sprite 130]
#initclip 14
class com.rockstargames.gtav.pc.popups.Popup_Base extends MovieClip
{
    var centerMC, picMC, bgMC, closeMC, keylineMC, titleTF, _visible;
    function Popup_Base()
    {
        super();
        picMC = centerMC.alignMC.picMC;
        bgMC = centerMC.alignMC.bgMC;
        closeMC = centerMC.alignMC.closeMC;
        keylineMC = centerMC.alignMC.keylineMC;
        titleTF = centerMC.alignMC.titleTF;
    } // End of the function
    function init(id, data)
    {
        picMC.gotoAndStop(id + 1);
        var _loc5 = picMC.sizeMC._width;
        var _loc4 = picMC.sizeMC._height;
        keylineMC._width = _loc5;
        keylineMC._height = _loc4;
        var _loc2 = _loc5 + 2 * margin;
        var _loc3 = _loc4 + margin + picMC._y;
        bgMC._width = _loc2;
        bgMC._height = _loc3;
        if (data[3] != undefined)
        {
            titleTF.autoSize = "left";
            titleTF.multiline = false;
            titleTF.wordWrap = false;
            titleTF.text = data[3];
        } // end if
        closeMC._x = _loc2 - closeMC._width - margin;
        _loc2 = centerMC.alignMC._width / 2;
        _loc3 = centerMC.alignMC._height / 2;
        centerMC.alignMC._x = -_loc2;
        centerMC.alignMC._y = -_loc3;
        centerMC._x = _loc2;
        centerMC._y = _loc3;
        centerMC._alpha = 0;
        centerMC._xscale = centerMC._yscale = 90;
        _visible = false;
    } // End of the function
    function openAnim()
    {
        centerMC._alpha = 0;
        _visible = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(centerMC, 0.400000, {_alpha: 100, _xScale: 100, _yScale: 100});
    } // End of the function
    var margin = 6;
} // End of Class
#endinitclip
