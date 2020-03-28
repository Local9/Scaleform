// Action script...

// [Initial MovieClip Action of sprite 122]
#initclip 9
class com.rockstargames.gtav.pc.DESKTOP_PC extends com.rockstargames.ui.core.BaseScreenLayout
{
    var desktopIconsList, buttonsList, popupData, CONTENT, mouse, ref, safeLeft, safeRight, safeTop, safeBottom, screenWidthPixels, screenHeightPixels, popupApp, antivirusApp, buttonUnderCursor;
    function DESKTOP_PC()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        desktopIconsList = [];
        buttonsList = [];
        popupData = [];
        var _loc3 = CONTENT.attachMovie("mousecursor", "mousecursorMC", CONTENT.getNextHighestDepth(), {_x: mx, _y: my});
        mouse = new com.rockstargames.gtav.pc.MousePointer(_loc3);
        this.RUN_PROGRAM(com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS[0]);
    } // End of the function
    function debug()
    {
        var _loc2 = 0.050000;
        this.SET_DISPLAY_CONFIG(1280, 720, _loc2, 1 - _loc2, _loc2, 1 - _loc2, true, true);
        CONTENT.ref = this;
        CONTENT.onEnterFrame = function ()
        {
            ref.getKeys();
        };
        this.ADD_PROGRAM(1, 1, "MyComputer");
        this.ADD_PROGRAM(2, com.rockstargames.gtav.constants.PCAppLUT.PC_USB[0], "*usb");
        this.ADD_PROGRAM(3, com.rockstargames.gtav.constants.PCAppLUT.PC_FOLDER[0], "*folder");
        this.ADD_PROGRAM(4, com.rockstargames.gtav.constants.PCAppLUT.PC_PRINT[0], "*print");
        this.ADD_PROGRAM(5, com.rockstargames.gtav.constants.PCAppLUT.PC_TRASH[0], "*trash");
        this.ADD_PROGRAM(7, com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS[0], "Antivirus");
        this.SET_DATA_SLOT(0, 1, 0, 0);
        this.SET_DATA_SLOT(1, 2, 0.250000, 0.250000);
        this.SET_DATA_SLOT(2, 3, 0.500000, 0.500000);
        this.SET_DATA_SLOT(3, 4, 0.500000, 0.500000);
        this.SET_DATA_SLOT(4, 5, 0.750000, 0.750000);
        this.RUN_PROGRAM(com.rockstargames.gtav.constants.PCAppLUT.PC_VIRUS[0]);
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(38))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
        }
        else if (Key.isDown(39))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADRIGHT);
        }
        else if (Key.isDown(40))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
        }
        else if (Key.isDown(37))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADLEFT);
        }
        else if (Key.isDown(32))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.CROSS);
        }
        else if (Key.isDown(45))
        {
            this.SET_SCAN_BAR(scanpercent++);
        }
        else if (Key.isDown(97))
        {
            var _loc2 = Math.floor(Math.random() * 8);
            this.CLOSE_POPUP(_loc2);
        }
        else if (Key.isDown(98))
        {
            this.PLAY_SCAN_ANIM(1);
        } // end else if
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
    {
        var _loc9 = 1.777778;
        var _loc8 = 1.333333;
        var _loc4 = 1280;
        var _loc7 = 720;
        var _loc3 = 0;
        var _loc2 = 0;
        if (!_isWideScreen)
        {
            _loc3 = (_loc4 - Math.round(_loc4 / _loc9 * _loc8)) / 2;
            _loc2 = 0;
            _screenWidthPixels = _loc4 - _loc3 * 2;
            _screenHeightPixels = _loc7 - _loc2 * 2;
        } // end if
        safeLeft = _loc3 + _safeLeftPercent * _screenWidthPixels;
        safeRight = _loc3 + _safeRightPercent * _screenWidthPixels;
        safeTop = _loc2 + _safeTopPercent * _screenHeightPixels;
        safeBottom = _loc2 + _safeBottomPercent * _screenHeightPixels;
        screenWidthPixels = _screenWidthPixels;
        screenHeightPixels = _screenHeightPixels;
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        CONTENT.bgMC._x = 640 - CONTENT.bgMC._width / 2;
        if (popupApp != undefined)
        {
            popupApp.repositionPopups(screenWidthPixels, screenHeightPixels, safeTop, safeBottom, safeLeft, safeRight);
        } // end if
    } // End of the function
    function ADD_PROGRAM(i, enum, lbl)
    {
        if (enum != undefined)
        {
            var _loc6 = sideMargin + colspace * ((i - 1) % columns);
            var _loc5 = bottomMargin + rowspace * Math.floor((i - 1) / rows);
            var _loc2 = CONTENT.desktopMC.getNextHighestDepth();
            var _loc7 = CONTENT.desktopMC.attachMovie("desktopicon", "desktopicon" + _loc2, _loc2, {_x: _loc6, _y: _loc5});
            var _loc3 = new com.rockstargames.gtav.pc.DesktopIcon();
            _loc3.init(_loc7, enum, {depth: i}, i, lbl);
            desktopIconsList.push(_loc3);
        } // end if
    } // End of the function
    function RUN_PROGRAM(id)
    {
        this.openApp(id);
    } // End of the function
    function SET_DATA_SLOT(i, id, x, y, t)
    {
        popupData[i] = [id, x, y, t];
    } // End of the function
    function OPEN_POPUP(i)
    {
        popupApp.openPopup(i);
    } // End of the function
    function CLOSE_POPUP(i)
    {
        popupApp.closePopup(i);
    } // End of the function
    function OPEN_ANTIVIRUS(i, promptText)
    {
        if (i == 1)
        {
            antivirusApp.ready(promptText);
        }
        else
        {
            antivirusApp.notReady(promptText);
        } // end else if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc2 = 0;
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.CROSS:
            {
                _loc2 = this.cursorClick();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                this.MOVE_CURSOR(0, -mouseSpeed);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                this.MOVE_CURSOR(0, mouseSpeed);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                this.MOVE_CURSOR(-mouseSpeed, 0);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                this.MOVE_CURSOR(mouseSpeed, 0);
                break;
            } 
        } // End of switch
        return (_loc2);
    } // End of the function
    function IS_PC_NEEDED()
    {
        return (isNeeded);
    } // End of the function
    function SET_SCAN_BAR(percent)
    {
        if (antivirusApp != undefined)
        {
            var _loc2 = Math.ceil(percent);
            antivirusApp.setScanBar(_loc2);
            if (_loc2 == 100)
            {
                antivirusApp.scanComplete();
            } // end if
        } // end if
    } // End of the function
    function PLAY_SCAN_ANIM(bool)
    {
        if (antivirusApp != undefined)
        {
            antivirusApp.playScanAnim(bool);
        } // end if
    } // End of the function
    function addButtons(m, addOnce)
    {
        var _loc3 = false;
        if (addOnce)
        {
            for (var _loc5 in buttonsList)
            {
                var _loc2 = buttonsList[_loc5];
                if (_loc2.id == m.id)
                {
                    _loc3 = true;
                } // end if
            } // end of for...in
        } // end if
        if (!_loc3)
        {
            buttonsList.push(m);
        } // end if
    } // End of the function
    function activateButtons(m, b)
    {
        m.__set__active(b);
    } // End of the function
    function removeButtons(m)
    {
        for (var _loc4 in buttonsList)
        {
            var _loc2 = buttonsList[_loc4];
            if (m.id == _loc2.id)
            {
                buttonsList.splice(_loc4, 1);
                break;
            } // end if
        } // end of for...in
    } // End of the function
    function SET_SNAP_SPEED(s)
    {
        mouseSnapSpeed = s;
    } // End of the function
    function MOVE_CURSOR(vx, vy)
    {
        if (!isCentering)
        {
            mx = Math.max(0, Math.min(mx + vx, 1280));
            my = Math.max(0, Math.min(my + vy, 720));
            mouse.moveCursor(mx, my);
            this.checkUnderCursor();
        } // end if
    } // End of the function
    function checkUnderCursor()
    {
        var _loc2 = this.testList(buttonsList);
        if (_loc2)
        {
            return;
        } // end if
        this.testList(desktopIconsList);
    } // End of the function
    function snapToButton()
    {
        var _loc3 = mouseSnapSpeed / 1000;
        var _loc2 = {x: buttonUnderCursor.mc._x, y: buttonUnderCursor.mc._y};
        buttonUnderCursor.mc._parent.localToGlobal(_loc2);
        mx = _loc2.x + buttonUnderCursor.mc._width / 2;
        my = _loc2.y + buttonUnderCursor.mc._height / 2;
        isCentering = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(mouse.mc, _loc3, {_x: mx, _y: my, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT, onComplete: snapToButtonComplete, onCompleteScope: this});
    } // End of the function
    function snapToButtonComplete()
    {
        isCentering = false;
    } // End of the function
    function testList(list)
    {
        var _loc5 = false;
        var _loc6;
        var _loc3 = -1;
        for (var _loc7 in list)
        {
            var _loc2 = list[_loc7];
            if (_loc2.__get__active())
            {
                if (mouse.mc.hitMC.hitTest(_loc2.mc))
                {
                    if (_loc2.args.depth > _loc3)
                    {
                        _loc3 = _loc2.args.depth;
                        _loc6 = _loc2;
                    } // end if
                    _loc5 = true;
                } // end if
            } // end if
        } // end of for...in
        if (_loc5)
        {
            switch (_loc6.type)
            {
                case undefined:
                {
                    mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
                    break;
                } 
                case com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW[0]:
                {
                    mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
                    break;
                } 
                default:
                {
                    mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.HAND);
                    break;
                } 
            } // End of switch
            buttonUnderCursor.__set__highlight(false);
            buttonUnderCursor = _loc6;
            buttonUnderCursor.__set__highlight(true);
            if (buttonUnderCursor.type == com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE[0])
            {
                mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.HAND);
                if (!isSnapping)
                {
                    isSnapping = true;
                    this.snapToButton();
                } // end if
            }
            else
            {
                isSnapping = false;
            } // end else if
        }
        else
        {
            mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
            buttonUnderCursor.__set__highlight(false);
            buttonUnderCursor = null;
            isSnapping = false;
        } // end else if
        return (_loc5);
    } // End of the function
    function resetUnderCursor()
    {
        mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
        buttonUnderCursor = null;
    } // End of the function
    function cursorClick()
    {
        var _loc2 = buttonUnderCursor.type == undefined ? (0) : (buttonUnderCursor.type);
        lastPopupID = -1;
        switch (buttonUnderCursor.type)
        {
            case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS[0]:
            {
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_START[0]:
            {
                antivirusApp.scanAntiVirus(5);
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLEAN[0]:
            {
                antivirusApp.closeButtons();
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLOSE[0]:
            {
                antivirusApp.closeButtons();
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE[0]:
            {
                lastPopupID = buttonUnderCursor.args.index;
                buttonUnderCursor.__set__highlight(false);
                popupApp.closePopup(lastPopupID);
                com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mouse.mc);
                this.snapToButtonComplete();
                break;
            } 
        } // End of switch
        return (_loc2);
    } // End of the function
    function LAST_POPUP_CLOSED()
    {
        return (lastPopupID);
    } // End of the function
    function openApp(i)
    {
        var _loc2;
        var _loc3;
        switch (i)
        {
            case com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS[0]:
            {
                if (antivirusApp == undefined)
                {
                    _loc3 = "antivirus";
                    _loc2 = 1;
                    antivirusApp = CONTENT.appsMC.attachMovie(_loc3, _loc3 + _loc2, _loc2);
                    antivirusApp._x = screenWidthPixels / 2 - antivirusApp._width / 2;
                    antivirusApp._y = screenHeightPixels / 2 - antivirusApp._height / 2;
                    antivirusApp.__set__desktopRef(this);
                } // end if
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_VIRUS[0]:
            {
                if (popupApp == undefined)
                {
                    _loc3 = "popups";
                    _loc2 = 0;
                    popupApp = CONTENT.appsMC.attachMovie(_loc3, _loc3 + _loc2, _loc2);
                    popupApp.__set__desktopRef(this);
                    popupApp.screenWidthPixels = screenWidthPixels;
                    popupApp.screenHeightPixels = screenHeightPixels;
                    popupApp.safeTop = safeTop;
                    popupApp.safeBottom = safeBottom;
                    popupApp.safeLeft = safeLeft;
                    popupApp.safeRight = safeRight;
                    popupApp.__set__data(popupData);
                    popupApp.ready();
                } // end if
                break;
            } 
        } // End of switch
    } // End of the function
    function closeApp(id)
    {
        switch (id)
        {
            case com.rockstargames.gtav.constants.PCAppLUT.PC_VIRUS[0]:
            {
                break;
            } 
        } // End of switch
    } // End of the function
    function RESTART_MOVIE()
    {
        if (typeof(mouse.mc) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeAllTweens(mouse.mc);
        } // end if
        com.rockstargames.ui.game.GameCom.REQUEST_RESTART_MOVIE("DESKTOP_PC");
    } // End of the function
    var rows = 6;
    var columns = 6;
    var rowspace = 168;
    var colspace = 200;
    var bottomMargin = 56;
    var sideMargin = 104;
    var mouseSpeed = 15;
    var mouseSnapSpeed = 500;
    var mx = 640;
    var my = 320;
    var lastPopupID = -1;
    var isNeeded = 1;
    var isSnapping = false;
    var isCentering = false;
    var autoMode = true;
    var scanpercent = 0;
} // End of Class
#endinitclip
