// Action script...

// [Initial MovieClip Action of sprite 68]
#initclip 6
class com.rockstargames.gtav.minigames.tennis.Scoreboard extends MovieClip
{
    var tennisColor, whiteColor, blackColor, bgColor, logoMC, titleCellsMC, titleTF, highlightedCells, bgMC, p0, p1, getNextHighestDepth;
    function Scoreboard()
    {
        super();
        _global.gfxExtensions = true;
        tennisColor = new com.rockstargames.ui.utils.HudColour();
        whiteColor = new com.rockstargames.ui.utils.HudColour();
        blackColor = new com.rockstargames.ui.utils.HudColour();
        bgColor = new com.rockstargames.ui.utils.HudColour();
        var _loc6 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TENNIS, tennisColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, whiteColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, blackColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG, bgColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW, _loc6);
        com.rockstargames.ui.utils.Colour.Colourise(logoMC, tennisColor.r, tennisColor.g, tennisColor.b, tennisColor.a);
        com.rockstargames.ui.utils.Colour.Colourise(titleCellsMC.ruleMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
        var _loc5;
        for (var _loc4 = 0; _loc4 < 2; ++_loc4)
        {
            _loc5 = this["p" + _loc4];
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.nameMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.bgMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
        } // end of for
    } // End of the function
    function SET_SCOREBOARD_TITLE(title, column0)
    {
        titleTF.text = title;
        highlightedCells = [];
        curCellCount = arguments.length - 1;
        if (maxCellCount < curCellCount)
        {
            maxCellCount = curCellCount;
        } // end if
        var _loc3;
        var _loc5;
        for (var _loc4 = 0; _loc4 < maxCellCount; ++_loc4)
        {
            _loc3 = titleCellsMC["c" + _loc4];
            if (_loc4 < curCellCount)
            {
                if (_loc3 == undefined)
                {
                    _loc3 = titleCellsMC.attachMovie("ScoreboardCell", "c" + _loc4, titleCellsMC.getNextHighestDepth(), {_x: _loc4 * 55});
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.bgMC, tennisColor.r, tennisColor.g, tennisColor.b, tennisColor.a);
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.labelMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
                    titleCellsMC.ruleMC.swapDepths(_loc3);
                } // end if
                _loc5 = arguments[_loc4 + 1];
                if (_loc5 != undefined && _loc5 != "")
                {
                    if (isNaN(Number(_loc5)))
                    {
                        var _loc6 = new TextFormat();
                        _loc6.size = 12;
                        _loc3.labelMC.labelTF.setNewTextFormat(_loc6);
                        _loc3.labelMC.labelTF._y = 5;
                        highlightedCells.push(_loc4);
                    } // end if
                    _loc3._visible = true;
                    _loc3.labelMC.labelTF.textAutoSize = "shrink";
                    _loc3.labelMC.labelTF.text = _loc5;
                }
                else
                {
                    _loc3._visible = false;
                } // end else if
                continue;
            } // end if
            _loc3.removeMovieClip();
        } // end of for
        titleCellsMC.ruleMC._width = curCellCount * 55;
        bgMC._width = titleCellsMC._x + titleCellsMC._width;
        logoMC._x = bgMC._width - logoMC._width - 8;
        p0.bgMC._width = p1.bgMC._width = bgMC._width;
    } // End of the function
    function SET_SCOREBOARD_SLOT(id, isMP, name, crewTag, isSelected, column0)
    {
        var _loc8 = this["p" + id];
        var _loc9 = _loc8.nameMC;
        var _loc12 = isMP ? (_loc9.MPnameTF) : (_loc9.nameTF);
        _loc9.nameTF._visible = !isMP;
        _loc9.MPnameTF._visible = isMP;
        _loc12._width = 20;
        _loc12.autoSize = true;
        _loc12.text = name;
        var _loc10 = _loc8.crewTagMC;
        if (crewTag != "" && crewTag != undefined)
        {
            if (_loc10 == undefined)
            {
                _loc10 = (com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP)(_loc8.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", this.getNextHighestDepth(), {_x: _loc9._x + _loc12._width + 5, _y: 4, _xscale: 80, _yscale: 80}));
            } // end if
            _loc10.UNPACK_CREW_TAG(crewTag);
        }
        else
        {
            _loc10.removeMovieClip();
            false;
        } // end else if
        if (isSelected)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc8.nameMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc8.bgMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc8.nameMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc8.bgMC, bgColor.r, bgColor.g, bgColor.b, 50);
        } // end else if
        var _loc6 = _loc8.cellsMC;
        _loc6.ruleMC._visible = false;
        var _loc3;
        for (var _loc4 = 0; _loc4 < maxCellCount; ++_loc4)
        {
            _loc3 = _loc6["c" + _loc4];
            if (_loc4 < curCellCount)
            {
                if (_loc3 == undefined)
                {
                    _loc3 = _loc6.attachMovie("ScoreboardCell", "c" + _loc4, _loc6.getNextHighestDepth(), {_x: _loc4 * 55});
                } // end if
                _loc3.bgMC._visible = false;
                com.rockstargames.ui.utils.Colour.Colourise(_loc3.borderMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
                if (isSelected)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.labelMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(_loc3.labelMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
                    if (highlightedCells.toString().indexOf(_loc4 + "") != -1)
                    {
                        _loc3.bgMC._visible = true;
                        com.rockstargames.ui.utils.Colour.Colourise(_loc3.bgMC, tennisColor.r, tennisColor.g, tennisColor.b, 50);
                    } // end if
                } // end else if
                var _loc5 = arguments[_loc4 + 5];
                _loc3.labelMC.labelTF.text = _loc5 != undefined ? (_loc5) : ("");
                continue;
            } // end if
            if (_loc3 != undefined)
            {
                _loc3.removeMovieClip();
            } // end if
        } // end of for
    } // End of the function
    var curCellCount = 0;
    var maxCellCount = 0;
} // End of Class
#endinitclip
