// Action script...

// [Initial MovieClip Action of sprite 173]
#initclip 7
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem
{
    var index, menuID, uniqueID, type, initialIndex, isSelectable, _data, labelMC, bgMC, blipLayer, itemTextLeft, __get__data, __set__data;
    function PauseMenuMissionHelpListItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        index = _d[0];
        menuID = _d[1];
        uniqueID = _d[2];
        type = _d[3];
        initialIndex = _d[4];
        isSelectable = _d[5];
        if (_d.length >= 7)
        {
            _data = _d.slice(6);
        } // end if
        com.rockstargames.ui.utils.Colour.ApplyHudColour(labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        bgMC._visible = false;
        if (blipLayer != undefined)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = labelMC.createEmptyMovieClip("blipLayer", 1000);
        itemTextLeft.autoSize = true;
        var _loc3 = new com.rockstargames.ui.utils.Text();
        _loc3.setTextWithIcons(_data[0], blipLayer, itemTextLeft, 0, 13, 3, false);
        this.snapBGGrid(bgMC);
        //return (this.data());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        var _loc2 = labelMC._y + itemTextLeft.textHeight;
        bgMC._height = _loc2;
    } // End of the function
} // End of Class
#endinitclip
