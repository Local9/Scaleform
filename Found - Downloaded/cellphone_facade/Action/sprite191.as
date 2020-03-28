// Action script...

// [Initial MovieClip Action of sprite 191]
#initclip 1
class com.rockstargames.gtav.cellphone.facade.CELLPHONE_FACADE
{
    var TIMELINE, CONTENT, BOUNDING_BOX, dataProviderUI, homemenuDataProviderUI, contactsDataProviderUI, callscreenDataProviderUI, emailListDataProviderUI, emailViewDataProviderUI, emailResponseDataProviderUI, messageListDataProviderUI, messageViewDataProviderUI, jobListDataProviderUI, settingsDataProviderUI, toDoListDataProviderUI, toDoViewDataProviderUI, missionRepeatDataProviderUI, missionStatsDataProviderUI, applayer, infoBar, cellphoneButtons, componentArray, currentStyle, loadingApp, lastViewID, lastCurrentID, previousViewID, currentlyLoadedApp, cellphoneApp, app_loader;
    function CELLPHONE_FACADE()
    {
        _global.gfxExtensions = true;
        style.push(new Array([80, 141, 222], [80, 141, 222], [80, 141, 222], blackRGB, blackRGB));
        style.push(new Array([65, 174, 8], [65, 174, 83], [65, 174, 8], blackRGB, blackRGB));
        style.push(new Array([154, 17, 17], [154, 17, 17], [154, 17, 17], blackRGB, blackRGB));
        style.push(new Array([230, 113, 43], [230, 113, 43], [230, 113, 43], blackRGB, blackRGB));
        style.push(new Array([110, 110, 110], [110, 110, 110], [110, 110, 110], blackRGB, blackRGB));
        style.push(new Array([76, 2, 113], [76, 2, 113], [76, 2, 113], blackRGB, blackRGB));
        style.push(new Array([188, 75, 141], [188, 75, 141], [188, 75, 141], blackRGB, blackRGB));
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
        var _loc2 = new flash.geom.Transform(CONTENT);
        var _loc3 = new flash.geom.ColorTransform(1, 1, 1, 1, -25, -25, -25, 0);
        _loc2.colorTransform = _loc3;
        dataProviderUI = new Array();
        homemenuDataProviderUI = new Array();
        contactsDataProviderUI = new Array();
        callscreenDataProviderUI = new Array();
        emailListDataProviderUI = new Array();
        emailViewDataProviderUI = new Array();
        emailResponseDataProviderUI = new Array();
        messageListDataProviderUI = new Array();
        messageViewDataProviderUI = new Array();
        jobListDataProviderUI = new Array();
        settingsDataProviderUI = new Array();
        toDoListDataProviderUI = new Array();
        toDoViewDataProviderUI = new Array();
        missionRepeatDataProviderUI = new Array();
        missionStatsDataProviderUI = new Array();
        applayer = CONTENT.applayer;
        infoBar = CONTENT.infoBar;
        infoBar.topmostLevel = true;
        cellphoneButtons = CONTENT.cellphoneButtons;
        cellphoneButtons.topmostLevel = true;
        componentArray = ["SHUTDOWN_MOVIE", "HOMEMENU", "CONTACTLIST", "", "CALLSCREEN", "", "TEXT_MESSAGE_LIST", "TEXT_MESSAGE_VIEW", "EMAIL_LIST", "EMAIL_VIEW", "", "APP_NUMBERPAD", "", "SETTINGS", "APP_TODO_LIST", "APP_TODO_VIEW", "SHUTTER", "APP_TODO_VIEW", "MISSION_REPEAT_LIST", "APP_MISSION_STATS_VIEW", "APP_JOB_LIST", "EMAIL_RESPONSE", "SETTINGS", "APP_TRACKIFY"];
        currentStyle = style[2];
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        var _loc2;
        if (loadingApp != undefined)
        {
            _loc2 = 0;
        }
        else
        {
            _loc2 = currentInterface.GET_CURRENT_SELECTION();
            if (_loc2 == -1 || _loc2 == undefined)
            {
                _loc2 = 0;
            } // end if
        } // end else if
        return (_loc2);
    } // End of the function
    function SET_TITLEBAR_TIME(newHour, newMinute, newDay)
    {
        if (newHour != undefined)
        {
            currentHour = newHour;
        } // end if
        if (newMinute != undefined)
        {
            currentMinute = newMinute;
        } // end if
        if (newDay != undefined)
        {
            currentDay = newDay;
        } // end if
        var _loc3 = "";
        var _loc2 = "";
        var _loc4 = "";
        if (currentHour < 10)
        {
            _loc3 = "0";
        } // end if
        if (currentMinute < 10)
        {
            _loc2 = "0";
        } // end if
        _loc3 = _loc3 + (String(currentHour) + ":");
        _loc2 = _loc2 + String(currentMinute);
        _loc4 = currentDay;
        infoBar.timeBar.hour.text = _loc3;
        infoBar.timeBar.minutes.text = _loc2;
        infoBar.dayBar.mainMenuDay.text = _loc4;
    } // End of the function
    function SET_SLEEP_MODE(isSleepModeActive)
    {
        infoBar.sleepModeIcon._visible = isSleepModeActive;
    } // End of the function
    function SET_HEADER(newHeader)
    {
        var _loc2 = true;
        if (newHeader == undefined)
        {
            _loc2 = false;
            newHeader = "";
        } // end if
        infoBar.headerText._visible = _loc2;
        infoBar.headerBackground._visible = _loc2;
        infoBar.headerText.textAutoSize = "shrink";
        if (loadingApp != undefined)
        {
            infoBar.headerText._visible = false;
        } // end if
        infoBar.headerText.text = newHeader;
        this.COLOUR_HEADERBAR();
    } // End of the function
    function COLOUR_HEADERBAR()
    {
        switch (currentInterface._name)
        {
            case "TEXT_MESSAGE_LIST":
            case "TEXT_MESSAGE_VIEW":
            case "EMAIL_LIST":
            case "EMAIL_RESPONSE":
            {
                com.rockstargames.ui.utils.Colour.Colourise(infoBar.headerBackground, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                infoBar.headerText.textColor = TextBlackHex;
                break;
            } 
            default:
            {
                com.rockstargames.ui.utils.Colour.Colourise(infoBar.headerBackground, blackRGB[0], blackRGB[1], blackRGB[2], 100);
                infoBar.headerText.textColor = TextWhiteHex;
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_SOFT_KEYS_COLOUR(buttonID, red, green, blue)
    {
        var _loc3 = ["positiveButton", "otherButton", "negativeButton"];
        var _loc2 = _loc3[buttonID - 1];
        if (cellphoneButtons[_loc2] != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(cellphoneButtons[_loc2], red, green, blue);
        } // end if
    } // End of the function
    function SET_SOFT_KEYS(buttonID, isVisible, iconEnum, textLabel)
    {
        var _loc3 = ["positiveButton", "otherButton", "negativeButton"];
        var _loc2 = _loc3[buttonID - 1];
        cellphoneButtons[_loc2]._visible = isVisible;
        cellphoneButtons[_loc2].gotoAndStop(com.rockstargames.gtav.cellphone.SoftKeyLabels.SOFTKEYS[iconEnum][1]);
    } // End of the function
    function toggleCellphoneButtonsVisible(isVisible)
    {
        cellphoneButtons._visible = isVisible;
    } // End of the function
    function updateSoftKeys(currentClip)
    {
        if (currentClip.isLandscape)
        {
            cellphoneButtons._rotation = 90;
            cellphoneButtons.background._width = 345;
            cellphoneButtons._x = 40;
            cellphoneButtons._y = 0;
            cellphoneButtons.positiveButton._x = 56;
            cellphoneButtons.divider1._x = 114;
            cellphoneButtons.otherButton._x = 170;
            cellphoneButtons.divider2._x = 228;
            cellphoneButtons.negativeButton._x = 283;
        }
        else
        {
            cellphoneButtons._rotation = 0;
            cellphoneButtons.background._width = 256;
            cellphoneButtons._x = 0;
            cellphoneButtons._y = 304;
            cellphoneButtons.positiveButton._x = 42;
            cellphoneButtons.divider1._x = 85;
            cellphoneButtons.otherButton._x = 127;
            cellphoneButtons.divider2._x = 170;
            cellphoneButtons.negativeButton._x = 211;
        } // end else if
    } // End of the function
    function updateInfoBar(currentClip)
    {
        if (currentClip._name == "SHUTTER")
        {
            infoBar._visible = false;
        }
        else
        {
            infoBar._visible = true;
        } // end else if
        if (currentClip.isLandscape)
        {
            infoBar._rotation = 90;
            infoBar.gotoAndStop("LANDSCAPE");
            infoBar._x = 256;
            infoBar._y = 0;
            infoBar.timeBar._x = 314;
            infoBar.sleepModeIcon._x = 242;
            infoBar.headerText._x = 3;
            infoBar.headerText._width = 344;
            infoBar.headerBackground._x = 0;
            infoBar.headerBackground._width = 344;
        }
        else
        {
            infoBar.gotoAndStop("PORTRAIT");
            infoBar._rotation = 0;
            infoBar._x = 0;
            infoBar._y = 0;
            infoBar.timeBar._x = 227;
            infoBar.sleepModeIcon._x = 154;
            infoBar.headerText._x = 3;
            infoBar.headerText._width = 256;
            infoBar.headerBackground._x = 0;
            infoBar.headerBackground._width = 256;
        } // end else if
        this.COLOUR_HEADERBAR(currentClip);
        CONTENT.infoBar.badgerIcon.gotoAndStop(providerIcon * 20);
        CONTENT.infoBar.signalStrengthIcon.gotoAndStop(6 - signalStrength);
        this.SET_TITLEBAR_TIME();
    } // End of the function
    function SET_BACKGROUND_IMAGE(image_enum)
    {
    } // End of the function
    function SET_PROVIDER_ICON(icon_enum, signal_strength)
    {
        if (icon_enum != undefined)
        {
            providerIcon = icon_enum;
            CONTENT.infoBar.badgerIcon.gotoAndStop(providerIcon * 20);
        } // end if
        this.SET_SIGNAL_STRENGTH(signal_strength);
    } // End of the function
    function SET_SIGNAL_STRENGTH(signal_strength)
    {
        if (signal_strength == undefined)
        {
            signal_strength = 5;
        } // end if
        signalStrength = signal_strength;
        infoBar.signalStrengthIcon.gotoAndStop(6 - signalStrength);
    } // End of the function
    function SET_THEME(themeID)
    {
        currentStyle = style[themeID - 1];
        currentInterface.currentStyle = currentStyle;
        this.COLOUR_HEADERBAR(currentInterface);
        currentInterface.currentStyle = currentStyle;
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewID)
    {
        switch (viewID)
        {
            case 2:
            {
                contactsDataProviderUI = new Array();
                break;
            } 
            case 4:
            {
                callscreenDataProviderUI = new Array();
                break;
            } 
            case 6:
            {
                messageListDataProviderUI = new Array();
                break;
            } 
            case 7:
            {
                messageViewDataProviderUI = new Array();
                break;
            } 
            case 8:
            {
                emailListDataProviderUI = new Array();
                break;
            } 
            case 9:
            {
                emailViewDataProviderUI = new Array();
                break;
            } 
            case 13:
            case 22:
            {
                settingsDataProviderUI = new Array();
                break;
            } 
            case 14:
            case 17:
            {
                toDoListDataProviderUI = new Array();
                break;
            } 
            case 15:
            {
                toDoViewDataProviderUI = new Array();
                break;
            } 
            case 18:
            {
                missionRepeatDataProviderUI = new Array();
                break;
            } 
            case 19:
            {
                missionStatsDataProviderUI = new Array();
                break;
            } 
            case 20:
            {
                jobListDataProviderUI = new Array();
                break;
            } 
            case 21:
            {
                emailResponseDataProviderUI = new Array();
                break;
            } 
            default:
            {
                dataProviderUI = new Array();
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_DATA_SLOT(viewID, slotID)
    {
        switch (viewID)
        {
            case 1:
            {
                homemenuDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 2:
            {
                contactsDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 4:
            {
                callscreenDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 6:
            {
                messageListDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 7:
            {
                messageViewDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 8:
            {
                emailListDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 9:
            {
                emailViewDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 13:
            case 22:
            {
                settingsDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 14:
            case 17:
            {
                toDoListDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 15:
            {
                toDoViewDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 18:
            {
                missionRepeatDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 19:
            {
                missionStatsDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 20:
            {
                jobListDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            case 21:
            {
                emailResponseDataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
            default:
            {
                dataProviderUI[slotID] = arguments.slice(2);
                break;
            } 
        } // End of switch
    } // End of the function
    function DISPLAY_VIEW(_viewID, _currentID)
    {
        if (_viewID == 0)
        {
            this.SHUTDOWN_MOVIE();
        } // end if
        if (_currentID == undefined)
        {
            _currentID = 0;
            if (_viewID == 1)
            {
                _currentID = 4;
            } // end if
        } // end if
        lastViewID = _viewID;
        lastCurrentID = _currentID;
        var _loc4 = true;
        if (componentArray[_viewID] != componentArray[previousViewID])
        {
            _loc4 = false;
            currentlyLoadedApp = undefined;
        } // end if
        previousViewID = _viewID;
        if (currentlyLoadedApp == undefined && loadingApp == undefined)
        {
            this.LOAD_APP(componentArray[_viewID]);
        }
        else
        {
            this.CELLPHONE_APP(_currentID, componentArray[_viewID], _loc4);
        } // end else if
        return (true);
    } // End of the function
    function CELLPHONE_APP(_currentID, _appString, isSameView)
    {
        if (applayer[_appString] == undefined)
        {
            if (currentlyLoadedApp == _appString && loadingApp == undefined)
            {
                this.LOAD_APP(_appString);
            } // end if
        }
        else
        {
            cellphoneApp.currentID = _currentID;
            cellphoneApp.currentStyle = currentStyle;
            if (currentInterface != cellphoneApp)
            {
                cellphoneApp._name = currentlyLoadedApp;
                cellphoneApp.gfxFileName = gfxFileName;
                cellphoneApp.TextBlackHex = TextBlackHex;
                cellphoneApp.TextWhiteHex = TextWhiteHex;
                cellphoneApp.TextGreyHex = TextGreyHex;
                cellphoneApp.whiteRGB = whiteRGB;
                cellphoneApp.offWhiteRGB = offWhiteRGB;
                cellphoneApp.greyRGB = greyRGB;
                cellphoneApp.darkGreyRGB = darkGreyRGB;
                cellphoneApp.blackRGB = blackRGB;
                cellphoneApp.construct(dataProviderUI);
                this.createTransition(currentInterface, cellphoneApp);
                currentInterface = cellphoneApp;
            }
            else if (isSameView == true)
            {
                cellphoneApp.construct(dataProviderUI);
            }
            else
            {
                cellphoneApp.populateContent(dataProviderUI);
            } // end else if
            if (infoBar.headerBackground._visible == true)
            {
                infoBar.headerText._visible = true;
            } // end if
            this.COLOUR_HEADERBAR();
        } // end else if
        return (true);
    } // End of the function
    function SHUTDOWN_MOVIE()
    {
        if (currentInterface == cellphoneApp)
        {
            this.REQUEST_REMOVE_APP(currentInterface._name);
        }
        else
        {
            currentInterface.CLEAN_UP_DATA();
        } // end else if
        if (previousInterface == cellphoneApp)
        {
            this.REQUEST_REMOVE_APP(previousInterface._name);
        }
        else
        {
            previousInterface.CLEAN_UP_DATA();
        } // end else if
    } // End of the function
    function LOAD_APP(fileToLoad)
    {
        com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG", com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE, 9, 0);
        loadingApp = fileToLoad;
        if (fileToLoad.substr(0, 4) == "APP_")
        {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_GFX_STREAM", com.rockstargames.ui.game.GameInterface.WEB_TYPE, uid, fileToLoad, gfxFileName);
            ++uid;
        }
        else
        {
            if (applayer[fileToLoad] == undefined)
            {
                var _loc3 = 20000 + lastViewID;
                var _loc4 = applayer.attachMovie(fileToLoad, fileToLoad, _loc3);
            } // end if
            currentlyLoadedApp = fileToLoad;
            loadingApp = undefined;
            cellphoneApp = applayer[currentlyLoadedApp];
            cellphoneApp._name = fileToLoad;
            this.CELLPHONE_APP(lastCurrentID, currentlyLoadedApp, false);
        } // end else if
    } // End of the function
    function STREAM_RESPONSE(uid, fileToLoad)
    {
        loadingApp = fileToLoad;
        currentlyLoadedApp = fileToLoad;
        var _loc4 = 20000 + lastViewID;
        var _loc3 = applayer.createEmptyMovieClip(fileToLoad, _loc4);
        _loc3._name = fileToLoad;
        app_loader = new MovieClipLoader();
        app_loader.addListener(this);
        app_loader.loadClip(fileToLoad, _loc3);
    } // End of the function
    function STREAM_RESPONSE_FAILED(uid)
    {
        this.LOAD_APP(loadingApp);
    } // End of the function
    function onLoadInit(target_mc)
    {
        app_loader.removeListener(this);
        app_loader = null;
        if (loadingApp == componentArray[lastViewID])
        {
            currentlyLoadedApp = loadingApp;
            loadingApp = undefined;
            cellphoneApp = applayer[currentlyLoadedApp].TIMELINE;
            this.CELLPHONE_APP(lastCurrentID, currentlyLoadedApp, false);
        }
        else
        {
            this.REQUEST_REMOVE_APP(loadingApp);
            loadingApp = undefined;
            currentlyLoadedApp = componentArray[lastViewID];
            this.CELLPHONE_APP(lastCurrentID, componentArray[lastViewID], false);
        } // end else if
    } // End of the function
    function onLoadError(target_mc)
    {
        app_loader.removeListener(this);
        app_loader = null;
    } // End of the function
    function REQUEST_REMOVE_APP(whichMC)
    {
        if (whichMC != "SHUTDOWN_MOVIE")
        {
            if (applayer[whichMC] != undefined)
            {
                applayer[whichMC].TIMELINE.CLEAN_UP_DATA();
                applayer[whichMC].TIMELINE.CLOSE_APP();
                delete applayer[whichMC];
                applayer[whichMC].removeMovieClip();
                if (whichMC.substr(0, 4) == "APP_")
                {
                    com.rockstargames.ui.game.GameInterface.call("REQUEST_REMOVAL", com.rockstargames.ui.game.GameInterface.WEB_TYPE, whichMC, gfxFileName);
                } // end if
            } // end if
            if (lastViewID != previousViewID)
            {
                this.SET_DATA_SLOT_EMPTY(previousViewID);
            } // end if
        } // end if
        flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION", 0, gfxFileName);
        return (true);
    } // End of the function
    function REMOVE_CHILD_MOVIE(whichMC)
    {
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        currentInterface.TXD_HAS_LOADED(textureDict, success, uniqueID);
    } // End of the function
    function TXD_ALREADY_LOADED(textureDict, uniqueID)
    {
        this.TXD_HAS_LOADED(textureDict, true, uniqueID);
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        currentInterface.ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        if (loadingApp == undefined)
        {
            switch (direction)
            {
                case 1:
                {
                    currentInterface.navigate("UP");
                    break;
                } 
                case 2:
                {
                    currentInterface.navigate("RIGHT");
                    break;
                } 
                case 3:
                {
                    currentInterface.navigate("DOWN");
                    break;
                } 
                case 4:
                {
                    currentInterface.navigate("LEFT");
                    break;
                } 
            } // End of switch
        } // end if
    } // End of the function
    function createTransition(previousClip, currentClip)
    {
        this.updateInfoBar(currentClip);
        this.updateSoftKeys(currentClip);
        if (currentClip.isLandscape == true)
        {
            currentClip.container._x = 0;
            currentClip.container._y = 256;
        }
        else
        {
            currentClip.container._x = 0;
            currentClip.container._y = 0;
        } // end else if
        currentClip.SHOW();
        this.REQUEST_REMOVE_APP(previousClip._name);
    } // End of the function
    var currentHour = 0;
    var currentMinute = 0;
    var currentDay = "";
    var backgroundImage = 0;
    var uid = 1;
    var currentInterface = undefined;
    var previousInterface = undefined;
    var providerIcon = 0;
    var signalStrength = 5;
    var gfxFileName = "CELLPHONE_FACADE";
    var TextWhiteHex = 16777215;
    var TextBlackHex = 0;
    var TextGreyHex = 9211020;
    var whiteRGB = new Array(255, 255, 255);
    var offWhiteRGB = new Array(235, 235, 235);
    var greyRGB = new Array(140, 140, 140);
    var darkGreyRGB = new Array(50, 54, 59);
    var blackRGB = new Array(0, 0, 0);
    var style = new Array();
} // End of Class
#endinitclip
