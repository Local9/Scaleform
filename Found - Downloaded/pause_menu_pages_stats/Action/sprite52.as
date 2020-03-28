// Action script...

// [Initial MovieClip Action of sprite 52]
#initclip 9
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextRight, __set__highlighted, barMC, bar, index, bgMC, type, __get__data, _highlighted, itemTextLeft, __get__highlighted, __set__data;
    function PauseMenuStatsListItem()
    {
        super();
        itemTextRight = labelMC.valueTF;
        this.__set__highlighted(false);
        bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(barMC);
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc3);
        if (index % 2 == 1)
        {
            bgA = 20;
        }
        else
        {
            bgA = 0;
        } // end else if
        com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, bgA);
        switch (type)
        {
            case 0:
            {
                if (this.__get__data()[1] != undefined && this.__get__data()[1] != "")
                {
                    com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, this.__get__data()[1]);
                } // end if
                barMC._visible = false;
                break;
            } 
            case 1:
            {
                var _loc4 = this.__get__data()[2];
                if (_loc4 == undefined)
                {
                    _loc4 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
                } // end if
                bar.init(_loc4, 158);
                if (this.__get__data()[1] != undefined && this.__get__data()[1] != "")
                {
                    var _loc5 = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(this.__get__data()[1], 30, 2, 5);
                    bar.percent(_loc5, false);
                } // end if
                barMC._visible = true;
                break;
            } 
        } // End of switch
        com.rockstargames.ui.utils.Colour.ApplyHudColour(labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        this.__set__highlighted(_highlighted);
        //return (this.data());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        var _loc2 = Math.ceil(itemTextLeft.textHeight / 27);
        bgMC._height = _loc2 * 27 - 2;
    } // End of the function
    function set highlighted(_h)
    {
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc4 = 100;
        if (_h)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc2);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            _loc4 = bgA;
        } // end else if
        if (bgMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc4);
        } // end if
        if (labelMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        } // end if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var bgA = 100;
} // End of Class
#endinitclip
