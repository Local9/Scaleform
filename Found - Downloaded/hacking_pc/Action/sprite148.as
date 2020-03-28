// Action script...

// [Initial MovieClip Action of sprite 148]
#initclip 32
class com.rockstargames.gtav.pc.applications.hacking.ConnectHostApp extends com.rockstargames.gtav.pc.applications.hacking.BaseHacking
{
    var gridMC, frameMC, replayMC, winMC, getRndNumber, ipMC, gameSpeed, AH, onEnterFrame, bgMC, lives, signalMC, signalStrengthText, timeTF;
    function ConnectHostApp()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function initApp01()
    {
        gridItems = [];
        var _loc5 = 12;
        var _loc6 = -12;
        var _loc7 = 70;
        var _loc4 = gridColumns * gridRows;
        for (var _loc3 = 0; _loc3 < _loc4; ++_loc3)
        {
            var _loc2 = gridMC.attachMovie("gridnum", "gridnumMC" + _loc3, _loc3);
            _loc2._x = _loc3 % gridColumns * (_loc2._width + _loc5);
            _loc2._y = Math.floor(_loc3 / gridColumns) * (_loc2._height + _loc6);
            _loc2.numTF.text = _loc3;
            _loc2.numTF.textAutoSize = "shrink";
            _loc2.numTF.verticalAlign = "center";
            gridItems.push(_loc2);
        } // end of for
        gridMC._x = frameMC._width * 0.500000 - gridMC._width * 0.500000;
        gridMC._y = frameMC._height * 0.500000 - gridMC._height * 0.500000 + _loc7;
        replayMC._visible = false;
        winMC._visible = false;
    } // End of the function
    function startApp01()
    {
        var _loc2 = "";
        var _loc6 = "";
        var _loc5 = gridItems.length;
        IPList = [];
        for (var _loc3 = 0; _loc3 < _loc5; ++_loc3)
        {
            _loc2 = this.getRndNumber();
            IPList.push(_loc2);
        } // end of for
        IPIndex = Math.floor(Math.random() * _loc5);
        highlightIndex = 33;
        IPTarget = [];
        for (var _loc3 = 0; _loc3 < 4; ++_loc3)
        {
            _loc2 = this.getRndNumber();
            if (_loc3 != 3)
            {
                _loc6 = _loc6 + String(_loc2 + ".");
            }
            else
            {
                _loc6 = _loc6 + String(_loc2);
            } // end else if
            IPTarget.push(_loc2);
            var _loc4 = IPIndex + _loc3;
            if (_loc4 > _loc5 - 1)
            {
                _loc4 = _loc4 - _loc5;
            } // end if
            IPList[_loc4] = _loc2;
        } // end of for
        ipMC.ipTF.text = _loc6;
        com.rockstargames.ui.utils.Colour.Colourise(ipMC, 244, 20, 11);
        IPMoveTimer = 100 - gameSpeed;
        AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME;
        this.refreshGrid();
        this.highlightIP(highlightIndex);
        replayMC._visible = false;
        winMC._visible = false;
        gridMC._visible = true;
        onEnterFrame = updateApp01;
    } // End of the function
    function updateApp01()
    {
        --IPMoveTimer;
        if (IPMoveTimer < 0)
        {
            this.shiftGrid();
            this.refreshGrid();
            IPMoveTimer = 100 - gameSpeed;
        } // end if
    } // End of the function
    function stopApp01(retryStr)
    {
        if (onEnterFrame != undefined)
        {
            delete this.onEnterFrame;
        } // end if
        var _loc4 = gridItems.length;
        for (var _loc3 = 0; _loc3 < 4; ++_loc3)
        {
            var _loc2 = highlightIndex + _loc3;
            if (_loc2 > _loc4 - 1)
            {
                _loc2 = _loc2 - _loc4;
            } // end if
            com.rockstargames.ui.utils.Colour.Colourise(gridItems[_loc2], 255, 255, 255);
        } // end of for
        AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY;
        IPReplay = 1;
        this.highlightReplay(IPReplay);
        gridMC._visible = false;
        if (retryStr != undefined)
        {
            replayMC.replayTF.htmlText = retryStr;
        } // end if
        replayMC._visible = true;
    } // End of the function
    function testIP()
    {
        if (IPIndex == highlightIndex)
        {
            return (com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_SUCCESS[0]);
        }
        else
        {
            bgMC.gotoAndPlay("in");
            return (com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_FAIL[0]);
        } // end else if
    } // End of the function
    function winApp01(outcomeStr)
    {
        com.rockstargames.ui.utils.Colour.Colourise(ipMC, 34, 172, 33);
        if (onEnterFrame != undefined)
        {
            delete this.onEnterFrame;
        } // end if
        AH.state = com.rockstargames.gtav.pc.applications.App_Hacking.APP01_WIN;
        gridMC._visible = false;
        winMC.winTF.htmlText = outcomeStr;
        winMC._visible = true;
    } // End of the function
    function highlightIP(newIndex)
    {
        var _loc4 = gridItems.length;
        for (var _loc3 = 0; _loc3 < 4; ++_loc3)
        {
            var _loc2 = highlightIndex + _loc3;
            if (_loc2 > _loc4 - 1)
            {
                _loc2 = _loc2 - _loc4;
            } // end if
            com.rockstargames.ui.utils.Colour.Colourise(gridItems[_loc2], 255, 255, 255);
        } // end of for
        highlightIndex = newIndex;
        for (var _loc3 = 0; _loc3 < 4; ++_loc3)
        {
            _loc2 = highlightIndex + _loc3;
            if (_loc2 > _loc4 - 1)
            {
                _loc2 = _loc2 - _loc4;
            } // end if
            com.rockstargames.ui.utils.Colour.Colourise(gridItems[_loc2], 255, 0, 0);
        } // end of for
    } // End of the function
    function highlightReplay(choice)
    {
    } // End of the function
    function moveHighlight(vx, vy)
    {
        var _loc2 = highlightIndex;
        var _loc3 = gridItems.length;
        if (vx > 0)
        {
            ++_loc2;
        }
        else if (vx < 0)
        {
            --_loc2;
        }
        else if (vy > 0)
        {
            _loc2 = _loc2 + gridColumns;
        }
        else if (vy < 0)
        {
            _loc2 = _loc2 - gridColumns;
        } // end else if
        if (_loc2 > _loc3 - 1)
        {
            _loc2 = _loc2 - _loc3;
        } // end if
        if (_loc2 < 0)
        {
            _loc2 = _loc2 + _loc3;
        } // end if
        this.highlightIP(_loc2);
    } // End of the function
    function shiftGrid()
    {
        var _loc3 = String(IPList.shift());
        IPList.push(_loc3);
        var _loc2 = gridItems.length;
        --IPIndex;
        if (IPIndex < 0)
        {
            IPIndex = IPIndex + _loc2;
        } // end if
    } // End of the function
    function refreshGrid()
    {
        for (var _loc2 = 0; _loc2 < gridItems.length; ++_loc2)
        {
            var _loc3 = gridItems[_loc2];
            _loc3.numTF.text = IPList[_loc2];
            _loc3.numTF.textAutoSize = "shrink";
            _loc3.numTF.verticalAlign = "center";
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
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
                {
                    if (IPReplay == 1)
                    {
                        this.startApp01();
                        _loc2 = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_RETRY[0];
                    }
                    else
                    {
                        _loc2 = com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_IP_NORETRY[0];
                    } // end else if
                }
                else if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
                {
                    _loc2 = this.testIP();
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
                {
                    this.stopApp01();
                } // end if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
                {
                    this.moveHighlight(0, -1);
                }
                else if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
                {
                    this.highlightReplay(1);
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
                {
                    this.moveHighlight(0, 1);
                }
                else if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
                {
                    this.highlightReplay(2);
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
                {
                    this.moveHighlight(-1, 0);
                }
                else if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
                {
                    this.highlightReplay(1);
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME)
                {
                    this.moveHighlight(1, 0);
                }
                else if (AH.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY)
                {
                    this.highlightReplay(2);
                } // end else if
                break;
            } 
        } // End of switch
        return (_loc2);
    } // End of the function
    var gridItems = new Array();
    var gridColumns = 10;
    var gridRows = 8;
    var IPList = new Array();
    var IPTarget = new Array();
    var IPIndex = 0;
    var IPMoveTimer = 100;
    var IPReplay = 1;
    var highlightIndex = 0;
} // End of Class
#endinitclip
