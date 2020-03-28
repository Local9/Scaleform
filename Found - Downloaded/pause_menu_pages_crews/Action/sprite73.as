// Action script...

// [Initial MovieClip Action of sprite 73]
#initclip 11
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREWS_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, statsList, containerMC, model, emblemImageMC, typeImageMC;
    function PAUSE_MENU_CREWS_CARD()
    {
        super();
        _global.gfxExtensions = true;
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
        var _loc5 = collapse ? ("playerComparisonItem") : ("statItem");
        statsList = [];
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.titleTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.infoMC.foundedTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.infoMC.statusTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.infoMC.membersTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.infoMC.descTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.infoMC.membersIconMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        containerMC = CONTENT.createEmptyMovieClip("containerMC", 0);
        containerMC._y = CONTENT.bgMC.listItemBGMC._y;
        if (CONTENT.bgMC)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        } // end if
        if (CONTENT.titleBGMC != undefined)
        {
            CONTENT.titleBGMC = com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.titleBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        } // end if
        if (CONTENT.titleColourBarMC == undefined)
        {
            CONTENT.titleColourBarMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(CONTENT.titleColourBarMC);
        } // end if
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewsCardModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, container: containerMC, visibleItems: 5, linkage: ["crewsCardItem"], viewMaskHeight: 430, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE, collapse: collapse});
        for (var _loc3 = 0; _loc3 < 2; ++_loc3)
        {
            var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem)(CONTENT.attachMovie(_loc5, _loc5 + _loc3 + "MC", CONTENT.getNextHighestDepth()));
            _loc4.bgMC._height = 52;
            statsList.push(_loc4);
        } // end of for
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW(viewIndex, itemIndex);
        var _loc5 = model.getCurrentView().dataList.length * 27 - 2;
        CONTENT.bgMC.listItemBGMC._height = _loc5;
        var _loc4 = CONTENT.bgMC.listItemBGMC._y + _loc5 + 2;
        for (var _loc3 = 0; _loc3 < 2; ++_loc3)
        {
            statsList[_loc3]._y = _loc4;
            _loc4 = _loc4 + 54;
        } // end of for
        CONTENT.bgMC.descBGMC._y = _loc4;
        CONTENT.infoMC.descTF._y = _loc4 + 6;
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        if (_slotIndex == -1)
        {
            model.addDataToView(0, currItemIndex, arguments);
            ++currItemIndex;
        }
        else
        {
            var _loc3 = statsList[_viewIndex];
            _loc3.init(arguments);
        } // end else if
    } // End of the function
    function SET_TITLE(titleStr)
    {
        com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.titleTF, titleStr, true);
        var _loc5 = arguments[1];
        emblemImageMC = this.loadCardTexture(emblemImageMC, "emblemImg", _loc5, _loc5, 6, 31, 70, 70);
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        if (arguments[2] != undefined)
        {
            _loc4.r = arguments[2];
            _loc4.g = arguments[3];
            _loc4.b = arguments[4];
            _loc4.a = 100;
        } // end if
        for (var _loc3 = 0; _loc3 < statsList.length; ++_loc3)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem)(statsList[_loc3]).setCustomColour(_loc4);
        } // end of for
        if (CONTENT.titleColourBarMC != undefined)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(CONTENT.titleColourBarMC).initCustom(_loc4);
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(CONTENT.titleColourBarMC).percent(0);
        } // end if
        com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.infoMC.foundedTF, arguments[5] ? (arguments[5]) : (""), true);
        com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.infoMC.statusTF, arguments[6] ? (arguments[6]) : (""), true);
        if (arguments[7] != undefined)
        {
            com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.infoMC.membersTF, arguments[7] ? (arguments[7]) : (""), false, true);
            var _loc9 = 6;
            CONTENT.infoMC.membersTF._x = 288 - CONTENT.infoMC.membersTF._width - _loc9;
            var _loc11 = CONTENT.infoMC.membersTF._x;
            var _loc6 = CONTENT.infoMC.membersTF._width;
            var _loc8 = CONTENT.infoMC.membersTF.textWidth;
            var _loc7 = CONTENT.infoMC.membersIconMC._width;
            var _loc10 = 5;
            CONTENT.infoMC.membersIconMC._x = _loc11 + _loc6 - _loc8 - _loc7 - _loc10;
        } // end if
        CONTENT.infoMC.crewTypeMC.gotoAndStop(arguments[8] ? (arguments[8]) : (1));
    } // End of the function
    function loadCardTexture(loaderMC, name, txd, txn, x, y, w, h)
    {
        if (txd == undefined || txn == undefined || txd == "" || txn == "")
        {
            if (loaderMC)
            {
                loaderMC.removeTxdRef();
            } // end if
        }
        else
        {
            if (loaderMC == undefined)
            {
                loaderMC = (com.rockstargames.ui.media.ImageLoaderMC)(CONTENT.infoMC.attachMovie("GenericImageLoader", name, CONTENT.infoMC.getNextHighestDepth(), {_x: x, _y: y}));
            } // end if
            if (loaderMC.textureDict == txd)
            {
                if (loaderMC.isLoaded)
                {
                    loaderMC.init("PAUSE_MENU_SP_CONTENT", txd, txn, w, h);
                    loaderMC.displayTxdResponse(txd);
                } // end if
            }
            else
            {
                if (loaderMC.isLoaded)
                {
                    loaderMC.removeTxdRef();
                } // end if
                loaderMC.init("PAUSE_MENU_SP_CONTENT", txd, txn, w, h);
                loaderMC.addTxdRefWithPath(String(loaderMC), 3);
            } // end else if
        } // end else if
        return (loaderMC);
    } // End of the function
    function ON_DESTROY()
    {
        if (emblemImageMC.isLoaded)
        {
            emblemImageMC.removeTxdRef();
        } // end if
        if (typeImageMC.isLoaded)
        {
            typeImageMC.removeTxdRef();
        } // end if
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        currItemIndex = 0;
    } // End of the function
    function SET_DESCRIPTION(descStr)
    {
        com.rockstargames.ui.utils.UIText.setDescText(CONTENT.infoMC.descTF, descStr);
        CONTENT.infoMC.crewTagMC.SET_CREW_TAG(arguments[3], arguments[4], arguments[5], arguments[6]);
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(38))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
        }
        else if (Key.isDown(40))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
        } // end else if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
        {
            model.prevItem();
        }
        else if (direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
        {
            model.nextItem();
        } // end else if
    } // End of the function
    var currItemIndex = 0;
} // End of Class
#endinitclip
