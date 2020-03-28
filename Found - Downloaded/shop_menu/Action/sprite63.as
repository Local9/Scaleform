// Action script...

// [Initial MovieClip Action of sprite 63]
#initclip 23
class com.rockstargames.gtav.levelDesign.ShopMenuItem extends com.rockstargames.ui.components.GUIMenuItem
{
    var _data, __get__data, newMC, boughtMC, wearingMC, itemTextRight, _highlighted, __set__highlighted, itemTextLeft, backgroundMC, __get__highlighted, __set__data;
    function ShopMenuItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        isActive = !Boolean(_data[0]);
        var _loc3 = _data[1];
        var _loc2 = this.__get__data()[2];
        newMC._visible = _loc3;
        boughtMC._visible = !isActive;
        wearingMC._visible = _loc2;
        if (_loc2)
        {
            boughtMC._visible = false;
            itemTextRight.text = "";
        }
        else if (isActive)
        {
            itemTextRight.text = "$" + _data[3];
            itemTextRight.autoFit = true;
        }
        else
        {
            itemTextRight.text = "";
        } // end else if
        this.__set__highlighted(_highlighted);
        itemTextLeft.text = _data[4];
        itemTextLeft.autoSize = "left";
        newMC._x = itemTextLeft._x + itemTextLeft._width + 10;
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        isActive = !Boolean(_data[0]);
        if (_h)
        {
            itemTextLeft.textColor = itemTextRight.textColor = overText;
            itemTextLeft._alpha = itemTextRight._alpha = 100;
            if (isActive)
            {
                backgroundMC.gotoAndStop(2);
            }
            else
            {
                backgroundMC.gotoAndStop(3);
            } // end else if
            boughtMC.gotoAndStop(2);
            wearingMC.gotoAndStop(2);
            newMC.gotoAndStop(2);
        }
        else
        {
            itemTextLeft.textColor = itemTextRight.textColor = offText;
            if (isActive)
            {
                itemTextLeft._alpha = itemTextRight._alpha = 100;
            }
            else
            {
                itemTextLeft._alpha = 50;
                itemTextRight._alpha = 50;
            } // end else if
            boughtMC.gotoAndStop(1);
            wearingMC.gotoAndStop(1);
            newMC.gotoAndStop(1);
            backgroundMC.gotoAndStop(1);
        } // end else if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var overText = 0;
    var offText = 14474460;
    var inactiveText = 14474460;
    var isActive = true;
} // End of Class
#endinitclip
