// Action script...

// [Initial MovieClip Action of sprite 67]
#initclip 24
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsVerticalListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem
{
    var type, __get__data, multiListItems, _data, itemTextLeft, initialIndex, __set__textIndex, itemTextRight, labelMC, _highlighted, __set__highlighted, multiListIndex, selectedIndex, selectedValue, __get__textIndex, bgMC, __get__highlighted, __set__data;
    function PauseMenuStatsVerticalListItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        switch (type)
        {
            case 1:
            {
                multiListItems = this.__get__data().slice(1);
                com.rockstargames.ui.utils.UIText.setSizedText(itemTextLeft, _data[0]);
                this.__set__textIndex(initialIndex);
                itemTextRight._visible = true;
                labelMC.rMC._visible = labelMC.lMC._visible = true;
                break;
            } 
            default:
            {
                labelMC.rMC._visible = labelMC.lMC._visible = false;
                break;
            } 
        } // End of switch
        this.__set__highlighted(_highlighted);
        //return (this.data());
        null;
    } // End of the function
    function set textIndex(ti)
    {
        multiListIndex = ti;
        selectedIndex = multiListIndex;
        selectedValue = multiListItems[multiListIndex];
        if (selectedValue != undefined || selectedValue != "")
        {
            com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, selectedValue, false, true);
            com.rockstargames.ui.utils.UIText.setSizedText(itemTextLeft, _data[0]);
            itemTextRight._x = labelMC.rMC._x - itemTextRight._width - 2;
            labelMC.lMC._x = itemTextRight._x - 2;
            labelMC.rMC._visible = labelMC.lMC._visible = true;
        } // end if
        //return (this.textIndex());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        if (_h)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
            if (type == 1)
            {
                itemTextRight._x = labelMC.rMC._x - itemTextRight._width - 2;
                labelMC.lMC._x = itemTextRight._x - 2;
                labelMC.rMC._visible = labelMC.lMC._visible = true;
                itemTextRight._visible = true;
            } // end if
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc2);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            if (type == 1)
            {
                labelMC.rMC._visible = labelMC.lMC._visible = false;
                itemTextRight._visible = false;
            } // end if
        } // end else if
        if (bgMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        if (labelMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        } // end if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
