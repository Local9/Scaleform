// Action script...

// [Initial MovieClip Action of sprite 36]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var menuList, currAngle, statsMaxDegrees, CONTENT;
    function SP_PLAYER_CARD()
    {
        super();
        menuList = new Array(com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.NUM_STAT_ITEMS);
        currAngle = 0;
        statsMaxDegrees = [180, 45, 45, 45, 45];
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        if (mc != undefined)
        {
            super.INITIALISE(mc);
        }
        else
        {
            CONTENT = this;
        } // end else if
        if (CONTENT.titleBGMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.titleBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        } // end if
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.headerBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.bodyBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.statWheelMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.statWheelMC.maskMC.arcMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
        var _loc6 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc6);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.statWheelMC.maskMC.bgFillMC, _loc6.r, _loc6.g, _loc6.b, com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.BG_FILL_ALPHA);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.statWheelMC.bgFillMC, _loc6.r, _loc6.g, _loc6.b, com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.BG_FILL_ALPHA);
        for (var _loc3 = 0; _loc3 < com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.NUM_STAT_ITEMS; ++_loc3)
        {
            var _loc5 = this.getMovieID();
            var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuSPCardItem)(CONTENT.attachMovie(_loc5, _loc5 + _loc3 + "MC", CONTENT.getNextHighestDepth()));
            _loc4._y = CONTENT.bodyBGMC._y + _loc4._height * _loc3;
            _loc4._visible = false;
            menuList[_loc3] = _loc4;
        } // end of for
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.pctTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        CONTENT.pctTF.textAutoSize = "shrink";
    } // End of the function
    function getMovieID()
    {
        return ("spPlayerCardStatItem");
    } // End of the function
    function SET_TITLE(titleStr, crewTagStr, hudColourEnum)
    {
        CONTENT.titleTF.text = titleStr;
        if (crewTagStr == "")
        {
            if (CONTENT.crewTagMC)
            {
                CONTENT.crewTagMC._visible = false;
            } // end if
        }
        else
        {
            if (!CONTENT.crewTagMC)
            {
                CONTENT.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", CONTENT.getNextHighestDepth(), {_y: 4, _xscale: 70, _yscale: 70});
            } // end if
            CONTENT.crewTagMC._visible = true;
            CONTENT.crewTagMC.UNPACK_CREW_TAG(crewTagStr);
            CONTENT.crewTagMC._x = CONTENT.titleTF._x + CONTENT.titleTF.textWidth + 10;
        } // end else if
        if (CONTENT.titleBGMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.titleBGMC, hudColourEnum);
        } // end if
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        if (_viewIndex == 0)
        {
            CONTENT.pctTF.text = arguments[2];
            var _loc6 = 3;
            if (arguments[_loc6])
            {
                for (var _loc3 = 0; _loc3 < _loc6 + com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.NUM_STAT_ITEMS; ++_loc3)
                {
                    var _loc4 = CONTENT["stat" + _loc3 + "TF"];
                    if (_loc4 != undefined)
                    {
                        var _loc5 = arguments[_loc6 + _loc3];
                        com.rockstargames.ui.utils.UIText.setSizedText(_loc4, _loc5, true);
                    } // end if
                } // end of for
            } // end if
        }
        else
        {
            if (_viewIndex == 1)
            {
                currAngle = 0;
                CONTENT.statWheelMC.maskMC.mask._rotation = 0;
            } // end if
            var _loc7 = menuList[_viewIndex - 1];
            _loc7.init(arguments);
            _loc7._visible = true;
            this.updateStatWheel(_viewIndex - 1, arguments[8], arguments[9]);
        } // end else if
    } // End of the function
    function updateStatWheel(index, pctComplete, statColourEnum)
    {
        var _loc2 = CONTENT.statWheelMC["statArc" + index + "MC"];
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2, statColourEnum);
        currAngle = currAngle + statsMaxDegrees[index] * pctComplete;
        _loc2._rotation = currAngle;
        if (currAngle > 360 - statsMaxDegrees[0])
        {
            CONTENT.statWheelMC.maskMC.mask._rotation = currAngle - statsMaxDegrees[0];
        } // end if
    } // End of the function
    function ON_FOCUS_PAGE_CONTENT(bFocused)
    {
        for (var _loc2 = 0; _loc2 < com.rockstargames.gtav.pauseMenu.pauseComponents.SP_PLAYER_CARD.NUM_STAT_ITEMS; ++_loc2)
        {
            var _loc3 = CONTENT.statWheelMC["statArc" + _loc2 + "MC"];
            _loc3._visible = bFocused;
        } // end of for
        CONTENT.statWheelMC.maskMC._visible = bFocused;
    } // End of the function
    function SET_DATA_SLOT_EMPTY()
    {
        currAngle = 0;
        CONTENT.statWheelMC.maskMC.mask._rotation = 0;
        for (var _loc2 = 0; _loc2 < menuList.length; ++_loc2)
        {
            menuList[_loc2]._visible = false;
        } // end of for
    } // End of the function
    static var NUM_STAT_ITEMS = 5;
    static var BG_FILL_ALPHA = 20;
} // End of Class
#endinitclip
