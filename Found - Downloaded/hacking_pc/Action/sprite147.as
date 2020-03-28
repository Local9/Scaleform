// Action script...

// [Initial MovieClip Action of sprite 147]
#initclip 31
class com.rockstargames.gtav.pc.applications.App_Hacking extends com.rockstargames.gtav.pc.applications.hacking.BaseHacking
{
    var mainPopupMC, errorContainerMC, hackingMC, attachMovie, app01MC, app02MC, setupIcon, setupButton, computerBtn, networkBtn, hackingBtn, hackingApp1, hackingApp2, downloadBtn, hackingRef, mouse;
    function App_Hacking()
    {
        super();
        mainPopupMC._visible = false;
        errorContainerMC._visible = false;
        hackingMC._visible = false;
        app01MC = (com.rockstargames.gtav.pc.applications.hacking.ConnectHostApp)(this.attachMovie("appHacking01", "app01MC", 10, {_x: 170, _y: 52}));
        app02MC = (com.rockstargames.gtav.pc.applications.hacking.BruteForceApp)(this.attachMovie("appHacking02", "app02MC", 20, {_x: 170, _y: 52}));
        app01MC.AH = this;
        app02MC.AH = this;
        app01MC._visible = false;
        app02MC._visible = false;
    } // End of the function
    function ready(labels)
    {
        this.setupIcon(mainPopupMC.computerMC, "PC_HARDDRIVE", labels[0]);
        this.setupIcon(mainPopupMC.networkMC, "PC_NETWORK", labels[1]);
        this.setupIcon(mainPopupMC.hackingMC, "PC_HACKING_DEVICE", labels[2]);
        this.setupIcon(hackingMC.hacking1MC, "PC_HACKING_APP01", labels[3]);
        this.setupIcon(hackingMC.hacking2MC, "PC_HACKING_APP02", labels[4]);
        this.setupIcon(hackingMC.downloadMC, "PC_HACKING_DOWNLOAD", labels[5]);
        computerBtn = this.setupButton(mainPopupMC.computerMC, com.rockstargames.gtav.constants.PCAppLUT.PC_ERROR[0], 100);
        networkBtn = this.setupButton(mainPopupMC.networkMC, com.rockstargames.gtav.constants.PCAppLUT.PC_ERROR[0], 101);
        hackingBtn = this.setupButton(mainPopupMC.hackingMC, com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_MENU[0], 102);
        hackingApp1 = this.setupButton(hackingMC.hacking1MC, com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP01[0], 105);
        hackingApp2 = this.setupButton(hackingMC.hacking2MC, com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_APP02[0], 106);
        downloadBtn = this.setupButton(hackingMC.downloadMC, com.rockstargames.gtav.constants.PCAppLUT.PC_HACKING_DOWNLOAD[0], 107);
        downloadBtn.__set__active(false);
        btnManagerIndex = 0;
        btnManagerList = [computerBtn, networkBtn, hackingBtn, hackingApp1, hackingApp2];
        btnManagerStateList = [[false, false, false, false, false], [true, true, true, false, false], [false, false, false, true, true], [false, false, false, false, false]];
        app01MC.initApp01();
        app02MC.initApp02();
        this.openMyComputer(true);
    } // End of the function
    function backButtonState()
    {
        if (btnManagerIndex >= 1)
        {
            if (btnManagerIndex == com.rockstargames.gtav.pc.applications.App_Hacking.MYCOMP)
            {
                this.openMyComputer(false);
            }
            else if (btnManagerIndex == com.rockstargames.gtav.pc.applications.App_Hacking.HACKMENU)
            {
                this.openHackingMenu(false);
            } // end if
        } // end else if
    } // End of the function
    function buttonsState(index)
    {
        for (var _loc2 = 0; _loc2 < btnManagerList.length; ++_loc2)
        {
            var _loc3 = btnManagerList[_loc2];
            _loc3.__set__active(btnManagerStateList[index][_loc2]);
        } // end of for
    } // End of the function
    function openMyComputer(b)
    {
        if (b)
        {
            btnManagerIndex = 1;
            this.buttonsState(btnManagerIndex);
            mainPopupMC._visible = true;
            state = com.rockstargames.gtav.pc.applications.App_Hacking.MYCOMP;
        }
        else
        {
            btnManagerIndex = 0;
            this.buttonsState(btnManagerIndex);
            mainPopupMC._visible = false;
            state = com.rockstargames.gtav.pc.applications.App_Hacking.POPUPS;
        } // end else if
        hackingRef.checkUnderCursor();
    } // End of the function
    function openDownload(b)
    {
        if (b)
        {
            hackingMC.gotoAndStop(2);
            hackingMC.downloadMC._visible = true;
            hackingRef.ACTIVATE_BUTTONS(downloadBtn, true);
            downloadOpen = true;
        }
        else
        {
            hackingMC.gotoAndStop(1);
            hackingMC.downloadMC._visible = false;
            hackingRef.ACTIVATE_BUTTONS(downloadBtn, false);
            downloadOpen = false;
        } // end else if
    } // End of the function
    function openHackingMenu(b)
    {
        if (b)
        {
            btnManagerIndex = 2;
            this.buttonsState(btnManagerIndex);
            hackingMC._visible = true;
            if (downloadOpen)
            {
                hackingRef.ACTIVATE_BUTTONS(downloadBtn, true);
            } // end if
            state = com.rockstargames.gtav.pc.applications.App_Hacking.MYCOMP;
        }
        else
        {
            btnManagerIndex = 1;
            this.buttonsState(btnManagerIndex);
            hackingRef.ACTIVATE_BUTTONS(downloadBtn, false);
            hackingMC._visible = false;
        } // end else if
        hackingRef.checkUnderCursor();
    } // End of the function
    function openErrorPopup(b, msg)
    {
        if (b)
        {
            if (!errorAnimating)
            {
                if (state <= com.rockstargames.gtav.pc.applications.App_Hacking.HACKMENU)
                {
                    oldbtnManagerIndex = btnManagerIndex;
                    btnManagerIndex = 0;
                    this.buttonsState(btnManagerIndex);
                    if (msg != undefined)
                    {
                        errorContainerMC.errorPopupMC.warningTF.htmlText = msg;
                    } // end if
                    errorContainerMC.errorPopupMC.warningMC.gotoAndPlay("loop");
                    errorContainerMC._visible = true;
                    errorAnimating = true;
                } // end if
            } // end if
        }
        else
        {
            btnManagerIndex = oldbtnManagerIndex;
            this.buttonsState(btnManagerIndex);
            errorAnimating = false;
            errorContainerMC._visible = false;
        } // end else if
        hackingRef.checkUnderCursor();
    } // End of the function
    function openApp01(b)
    {
        if (b)
        {
            btnManagerIndex = 3;
            this.buttonsState(btnManagerIndex);
            app01MC._visible = true;
            app01MC.startApp01();
            mouse.mc._visible = false;
        }
        else
        {
            btnManagerIndex = 2;
            this.buttonsState(btnManagerIndex);
            app01MC._visible = false;
            app01MC.stopApp01();
            state = com.rockstargames.gtav.pc.applications.App_Hacking.HACKMENU;
            mouse.mc._visible = true;
        } // end else if
        hackingRef.checkUnderCursor();
    } // End of the function
    function openApp02(b)
    {
        if (b)
        {
            btnManagerIndex = 3;
            this.buttonsState(btnManagerIndex);
            app02MC._visible = true;
            app02MC.startApp02();
            mouse.mc._visible = false;
        }
        else
        {
            btnManagerIndex = 2;
            this.buttonsState(btnManagerIndex);
            app02MC._visible = false;
            app02MC.stopApp02();
            state = com.rockstargames.gtav.pc.applications.App_Hacking.HACKMENU;
            mouse.mc._visible = true;
        } // end else if
        hackingRef.checkUnderCursor();
    } // End of the function
    function openApp(id)
    {
        switch (id)
        {
            case 0:
            {
                this.openApp01(true);
                break;
            } 
            case 1:
            {
                this.openApp02(true);
                break;
            } 
        } // End of switch
    } // End of the function
    function closeAllApps()
    {
        var _loc2 = this.isApp1();
        if (_loc2 != undefined)
        {
            _loc2 ? (this.openApp01(false)) : (this.openApp02(false));
        } // end if
    } // End of the function
    function isApp1()
    {
        if (state >= com.rockstargames.gtav.pc.applications.App_Hacking.APP01_GAME && state <= com.rockstargames.gtav.pc.applications.App_Hacking.APP01_WIN)
        {
            return (true);
        }
        else if (state >= com.rockstargames.gtav.pc.applications.App_Hacking.APP02_GAME && state <= com.rockstargames.gtav.pc.applications.App_Hacking.APP02_WIN)
        {
            return (false);
        } // end else if
    } // End of the function
    function setRouletteOutcome(success, outcomeStr)
    {
        if (success)
        {
            app02MC.winApp02(outcomeStr);
        }
        else
        {
            app02MC.stopApp02(outcomeStr);
        } // end else if
    } // End of the function
    function setIPOutcome(success, outcomeStr)
    {
        if (success)
        {
            app01MC.winApp01(outcomeStr);
        }
        else
        {
            app01MC.stopApp01(outcomeStr);
        } // end else if
    } // End of the function
    function setSpeed(s)
    {
        app01MC.setSpeed(s);
        app02MC.setSpeed(s);
    } // End of the function
    function setColumnSpeed(gameColumnSpeedList)
    {
        app02MC.setColumnSpeed(gameColumnSpeedList);
    } // End of the function
    function setTime(m, s, ms)
    {
        var _loc2 = this.isApp1();
        if (_loc2 != undefined)
        {
            _loc2 ? (app01MC.setTime(m, s, ms)) : (app02MC.setTime(m, s, ms));
        } // end if
    } // End of the function
    function stopRoulette()
    {
        if (app02MC != undefined)
        {
            app02MC.stopRoulette();
        } // end if
    } // End of the function
    function resetRoulette()
    {
        if (app02MC != undefined)
        {
            app02MC.resetRoulette();
        } // end if
    } // End of the function
    function setRouletteWord(wordStr)
    {
        if (app02MC != undefined)
        {
            app02MC.setWord(wordStr);
        } // end if
    } // End of the function
    function setLives(l, t)
    {
        app01MC.setLives(l, t);
        app02MC.setLives(l, t);
    } // End of the function
    function showLives(vis)
    {
        app01MC.showLives(vis);
        app02MC.showLives(vis);
    } // End of the function
    function setInputEvent(direction)
    {
        var _loc2 = 0;
        if (direction == 17)
        {
            this.backButtonState();
        } // end if
        var _loc3 = this.isApp1();
        if (_loc3 != undefined)
        {
            _loc3 ? (_loc2 = app01MC.setInputEvent(direction), app01MC.setInputEvent(direction)) : (_loc2 = app02MC.setInputEvent(direction), app02MC.setInputEvent(direction));
        } // end if
        return (_loc2);
    } // End of the function
    var oldbtnManagerIndex = 0;
    var btnManagerIndex = 0;
    var btnManagerList = new Array();
    var btnManagerStateList = new Array();
    var errorAnimating = false;
    var state = 0;
    static var POPUPS = 0;
    static var MYCOMP = 1;
    static var HACKMENU = 2;
    static var APP01_GAME = 3;
    static var APP01_REPLAY = 4;
    static var APP01_WIN = 5;
    static var APP02_GAME = 6;
    static var APP02_REPLAY = 7;
    static var APP02_WIN = 8;
    static var hitBuffer = 20;
    var gameSpeed = 5;
    var downloadOpen = false;
} // End of Class
#endinitclip
