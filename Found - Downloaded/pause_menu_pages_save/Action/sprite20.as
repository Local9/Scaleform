// Action script...

// [Initial MovieClip Action of sprite 20]
#initclip 8
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListFullItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextLeft, itemTextRight, bgMC, solidMC, gradMC, __get__data, type, isSelectable, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function PauseMenuTextListFullItem()
    {
        super();
        itemTextLeft = labelMC.titleTF;
        itemTextRight = labelMC.valueTF;
        solidMC = bgMC.solidMC;
        gradMC = bgMC.gradMC;
        gradMC._visible = false;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        if (this.__get__data()[1] != undefined && this.__get__data()[1] != "")
        {
            com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, this.__get__data()[1]);
        } // end if
        switch (type)
        {
            case 1:
            {
                gradMC._visible = true;
                solidMC._visible = false;
                itemTextLeft._x = (bgMC._width - itemTextLeft._width) / 2 - labelMC._x;
                break;
            } 
            case 0:
            default:
            {
                gradMC._visible = false;
                solidMC._visible = true;
                itemTextLeft._x = 10;
                break;
            } 
        } // End of switch
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        var _loc3;
        var _loc2;
        if (_h)
        {
            _loc3 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
            _loc2 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK;
        }
        else
        {
            _loc3 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_50;
            if (isSelectable == 1)
            {
                _loc2 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
            }
            else
            {
                _loc2 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.GREYED;
            } // end else if
        } // end else if
        com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3[1], _loc3[2], _loc3[3], _loc3[4]);
        com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2[1], _loc2[2], _loc2[3], _loc2[4]);
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        var _loc2 = Math.ceil(itemTextLeft.textHeight / 27);
        bgMC._height = _loc2 * 27 - 2;
    } // End of the function
} // End of Class
#endinitclip
