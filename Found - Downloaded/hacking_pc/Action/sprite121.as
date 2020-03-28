// Action script...

// [Initial MovieClip Action of sprite 121]
#initclip 5
class com.rockstargames.gtav.pc.HACKING_PC extends com.rockstargames.ui.core.BaseScreenLayout
{
    var desktopIconsList, buttonsList, CONTENT, mouse, hackingLoading, screenWidthPixels, hackingApp, screenHeightPixels, safeTop, safeBottom, safeLeft, safeRight, backgroundImage, buttonUnderCursor, wallpaper_loader;
    function HACKING_PC()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        desktopIconsList = [];
        buttonsList = [];
        var _loc3 = CONTENT.attachMovie("mousecursor", "mousecursorMC", CONTENT.getNextHighestDepth(), {_x: mx, _y: my});
        mouse = new com.rockstargames.gtav.pc.MousePointer(_loc3);
        hackingLoading = CONTENT.appsMC.attachMovie("loadingHacking", "loadingHackingMC", 1, {_x: 186, _y: 52});
        hackingLoading._visible = false;
    } // End of the function
    function SET_LABELS()
    {
        labelList = [];
        labelList = arguments;
    } // End of the function
    function initScreenLayout()
    {
        CONTENT.bgMC._x = screenWidthPixels / 2 - CONTENT.bgMC._width / 2;
        if (hackingApp != undefined)
        {
            hackingApp.screenWidthPixels = screenWidthPixels;
            hackingApp.screenHeightPixels = screenHeightPixels;
            hackingApp.safeTop = safeTop;
            hackingApp.safeBottom = safeBottom;
            hackingApp.safeLeft = safeLeft;
            hackingApp.safeRight = safeRight;
        } // end if
    } // End of the function
    function SET_BACKGROUND(bgEnum)
    {
        this.removeBackground();
        if (bgEnum != undefined)
        {
            if (bgEnum < 0 || bgEnum > 10)
            {
                bgEnum = 0;
            } // end if
        } // end if
        backgroundImage = "HACKING_PC_desktop_" + bgEnum;
        var _loc3 = CONTENT.bgMC.createEmptyMovieClip("background", CONTENT.bgMC.getNextHighestDepth());
        com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, backgroundImage, "wallpaper", true);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc3 = 0;
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.CROSS:
            {
                _loc3 = this.SET_INPUT_EVENT_SELECT();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            {
                this.SET_INPUT_EVENT_BACK();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                if (hackingApp != undefined)
                {
                    hackingApp.setInputEvent(direction);
                } // end if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                if (hackingApp != undefined)
                {
                    hackingApp.setInputEvent(direction);
                } // end if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                if (hackingApp != undefined)
                {
                    hackingApp.setInputEvent(direction);
                } // end if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                if (hackingApp != undefined)
                {
                    hackingApp.setInputEvent(direction);
                } // end if
                break;
            } 
        } // End of switch
        return (_loc3);
    } // End of the function
    function SET_INPUT_EVENT_SELECT()
    {
        return (this.CURSOR_CLICK(16));
    } // End of the function
    function SET_INPUT_EVENT_BACK()
    {
        if (hackingApp != undefined)
        {
            hackingApp.setInputEvent(17);
            if (hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.POPUPS)
            {
                this.setDesktopIconsActive(true);
                this.checkUnderCursor();
            } // end if
        } // end if
    } // End of the function
    function ADD_PROGRAM(i, enum, lbl)
    {
        if (enum != undefined)
        {
            var _loc5 = 6;
            var _loc11 = 6;
            var _loc9 = 168;
            var _loc6 = 200;
            var _loc10 = 56;
            var _loc13 = 104;
            var _loc8 = _loc13 + _loc6 * ((i - 1) % _loc11);
            var _loc7 = _loc10 + _loc9 * Math.floor((i - 1) / _loc5);
            var _loc2 = CONTENT.desktopMC.getNextHighestDepth();
            var _loc12 = CONTENT.desktopMC.attachMovie("desktopicon", "desktopicon" + _loc2, _loc2, {_x: _loc8, _y: _loc7});
            var _loc3 = new com.rockstargames.gtav.pc.DesktopIcon();
            _loc3.init(_loc12, enum, {depth: i}, i, lbl);
            desktopIconsList.push(_loc3);
        } // end if
    } // End of the function
    function RUN_PROGRAM(id)
    {
        this.openApp(id);
    } // End of the function
    function ADD_BUTTONS(m)
    {
        buttonsList.push(m);
    } // End of the function
    function ACTIVATE_BUTTONS(m, b)
    {
        m.__set__active(b);
    } // End of the function
    function REMOVE_BUTTONS(m)
    {
        for (var _loc4 in buttonsList)
        {
            var _loc2 = buttonsList[_loc4];
            if (m == _loc2)
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
        var _loc4 = true;
        if (hackingApp != undefined)
        {
            if (hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME || hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP01_REPLAY || hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME || hackingApp.state == com.rockstargames.gtav.pc.applications.App_Hacking.APP02_REPLAY)
            {
                _loc4 = false;
                --keyRepeatDelay;
                if (keyRepeatDelay <= 0)
                {
                    if (vx > 0)
                    {
                        this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADRIGHT);
                    }
                    else if (vx < 0)
                    {
                        this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADLEFT);
                    }
                    else if (vy > 0)
                    {
                        this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
                    }
                    else if (vy < 0)
                    {
                        this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
                    } // end else if
                    keyRepeatDelay = maxKeyRepeatDelay;
                } // end if
                if (vx == 0 && vy == 0)
                {
                    keyRepeatDelay = 0;
                } // end if
            } // end if
        } // end if
        if (!isCentering && _loc4 == true)
        {
            mx = Math.max(safeLeft, Math.min(mx + vx, safeRight));
            my = Math.max(safeTop, Math.min(my + vy, safeBottom));
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
            mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.HAND);
            buttonUnderCursor.__set__highlight(false);
            buttonUnderCursor = _loc6;
            buttonUnderCursor.__set__highlight(true);
            if (buttonUnderCursor.type == com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE[0])
            {
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
    function RESET_UNDER_CURSOR()
    {
        mouse.changeCursor(com.rockstargames.gtav.pc.MousePointer.ARROW);
        buttonUnderCursor = null;
    } // End of the function
    function CURSOR_CLICK(direction)
    {
        var _loc2 = buttonUnderCursor.type == undefined ? (0) : (buttonUnderCursor.type);
        switch (_loc2)
        {
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING[0]:
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_MENU[0]:
            {
                this.openApp(buttonUnderCursor.type);
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP01[0]:
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP02[0]:
            {
                if (debugMode)
                {
                    this.openApp(buttonUnderCursor.type);
                } // end if
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_EMPTY[0]:
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_DOWNLOAD[0]:
            default:
            {
                break;
            } 
        } // End of switch
        if (_loc2 == 0)
        {
            if (hackingApp != undefined)
            {
                _loc2 = hackingApp.setInputEvent(direction);
            } // end if
        } // end if
        return (_loc2);
    } // End of the function
    function openApp(i)
    {
        var _loc2;
        var _loc3;
        switch (i)
        {
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING[0]:
            {
                if (hackingApp == undefined)
                {
                    _loc3 = "hacking";
                    _loc2 = 0;
                    hackingApp = CONTENT.appsMC.attachMovie(_loc3, _loc3 + _loc2, _loc2);
                    hackingApp.mouse = mouse;
                    hackingApp.hackingRef = this;
                    hackingApp.ready(labelList);
                    hackingApp.setLives(livesDisplay, livesTotal);
                    hackingApp.setSpeed(gameSpeed);
                    hackingApp.setRouletteWord(gamePassword);
                    hackingApp.setColumnSpeed(gameColumnSpeedList);
                    hackingApp.openDownload(false);
                }
                else
                {
                    hackingApp.ready(labelList);
                } // end else if
                this.setDesktopIconsActive(false);
                this.checkUnderCursor();
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_ERROR[0]:
            {
                if (hackingApp != undefined)
                {
                    hackingApp.openErrorPopup(true);
                } // end if
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_MENU[0]:
            {
                if (hackingApp != undefined)
                {
                    hackingApp.openHackingMenu(true);
                } // end if
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP01[0]:
            {
                if (hackingApp != undefined)
                {
                    hackingApp.openApp01(true);
                } // end if
                break;
            } 
            case com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP02[0]:
            {
                if (hackingApp != undefined)
                {
                    hackingApp.openApp02(true);
                } // end if
                break;
            } 
        } // End of switch
    } // End of the function
    function closeApp(id)
    {
        
        
    } // End of the function
    function setDesktopIconsActive(a)
    {
        for (var _loc2 = 0; _loc2 < desktopIconsList.length; ++_loc2)
        {
            var _loc3 = desktopIconsList[_loc2];
            if (_loc3.type == com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING[0])
            {
                _loc3.__set__active(a);
            } // end if
        } // end of for
    } // End of the function
    function OPEN_APP(id)
    {
        if (hackingApp != undefined)
        {
            hackingApp.openApp(id);
        } // end if
    } // End of the function
    function CLOSE_APP()
    {
        if (hackingApp != undefined)
        {
            hackingApp.closeAllApps();
        } // end if
    } // End of the function
    function OPEN_LOADING_PROGRESS(bool)
    {
        hackingLoading._visible = Boolean(bool);
    } // End of the function
    function SET_LOADING_PROGRESS(percent, showPercent)
    {
        if (showPercent != undefined)
        {
            hackingPercentShow = Boolean(showPercent);
            if (hackingPercentShow)
            {
                var _loc3 = hackingLoading.innerMC.percentTF;
                var _loc2 = _loc3.getTextFormat();
                _loc3.text = String(percent) + "%";
                _loc3.setTextFormat(_loc2);
            }
            else
            {
                _loc3 = hackingLoading.innerMC.percentTF;
                _loc3.text = "";
            } // end if
        } // end else if
        hackingLoading.innerMC.loadbarMC.barMC._xscale = percent;
    } // End of the function
    function SET_LOADING_TIME(secs, label)
    {
        var _loc2 = secs % 60;
        var _loc3 = Math.floor(secs / 60);
        var _loc5 = _loc2 < 10 ? (String("0" + _loc2)) : (String(_loc2));
        var _loc4 = _loc3 < 10 ? (String("0" + _loc3)) : (String(_loc3));
        hackingLoading.innerMC.loadbarMC.secsTF.text = _loc5;
        hackingLoading.innerMC.loadbarMC.minsTF.text = _loc4;
        if (secs > 0)
        {
            if (label != undefined)
            {
                hackingLoading.innerMC.loadbarMC.remainingTF.text = label;
            } // end if
        }
        else
        {
            hackingLoading.frameMC.play();
            hackingLoading.innerMC.loadbarMC.remainingTF.textAutoSize = "shrink";
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "HACKING_COMPLETE", hackingLoading.innerMC.loadbarMC.remainingTF);
        } // end else if
    } // End of the function
    function SET_LOADING_MESSAGE(msg, size)
    {
        var _loc2 = hackingLoading.innerMC.msgTF;
        var _loc4 = hackingLoading.innerMC.percentTF;
        var _loc6 = _loc2.getTextFormat();
        var _loc5 = 72;
        var _loc3 = 30;
        switch (size)
        {
            case 1:
            {
                _loc5 = 36;
                _loc3 = 16;
                break;
            } 
            case 2:
            {
                _loc5 = 48;
                _loc3 = 24;
                break;
            } 
            case 3:
            {
                _loc5 = 72;
                _loc3 = 36;
                break;
            } 
            case 4:
            {
                _loc5 = 96;
                _loc3 = 48;
                break;
            } 
        } // End of switch
        _loc6.size = _loc5;
        _loc2.htmlText = msg;
        _loc2.autoSize = true;
        _loc2.setTextFormat(_loc6);
        _loc4.autoSize = true;
        _loc4.setTextFormat(_loc6);
        _loc4._y = _loc2._height + _loc3;
        if (hackingPercentShow)
        {
            hackingLoading.innerMC.loadbarMC._y = _loc4._y + _loc4._height + _loc3;
        }
        else
        {
            hackingLoading.innerMC.loadbarMC._y = _loc2._y + _loc2._height + _loc3;
        } // end else if
        hackingLoading.innerMC._y = 310 - hackingLoading.innerMC._height / 2;
    } // End of the function
    function OPEN_DOWNLOAD(bool)
    {
        if (hackingApp != undefined)
        {
            hackingApp.openDownload(bool);
        } // end if
    } // End of the function
    function OPEN_ERROR_POPUP(bool, msg)
    {
        if (hackingApp != undefined)
        {
            hackingApp.openErrorPopup(Boolean(bool), msg);
        } // end if
    } // End of the function
    function SET_IP_OUTCOME(success, winStr)
    {
        if (hackingApp != undefined)
        {
            hackingApp.setIPOutcome(Boolean(success), winStr);
        } // end if
    } // End of the function
    function SET_ROULETTE_OUTCOME(success, outcomeStr)
    {
        if (hackingApp != undefined)
        {
            hackingApp.setRouletteOutcome(Boolean(success), outcomeStr);
        } // end if
    } // End of the function
    function SET_ROULETTE_WORD(wordStr)
    {
        gamePassword = wordStr;
        if (hackingApp != undefined)
        {
            hackingApp.setRouletteWord(gamePassword);
        } // end if
    } // End of the function
    function STOP_ROULETTE()
    {
        if (hackingApp != undefined)
        {
            hackingApp.stopRoulette();
        } // end if
    } // End of the function
    function RESET_ROULETTE()
    {
        if (hackingApp != undefined)
        {
            hackingApp.resetRoulette();
        } // end if
    } // End of the function
    function SET_COUNTDOWN(m, s, ms)
    {
        if (hackingApp != undefined)
        {
            hackingApp.setTime(m, s, ms);
        } // end if
    } // End of the function
    function SET_SPEED(speed)
    {
        gameSpeed = speed;
        if (hackingApp != undefined)
        {
            hackingApp.setSpeed(gameSpeed);
        } // end if
    } // End of the function
    function SET_KEY_REPEAT_DELAY(kDelay)
    {
        maxKeyRepeatDelay = kDelay;
    } // End of the function
    function SET_COLUMN_SPEED(columnIndex, speed)
    {
        gameColumnSpeedList[columnIndex] = speed;
        if (hackingApp != undefined)
        {
            hackingApp.setColumnSpeed(gameColumnSpeedList);
        } // end if
    } // End of the function
    function SET_LIVES(lives, total)
    {
        livesDisplay = lives;
        livesTotal = total;
        if (hackingApp != undefined)
        {
            hackingApp.setLives(livesDisplay, livesTotal);
        } // end if
    } // End of the function
    function SHOW_LIVES(vis)
    {
        if (vis == undefined)
        {
            vis = true;
        } // end if
        if (hackingApp != undefined)
        {
            hackingApp.showLives(vis);
        } // end if
    } // End of the function
    function RESTART_MOVIE()
    {
        this.removeBackground();
        if (typeof(mouse.mc) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mouse.mc);
        } // end if
        com.rockstargames.ui.game.GameCom.REQUEST_RESTART_MOVIE("HACKING_PC");
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success == true)
        {
            this.loadBackground(textureDict);
        } // end if
    } // End of the function
    function TXD_ALREADY_LOADED(textureDict, uniqueID)
    {
        this.loadBackground(textureDict);
    } // End of the function
    function removeBackground()
    {
        if (backgroundImage != undefined)
        {
            if (CONTENT.bgMC.background != undefined)
            {
                CONTENT.bgMC.background.removeMovieClip();
                com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, backgroundImage);
                backgroundImage = undefined;
            } // end if
        } // end if
    } // End of the function
    function loadBackground(textureDict)
    {
        wallpaper_loader = new MovieClipLoader();
        wallpaper_loader.addListener(this);
        var _loc2 = "img://" + textureDict + "/" + textureDict;
        wallpaper_loader.loadClip(_loc2, CONTENT.bgMC.background);
    } // End of the function
    function onLoadInit(target_mc)
    {
        CONTENT.bgMC.background._x = 0;
        CONTENT.bgMC.background._y = 0;
        CONTENT.bgMC.background._width = 1280;
        CONTENT.bgMC.background._height = 720;
        CONTENT.bgMC._visible = true;
        delete this.wallpaper_loader;
    } // End of the function
    function SHUTDOWN_MOVIE()
    {
        this.removeBackground();
        if (typeof(mouse.mc) == "movieclip")
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mouse.mc);
        } // end if
    } // End of the function
    var mouseSpeed = 15;
    var mouseSnapSpeed = 500;
    var mx = 640;
    var my = 320;
    var hackingPercentShow = true;
    var isSnapping = false;
    var isCentering = false;
    var autoMode = true;
    var debugMode = false;
    var livesTotal = 7;
    var livesDisplay = 7;
    var gameSpeed = 1;
    var gameColumnSpeedList = [1, 1, 1, 1, 1, 1, 1, 1];
    var gamePassword = "PASSWORD";
    var keyRepeatDelay = 0;
    var maxKeyRepeatDelay = 3;
    var labelList = new Array();
    var gfxFileName = "HACKING_PC";
} // End of Class
#endinitclip
