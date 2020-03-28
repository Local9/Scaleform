// Action script...

// [Initial MovieClip Action of sprite 69]
#initclip 7
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRankItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextLeft, itemTextRight, _data, __get__data, xpLabelMC, bgMC, _highlighted, __set__highlighted, type, __get__highlighted, __set__data;
    function PauseMenuCrewRankItem()
    {
        super();
        _global.gfxExtensions = true;
        itemTextLeft = labelMC.rankTF;
        itemTextRight = labelMC.xpTF;
        itemTextRight.textAutoSize = "shrink";
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        itemTextLeft.text = _data[0];
        itemTextLeft.autoSize = "right";
        itemTextRight.text = this.__get__data()[2];
        xpLabelMC._visible = labelMC._visible = itemTextLeft.text != "" || itemTextRight.text != "";
        this.snapBGGrid(bgMC);
        this.__set__highlighted(_highlighted);
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        super.__set__highlighted(_h);
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(_h ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK), _loc4);
        com.rockstargames.ui.utils.Colour.Colourise(xpLabelMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        if (bgMC)
        {
            var _loc3 = new com.rockstargames.ui.utils.HudColour();
            if (_h)
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            } // end else if
            if (type == 3)
            {
                _loc3.a = 20;
            } // end if
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        //return (this.highlighted());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        bgMC._width = 290;
        bgMC._x = -2;
    } // End of the function
} // End of Class
#endinitclip
