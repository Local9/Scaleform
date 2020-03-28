// Action script...

// [Initial MovieClip Action of sprite 63]
#initclip 10
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem extends com.rockstargames.ui.components.GUIMenuItem
{
    var labelMC, itemTextLeft, _highlighted, __set__highlighted, _data, __get__data, bgMC, __get__highlighted, __set__data;
    function PauseMenuBaseItem()
    {
        super();
        itemTextLeft = labelMC.titleTF;
        this.__set__highlighted(_highlighted);
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
        if (_data[0] != undefined)
        {
            itemTextLeft.htmlText = _data[0];
            itemTextLeft.autoSize = true;
        } // end if
        //return (this.data());
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
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc2);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
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
    function snapBGGrid(bgMC)
    {
        var _loc2 = Math.ceil(itemTextLeft.textHeight / 27);
        bgMC._height = _loc2 * 27;
    } // End of the function
    function stepVal(dir)
    {
    } // End of the function
    function setPref(val)
    {
        if (uniqueID >= 0 && uniqueID < menuPrefOffset)
        {
            com.rockstargames.ui.game.GameInterface.call("SET_PAUSE_MENU_PREF", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, uniqueID, val);
        } // end if
    } // End of the function
    var index = 0;
    var type = 0;
    var menuID = 0;
    var uniqueID = 0;
    var initialIndex = 0;
    var selectedIndex = 0;
    var isAdjustable = false;
    var isSelectable = 1;
    var itemHeight = 25;
    var menuPrefOffset = 1000;
} // End of Class
#endinitclip
