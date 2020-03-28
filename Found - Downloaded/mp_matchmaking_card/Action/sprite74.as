// Action script...

// [Initial MovieClip Action of sprite 74]
#initclip 19
class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, title, model;
    function MP_MATCHMAKING_CARD()
    {
        super();
        dbgID = "MP_MATCHMAKING_CARD";
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
            isStandalone = false;
        } // end else if
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
        title = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTitleItem)(CONTENT.attachMovie("mpMMCardTitle", "mpMMCardTitleMC", 0, {_x: 25, _y: 0, _visible: false}));
        com.rockstargames.ui.utils.Colour.Colourise(title.bgMC, _loc3.r, _loc3.g, _loc3.b, 64);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.descriptionMC.bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        CONTENT.descriptionMC._visible = false;
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_NORTH_BLUE, _loc4);
        com.rockstargames.ui.utils.Colour.Colourise(title.verifiedMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardModel();
        model.createView(0, {id: 0, x: 0, y: titleHeight, rowSpacing: 2, columnSpacing: 0, container: CONTENT, isStandalone: isStandalone, linkage: ["mpMMCardItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
    } // End of the function
    function SET_TITLE(str, verified)
    {
        var _loc2 = title.itemTextLeft;
        if (str == undefined || str == "")
        {
            _loc2.htmlText = "";
            title._visible = false;
            model.getCurrentView().viewContainer._y = 0;
        }
        else
        {
            title.__set__data([0, 0, 0, 0, 0, 0, str]);
            _loc2.textAutoSize = "shrink";
            _loc2.autoSize = false;
            _loc2._width = verified ? (255) : (270);
            title.verifiedMC._visible = verified;
            title.verifiedBGMC._visible = verified;
            title._visible = true;
            model.getCurrentView().viewContainer._y = titleHeight;
            if (verified && title.verifiedMC.verifiedTF)
            {
                var _loc4 = _loc2.textWidth >= com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_CARD.MAX_TITLE_WIDTH ? (com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_CARD.VERIFIED_CHAR_SHORT) : (com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_CARD.VERIFIED_CHAR_LONG);
                title.verifiedMC.verifiedTF.text = String.fromCharCode(_loc4);
                title.verifiedBGMC._width = title.verifiedMC.verifiedTF.textWidth + 1;
                title.verifiedBGMC._x = 288 - title.verifiedBGMC._width;
            } // end if
        } // end else if
    } // End of the function
    function COLLAPSE(collapse)
    {
        CONTENT._x = collapse ? (-25) : (0);
    } // End of the function
    function SET_ROW_SPACING(_rowSpacing)
    {
        model.getCurrentView().updateParams({rowSpacing: _rowSpacing});
    } // End of the function
    function SET_DESCRIPTION(cashStr, totalBetsStr, betsOnYouStr)
    {
        if (cashStr == "" || cashStr == undefined)
        {
            CONTENT.descriptionMC._visible = false;
        }
        else
        {
            CONTENT.descriptionMC._visible = true;
            var _loc2 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE, _loc2);
            var _loc3 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED, _loc3);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(CONTENT.descriptionMC.yourCashTF, "YOUR_CASH");
            CONTENT.descriptionMC.cashMC.itemTF.text = cashStr;
            CONTENT.descriptionMC.cashMC.bgMC._width = CONTENT.descriptionMC.cashMC.itemTF.textWidth + 10;
            CONTENT.descriptionMC.cashMC.bgMC._x = 145 - CONTENT.descriptionMC.cashMC.bgMC._width;
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.descriptionMC.cashMC.bgMC, _loc2.r, _loc2.g, _loc2.b, 30);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(CONTENT.descriptionMC.yourTotalTF, "TOTAL_PLACED");
            CONTENT.descriptionMC.totalBetsMC.itemTF.text = totalBetsStr;
            CONTENT.descriptionMC.totalBetsMC.bgMC._width = CONTENT.descriptionMC.totalBetsMC.itemTF.textWidth + 10;
            CONTENT.descriptionMC.totalBetsMC.bgMC._x = 145 - CONTENT.descriptionMC.totalBetsMC.bgMC._width;
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.descriptionMC.totalBetsMC.bgMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(CONTENT.descriptionMC.betsOnYouTF, "BETS_ON_YOU");
            CONTENT.descriptionMC.betsOnYouMC.itemTF.text = betsOnYouStr;
            CONTENT.descriptionMC.betsOnYouMC.bgMC._width = CONTENT.descriptionMC.betsOnYouMC.itemTF.textWidth + 10;
            CONTENT.descriptionMC.betsOnYouMC.bgMC._x = 145 - CONTENT.descriptionMC.betsOnYouMC.bgMC._width;
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.descriptionMC.betsOnYouMC.bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end else if
        currView.params = {};
        var currView = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardView)(model.getCurrentView());
        CONTENT.descriptionMC._y = model.getCurrentView().viewContainer._y + currView.dataList.length * 27;
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        if (viewIndex == undefined)
        {
            viewIndex = 0;
        } // end if
        super.DISPLAY_VIEW(viewIndex, itemIndex);
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        this.ON_DESTROY();
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        model.getCurrentView().topEdge = 0;
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        model.getCurrentView().__set__index(i);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
        {
            model.prevItem();
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
        {
            model.nextItem();
        } // end if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success == true)
        {
            var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(this.CONTENT + "." + uniqueID));
            il.displayTxdResponse(textureDict);
        } // end if
    } // End of the function
    function TXD_ALREADY_LOADED(textureDict, uniqueID)
    {
        var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(this.CONTENT + "." + uniqueID));
        il.displayTxdResponse(textureDict);
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        if (success == true)
        {
            var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(this.CONTENT + "." + uniqueID));
            il.displayTxdResponse(textureDict);
        } // end if
    } // End of the function
    function ON_DESTROY()
    {
        var _loc3 = model.getCurrentView().itemList;
        for (var _loc2 = 0; _loc2 < _loc3.length; ++_loc2)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem)(_loc3[_loc2]).ON_DESTROY();
        } // end of for
    } // End of the function
    static var MAX_TITLE_WIDTH = 189;
    static var VERIFIED_CHAR_SHORT = 247;
    static var VERIFIED_CHAR_LONG = 166;
    var titleHeight = 27;
    var isStandalone = true;
} // End of Class
#endinitclip
