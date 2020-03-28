// Action script...

// [Initial MovieClip Action of sprite 118]
#initclip 5
class com.rockstargames.gtav.pc.SUB_PC extends com.rockstargames.ui.core.BaseScreenLayout
{
    var desktopIconsList, buttonsList, popupData, CONTENT, mouse, SET_DISPLAY_CONFIG, ref, positionToScreenLayout, screenWidthPixels, isWideScreen, subApp, screenHeightPixels, safeTop, safeBottom, safeLeft, safeRight, popupApp, buttonUnderCursor;
    function SUB_PC()
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
    } // End of the function
    function debug()
    {
        var _loc2 = 0.150000;
        this.SET_DISPLAY_CONFIG(1280, 720, _loc2, _loc2, _loc2, _loc2, true, true);
        CONTENT.ref = this;
        CONTENT.onEnterFrame = function ()
        {
            ref.getKeys();
        };
        this.RUN_PROGRAM(com.rockstargames.gtav.constants.PCAppLUT.PC_SUB[0]);
        this.SET_LABELS("Sluice Gate Feed", "Technical Specification", "Security Layout", "Access Switches");
        this.SET_SECTION("section - 5A", "Live feed 1", "Open Sluice Gates", "Release Submarine");
        this.SET_TIME(9, 47);
        this.SET_DATE(1, 3, 90);
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
        } // end else if
    } // End of the function
    function initScreenLayout()
    {
        this.positionToScreenLayout(CONTENT.bgMC.logoMC, "LT");
        CONTENT.bgMC.optimiseMC.edgeMC._x = screenWidthPixels;
        CONTENT.bgMC.optimiseMC.crestMC.gotoAndStop(isWideScreen ? (1) : (2));
        if (subApp != undefined)
        {
            subApp.screenWidthPixels = screenWidthPixels;
            subApp.screenHeightPixels = screenHeightPixels;
            subApp.safeTop = safeTop;
            subApp.safeBottom = safeBottom;
            subApp.safeLeft = safeLeft;
            subApp.safeRight = safeRight;
        } // end if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc2 = 0;
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.CROSS:
            {
                _loc2 = this.CURSOR_CLICK();
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
    function SET_INPUT_EVENT_SELECT()
    {
        var _loc2 = this.CURSOR_CLICK();
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
    function OPEN_POPUP(i)
    {
        popupApp.openPopup(i);
    } // End of the function
    function SET_DATA_SLOT(i, id, x, y, t)
    {
        popupData[i] = [id, x, y, t];
    } // End of the function
    function SET_PC_NEEDED(i)
    {
        isNeeded = i;
    } // End of the function
    function IS_PC_NEEDED()
    {
        return (isNeeded);
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
        if (!isCentering)
        {
            mx = Math.max(safeLeft, Math.min(mx + vx, safeRight));
            my = Math.max(safeTop, Math.min(my + vy, safeBottom));
            mouse.moveCursor(mx, my);
            this.CheckUnderCursor();
        } // end if
    } // End of the function
    function CheckUnderCursor()
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
    function CURSOR_CLICK()
    {
        var _loc2 = buttonUnderCursor.type == undefined ? (0) : (buttonUnderCursor.type);
        lastPopupID = -1;
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
            case com.rockstargames.gtav.constants.PCAppLUT.PC_SUB[0]:
            {
                if (popupApp == undefined)
                {
                    _loc3 = "sub";
                    _loc2 = CONTENT.appsMC.getNextHighestDepth();
                    subApp = CONTENT.appsMC.attachMovie(_loc3, _loc3 + _loc2, _loc2);
                    subApp._subRef = this;
                    subApp.screenWidthPixels = screenWidthPixels;
                    subApp.screenHeightPixels = screenHeightPixels;
                    subApp.safeTop = safeTop;
                    subApp.safeBottom = safeBottom;
                    subApp.safeLeft = safeLeft;
                    subApp.safeRight = safeRight;
                    subApp.ready();
                } // end if
                break;
            } 
        } // End of switch
    } // End of the function
    function closeApp(id)
    {
    } // End of the function
    function SET_LABELS(sluiceLbl, techLbl, securityLbl, accessLbl)
    {
        if (subApp != undefined)
        {
            subApp.setLabels(sluiceLbl, techLbl, securityLbl, accessLbl);
        } // end if
    } // End of the function
    function SET_DATE(days, months, years)
    {
        if (subApp != undefined)
        {
            subApp.setDate(days, months, years);
        } // end if
    } // End of the function
    function SET_TIME(hours, mins)
    {
        if (subApp != undefined)
        {
            subApp.setTime(hours, mins);
        } // end if
    } // End of the function
    function SET_SECTION(section, cam, action1Lbl, action2Lbl)
    {
        if (subApp != undefined)
        {
            subApp.setSection(section, cam, action1Lbl, action2Lbl);
        } // end if
    } // End of the function
    function TRIGGER_CAM_FLASH()
    {
        if (subApp != undefined)
        {
            subApp.triggerFlash();
        } // end if
    } // End of the function
    function TRIGGER_WARNING(num)
    {
        if (subApp != undefined)
        {
            subApp.triggerWarning(num);
        } // end if
    } // End of the function
    function SET_BUTTON_ACTIVE(buttonEnum, isActive)
    {
        if (subApp != undefined)
        {
            subApp.setButtonActive(buttonEnum, isActive);
        } // end if
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
} // End of Class
#endinitclip
