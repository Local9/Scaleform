// Action script...

// [Initial MovieClip Action of sprite 73]
#initclip 11
class com.rockstargames.gtav.minigames.tennis.PlayerCard extends MovieClip
{
    var tennisColor, whiteColor, blackColor, blackBGColor, titleCellsMC, getNextHighestDepth, createEmptyMovieClip, p0, p1;
    function PlayerCard()
    {
        super();
        tennisColor = new com.rockstargames.ui.utils.HudColour();
        whiteColor = new com.rockstargames.ui.utils.HudColour();
        blackColor = new com.rockstargames.ui.utils.HudColour();
        blackBGColor = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TENNIS, tennisColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, whiteColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, blackColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG, blackBGColor);
        var _loc4;
        for (var _loc3 = 0; _loc3 < 2; ++_loc3)
        {
            _loc4 = this["p" + _loc3];
            com.rockstargames.ui.utils.Colour.Colourise(_loc4.nameMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc4.currentPlayerMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc4.bgMC, blackBGColor.r, blackBGColor.g, blackBGColor.b, blackBGColor.a);
        } // end of for
    } // End of the function
    function SET_PLAYERCARD_TITLE(column0)
    {
        if (maxCellCount < arguments.length)
        {
            maxCellCount = arguments.length - 1;
        } // end if
        if (titleCellsMC == undefined)
        {
            titleCellsMC = this.createEmptyMovieClip("titleCellsMC", this.getNextHighestDepth());
        } // end if
        titleCellsMC._y = 54;
        var _loc3;
        var _loc6 = arguments.length;
        var _loc5;
        for (var _loc4 = maxCellCount > _loc6 ? (maxCellCount) : (_loc6); _loc4 >= 0; --_loc4)
        {
            _loc3 = titleCellsMC["c" + _loc4];
            if (_loc4 < _loc6)
            {
                if (_loc3 == undefined)
                {
                    _loc3 = titleCellsMC.attachMovie("PlayerCardTitleCell", "c" + _loc4, titleCellsMC.getNextHighestDepth(), {_x: _loc4 * 37});
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.bgMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.labelMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
                } // end if
                _loc5 = arguments[_loc4];
                if (_loc5 != undefined || _loc5 != "")
                {
                    _loc3._visible = true;
                    _loc3.labelMC.labelTF.text = _loc5;
                }
                else
                {
                    _loc3._visible = false;
                } // end else if
                continue;
            } // end if
            if (_loc3 != undefined)
            {
                _loc3.removeMovieClip();
            } // end if
        } // end of for
        maxCellCount = _loc6;
        this.updatePlayerCardDisplay();
    } // End of the function
    function SET_PLAYERCARD_SLOT(id, isMP, name, crewTag, isSelected, txd, txn, column0)
    {
        var _loc5 = this["p" + id];
        var _loc11 = _loc5.nameMC;
        var _loc14 = isMP ? (_loc11.MPNameTF) : (_loc11.nameTF);
        _loc11.nameTF._visible = !isMP;
        _loc11.MPNameTF._visible = isMP;
        _loc11.MPNameTF._width = 5;
        _loc11.nameTF._width = 5;
        _loc14.autoSize = "left";
        _loc14.text = name;
        var _loc12 = _loc5.crewTagMC;
        if (crewTag != "" && crewTag != undefined)
        {
            if (_loc12 == undefined)
            {
                _loc12 = (com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP)(_loc5.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", _loc5.getNextHighestDepth(), {_x: _loc5.nameMC._x + _loc5.nameMC._width + 6, _y: 3.500000, _xscale: 80, _yscale: 80}));
            } // end if
            _loc12.UNPACK_CREW_TAG(crewTag);
        }
        else
        {
            _loc12.removeMovieClip();
            false;
        } // end else if
        if (isSelected)
        {
            _loc5.currentPlayerMC._visible = true;
            _loc5.ballMC._visible = true;
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.ballMC, 248, 242, 24, 100);
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.nameMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.headsetMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.bgMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.currentPlayerMC, tennisColor.r, tennisColor.g, tennisColor.b, tennisColor.a);
        }
        else
        {
            _loc5.currentPlayerMC._visible = false;
            _loc5.ballMC._visible = false;
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.nameMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.headsetMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.bgMC, blackBGColor.r, blackBGColor.g, blackBGColor.b, blackBGColor.a);
        } // end else if
        var _loc10 = _loc5.imgLdr;
        if (_loc10 == undefined)
        {
            _loc10 = (com.rockstargames.ui.media.ImageLoaderMC)(_loc5.attachMovie("GenericImageLoader", "imgLdr", _loc5.getNextHighestDepth(), {}));
            _loc5.outlineMC.swapDepth(_loc5.getNextHighestDepth());
        } // end if
        if (_loc10.textureDict != txd && _loc10.textureFilename != txn)
        {
            if (_loc10.isLoaded)
            {
                _loc10.removeTxdRef();
            } // end if
            _loc10.init("TENNIS", txd, txn, 25, 25);
            _loc10.addTxdRef(String(_loc10));
        } // end if
        var _loc7 = _loc5.cellContainer;
        if (_loc7 == undefined)
        {
            _loc7 = _loc5.createEmptyMovieClip("cellContainer", _loc5.getNextHighestDepth());
        } // end if
        _loc7._x = 288;
        var _loc3;
        var _loc8 = arguments.length - 7;
        for (var _loc4 = maxCellCount > _loc8 ? (maxCellCount) : (_loc8); _loc4 >= 0; --_loc4)
        {
            _loc3 = _loc7["c" + _loc4];
            if (_loc4 < maxCellCount)
            {
                if (_loc3 == undefined)
                {
                    _loc3 = _loc7.attachMovie("PlayerCardCell", "c" + _loc4, _loc7.getNextHighestDepth(), {_x: _loc4 * 37});
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.bgMC, tennisColor.r, tennisColor.g, tennisColor.b, tennisColor.a);
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.blackBGMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.labelMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
                } // end if
                if (isSelected)
                {
                    _loc3.bgMC._alpha = 100;
                    _loc3.blackBGMC._visible = false;
                }
                else
                {
                    _loc3.bgMC._alpha = 50;
                    _loc3.blackBGMC._visible = true;
                } // end else if
                var _loc6 = arguments[_loc4 + 7];
                _loc3.labelMC.labelTF.text = _loc6 != undefined ? (_loc6) : ("");
                continue;
            } // end if
            if (_loc3 != undefined)
            {
                _loc3.removeMovieClip();
            } // end if
        } // end of for
        this.updatePlayerCardDisplay();
    } // End of the function
    function SET_PLAYERCARD_HEADSET(id, headsetEnum)
    {
        var _loc2 = this["p" + id];
        _loc2.headsetMC.gotoAndStop(headsetEnum + 1);
    } // End of the function
    function updatePlayerCardDisplay()
    {
        var _loc2;
        if (p0.nameMC.nameTF._visible || p0.nameMC.nameTF._visible)
        {
            maxPlayerCardNameWidth = Math.ceil(p0.nameMC._width > p1.nameMC._width ? (p0.nameMC._width) : (p1.nameMC._width));
            p0.bgMC._width = p1.bgMC._width = maxPlayerCardNameWidth + 25 + 45;
        }
        else
        {
            p0.bgMC._width = p1.bgMC._width = 288;
        } // end else if
        p0.ballMC._x = p1.ballMC._x = p0.bgMC._width - 11;
        p0.cellContainer._x = p1.cellContainer._x = p0.bgMC._width;
        p0.currentPlayerMC._x = p1.currentPlayerMC._x = p0.cellContainer._x + p0.cellContainer._width;
        titleCellsMC._x = p0.bgMC._width;
    } // End of the function
    function ADD_TXD_REF_RESPONSE(txd, strRef, success)
    {
        var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(strRef));
        il.displayTxdResponse(txd);
    } // End of the function
    var maxCellCount = 0;
    var maxPlayerCardNameWidth = 0;
} // End of Class
#endinitclip
