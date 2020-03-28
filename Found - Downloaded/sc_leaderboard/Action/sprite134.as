// Action script...

// [Initial MovieClip Action of sprite 134]
#initclip 5
class com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD extends com.rockstargames.ui.core.BaseScreenLayout
{
    var slots, scColor, whiteColor, blackColor, blackAlphaColor, safeRight, safeLeft, leaderboard, isWideScreen, isHiDef, FILE_WIDTH, FOUR_THREE_PADDING, safeTop, safeBottom, CONTENT, columnCount, cellXSpacing;
    function SC_LEADERBOARD()
    {
        super();
    } // End of the function
    function SCLeaderboard()
    {
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        slots = [];
        scColor = new com.rockstargames.ui.utils.HudColour();
        whiteColor = new com.rockstargames.ui.utils.HudColour();
        blackColor = new com.rockstargames.ui.utils.HudColour();
        blackAlphaColor = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_SOCIAL_CLUB, scColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, whiteColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, blackColor);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, blackAlphaColor);
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        var _loc2 = safeRight - safeLeft;
        if (_loc2 <= leaderboard._width)
        {
            leaderboard._width = _loc2;
        }
        else
        {
            leaderboard._xscale = 100;
        } // end else if
        leaderboard._x = Math.round((_loc2 - leaderboard._width) / 2 + safeLeft);
        leaderboard._y = 114;
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
    {
        isWideScreen = _isWideScreen;
        isHiDef = _isHiDef;
        if (!isWideScreen)
        {
            Stage.scaleMode = "noBorder";
            var _loc4 = 1.777778;
            var _loc3 = 1.333333;
            FOUR_THREE_PADDING = (FILE_WIDTH - Math.round(FILE_WIDTH / _loc4 * _loc3)) / 2;
            _screenWidthPixels = FILE_WIDTH - FOUR_THREE_PADDING * 2;
        } // end if
        safeLeft = FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
        safeRight = FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
        safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
        safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
        this.initScreenLayout();
    } // End of the function
    function SET_DISPLAY_TYPE()
    {
        if (leaderboard != undefined)
        {
            leaderboard.removeMovieClip();
        } // end if
        leaderboard = CONTENT.attachMovie("Leaderboard", "leaderboard", CONTENT.getNextHighestDepth());
        if (leaderboard.titleColorMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(leaderboard.titleColorMC, scColor.r, scColor.g, scColor.b, scColor.a);
        } // end if
        if (leaderboard.titleSlotMC.bgMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(leaderboard.titleSlotMC.bgMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
        } // end if
        cellsStartX = 259;
    } // End of the function
    function SET_MULTIPLAYER_TITLE(title)
    {
        leaderboard.mpTitleMC.labelTF.htmlText = title;
    } // End of the function
    function SET_TITLE(title)
    {
        requiredCells = 1;
        var _loc5 = leaderboard.titleSlotMC;
        _loc5.outlineMC._visible = false;
        _loc5.iconsMC._visible = false;
        if (_loc5.labelsMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.labelsMC, blackColor.r, blackColor.g, blackColor.b, blackColor.a);
        } // end if
        if (_loc5.bgMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc5.bgMC, whiteColor.r, whiteColor.g, whiteColor.b, whiteColor.a);
        } // end if
        columnCount = arguments.length - 1;
        if (columnsMax < columnCount)
        {
            columnsMax = columnCount;
        } // end if
        cellXSpacing = Math.round((_loc5.bgMC._width - cellsStartX) / columnCount);
        var _loc3;
        var _loc6;
        for (var _loc4 = 0; _loc4 < columnsMax + requiredCells; ++_loc4)
        {
            _loc3 = _loc5.labelsMC["c" + _loc4];
            if (_loc4 == 0)
            {
                if (_loc3 == undefined)
                {
                    _loc3 = _loc5.labelsMC.attachMovie("CellStat", "c" + _loc4, _loc5.labelsMC.getNextHighestDepth(), {_x: -3});
                } // end if
                _loc6 = new TextFormat();
                _loc6.align = "left";
                _loc3.labelTF.setTextFormat(_loc6);
                _loc3.labelTF.autoSize = true;
            }
            else if (_loc4 > columnCount)
            {
                if (_loc3 != undefined)
                {
                    _loc3.removeMovieClip();
                } // end if
            }
            else
            {
                if (_loc3 == undefined)
                {
                    _loc3 = _loc5.labelsMC.attachMovie("CellStat", "c" + _loc4, _loc5.labelsMC.getNextHighestDepth());
                } // end if
                _loc3._x = cellsStartX + cellXSpacing * (_loc4 - requiredCells) + (cellXSpacing - cellWidth);
                _loc3.labelTF.autoSize = "right";
            } // end else if
            _loc3.labelTF.htmlText = arguments[_loc4];
        } // end of for
        this.initScreenLayout();
    } // End of the function
    function SET_SLOT(id, state)
    {
        requiredCells = 3;
        var _loc5 = slots[id];
        if (_loc5 != undefined)
        {
            _loc5.removeMovieClip();
        } // end if
        _loc5 = leaderboard.attachMovie("Slot", "s" + id, leaderboard.getNextHighestDepth(), {_y: rowStartY + rowYSpacing * id});
        slots[id] = _loc5;
        _loc5.iconsMC._visible = false;
        this.SET_SLOT_STATE(id, state);
        var _loc6 = arguments.slice(2);
        var _loc4;
        var _loc7;
        if (_loc5.isDesc)
        {
            _loc4 = _loc5.labelsMC.attachMovie("CellDescription", "desc", _loc5.labelsMC.getNextHighestDepth());
            _loc4._x = 16;
            var _loc14 = new com.rockstargames.ui.utils.Text();
            _loc14.setTextWithIcons(_loc6[0], _loc4, _loc4.labelTF, 0, 14, 0, false);
            _loc4.labelTF.autoSize = true;
            if (_loc4._width > 837)
            {
                _loc4._width = 837;
                _loc4._yscale = _loc4._xscale;
                _loc4._y = Math.floor((23 - _loc4._height) / 2);
            } // end if
            _loc5.iconsMC._visible = true;
        }
        else if (_loc5.isHeader)
        {
            _loc4 = _loc5.labelsMC.attachMovie("CellPosition", "header", _loc5.labelsMC.getNextHighestDepth());
            _loc4._x = -2;
            _loc4.labelTF.autoSize = true;
            _loc4.labelTF.htmlText = _loc6[0];
        }
        else
        {
            for (var _loc3 = 0; _loc3 < columnsMax + requiredCells; ++_loc3)
            {
                if (_loc3 == 0)
                {
                    _loc4 = _loc5.labelsMC.attachMovie("CellPosition", "c" + _loc3, _loc5.labelsMC.getNextHighestDepth());
                    _loc4.labelTF.autoSize = true;
                    _loc4.labelTF.htmlText = _loc6[_loc3];
                    if (this.canUseFixedWidthNumbers(_loc6[_loc3]))
                    {
                        _loc7 = _loc4.labelTF.getTextFormat();
                        _loc7.font = "$FixedWidthNumbers";
                        _loc4.labelTF.setTextFormat(_loc7);
                    } // end if
                    continue;
                } // end if
                if (_loc3 == 1)
                {
                    _loc4 = _loc5.labelsMC.attachMovie("CellPlayer", "c" + _loc3, _loc5.labelsMC.getNextHighestDepth());
                    _loc4.labelTF.autoSize = true;
                    _loc4.labelTF.htmlText = _loc6[_loc3];
                    continue;
                } // end if
                if (_loc3 == 2 && _loc6[_loc3] != undefined && _loc6[_loc3] != "")
                {
                    var _loc8 = _loc5.tag;
                    var _loc9 = _loc5.labelsMC["c" + (_loc3 - 1)];
                    if (_loc8 == undefined)
                    {
                        _loc8 = (com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP)(_loc5.attachMovie("CREW_TAG_MOVIECLIP", "tag", _loc5.getNextHighestDepth(), {_y: 4.500000, _xscale: 70, _yscale: 70}));
                    } // end if
                    _loc8.UNPACK_CREW_TAG(_loc6[_loc3]);
                    continue;
                } // end if
                if (_loc3 > columnCount + requiredCells)
                {
                    if (_loc4 != undefined)
                    {
                        _loc4.removeMovieClip();
                    } // end if
                    continue;
                } // end if
                _loc4 = _loc5.labelsMC.attachMovie("CellStat", "c" + _loc3, _loc5.labelsMC.getNextHighestDepth());
                _loc4._x = cellsStartX + cellXSpacing * (_loc3 - requiredCells) + (cellXSpacing - cellWidth);
                _loc4.labelTF.autoSize = "right";
                _loc4.labelTF.htmlText = _loc6[_loc3];
                if (this.canUseFixedWidthNumbers(_loc6[_loc3]))
                {
                    _loc7 = _loc4.labelTF.getTextFormat();
                    _loc7.font = "$FixedWidthNumbers";
                    _loc4.labelTF.setTextFormat(_loc7);
                } // end if
            } // end of for
        } // end else if
        this.updateDisplay();
    } // End of the function
    function SET_SLOT_STATE(id, state)
    {
        var _loc4 = new com.rockstargames.ui.utils.BitMonger(state);
        var _loc2 = slots[id];
        _loc2.outlineMC._visible = _loc4.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_OUTLINE);
        _loc2.isHeader = _loc4.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_WORLD) || _loc4.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_FRIENDS) || _loc4.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_CREW);
        _loc2.isDesc = _loc4.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_DESCRIPTION);
        var _loc5;
        var _loc6;
        var _loc3;
        var _loc7 = whiteColor;
        if (_loc4.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_SELECTED))
        {
            if (_loc4.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_IS_PLAYER))
            {
                _loc5 = scColor;
                _loc6 = blackColor;
                _loc3 = blackColor;
            }
            else
            {
                _loc5 = whiteColor;
                _loc6 = blackColor;
                _loc3 = blackColor;
            } // end else if
        }
        else
        {
            _loc6 = whiteColor;
            _loc3 = whiteColor;
            _loc5 = blackAlphaColor;
            if (_loc4.isBitSet(com.rockstargames.gtav.minigames.scleaderboard.SC_LEADERBOARD.SLOT_STATE_IS_PLAYER))
            {
                _loc3 = scColor;
            }
            else if (_loc2.isHeader)
            {
                _loc3 = blackColor;
                _loc5 = scColor;
            } // end else if
        } // end else if
        if (_loc2.bgMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2.bgMC, _loc5.r, _loc5.g, _loc5.b, _loc5.a);
        } // end if
        if (_loc2.outlineMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2.outlineMC, _loc6.r, _loc6.g, _loc6.b, _loc6.a);
        } // end if
        if (_loc2.labelsMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2.labelsMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        if (_loc2.tag)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc2.tag, _loc7.r, _loc7.g, _loc7.b, _loc7.a);
        } // end if
    } // End of the function
    function CLEAR_SLOT(id)
    {
        var _loc2 = slots[id];
        if (_loc2 != undefined)
        {
            slots[id] = undefined;
            _loc2.removeMovieClip();
        } // end if
        widestPosition = 0;
        this.updateDisplay();
    } // End of the function
    function CLEAR_ALL_SLOTS()
    {
        for (var _loc2 = 0; _loc2 < slots.length; ++_loc2)
        {
            this.CLEAR_SLOT(_loc2);
        } // end of for
    } // End of the function
    function canUseFixedWidthNumbers(str, validChars)
    {
        validChars = validChars != undefined ? (validChars) : (":.$/\\");
        var _loc2 = validChars.split("");
        for (var _loc1 = 0; _loc1 < _loc2.length; ++_loc1)
        {
            str = str.split(_loc2[_loc1]).join("");
        } // end of for
        if (isNaN(Number(str)))
        {
            return (false);
        } // end if
        return (true);
    } // End of the function
    function updateDisplay()
    {
        var _loc2;
        var _loc3;
        for (var _loc3 = 0; _loc3 < slots.length; ++_loc3)
        {
            _loc2 = slots[_loc3];
            if (!_loc2.isHeader && _loc2.labelsMC.c0._width > widestPosition)
            {
                widestPosition = _loc2.labelsMC.c0._width;
            } // end if
        } // end of for
        for (var _loc3 = 0; _loc3 < slots.length; ++_loc3)
        {
            _loc2 = slots[_loc3];
            if (!_loc2.isHeader)
            {
                _loc2.labelsMC.c0._x = (widestPosition - slots[_loc3].labelsMC.c0._width) / 2 - 4;
                _loc2.labelsMC.c1._x = widestPosition - 1;
                _loc2.tag._x = _loc2.labelsMC.c1._x + _loc2.labelsMC.c1._width + 16;
                continue;
            } // end if
            _loc2.labelsMC.c0._x = 16;
        } // end of for
    } // End of the function
    static var SLOT_STATE_PLAIN = 0;
    static var SLOT_STATE_IS_PLAYER = 1;
    static var SLOT_STATE_OUTLINE = 2;
    static var SLOT_STATE_SELECTED = 3;
    static var SLOT_STATE_WORLD = 4;
    static var SLOT_STATE_FRIENDS = 5;
    static var SLOT_STATE_CREW = 6;
    static var SLOT_STATE_DESCRIPTION = 7;
    static var DISPLAY_TYPE_MINIGAME = 0;
    static var DISPLAY_TYPE_MULTIPLAYER = 1;
    var rowStartY = 40;
    var rowYSpacing = 27;
    var cellsStartX = 290;
    var cellWidth = 94;
    var widestPosition = 0;
    var requiredCells = 3;
    var columnsMax = 0;
} // End of Class
#endinitclip
