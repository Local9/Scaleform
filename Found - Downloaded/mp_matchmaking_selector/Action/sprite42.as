// Action script...

// [Initial MovieClip Action of sprite 42]
#initclip 2
class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_SELECTOR extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, betSelectorMC, carSelectorMC, gamerInfoMC, currSelectorMC;
    function MP_MATCHMAKING_SELECTOR()
    {
        super();
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
        betSelectorMC = CONTENT.betSelectorMC;
        carSelectorMC = CONTENT.carSelectorMC;
        carSelectorMC.innerMC.nameTF.textAutoSize = "shrink";
        gamerInfoMC = CONTENT.gamerInfoMC;
        betSelectorMC._visible = false;
        carSelectorMC._visible = false;
        gamerInfoMC._visible = false;
    } // End of the function
    function SHOW_GAMER_INFO(colIndex, name, crewName, crewTagStr, txd, txn)
    {
        gamerInfoMC._visible = true;
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(colIndex, _loc2);
        com.rockstargames.ui.utils.Colour.Colourise(gamerInfoMC.nameTF, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        gamerInfoMC.nameTF.text = name;
        gamerInfoMC.crewNameTF.htmlText = crewName;
        if (txd != undefined && txn != undefined)
        {
            if (gamerInfoMC.crewEmblem == undefined)
            {
                gamerInfoMC.crewEmblem = gamerInfoMC.attachMovie("crewEmblem", "crewEmblemMC", gamerInfoMC.getNextHighestDepth(), {_x: 7, _y: 7});
            } // end if
            if (gamerInfoMC.crewEmblem.isLoaded)
            {
                gamerInfoMC.crewEmblem.removeTxdRef();
            } // end if
            gamerInfoMC.crewEmblem.init("mp_matchmaking_selector", txd, txn, 64, 64);
            gamerInfoMC.crewEmblem.addTxdRef("");
        }
        else if (gamerInfoMC.crewEmblem.isLoaded)
        {
            gamerInfoMC.crewEmblem.removeTxdRef();
        } // end else if
        if (crewTagStr == "" || crewTagStr == undefined)
        {
            gamerInfoMC.crewTag._visible = false;
        }
        else
        {
            gamerInfoMC.crewTag.UNPACK_CREW_TAG(crewTagStr);
            gamerInfoMC.crewTag._x = gamerInfoMC.nameTF._x + gamerInfoMC.nameTF.textWidth + 10;
            gamerInfoMC.crewTag._visible = true;
        } // end else if
    } // End of the function
    function SHOW_CENTER_CONTENT(show)
    {
        currSelectorMC.innerMC._visible = show;
    } // End of the function
    function SHOW_BOTTOM_SELECTOR(show)
    {
        currSelectorMC.innerMC.lowerSelectorMC._visible = show;
    } // End of the function
    function SHOW_LEFT_ARROW(show)
    {
        currSelectorMC.arrowLeftMC._visible = show;
    } // End of the function
    function SHOW_RIGHT_ARROW(show)
    {
        currSelectorMC.arrowRightMC._visible = show;
    } // End of the function
    function SHOW_UP_DOWN_ARROWS(show)
    {
        currSelectorMC.innerMC.lowerSelectorMC.upArrowMC._visible = show;
        currSelectorMC.innerMC.lowerSelectorMC.downArrowMC._visible = show;
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID)
    {
        gamerInfoMC.crewEmblem.displayTxdResponse(textureDict);
    } // End of the function
    function SHOW_BET_SELECTOR(betsOnVal, oddsVal, myBetVal)
    {
        betSelectorMC._visible = true;
        carSelectorMC._visible = false;
        currSelectorMC = betSelectorMC;
        this.SHOW_CENTER_CONTENT(true);
        this.SHOW_LEFT_ARROW(true);
        this.SHOW_RIGHT_ARROW(true);
        this.LOCK_BETTING(false);
        betSelectorMC.innerMC.betsOnThisPlayerValTF.text = betsOnVal;
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(betSelectorMC.innerMC.betsOnThisPlayerTF, "BETS_ON_THIS_PLAYER");
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(betSelectorMC.innerMC.betsOnThisPlayerValBGMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        var _loc4 = betSelectorMC.innerMC.betsOnThisPlayerValTF.textWidth + 20;
        betSelectorMC.innerMC.betsOnThisPlayerValBGMC._width = _loc4;
        betSelectorMC.innerMC.betsOnThisPlayerValBGMC._x = 640 - _loc4 / 2;
        betSelectorMC.innerMC.oddsValTF.text = oddsVal;
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(betSelectorMC.innerMC.oddsTF, "ODDS");
        betSelectorMC.innerMC.myBetValTF.text = myBetVal;
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(betSelectorMC.innerMC.myBetTF, "MY_BET");
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE, _loc2);
        com.rockstargames.ui.utils.Colour.Colourise(betSelectorMC.innerMC.myBetValBGMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        _loc4 = betSelectorMC.innerMC.myBetValTF.textWidth + 30;
        betSelectorMC.innerMC.myBetValBGMC._width = _loc4;
        betSelectorMC.innerMC.myBetValBGMC._x = 640 - _loc4 / 2;
    } // End of the function
    function SET_BETS_ON_PLAYER(val)
    {
        betSelectorMC.innerMC.betsOnThisPlayerValTF.text = val;
        var _loc2 = betSelectorMC.innerMC.betsOnThisPlayerValTF.textWidth + 20;
        betSelectorMC.innerMC.betsOnThisPlayerValBGMC._width = _loc2;
        betSelectorMC.innerMC.betsOnThisPlayerValBGMC._x = 640 - _loc2 / 2;
    } // End of the function
    function LOCK_BETTING(locked)
    {
        betSelectorMC.innerMC.noBetsTF._visible = locked;
        betSelectorMC.innerMC.noBetsBGMC._visible = locked;
        if (locked)
        {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(betSelectorMC.innerMC.noBetsTF, "BETS_LOCKED");
        } // end if
        this.SHOW_UP_DOWN_ARROWS(!locked);
    } // End of the function
    function SET_ODDS(val)
    {
        betSelectorMC.innerMC.oddsValTF.text = val;
    } // End of the function
    function SET_MY_BET(val)
    {
        betSelectorMC.innerMC.myBetValTF.text = val;
        var _loc2 = betSelectorMC.innerMC.myBetValTF.textWidth + 30;
        betSelectorMC.innerMC.myBetValBGMC._width = _loc2;
        betSelectorMC.innerMC.myBetValBGMC._x = 640 - _loc2 / 2;
    } // End of the function
    function SHOW_VEHICLE_SELECTOR(name, type, colour, colourType)
    {
        betSelectorMC._visible = false;
        carSelectorMC._visible = true;
        currSelectorMC = carSelectorMC;
        this.SHOW_CENTER_CONTENT(true);
        this.SHOW_LEFT_ARROW(true);
        this.SHOW_RIGHT_ARROW(true);
        this.SHOW_UP_DOWN_ARROWS(true);
        this.SHOW_BOTTOM_SELECTOR(true);
        this.SET_VEHICLE_NAME(name);
        carSelectorMC.innerMC.typeTF.text = type;
        carSelectorMC.innerMC.lowerSelectorMC.colourTF.text = colour;
        carSelectorMC.innerMC.lowerSelectorMC.colourTypeTF.text = colourType;
    } // End of the function
    function SHOW_QUESTION_MARK(show)
    {
        carSelectorMC.innerMC.questionMarkTF._visible = show;
    } // End of the function
    function SET_VEHICLE_NAME(name)
    {
        carSelectorMC.innerMC.nameTF.text = name;
    } // End of the function
    function SET_VEHICLE_TYPE(type)
    {
        carSelectorMC.innerMC.typeTF.text = type;
    } // End of the function
    function SET_COLOUR(colour)
    {
        carSelectorMC.innerMC.lowerSelectorMC.colourTF.text = colour;
    } // End of the function
    function SET_COLOUR_TYPE(colourType)
    {
        carSelectorMC.innerMC.lowerSelectorMC.colourTypeTF.text = colourType;
    } // End of the function
} // End of Class
#endinitclip
