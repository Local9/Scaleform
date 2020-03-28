// Action script...

// [Initial MovieClip Action of sprite 77]
#initclip 15
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextRight, colourIconMC, rankIconMC, __get__data, type, __set__data;
    function PauseMenuCrewsCardItem()
    {
        super();
        itemTextRight = labelMC.valueTF;
        colourIconMC._visible = false;
        rankIconMC._visible = false;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        if (this.__get__data()[1] != undefined)
        {
            com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, this.__get__data()[1], true);
        } // end if
        if (this.__get__data()[2] != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(colourIconMC, this.__get__data()[2], this.__get__data()[3], this.__get__data()[4], 100);
            colourIconMC._visible = true;
        } // end if
        if (type == TYPE_WORLD_RANKING)
        {
            rankIconMC._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(rankIconMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        } // end if
        //return (this.data());
        null;
    } // End of the function
    function collapse(isCollapsed)
    {
        if (isCollapsed)
        {
            colourIconMC._x = 143 - colourIconMC._width - 6;
            rankIconMC._x = 143 - rankIconMC._width * 0.500000 - 6;
            itemTextRight._x = 143 - itemTextRight._width - 6 - (rankIconMC._visible ? (rankIconMC._width + 6) : (0));
        }
        else
        {
            colourIconMC._x = 288 - colourIconMC._width - 6;
            rankIconMC._x = 288 - rankIconMC._width * 0.500000 - 6;
            itemTextRight._x = 288 - itemTextRight._width - 6 - (rankIconMC._visible ? (rankIconMC._width + 6) : (0));
        } // end else if
    } // End of the function
    var TYPE_WORLD_RANKING = 1;
} // End of Class
#endinitclip
