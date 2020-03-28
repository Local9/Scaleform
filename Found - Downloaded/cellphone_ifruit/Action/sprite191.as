// Action script...

// [Initial MovieClip Action of sprite 191]
#initclip 1
class com.rockstargames.gtav.cellphone.ifruit.CELLPHONE_IFRUIT extends MovieClip
{
    var TIMELINE, CONTENT, BOUNDING_BOX, dataProviderUI, homemenuDataProviderUI, contactsDataProviderUI, callscreenDataProviderUI, emailListDataProviderUI, emailViewDataProviderUI, emailResponseDataProviderUI, messageListDataProviderUI, messageViewDataProviderUI, jobListDataProviderUI, settingsDataProviderUI, toDoListDataProviderUI, toDoViewDataProviderUI, missionRepeatDataProviderUI, missionStatsDataProviderUI, applayer, infoBar, cellphoneButtons, componentArray, backgroundImageArray, currentStyle, loadingApp, wallpaper_loader, lastViewID, lastCurrentID, previousViewID, currentlyLoadedApp, cellphoneApp, app_loader;
    function CELLPHONE_IFRUIT()
    {
        super();
        _global.gfxExtensions = true;
        style.push(new Array([152, 182, 230], [90, 151, 232], whiteRGB, offWhiteRGB, [210, 210, 210]));
        style.push(new Array([32, 132, 39], [57, 160, 51], whiteRGB, offWhiteRGB, [210, 210, 210]));
        style.push(new Array([174, 37, 37], [115, 16, 16], whiteRGB, offWhiteRGB, [210, 210, 210]));
        style.push(new Array([230, 113, 43], [213, 121, 47], whiteRGB, offWhiteRGB, [210, 210, 210]));
        style.push(new Array([125, 125, 125], [100, 100, 100], whiteRGB, offWhiteRGB, [210, 210, 210]));
        style.push(new Array([86, 12, 123], [159, 99, 189], whiteRGB, offWhiteRGB, [210, 210, 210]));
        style.push(new Array([219, 56, 146], [208, 95, 161], whiteRGB, offWhiteRGB, [210, 210, 210]));
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
        componentArray = ["SHUTDOWN_MOVIE", "HOMEMENU", "CONTACTLIST", "", "CALLSCREEN", "", "TEXT_MESSAGE_LIST", "TEXT_MESSAGE_VIEW", "EMAIL_LIST", "EMAIL_VIEW", "", "APP_NUMBERPAD", "", "SETTINGS", "APP_TODO_LIST", "APP_TODO_VIEW", "SHUTTER", "APP_TODO_VIEW", "MISSION_REPEAT_LIST", "APP_MISSION_STATS_VIEW", "JOB_LIST", "EMAIL_RESPONSE", "SETTINGS", "APP_TRACKIFY"];
        backgroundImageArray = ["Phone_Wallpaper_iFruit_b", "Phone_Wallpaper_Badger_b", "Phone_Wallpaper_Whizz_b", "Phone_Wallpaper_Tinkle_b", "Phone_Wallpaper_Swingers_b", "Phone_Wallpaper_Pisswasser_b", "Phone_Wallpaper_Sprunk_b", "Phone_Wallpaper_RSR_b", "Phone_Wallpaper_Poppy_b", "Phone_Wallpaper_Panic_b", "Phone_Wallpaper_Benders_b", "Phone_Wallpaper_Corkers_b", "Phone_Wallpaper_Devils_b", "Phone_Wallpaper_Feud_b", "Phone_Wallpaper_Jardineros_b", "Phone_Wallpaper_Shrimps_b", "Phone_Wallpaper_Squeezers_b", "Phone_Wallpaper_Swingers2_b"];
        currentStyle = style[0];
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
    function SET_SOFT_KEYS(buttonID, isVisible, iconEnum)
    {
        var _loc3 = ["positiveButton", "otherButton", "negativeButton"];
        var _loc2 = _loc3[buttonID - 1];
        cellphoneButtons[_loc2]._visible = isVisible;
        cellphoneButtons[_loc2].gotoAndStop(com.rockstargames.gtav.cellphone.SoftKeyLabels.SOFTKEYS[iconEnum][1]);
    } // End of the function
    function toggleCellphoneButtonsVisible(isVisible)
    {
        CONTENT.cellphoneButtons._visible = isVisible;
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
            infoBar.timeBar._x = 172;
            infoBar.sleepModeIcon._x = 290;
            infoBar.headerText._width = 344;
            infoBar.headerBackground._width = 344;
        }
        else
        {
            infoBar.gotoAndStop("PORTRAIT");
            infoBar._rotation = 0;
            infoBar._x = 0;
            infoBar.timeBar._x = 128;
            infoBar.sleepModeIcon._x = 203;
            infoBar.headerText._width = 256;
            infoBar.headerBackground._width = 256;
        } // end else if
        infoBar.badgerIcon.gotoAndStop(providerIcon * 20);
        infoBar.signalStrengthIcon.gotoAndStop(6 - signalStrength);
        this.SET_TITLEBAR_TIME();
    } // End of the function
    function REPLACE_BACKGROUND_IMAGE(image_enum, image_string)
    {
        backgroundImageArray[image_enum] = image_string;
    } // End of the function
    function SET_BACKGROUND_IMAGE(image_enum, removeOnly)
    {
        var _loc2 = CONTENT.phoneBackground.bgMC;
        if (_loc2 != undefined)
        {
            _loc2.removeMovieClip();
            var _loc3 = backgroundImageArray[backgroundImage];
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, _loc3);
        } // end if
        backgroundImage = image_enum;
        if (removeOnly != true)
        {
            _loc2 = CONTENT.phoneBackground.createEmptyMovieClip("bgMC", CONTENT.phoneBackground.getNextHighestDepth());
            _loc2._alpha = 90;
            _loc3 = backgroundImageArray[image_enum];
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, _loc3, "wallpaper", true);
            CONTENT.phoneBackground._visible = true;
        } // end if
    } // End of the function
    function LOAD_BACKGROUND(txdString)
    {
        wallpaper_loader = new MovieClipLoader();
        wallpaper_loader.addListener(this);
        var _loc2 = "img://" + txdString + "/" + txdString;
        wallpaper_loader.loadClip(_loc2, CONTENT.phoneBackground.bgMC);
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
        infoBar.headerText.textColor = TextWhiteHex;
        com.rockstargames.ui.utils.Colour.Colourise(infoBar.headerBackground, currentStyle[0][0], currentStyle[0][1], currentStyle[0][2], 100);
        currentInterface.currentStyle = currentStyle;
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewID)
    {
        switch (viewID)
        {
            case 2:
            {
                contactsDataProviderUI = [];
                break;
            } 
            case 4:
            {
                callscreenDataProviderUI = [];
                break;
            } 
            case 6:
            {
                messageListDataProviderUI = [];
                break;
            } 
            case 7:
            {
                messageViewDataProviderUI = [];
                break;
            } 
            case 8:
            {
                emailListDataProviderUI = [];
                break;
            } 
            case 9:
            {
                emailViewDataProviderUI = [];
                break;
            } 
            case 13:
            case 22:
            {
                settingsDataProviderUI = [];
                break;
            } 
            case 14:
            case 17:
            {
                toDoListDataProviderUI = [];
                break;
            } 
            case 15:
            {
                toDoViewDataProviderUI = [];
                break;
            } 
            case 18:
            {
                missionRepeatDataProviderUI = [];
                break;
            } 
            case 19:
            {
                missionStatsDataProviderUI = [];
                break;
            } 
            case 20:
            {
                jobListDataProviderUI = [];
                break;
            } 
            case 21:
            {
                emailResponseDataProviderUI = [];
                break;
            } 
            default:
            {
                dataProviderUI = [];
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
                this.createIfruitTransition(currentInterface, cellphoneApp);
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
        this.SET_BACKGROUND_IMAGE(0, true);
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
        if (target_mc != CONTENT.phoneBackground.bgMC)
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
        }
        else
        {
            wallpaper_loader.removeListener(this);
            wallpaper_loader = null;
            CONTENT.phoneBackground.bgMC._width = 256;
            CONTENT.phoneBackground.bgMC._height = 344;
            CONTENT.phoneBackground.bgMC._x = 0;
            CONTENT.phoneBackground.bgMC._y = 0;
        } // end else if
    } // End of the function
    function onLoadError(targetMC)
    {
        if (targetMC == CONTENT.phoneBackground.bgMC)
        {
            wallpaper_loader.removeListener(this);
            wallpaper_loader = null;
        }
        else
        {
            app_loader.removeListener(this);
            app_loader = null;
        } // end else if
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
        if (uniqueID == "wallpaper")
        {
            this.LOAD_BACKGROUND(textureDict);
        }
        else
        {
            currentInterface.TXD_HAS_LOADED(textureDict, success, uniqueID);
        } // end else if
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
    function createIfruitTransition(previousClip, currentClip)
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
        if (currentClip._name == "HOMEMENU")
        {
            this.IFRUIT_TRANSITION_IN(currentClip);
        } // end if
        currentClip._visible = true;
        this.REQUEST_REMOVE_APP(previousClip._name);
        if (lastViewID != 14 && lastViewID != 15 && lastViewID != 17 && lastViewID != 20)
        {
            com.rockstargames.ui.utils.Colour.Colourise(infoBar.headerBackground, currentStyle[0][0], currentStyle[0][1], currentStyle[0][2], 100);
        } // end if
    } // End of the function
    function IFRUIT_TRANSITION_IN(currentClip)
    {
        currentClip.container._alpha = 0;
        currentClip.container.reflectionBar._alpha = 0;
        if (currentClip.container.reflectionBar != undefined)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(currentClip.container.reflectionBar, iFruitTransitionTime / 2, {_alpha: 100, delay: iFruitTransitionTime, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteScope: this, onCompleteArgs: [currentClip.container.reflectionBar]});
        } // end if
        currentClip.container._xscale = 50;
        currentClip.container._yscale = 50;
        currentClip.container._x = 64;
        currentClip.container._y = 86;
        if (currentClip.container != undefined)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(currentClip.container, iFruitTransitionTime, {_alpha: 100, _x: 0, _y: 0, _xscale: 100, _yscale: 100, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteScope: this, onCompleteArgs: [currentClip.container]});
        } // end if
        currentClip._visible = true;
    } // End of the function
    var currentHour = 0;
    var currentMinute = 0;
    var currentDay = "";
    var backgroundImage = 0;
    var uid = 1;
    var currentInterface = undefined;
    var previousInterface = undefined;
    var iFruitTransitionTime = 0.250000;
    var providerIcon = 0;
    var signalStrength = 5;
    var gfxFileName = "CELLPHONE_IFRUIT";
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
