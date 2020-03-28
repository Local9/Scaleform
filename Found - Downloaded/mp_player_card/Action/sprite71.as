// Action script...

// [Initial MovieClip Action of sprite 71]
#initclip 18
class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_PLAYER_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, menuList, statID, playerColourEnum, crewEmblemMC, btnLayer;
    function MP_PLAYER_CARD()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function DISPLAY_VIEW()
    {
    } // End of the function
    function INITIALISE(mc, collapse)
    {
        if (mc != undefined)
        {
            super.INITIALISE(mc);
        }
        else
        {
            CONTENT = this;
        } // end else if
        menuList = [];
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.headerBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.item0TF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.item1TF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.item2TF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.vehiclePanelMC.titleTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.vehiclePanelMC.vehicleMC1, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.vehiclePanelMC.vehicleMC2, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.vehiclePanelMC.vehicleMC3, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.vehiclePanelMC.vehicleMC4, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.vehiclePanelMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.crewInfoMC.crewNameTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.crewInfoMC.rankNameTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.crewInfoMC.membersIconMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.crewInfoMC.membersTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        if (collapse)
        {
            statID = "playerComparisonItem";
        }
        else
        {
            statID = "statItem";
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(CONTENT.vehiclePanelMC.titleTF, "VEH_ACCESS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, false);
        } // end else if
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.descMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        CONTENT.descMC._visible = false;
        CONTENT.rankNumTF.textAutoSize = "shrink";
        CONTENT.crewInfoMC.crewNameTF.textAutoSize = "shrink";
        CONTENT.crewInfoMC.rankNameTF.textAutoSize = "shrink";
        CONTENT.crewInfoMC.crewRankTF.textAutoSize = "shrink";
        CONTENT.crewInfoMC._visible = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.crewInfoMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
    } // End of the function
    function SET_TITLE(title)
    {
        CONTENT.titleTF.text = title;
        playerColourEnum = arguments[2];
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.titleBGMC, playerColourEnum);
        if (arguments[1] == "" || arguments[1] == undefined)
        {
            CONTENT.crewInfoMC._visible = false;
            CONTENT.crewTagMC._visible = false;
        }
        else
        {
            CONTENT.crewTagMC.UNPACK_CREW_TAG(arguments[5]);
            CONTENT.crewTagMC._x = CONTENT.titleTF._x + CONTENT.titleTF.textWidth + 10;
            CONTENT.crewTagMC._visible = true;
            CONTENT.crewInfoMC.crewTagMC.UNPACK_CREW_TAG(arguments[5]);
            var _loc5 = arguments[6];
            var _loc3 = arguments[7];
            if (_loc5 && _loc3)
            {
                CONTENT.crewInfoMC.crewNameTF.text = arguments[1];
                CONTENT.crewInfoMC.rankNameTF.text = arguments[4];
                CONTENT.crewInfoMC.crewRankTF.text = arguments[8] != undefined ? (arguments[8]) : ("");
                if (!crewEmblemMC)
                {
                    crewEmblemMC = CONTENT.crewInfoMC.attachMovie("GenericImageLoader", "playerCardCrewEmblemMC", CONTENT.crewInfoMC.getNextHighestDepth(), {_x: 10, _y: 9});
                } // end if
                if (crewEmblemMC.isLoaded)
                {
                    crewEmblemMC.removeTxdRef();
                } // end if
                crewEmblemMC.init("PAUSE_MENU_SP_CONTENT", _loc5, _loc3, 61, 61);
                var _loc7 = 3;
                var _loc4 = String(crewEmblemMC).split(".");
                var _loc8 = _loc4.slice(_loc4.length - _loc7).join(".");
                crewEmblemMC.addTxdRef(_loc8);
                if (arguments[9] != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(CONTENT.crewInfoMC.rankBGMC, arguments[9], arguments[10], arguments[11], 100);
                    CONTENT.crewInfoMC._visible = true;
                } // end if
                CONTENT.crewInfoMC.membersTF.text = arguments[12] ? (arguments[12]) : ("");
                CONTENT.crewInfoMC.membersIconMC._x = 267 - CONTENT.crewInfoMC.membersTF.textWidth;
            } // end if
        } // end else if
        var _loc6 = com.rockstargames.gtav.constants.MPIconLabels.lookUp(arguments[3])[1];
        CONTENT.rankEmblemMC.gotoAndStop(_loc6);
        CONTENT.titleValTF.text = arguments[13] ? (arguments[13]) : ("");
        if (CONTENT.crewInfoMC._visible)
        {
            CONTENT.descMC._visible = false;
        } // end if
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        if (_viewIndex == 0)
        {
            CONTENT.vehiclePanelMC.vehicleMC1._alpha = arguments[5] ? (100) : (30);
            CONTENT.vehiclePanelMC.vehicleMC2._alpha = arguments[6] ? (100) : (30);
            CONTENT.vehiclePanelMC.vehicleMC3._alpha = arguments[7] ? (100) : (30);
            CONTENT.vehiclePanelMC.vehicleMC4._alpha = arguments[8] ? (100) : (30);
            var _loc11 = arguments[9];
            CONTENT.rankNumTF.text = _loc11;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.rankEmblemMC, playerColourEnum);
            var _loc9 = arguments.length;
            var _loc3 = 10;
            for (var _loc4 = 0; _loc3 < _loc9; ++_loc4)
            {
                var _loc5 = CONTENT["item" + _loc4 + "TF"];
                _loc5.text = arguments[_loc3] != undefined ? (arguments[_loc3]) : ("");
                var _loc6 = arguments[_loc3 + 1];
                var _loc7 = CONTENT["icon" + _loc4 + "MC"];
                _loc7.gotoAndStop(com.rockstargames.gtav.constants.MPIconLabels.lookUp(_loc6)[1]);
                if (_loc6 != com.rockstargames.gtav.constants.MPIconLabels.EMPTY[0])
                {
                    _loc5._x = 82;
                    com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc7, arguments[_loc3 + 2]);
                } // end if
                _loc3 = _loc3 + 3;
            } // end of for
        }
        else
        {
            var _loc10 = _viewIndex - 1;
            var _loc8;
            if (!menuList[_loc10])
            {
                _loc8 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem)(CONTENT.attachMovie(statID, statID + _loc10 + "MC", _loc10));
                _loc8._y = CONTENT.headerBGMC._y + CONTENT.headerBGMC._height + 2 + _loc10 * Math.round(_loc8._height);
                menuList[_loc10] = _loc8;
            }
            else
            {
                _loc8 = menuList[_loc10];
            } // end else if
            _loc8._visible = true;
            _loc8.setColour(playerColourEnum);
            _loc8.init(arguments);
            CONTENT.vehiclePanelMC._y = _loc8._y + Math.round(_loc8._height);
            CONTENT.crewInfoMC._y = CONTENT.vehiclePanelMC._y + CONTENT.vehiclePanelMC._height + 2;
            CONTENT.descMC._y = CONTENT.crewInfoMC._y;
        } // end else if
    } // End of the function
    function SET_DESCRIPTION(descStr, descType, crewTagStr)
    {
        if (descStr != "")
        {
            if (btnLayer)
            {
                btnLayer.removeMovieClip();
            } // end if
            btnLayer = CONTENT.descMC.createEmptyMovieClip("btnLayer", 1000);
            var _loc3 = new com.rockstargames.ui.utils.Text();
            _loc3.setTextWithIcons(descStr, btnLayer, CONTENT.descMC.descTF, 0, 13, 4, false);
            CONTENT.descMC.crewUpIconMC._visible = descType == DESC_TYPE_SC;
            CONTENT.descMC.crewTagMC._visible = descType == DESC_TYPE_INV_SENT;
            if (descType == DESC_TYPE_TXT)
            {
                CONTENT.descMC.descTF._x = 5;
                CONTENT.descMC.descTF._width = 278;
            }
            else
            {
                CONTENT.descMC.descTF._x = 54;
                CONTENT.descMC.descTF._width = 225;
                if (descType == DESC_TYPE_INV_SENT)
                {
                    CONTENT.descMC.crewTagMC.UNPACK_CREW_TAG(crewTagStr);
                } // end if
            } // end else if
            CONTENT.descMC.bgMC._height = Math.min(CONTENT.descMC.descTF._y + CONTENT.descMC.descTF.textHeight + 10, 79);
            CONTENT.descMC._visible = !CONTENT.crewInfoMC._visible;
        }
        else
        {
            CONTENT.descMC._visible = false;
        } // end else if
    } // End of the function
    function SET_DATA_SLOT_EMPTY()
    {
        for (var _loc2 = 0; _loc2 < menuList.length; ++_loc2)
        {
            (MovieClip)(menuList[_loc2]).removeMovieClip();
            menuList[_loc2] = null;
        } // end of for
        if (CONTENT.descMC)
        {
            CONTENT.descMC._visible = false;
        } // end if
        CONTENT.crewInfoMC._visible = false;
    } // End of the function
    var DESC_TYPE_TXT = 0;
    var DESC_TYPE_SC = 1;
    var DESC_TYPE_INV_SENT = 2;
} // End of Class
#endinitclip
