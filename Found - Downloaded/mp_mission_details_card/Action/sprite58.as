// Action script...

// [Initial MovieClip Action of sprite 58]
#initclip 19
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsTitleItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var itemTextLeft, __get__data, bgMC, labelMC, _highlighted, __set__data;
    function PauseMenuFreemodeDetailsTitleItem()
    {
        super();
        _global.gfxExtensions = true;
        itemTextLeft.textAutoSize = "shrink";
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        itemTextLeft.wordWrap = false;
        itemTextLeft.multiline = false;
        itemTextLeft.htmlText = this.__get__data()[0];
        if (itemTextLeft._width > 272)
        {
            itemTextLeft.textAutoSize = "shrink";
            itemTextLeft.autoSize = false;
            itemTextLeft._width = 272;
            itemTextLeft.htmlText = this.__get__data()[0];
        } // end if
        itemTextLeft._x = 144 - itemTextLeft._width * 0.500000;
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
