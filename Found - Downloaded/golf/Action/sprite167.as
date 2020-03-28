// Action script...

// [Initial MovieClip Action of sprite 167]
#initclip 5
class com.rockstargames.gtav.minigames.golf.GOLF extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, holeDisplay, swingDisplay, swingMeter, positionToScreenLayout, playerCardSlots, playerCard, coursePar, scoreboardSlots, scoreboard, safeRight, safeLeft, safeBottom, safeTop, FILE_WIDTH, isWideScreen, isHiDef, FOUR_THREE_PADDING, displayBM, ref;
    function GOLF()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        _global.gfxExtensions = true;
        CONTENT.ref = this;
        holeDisplay = CONTENT.attachMovie("HoleDisplay", "holeDisplay", CONTENT.getNextHighestDepth());
        com.rockstargames.ui.utils.Colour.ApplyHudColour(holeDisplay.frameMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        swingDisplay = CONTENT.attachMovie("SwingDisplay", "swingDisplay", CONTENT.getNextHighestDepth());
        swingDisplay.lieMC._visible = false;
        swingDisplay.spinMC._visible = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(swingDisplay.clubBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(swingDisplay.windBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(swingDisplay.ballBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(swingDisplay.shotBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(swingDisplay.swingBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        swingMeter = (com.rockstargames.gtav.minigames.components.SwingMeter)(CONTENT.attachMovie("SwingMeter", "swingMeter", CONTENT.getNextHighestDepth()));
        this.positionToScreenLayout(swingMeter, "CC");
        playerCardSlots = [];
        playerCard = CONTENT.attachMovie("PlayerCard", "playerCard", CONTENT.getNextHighestDepth());
        coursePar = [];
        scoreboardSlots = [];
        scoreboard = CONTENT.attachMovie("Scoreboard", "scoreboard", CONTENT.getNextHighestDepth());
        scoreboard.keyMC.holeInOneMC.gotoAndStop("holeInOneOutline");
        scoreboard.keyMC.holeInOneMC._width = scoreboard.keyMC.holeInOneMC._height = 16;
        scoreboard.keyMC.underParMC.gotoAndStop("underParOutline");
        scoreboard.keyMC.underParMC._width = scoreboard.keyMC.underParMC._height = 14;
        scoreboard.keyMC.overParMC.gotoAndStop("overParOutline");
        scoreboard.keyMC.overParMC._width = scoreboard.keyMC.overParMC._height = 14;
        scoreboard.keyMC.holeInOneTF.autoSize = "left";
        scoreboard.keyMC.underParTF.autoSize = "left";
        scoreboard.keyMC.overParTF.autoSize = "left";
        com.rockstargames.ui.utils.Colour.ApplyHudColour(scoreboard.keyMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(scoreboard.headerBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(scoreboard.holeAndParBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        this.SET_DISPLAY(com.rockstargames.ui.utils.BitMonger.BIT(SHOW_SWING_METER));
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        swingMeter.screenWidth = safeRight - safeLeft;
        swingMeter.screenHeight = safeBottom - safeLeft;
        this.positionToScreenLayout(holeDisplay, "LB", true);
        swingDisplay._x = safeRight - 179;
        swingDisplay._y = safeTop;
        this.positionToScreenLayout(playerCard, "LT", true);
        var _loc2 = safeRight - safeLeft;
        scoreboard._xscale = 100;
        if (_loc2 <= scoreboard._width)
        {
            scoreboard._width = _loc2;
        } // end if
        scoreboard._x = Math.round((FILE_WIDTH - scoreboard._width) / 2);
        scoreboard._y = 190;
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
    function SET_DISPLAY(state)
    {
        displayBM = new com.rockstargames.ui.utils.BitMonger(state);
        holeDisplay._visible = displayBM.isBitSet(SHOW_HOLE_DISPLAY);
        swingDisplay._visible = displayBM.isBitSet(SHOW_SWING_DISPLAY);
        playerCard._visible = displayBM.isBitSet(SHOW_PLAYERCARD);
        scoreboard._visible = displayBM.isBitSet(SHOW_SCOREBOARD);
    } // End of the function
    function SET_HOLE_DISPLAY(hole, par, dist)
    {
        holeDisplay.holeTF.text = hole;
        holeDisplay.parTF.text = par;
        holeDisplay.distTF.text = dist;
        this.initScreenLayout();
    } // End of the function
    function SET_SWING_DISPLAY(state, lie, lieEnum, wind, windDirection, club, clubEnum, swing, swingChangable, spin, spinPower, spinDirection, shotStr)
    {
        var _loc2 = new com.rockstargames.ui.utils.BitMonger(state);
        if (_loc2.isBitSet(SD_LIE) || _loc2.isBitSet(SD_SPIN))
        {
            swingDisplay.ballTitleTF._visible = true;
            swingDisplay.ballTitleBGMC._visible = true;
            swingDisplay.ballMC._visible = true;
            swingDisplay.ballBGMC._visible = true;
        }
        else
        {
            swingDisplay.ballTitleTF._visible = false;
            swingDisplay.ballTitleBGMC._visible = false;
            swingDisplay.ballMC._visible = false;
            swingDisplay.ballBGMC._visible = false;
        } // end else if
        if (_loc2.isBitSet(SD_LIE))
        {
            swingDisplay.ballTitleTF.textAutoSize = "shrink";
            swingDisplay.ballTitleTF.text = lie;
            swingDisplay.lieMC.gotoAndStop(lieEnum);
            swingDisplay.lieMC._visible = true;
        }
        else
        {
            swingDisplay.lieMC._visible = false;
        } // end else if
        if (_loc2.isBitSet(SD_WIND))
        {
            swingDisplay.windTF.textAutoSize = "shrink";
            swingDisplay.windTF.text = wind;
            swingDisplay.windMC._xscale = 110;
            swingDisplay.windMC._yscale = 80;
            swingDisplay.windMC.windArrow._rotation = windDirection;
            swingDisplay.windTF._visible = true;
            swingDisplay.windMC._visible = true;
            swingDisplay.windBGMC._visible = true;
        }
        else
        {
            swingDisplay.windTF._visible = false;
            swingDisplay.windMC._visible = false;
            swingDisplay.windBGMC._visible = false;
        } // end else if
        if (_loc2.isBitSet(SD_CLUB))
        {
            swingDisplay.clubTF.textAutoSize = "shrink";
            swingDisplay.clubTF.text = club;
            swingDisplay.clubMC.gotoAndStop(clubEnum + 1);
            swingDisplay.clubTF._visible = true;
            swingDisplay.clubMC._visible = true;
            swingDisplay.clubBGMC._visible = true;
        }
        else
        {
            swingDisplay.clubTF._visible = false;
            swingDisplay.clubMC._visible = false;
            swingDisplay.clubBGMC._visible = false;
        } // end else if
        if (_loc2.isBitSet(SD_SWING))
        {
            swingDisplay.swingTF.textAutoSize = "shrink";
            swingDisplay.swingTF.text = swing;
            swingDisplay.swingTF._visible = true;
            swingDisplay.swingArrowsMC._visible = swingChangable;
            swingDisplay.swingBGMC._visible = true;
        }
        else
        {
            swingDisplay.swingTF._visible = false;
            swingDisplay.swingArrowsMC._visible = false;
            swingDisplay.swingBGMC._visible = false;
        } // end else if
        if (_loc2.isBitSet(SD_SPIN))
        {
            _spinDirection = Math.round(spinDirection);
            _spinPower = Math.round(spinPower);
            _spinScaleTarget = _spinPower / 2 + 50;
            swingDisplay.ballTitleTF.textAutoSize = "shrink";
            swingDisplay.ballTitleTF.text = spin;
            swingDisplay.ballMC._alpha = 50;
            swingDisplay.spinMC._visible = true;
            swingDisplay.spinGradMC._visible = true;
            if (CONTENT.onEnterFrame == undefined)
            {
                CONTENT.onEnterFrame = _contentEnterFrame;
            } // end if
        }
        else
        {
            _spinning = false;
            swingDisplay.ballMC._alpha = 100;
            swingDisplay.spinMC._visible = false;
            swingDisplay.spinGradMC._visible = false;
            CONTENT.onEnterFrame = undefined;
        } // end else if
        if (_loc2.isBitSet(SD_SHOT))
        {
            swingDisplay.shotBGMC._visible = true;
            swingDisplay.shotTF._visible = true;
            swingDisplay.shotTF.textAutoSize = "shrink";
            swingDisplay.shotTF.text = shotStr;
        }
        else
        {
            swingDisplay.shotBGMC._visible = false;
            swingDisplay.shotTF._visible = false;
        } // end else if
        this.initScreenLayout();
    } // End of the function
    function _contentEnterFrame()
    {
        ref._spinDisplay();
    } // End of the function
    function _spinDisplay()
    {
        var _loc2 = swingDisplay.spinMC;
        var _loc4 = swingDisplay.spinGradMC;
        if (_spinning)
        {
            var _loc3 = _spinDirection + 180 - _loc2._rotation;
            _loc3 = _loc3 + ((_loc3 < 0 ? (360) : (_loc3 > 360 ? (-360) : (0))) - 180);
            _loc2._rotation = _loc2._rotation + _loc3 / 10;
            if (_loc2._rotation < _spinDirection + 1 && _loc2._rotation > _spinDirection - 1)
            {
                _loc2._rotation = _spinDirection;
            } // end if
            _loc2._xscale = _loc2._xscale - (_loc2._xscale - _spinScaleTarget) / 10;
            if (_loc2._xscale < _spinScaleTarget + 1 && _loc2._xscale > _spinScaleTarget - 1)
            {
                _loc2._xscale = _spinScaleTarget;
            } // end if
            _loc2._yscale = _loc2._xscale;
        }
        else
        {
            _loc2._rotation = _spinDirection;
            _loc2._xscale = _loc2._yscale = _spinScaleTarget;
            _spinning = true;
        } // end else if
        if (_spinPower > 0)
        {
            var _loc5 = Math.round(_spinPower / 250 * _loc2._totalframes);
            _loc2.gotoAndStop((_loc2._currentframe + _loc5) % _loc2._totalframes + 1);
            _loc4._alpha = _loc2._xscale;
        }
        else
        {
            _loc2.stop();
            if (_loc4._alpha > 0)
            {
                _loc4._alpha = _loc4._alpha - _loc4._alpha / 10;
            } // end if
        } // end else if
    } // End of the function
    function SET_PLAYERCARD_SLOT(id, state, name, crewTag, txd, txn, ballColor, score, scoreColor)
    {
        var _loc2 = playerCard["p" + id];
        var _loc4 = new com.rockstargames.ui.utils.BitMonger(state);
        if (_loc2 == undefined)
        {
            _loc2 = playerCard.attachMovie("PlayerCardSlot", "p" + id, playerCard.getNextHighestDepth(), {_y: id * 27});
            _loc2.nameMC.MPNameTF.autoSize = true;
            _loc2.nameMC.nameTF.autoSize = true;
            playerCardSlots[id] = _loc2;
        } // end if
        _loc2.bm = _loc4;
        _loc2.nameMC.nameTF._width = _loc2.nameMC.MPNameTF._width = 10;
        if (_loc4.isBitSet(SBBM_MP))
        {
            _loc2.nameMC.MPNameTF.text = name;
            _loc2.nameMC.MPNameTF._visible = true;
            _loc2.nameMC.nameTF._visible = false;
        }
        else
        {
            _loc2.nameMC.nameTF.text = name;
            _loc2.nameMC.MPNameTF._visible = false;
            _loc2.nameMC.nameTF._visible = true;
        } // end else if
        var _loc5 = _loc2.crewTagMC;
        if (_loc4.isBitSet(SBBM_CREWTAG) && crewTag != "" && crewTag != undefined)
        {
            if (!_loc5)
            {
                _loc5 = (com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP)(_loc2.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", _loc2.getNextHighestDepth(), {_y: 3, _xscale: 80, _yscale: 80}));
            }
            else
            {
                _loc5._visible = true;
            } // end else if
            _loc5._x = _loc2.nameMC._x + _loc2.nameMC._width + 7;
            _loc5.UNPACK_CREW_TAG(crewTag);
        }
        else
        {
            _loc5._visible = false;
        } // end else if
        this.SET_PLAYERCARD_HEADSET(id, _loc4.unpackInt(SBBM_HEADSET, 2));
        if (_loc4.isBitSet(SBBM_HIDE_BALL))
        {
            _loc2.ballMC._visible = false;
        }
        else
        {
            _loc2.ballMC._visible = true;
        } // end else if
        var _loc3 = _loc2.imgLdr;
        if (_loc3 == undefined)
        {
            _loc3 = (com.rockstargames.ui.media.ImageLoaderMC)(_loc2.attachMovie("GenericImageLoader", "imgLdr", _loc2.getNextHighestDepth(), {}));
        } // end if
        if (_loc3.textureDict != txd && _loc3.textureFilename != txn)
        {
            if (_loc3.isLoaded)
            {
                _loc3.removeTxdRef();
            } // end if
            _loc3.init("GOLF", txd, txn, 25, 25);
            _loc3.addTxdRef(String(_loc3));
        } // end if
        var _loc7 = _loc2.cellMC;
        _loc7.labelMC.labelTF.text = score;
        if (_loc4.isBitSet(SBBM_HIGHLIGHT))
        {
            _loc2.currentPlayerMC._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.nameMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.headsetMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        }
        else
        {
            _loc2.currentPlayerMC._visible = false;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.nameMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.headsetMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        } // end else if
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.ballMC, ballColor);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.currentPlayerMC, scoreColor);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc7.bgMC, scoreColor);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc7.labelMC, scoreColor == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK));
        this.updatePlayerCardDisplay();
    } // End of the function
    function SET_PLAYERCARD_HEADSET(id, headsetEnum)
    {
        var _loc2 = playerCard["p" + id];
        _loc2.headsetMC.gotoAndStop(headsetEnum + 1);
    } // End of the function
    function CLEAR_PLAYERCARD_SLOT(id)
    {
        var _loc2 = playerCardSlots[id];
        playerCardSlots[id] = undefined;
        _loc2.removeMovieClip();
        this.updatePlayerCardDisplay();
    } // End of the function
    function updatePlayerCardDisplay()
    {
        var _loc2 = playerCardSlots[0];
        var _loc4;
        var _loc3 = 0;
        maxPlayerCardNameWidth = 179 - _loc2.cellMC._width;
        while (_loc3 < playerCardSlots.length)
        {
            _loc2 = playerCardSlots[_loc3];
            if (_loc2 != undefined && !_loc2.bm.isBitSet(SBBM_MP) && _loc2.nameMC._width > maxPlayerCardNameWidth)
            {
                maxPlayerCardNameWidth = Math.ceil(_loc2.nameMC._width);
            } // end if
            ++_loc3;
        } // end while
        for (var _loc3 = 0; _loc3 < playerCardSlots.length; ++_loc3)
        {
            _loc2 = playerCardSlots[_loc3];
            if (_loc2 != undefined)
            {
                _loc4 = _loc2.bm.isBitSet(SBBM_MP) ? (defaultPlayerCardNameWidth) : (maxPlayerCardNameWidth);
                _loc2.bgMC._width = _loc4;
                _loc2.cellMC._x = _loc4;
                _loc2.ballMC._x = _loc4 - 11;
                _loc2.currentPlayerMC._x = _loc4 + _loc2.cellMC._width;
            } // end if
        } // end of for
        this.initScreenLayout();
    } // End of the function
    function SET_SCOREBOARD_TITLE(title, holeLabel, parLabel, scoreLabel, holeInOne, underPar, overPar)
    {
        scoreboard.titleTF.text = title;
        if (holeLabel != undefined)
        {
            scoreboard.titleBarMC.holeTF.text = holeLabel;
        } // end if
        if (parLabel != undefined)
        {
            scoreboard.titleBarMC.parTF.text = parLabel;
        } // end if
        if (scoreLabel != undefined)
        {
            scoreboard.titleBarMC.scoreTF.text = scoreLabel;
        } // end if
        if (holeInOne != undefined)
        {
            scoreboard.keyMC.holeInOneTF.text = holeInOne;
        } // end if
        if (underPar != undefined)
        {
            scoreboard.keyMC.underParTF.text = underPar;
        } // end if
        if (overPar != undefined)
        {
            scoreboard.keyMC.overParTF.text = overPar;
        } // end if
        scoreboard.keyMC.overParTF._x = scoreboard.keyMC.overParMC._x - scoreboard.keyMC.overParTF._width - scoreboard.keyMC.overParMC._width / 2 - 6;
        scoreboard.keyMC.underParMC._x = scoreboard.keyMC.overParTF._x - scoreboard.keyMC.underParMC._width / 2 - 12;
        scoreboard.keyMC.underParTF._x = scoreboard.keyMC.underParMC._x - scoreboard.keyMC.underParTF._width - scoreboard.keyMC.underParMC._width / 2 - 6;
        scoreboard.keyMC.holeInOneMC._x = scoreboard.keyMC.underParTF._x - scoreboard.keyMC.holeInOneMC._width / 2 - 12;
        scoreboard.keyMC.holeInOneTF._x = scoreboard.keyMC.holeInOneMC._x - scoreboard.keyMC.holeInOneTF._width - scoreboard.keyMC.holeInOneMC._width / 2 - 6;
        for (var _loc3 = 0; _loc3 < 9; ++_loc3)
        {
            if (arguments[_loc3 + 7] != undefined)
            {
                scoreboard.titleBarMC["h" + _loc3].text = arguments[_loc3 + 7];
            } // end if
        } // end of for
    } // End of the function
    function COURSE_PAR()
    {
        for (var _loc3 = 0; _loc3 < arguments.length; ++_loc3)
        {
            coursePar[_loc3] = arguments[_loc3];
            scoreboard.titleBarMC["p" + _loc3].text = arguments[_loc3];
        } // end of for
    } // End of the function
    function SET_SCOREBOARD_SLOT(id, state, name, crewTag, readyStr, ballColor, score, scoreColor, c0, c1, c2, c3, c4, c5, c6, c7, c8)
    {
        var _loc3 = scoreboard["s" + id];
        var _loc5 = new com.rockstargames.ui.utils.BitMonger(state);
        if (_loc3 == undefined)
        {
            _loc3 = scoreboard.attachMovie("ScoreboardSlot", "s" + id, scoreboard.getNextHighestDepth());
            _loc3.nameMC.MPNameTF.autoSize = true;
            _loc3.nameMC.nameTF.autoSize = true;
        } // end if
        scoreboardSlots[id] = _loc3;
        _loc3.nameMC.nameTF._width = _loc3.nameMC.MPNameTF._width = 10;
        if (_loc5.isBitSet(SBBM_MP))
        {
            _loc3.nameMC.MPNameTF.text = name;
            _loc3.nameMC.MPNameTF._visible = true;
            _loc3.nameMC.nameTF._visible = false;
        }
        else
        {
            _loc3.nameMC.nameTF.text = name;
            _loc3.nameMC.MPNameTF._visible = false;
            _loc3.nameMC.nameTF._visible = true;
        } // end else if
        var _loc7 = _loc3.crewTagMC;
        if (_loc5.isBitSet(SBBM_CREWTAG) && crewTag != "" && crewTag != undefined)
        {
            if (!_loc7)
            {
                _loc7 = (com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP)(_loc3.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", _loc3.getNextHighestDepth(), {_y: 3, _xscale: 80, _yscale: 80}));
            }
            else
            {
                _loc7._visible = true;
            } // end else if
            _loc7._x = _loc3.nameMC._x + _loc3.nameMC._width + 8;
            _loc7.UNPACK_CREW_TAG(crewTag);
        }
        else
        {
            _loc7._visible = false;
        } // end else if
        if (_loc5.isBitSet(SBBM_READY))
        {
            _loc3.statusMC.labelMC.labelTF.autoSize = true;
            _loc3.statusMC.labelMC.labelTF.text = readyStr;
            _loc3.statusMC.bgMC._width = Math.round(_loc3.statusMC.labelMC._width + 4);
            _loc3.statusMC._x = 266 - _loc3.statusMC._width;
            _loc3.statusMC._visible = true;
        }
        else
        {
            _loc3.statusMC._visible = false;
        } // end else if
        if (_loc5.isBitSet(SBBM_HIDE_BALL))
        {
            _loc3.ballMC._visible = false;
        }
        else
        {
            _loc3.ballMC._visible = true;
        } // end else if
        var _loc8 = arguments.slice(8);
        var _loc6;
        for (var _loc4 = 0; _loc4 < 9; ++_loc4)
        {
            _loc3.cellsMC["c" + _loc4].text = _loc8[_loc4];
            _loc6 = _loc5.unpackInt(this["SBBM_HOLE" + (_loc4 + 1)], 2);
            _loc3.cellsMC["o" + _loc4].gotoAndStop(_loc6 + 1);
            _loc3.cellsMC["o" + _loc4]._alpha = 15;
        } // end of for
        var _loc9 = _loc3.scoreMC.labelTF;
        _loc9.text = score;
        var _loc10 = _loc9.getTextFormat();
        _loc10.size = 12;
        _loc9.setTextFormat(_loc9.text.indexOf(" "), _loc9.text.length, _loc10);
        var _loc21;
        var _loc24;
        var _loc15 = new com.rockstargames.ui.utils.HudColour();
        var _loc14 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(ballColor, _loc15);
        com.rockstargames.ui.utils.Colour.setHudColour(scoreColor, _loc14);
        if (_loc5.isBitSet(SBBM_HIGHLIGHT))
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.statusMC.labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.statusMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
            _loc3.statusMC._alpha = 90;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.nameMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.cellsMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.statusMC.labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.statusMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            _loc3.statusMC._alpha = 50;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.nameMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.cellsMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
            _loc3.bgMC._alpha = _loc3.bgMC._alpha - 20;
        } // end else if
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.ballMC, ballColor);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.scoreBG, scoreColor);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.gridMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc3.scoreMC, scoreColor == com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK));
        this.updateScoreboardDisplay();
    } // End of the function
    function CLEAR_SCOREBOARD_SLOT(id)
    {
        var _loc2 = scoreboard["s" + id];
        _loc2.removeMovieClip();
        scoreboardSlots.splice(id, 1);
        this.updateScoreboardDisplay();
    } // End of the function
    function updateScoreboardDisplay()
    {
        var _loc3;
        for (var _loc2 = 0; _loc2 < scoreboardSlots.length; ++_loc2)
        {
            _loc3 = scoreboard["s" + _loc2];
            _loc3._y = 125 + 25 * _loc2;
        } // end of for
        scoreboard.keyMC._y = 125 + 25 * scoreboardSlots.length;
        this.initScreenLayout();
    } // End of the function
    function ADD_TXD_REF_RESPONSE(txd, strRef, success)
    {
        var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(strRef));
        il.displayTxdResponse(txd);
    } // End of the function
    function SWING_METER_SET_MARKER(hVisible, hPosition, vVisibile, vPosition)
    {
        swingMeter.setMarker(hVisible, hPosition, vVisibile, vPosition);
    } // End of the function
    function SWING_METER_SET_APEX_MARKER(hVisible, hPosition, vVisibile, vPosition)
    {
        swingMeter.setApexMarker(hVisible, hPosition, vVisibile, vPosition);
    } // End of the function
    function SWING_METER_SET_TARGET(span, position)
    {
        swingMeter.setTarget(span, position);
    } // End of the function
    function SWING_METER_SET_TARGET_COLOR(r, g, b, a)
    {
        swingMeter.setTargetColor(r, g, b, a);
    } // End of the function
    function SWING_METER_SET_FILL(span, state, fromTop)
    {
        swingMeter.setFill(span, state, fromTop);
    } // End of the function
    function SWING_METER_POSITION(x, y, center)
    {
        swingMeter.setPosition(x, y, center);
    } // End of the function
    function SWING_METER_SCALE(w, h)
    {
        swingMeter.setScale(w, h);
    } // End of the function
    function SWING_METER_IS_TRANSITIOING()
    {
        return (swingMeter.isTransitioing());
    } // End of the function
    function SWING_METER_TRANSITION_IN()
    {
        swingMeter.transitionIn();
    } // End of the function
    function SWING_METER_TRANSITION_OUT(duration)
    {
        swingMeter.transitionOut(duration);
    } // End of the function
    var SHOW_HOLE_DISPLAY = 0;
    var SHOW_SWING_DISPLAY = 1;
    var SHOW_SWING_METER = 2;
    var SHOW_PLAYERCARD = 3;
    var SHOW_SCOREBOARD = 4;
    var SD_LIE = 0;
    var SD_WIND = 1;
    var SD_CLUB = 2;
    var SD_SWING = 3;
    var SD_SPIN = 4;
    var SD_SHOT = 5;
    var SBBM_HIGHLIGHT = 0;
    var SBBM_MP = 1;
    var SBBM_CREWTAG = 2;
    var SBBM_READY = 3;
    var SBBM_HIDE_BALL = 4;
    var SBBM_HOLE1 = 6;
    var SBBM_HOLE2 = 8;
    var SBBM_HOLE3 = 10;
    var SBBM_HOLE4 = 12;
    var SBBM_HOLE5 = 14;
    var SBBM_HOLE6 = 16;
    var SBBM_HOLE7 = 18;
    var SBBM_HOLE8 = 20;
    var SBBM_HOLE9 = 22;
    var SBBM_HEADSET = 24;
    var maxPlayerCardNameWidth = 0;
    var defaultPlayerCardNameWidth = 288;
    var _spinning = true;
    var _spinDirection = 0;
    var _spinPower = 0;
    var _spinScaleTarget = 0;
} // End of Class
#endinitclip
