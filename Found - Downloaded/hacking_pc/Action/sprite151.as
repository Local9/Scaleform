// Action script...

// [Initial MovieClip Action of sprite 151]
#initclip 35
class com.rockstargames.gtav.pc.applications.hacking.BruteForceApp extends com.rockstargames.gtav.pc.applications.hacking.BaseHacking
{
    var gridMC, frameMC, replayMC, winMC, rouletteBarMC, __set__rouletteIndex, AH, userBarMC, topBoundMC, bottomBoundMC, onEnterFrame, __get__rouletteIndex, alertMC, lives, signalMC, signalStrengthText, gameSpeed, timeTF;
    function BruteForceApp()
    {
        super();
        rouletteWords = ["PASSWORD"];
    } // End of the function
    function initApp02()
    {
        rouletteItems = [];
        var _loc6 = -12;
        var _loc5 = 70;
        rouletteColItems = [];
        var _loc4 = rouletteWords[0].split("");
        for (var _loc2 = 0; _loc2 < _loc4.length; ++_loc2)
        {
            var _loc3 = new com.rockstargames.gtav.pc.applications.hacking.BFColumn();
            _loc3.init(gridMC, _loc2, rouletteRows, _loc4[_loc2]);
            rouletteColItems.push(_loc3);
        } // end of for
        rouletteItemWidth = _loc3.containerMC._width;
        gridMC._x = frameMC._width * 0.500000 - gridMC._width * 0.500000;
        gridMC._y = frameMC._height * 0.500000 - gridMC._height * 0.500000 + _loc5;
        replayMC._visible = false;
        winMC._visible = false;
    } // End of the function
    function setWord(wordStr)
    {
        rouletteWords = [wordStr];
        var _loc5 = rouletteWords[0];
        for (var _loc2 = 0; _loc2 < rouletteColItems.length; ++_loc2)
        {
            var _loc4 = rouletteColItems[_loc2];
            var _loc3 = _loc5.charAt(_loc2);
            _loc4.setLetter(_loc3);
        } // end of for
    } // End of the function
    function startApp02()
    {
        var _loc10 = "";
        var _loc11 = "";
        var _loc12 = rouletteItems.length;
        rouletteColObj = [];
        for (var _loc3 = 0; _loc3 < rouletteColumns; ++_loc3)
        {
            var _loc2 = 50 + Math.ceil(Math.random() * 50);
            rouletteColObj.push({speed: _loc2, maxspeed: _loc2, index: 0, success: false});
        } // end of for
        var _loc8 = Math.floor(Math.random() * rouletteWords.length);
        var _loc9 = rouletteWords[_loc8].split("");
        rouletteBarMC._visible = true;
        rouletteBarMC._x = gridMC._x;
        rouletteBarMC._width = gridMC._width;
        this.__set__rouletteIndex(0);
        AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME;
        gridMC._visible = true;
        userBarMC._visible = true;
        userBarMC._x = gridMC._x + 5;
        replayMC._visible = false;
        winMC._visible = false;
        topBoundMC._y = rouletteBarMC._y - com.rockstargames.gtav.pc.applications.App_Hacking.hitBuffer;
        bottomBoundMC._y = rouletteBarMC._y + rouletteBarMC._height + com.rockstargames.gtav.pc.applications.App_Hacking.hitBuffer;
        onEnterFrame = updateApp02;
    } // End of the function
    function updateApp02()
    {
        for (var _loc2 = 0; _loc2 < rouletteColItems.length; ++_loc2)
        {
            var _loc3 = rouletteColItems[_loc2];
            _loc3.update();
        } // end of for
    } // End of the function
    function refreshRowApp02(i)
    {
        var _loc7 = rouletteColItems[i];
        var _loc8 = String(_loc7.pop());
        _loc7.splice(0, 0, _loc8);
        rouletteColItems[i] = _loc7;
        var _loc6 = rouletteColObj[i].index;
        ++_loc6;
        if (_loc6 > rouletteRows - 1)
        {
            _loc6 = 0;
        } // end if
        for (var _loc2 = 0; _loc2 < rouletteRows; ++_loc2)
        {
            var _loc3 = rouletteItems[i][_loc2];
            var _loc4 = rouletteColItems[i][_loc2];
            _loc3.numTF.text = _loc4;
            if (_loc6 == _loc2)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, 255, 0, 0);
                continue;
            } // end if
            com.rockstargames.ui.utils.Colour.Colourise(_loc3, 255, 255, 255);
        } // end of for
        rouletteColObj[i].index = _loc6;
    } // End of the function
    function moveHighlightColumn(vx)
    {
        var _loc2 = this.__get__rouletteIndex() + vx;
        if (_loc2 < 0)
        {
            _loc2 = rouletteColumns - 1;
        } // end if
        if (_loc2 > rouletteColumns - 1)
        {
            _loc2 = 0;
        } // end if
        this.__set__rouletteIndex(_loc2);
        this.highlightColumn(this.__get__rouletteIndex());
    } // End of the function
    function highlightColumn(i)
    {
        userBarMC._x = gridMC._x + 5 + i * (rouletteItemWidth + rouletteSpacingX);
    } // End of the function
    function testRoulette()
    {
        var _loc6 = rouletteColItems[this.__get__rouletteIndex()];
        var _loc5 = _loc6.testHit();
        if (_loc5)
        {
            this.jumpHighlight();
            var _loc4 = 0;
            for (var _loc2 = 0; _loc2 < rouletteColItems.length; ++_loc2)
            {
                var _loc3 = rouletteColItems[_loc2];
                if (_loc3.success)
                {
                    ++_loc4;
                } // end if
            } // end of for
            if (_loc4 == rouletteColItems.length)
            {
                return (com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_WIN[0]);
            }
            else
            {
                return (com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_SUCCESS[0]);
            } // end else if
        }
        else
        {
            alertMC.gotoAndPlay("in");
            return (com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_FAIL[0]);
        } // end else if
    } // End of the function
    function stopRoulette()
    {
        isSpinning = false;
        if (onEnterFrame != undefined)
        {
            delete this.onEnterFrame;
        } // end if
    } // End of the function
    function resetRoulette()
    {
        isSpinning = true;
        for (var _loc2 = 0; _loc2 < rouletteColItems.length; ++_loc2)
        {
            var _loc3 = rouletteColItems[_loc2];
            _loc3.reset();
        } // end of for
        if (onEnterFrame != undefined)
        {
            delete this.onEnterFrame;
        } // end if
        this.startApp02();
        alertMC.gotoAndPlay("in");
    } // End of the function
    function jumpHighlight()
    {
        var _loc6 = false;
        var _loc5 = rouletteColumns - 1;
        for (var _loc3 = 0; _loc3 < rouletteColumns - 1; ++_loc3)
        {
            var _loc2 = this.__get__rouletteIndex() + _loc3 + 1;
            if (_loc2 > rouletteColumns - 1)
            {
                _loc2 = _loc2 - rouletteColumns;
            } // end if
            --_loc5;
            var _loc4 = rouletteColItems[_loc2];
            if (!_loc4.success)
            {
                this.__set__rouletteIndex(_loc2);
                this.highlightColumn(_loc2);
                break;
            } // end if
        } // end of for
    } // End of the function
    function get rouletteIndex()
    {
        return (_rouletteIndex);
    } // End of the function
    function set rouletteIndex(r)
    {
        _rouletteIndex = r;
        for (var _loc2 = 0; _loc2 < rouletteColItems.length; ++_loc2)
        {
            var _loc3 = rouletteColItems[_loc2];
            _loc3.__set__highlighted(Boolean(_loc2 == _rouletteIndex));
        } // end of for
        //return (this.rouletteIndex());
        null;
    } // End of the function
    function winApp02(winStr)
    {
        if (onEnterFrame != undefined)
        {
            delete this.onEnterFrame;
        } // end if
        AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP02_WIN;
        rouletteBarMC._visible = false;
        userBarMC._visible = false;
        gridMC._visible = false;
        winMC.winTF.htmlText = winStr;
        winMC._visible = true;
    } // End of the function
    function stopApp02(retryStr)
    {
        if (onEnterFrame != undefined)
        {
            delete this.onEnterFrame;
        } // end if
        for (var _loc2 = 0; _loc2 < rouletteColItems.length; ++_loc2)
        {
            var _loc3 = rouletteColItems[_loc2];
            _loc3.reset();
        } // end of for
        rouletteBarMC._visible = false;
        userBarMC._visible = false;
        AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY;
        rouletteReplay = 1;
        this.highlightReplay(rouletteReplay);
        gridMC._visible = false;
        if (retryStr != undefined)
        {
            replayMC.replayTF.htmlText = retryStr;
        } // end if
        replayMC._visible = true;
    } // End of the function
    function highlightReplay(choice)
    {
    } // End of the function
    function setColumnSpeed(gameColumnSpeedList)
    {
        for (var _loc2 = 0; _loc2 < rouletteColItems.length; ++_loc2)
        {
            var _loc4 = rouletteColItems[_loc2];
            var _loc3 = gameColumnSpeedList[_loc2];
            _loc4.setColumnSpeed(_loc3);
        } // end of for
    } // End of the function
    function setLives(l, t)
    {
        if (t != undefined)
        {
            lives = t;
        } // end if
        for (var _loc2 = 1; _loc2 <= 7; ++_loc2)
        {
            var _loc3 = signalMC["bar" + _loc2 + "MC"];
            _loc3._visible = _loc2 <= lives;
            _loc2 >= l + 1 ? (_loc3.gotoAndStop(2)) : (_loc3.gotoAndStop(1));
        } // end of for
        var _loc5 = 10 * lives;
        signalMC._x = 887 - _loc5;
        signalStrengthText._x = 887;
    } // End of the function
    function showLives(vis)
    {
        signalMC._visible = vis;
        signalStrengthText._visible = vis;
    } // End of the function
    function setSpeed(s)
    {
        gameSpeed = s;
    } // End of the function
    function setTime(m, s, ms)
    {
        var _loc3 = String(m);
        var _loc4 = String(s);
        var _loc2 = String(ms);
        if (m < 10)
        {
            _loc3 = "0" + _loc3;
        } // end if
        if (s < 10)
        {
            _loc4 = "0" + _loc4;
        } // end if
        if (ms < 10)
        {
            _loc2 = "00" + _loc2;
        }
        else if (ms < 100)
        {
            _loc2 = "0" + _loc2;
        } // end else if
        timeTF.text = _loc3 + ":" + _loc4 + ":" + _loc2;
    } // End of the function
    function setInputEvent(direction)
    {
        var _loc2 = 0;
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.CROSS:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
                {
                    if (rouletteReplay == 1)
                    {
                        this.startApp02();
                        _loc2 = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_RETRY[0];
                    }
                    else
                    {
                        _loc2 = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_ROULETTE_NORETRY[0];
                    } // end else if
                }
                else if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME)
                {
                    if (isSpinning)
                    {
                        _loc2 = this.testRoulette();
                    } // end if
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME)
                {
                    this.stopApp02();
                } // end if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
                {
                    this.highlightReplay(1);
                } // end if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
                {
                    this.highlightReplay(2);
                } // end if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME)
                {
                    this.moveHighlightColumn(-1);
                }
                else if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
                {
                    this.highlightReplay(1);
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME)
                {
                    this.moveHighlightColumn(1);
                }
                else if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
                {
                    this.highlightReplay(2);
                } // end else if
                break;
            } 
        } // End of switch
        return (_loc2);
    } // End of the function
    var rouletteColumns = 8;
    var rouletteRows = 7;
    var rouletteWords = new Array();
    var rouletteItems = new Array();
    var rouletteSpacingX = 12;
    var rouletteItemWidth = 72;
    var rouletteReplay = 1;
    var rouletteColItems = new Array();
    var rouletteColObj = new Array();
    var _rouletteIndex = 0;
    var isSpinning = true;
} // End of Class
#endinitclip
