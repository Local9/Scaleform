// Action script...

// [Initial MovieClip Action of sprite 27]
#initclip 14
class com.rockstargames.gtav.levelDesign.MissionCompleteItem extends com.rockstargames.ui.components.GUIMenuItem
{
    var innerMC, _data, id, _alpha, bgMC, __get__data, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function MissionCompleteItem()
    {
        super();
        com.rockstargames.ui.utils.Colour.ApplyHudColour(innerMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        innerMC.completeMC._visible = true;
        switch (_data[0])
        {
            case -1:
            {
                innerMC.completeMC.gotoAndStop(3);
                innerMC.completeMC._visible = false;
                innerMC.itemTextRight._x = 138;
                break;
            } 
            case 0:
            {
                innerMC.completeMC.gotoAndStop(1);
                break;
            } 
            case 1:
            {
                innerMC.completeMC.gotoAndStop(2);
                break;
            } 
        } // End of switch
        id = _d[1];
        var _loc2 = "";
        var _loc9 = _data[_data.length - 1];
        innerMC._alpha = 100;
        switch (id)
        {
            case 0:
            {
                _alpha = 50;
                break;
            } 
            case 1:
            case 2:
            {
                _loc2 = _data[_data.length - 2];
                break;
            } 
            case 3:
            {
                _loc2 = com.rockstargames.ui.utils.MathStar.toFixedRound(_data[_data.length - 2], 2) + "%";
                break;
            } 
            case 4:
            {
                var _loc4 = _data[_data.length - 3];
                var _loc6 = String(_loc4);
                if (_loc4 < 10)
                {
                    _loc6 = "0" + _loc4;
                } // end if
                var _loc5 = _data[_data.length - 2];
                var _loc7 = String(_loc5);
                if (_loc5 < 10)
                {
                    _loc7 = "0" + _loc5;
                } // end if
                _loc2 = _loc6 + ":" + _loc7;
                break;
            } 
            case 5:
            {
                _loc2 = _data[_data.length - 3] + "/" + _data[_data.length - 2];
                break;
            } 
            case 6:
            {
                _loc2 = "$" + _data[_data.length - 2];
                break;
            } 
            case 7:
            {
                innerMC.completeMC._visible = false;
                break;
            } 
            case 8:
            {
                _loc2 = _data[_data.length - 2];
                innerMC.itemTextRight._x = 138;
                innerMC.completeMC._visible = false;
                break;
            } 
            case 9:
            case 10:
            {
                _loc2 = _data[_data.length - 2];
                innerMC.itemTextRight._x = 138;
                break;
            } 
        } // End of switch
        var _loc3 = _loc9.split("<br/>");
        innerMC.itemTextLeft.text = _loc3[0];
        innerMC.itemTextLeft.autoSize = "left";
        var _loc8 = _loc3.length > 1;
        innerMC.descTF.text = _loc8 ? (_loc3[1]) : ("");
        bgMC._height = _loc8 ? (innerMC.descTF._y + innerMC.descTF.textHeight + 5) : (25);
        innerMC.itemTextRight.text = _loc2;
        innerMC.itemTextRight.autoSize = "right";
        if (id == 10)
        {
            innerMC.completeMC._x = innerMC.itemTextRight._x - 20;
        } // end if
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        if (_highlighted)
        {
            com.rockstargames.ui.utils.Colour.Colourise(innerMC, 0, 0, 0);
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, 220, 220, 220);
            bgMC._alpha = 100;
        }
        else
        {
            if (id == 0)
            {
                com.rockstargames.ui.utils.Colour.Colourise(innerMC, 100, 100, 100);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(innerMC, 220, 220, 220);
            } // end else if
            bgMC._alpha = 0;
        } // end else if
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
