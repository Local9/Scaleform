// Action script...

// [Initial MovieClip Action of sprite 35]
#initclip 2
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsTitleItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var __get__data, itemTextLeft, bgMC, labelMC, _highlighted, __set__data;
    function PauseMenuFreemodeDetailsTitleItem()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        com.rockstargames.ui.utils.UIText.setSizedText(itemTextLeft, this.__get__data()[0], true);
        this.snapBGGrid(bgMC);
        //return (this.data());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        var _loc2 = Math.ceil(itemTextLeft.textHeight / 27);
        bgMC._height = _loc2 * 27 - 2;
    } // End of the function
    function highlightTitle(_h)
    {
        if (_h)
        {
            bgMC._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        }
        else
        {
            bgMC._visible = false;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        } // end else if
        _highlighted = _h;
    } // End of the function
} // End of Class
#endinitclip
