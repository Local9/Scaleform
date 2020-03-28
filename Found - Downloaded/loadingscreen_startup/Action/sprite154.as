// Action script...

// [Initial MovieClip Action of sprite 154]
#initclip 2
class com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var gfxName, TIMELINE, loadingScreenOrder, LEGALROCKSTAR, LEGALSCREEN, CONTENT, legalOverlay, PROGRESS_BAR, GTAV_LOGO, PROGRESS_TEXT, LOADING_BUTTONS, loadingScreenHolder, currentScreenIndex, animationDoneName, intervalId, activeLoadingScreen, previousScreenIndex, ml, mlListener, activeLoadingScreenObject, overlay, bgOverlay;
    function LOADINGSCREEN_STARTUP()
    {
        super();
        _global.gfxExtensions = true;
        gfxName = "LOADINGSCREEN_STARTUP";
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        TIMELINE = mc;
        TIMELINE.isAmerican = false;
        var _loc8 = {texture: "MCBackgroundBeachGirl", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 20}, tweenTo: {_yrotation: -6, _xrotation: 5}};
        var _loc5 = {texture: "MCCharacterBeachGirl", setup: {_width: 343, _height: 629, _x: 480, _y: 95}, tweenTo: {_x: 720}};
        loadingScreens.push({txd: "loadingscreen_builtin0", isInFla: true, layers: [_loc8, _loc5]});
        var _loc11 = {texture: "MCBackgroundFrisk", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 20}, tweenTo: {_yrotation: -3, _xrotation: 5}};
        var _loc9 = {texture: "MCCharacterFrisk", setup: {_width: 756, _height: 667, _x: 740, _y: 90}, tweenTo: {_x: 550}};
        loadingScreens.push({txd: "loadingscreen_builtin1", isInFla: true, layers: [_loc11, _loc9]});
        var _loc20 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 16}, tweenTo: {_yrotation: -8}};
        var _loc17 = {texture: "foreground", setup: {_width: 297, _height: 599, _x: 360, _y: 140, _yrotation: 16}, tweenTo: {_x: 560}};
        loadingScreens.push({txd: "loadingscreen0", layers: [_loc20, _loc17]});
        var _loc18 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 12}, tweenTo: {_yrotation: -12}};
        var _loc15 = {texture: "foreground", setup: {_width: 503, _height: 206, _x: 300, _y: 465}, tweenTo: {_x: 480}};
        var _loc23 = {texture: "foreground_franklin", setup: {_width: 368, _height: 588, _x: 440, _y: 140}, tweenTo: {_x: 745}};
        loadingScreens.push({txd: "loadingscreen1", layers: [_loc18, _loc15, _loc23]});
        var _loc16 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 12}, tweenTo: {_yrotation: -10, _xrotation: 5}};
        var _loc13 = {texture: "foreground", setup: {_width: 311, _height: 558, _x: 745, _y: 200}, tweenTo: {_x: 450}};
        var _loc21 = {texture: "foreground_chop", isInFla: true, setup: {_width: 320, _height: 512, _x: 640, _y: 260}, tweenTo: {_x: 310}};
        loadingScreens.push({txd: "loadingscreen2", layers: [_loc16, _loc13, _loc21]});
        var _loc14 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 110, _y: 95, _yrotation: 12}, tweenTo: {_yrotation: -4}};
        var _loc12 = {texture: "foreground_car", isInFla: true, setup: {_width: 710, _height: 379, _x: 580, _y: 406}, tweenTo: {_x: 700}};
        var _loc19 = {texture: "foreground", setup: {_width: 412, _height: 609, _x: 440, _y: 120}, tweenTo: {_x: 730}};
        loadingScreens.push({txd: "loadingscreen3", layers: [_loc14, _loc12, _loc19]});
        var _loc30 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _xrotation: -10, _yrotation: 16}, tweenTo: {_yrotation: -5, _xrotation: 10}};
        var _loc28 = {texture: "foreground", setup: {_width: 251, _height: 643, _x: 400, _y: 85}, tweenTo: {_x: 250}};
        loadingScreens.push({txd: "loadingscreen4", layers: [_loc30, _loc28]});
        var _loc29 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 15}, tweenTo: {_yrotation: -8}};
        var _loc26 = {texture: "foreground", setup: {_width: 550, _height: 284, _x: 300, _y: 380}, tweenTo: {_x: 450}};
        var _loc3 = {texture: "foreground_michael", setup: {_width: 357, _height: 633, _x: 450, _y: 95}, tweenTo: {_x: 700}};
        loadingScreens.push({txd: "loadingscreen5", layers: [_loc29, _loc26, _loc3]});
        var _loc27 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 25}, tweenTo: {_yrotation: 0, _xrotation: 5}};
        var _loc24 = {texture: "foreground", setup: {_width: 367, _height: 603, _x: 410, _y: 115}, tweenTo: {_x: 800}};
        loadingScreens.push({txd: "loadingscreen6", layers: [_loc27, _loc24]});
        var _loc25 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 12}, tweenTo: {_yrotation: -8, _xrotation: 5}};
        var _loc22 = {texture: "foreground", setup: {_width: 311, _height: 625, _x: 860, _y: 95}, tweenTo: {_x: 520}};
        loadingScreens.push({txd: "loadingscreen7", layers: [_loc25, _loc22]});
        var _loc10 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 12}, tweenTo: {_yrotation: -12, _xrotation: 5}};
        var _loc6 = {texture: "foreground", setup: {_width: 492, _height: 497, _x: 400, _y: 190}, tweenTo: {_x: 660}};
        loadingScreens.push({txd: "loadingscreen8", layers: [_loc10, _loc6]});
        var _loc7 = {texture: "background", setup: {_width: 1024, _height: 512, _x: 98, _y: 95, _yrotation: 18}, tweenTo: {_yrotation: -3, _xrotation: 5}};
        var _loc4 = {texture: "foreground", setup: {_width: 306, _height: 557, _x: 320, _y: 160}, tweenTo: {_x: 650}};
        loadingScreens.push({txd: "loadingscreen9", layers: [_loc7, _loc4]});
        var _loc31 = this.randRange(0, 5);
        switch (_loc31)
        {
            case 0:
            case 1:
            {
                loadingScreenOrder = new Array(0, 3, 2, 10, 9, 8, 6, 11, 5, 4, 1, 7);
                break;
            } 
            case 2:
            {
                loadingScreenOrder = new Array(1, 4, 6, 11, 5, 7, 9, 3, 0, 10, 2, 8);
                break;
            } 
            case 3:
            {
                loadingScreenOrder = new Array(0, 7, 5, 3, 1, 10, 2, 8, 9, 4, 6, 11);
                break;
            } 
            case 4:
            {
                loadingScreenOrder = new Array(1, 8, 9, 4, 5, 11, 0, 7, 6, 3, 2, 10);
                break;
            } 
            case 5:
            {
                loadingScreenOrder = new Array(0, 10, 5, 7, 9, 4, 2, 11, 1, 8, 6, 3);
                break;
            } 
            default:
            {
                loadingScreenOrder = new Array(1, 11, 2, 8, 9, 3, 6, 7, 5, 4, 0, 10);
                break;
            } 
        } // End of switch
    } // End of the function
    function randRange(min, max)
    {
        var _loc1 = Math.floor(Math.random() * (max - min + 1)) + min;
        return (_loc1);
    } // End of the function
    function START()
    {
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
    {
        isWideScreen = _isWideScreen;
        isHiDef = _isHiDef;
        if (isWideScreen == false)
        {
            _screenWidthPixels = 960;
            _screenHeightPixels = 720;
            Stage.scaleMode = "noBorder";
            safeLeft = 160 + Math.round(_safeLeftPercent * _screenWidthPixels);
            safeRight = Math.round((1 - _safeRightPercent) * _screenWidthPixels) - 160;
        }
        else
        {
            safeLeft = Math.round(_safeLeftPercent * _screenWidthPixels);
            safeRight = Math.round((1 - _safeRightPercent) * _screenWidthPixels);
        } // end else if
        safeTop = Math.round(_safeTopPercent * _screenHeightPixels);
        safeBottom = Math.round((1 - _safeBottomPercent) * _screenHeightPixels);
        screenWidth = _screenWidthPixels;
        screenHeight = _screenHeightPixels;
        this.isAmericanBuild();
        this.initLogo();
        this.initButtons();
        this.initProgressBar();
    } // End of the function
    function SET_CONTEXT(view)
    {
        currentView = view;
        switch (view)
        {
            case 0:
            {
                break;
            } 
            case 1:
            {
                this.LEGAL();
                break;
            } 
            case 2:
            {
                this.fadeLegals();
                this.INSTALL();
                break;
            } 
            case 3:
            {
                this.fadeLegals();
                this.SWITCH();
                break;
            } 
        } // End of switch
    } // End of the function
    function fadeLegals()
    {
        if (LEGALROCKSTAR || LEGALSCREEN)
        {
            legalOverlay = this.createOverlay(CONTENT, CONTENT.getNextHighestDepth() + 1000);
            com.rockstargames.ui.tweenStar.TweenStarLite.to(legalOverlay, 1, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT, onComplete: removeLegals, onCompleteScope: this});
        } // end if
    } // End of the function
    function removeLegals()
    {
        if (LEGALROCKSTAR != undefined)
        {
            LEGALROCKSTAR.removeMovieClip();
        } // end if
        if (LEGALSCREEN != undefined)
        {
            LEGALSCREEN.removeMovieClip();
        } // end if
        this.fadeAndRemoveMovieClip(legalOverlay, 3);
    } // End of the function
    function fixJustifiedLegalText(tf, offset)
    {
        if (isNaN(offset))
        {
            offset = 0;
        } // end if
        tf._visible = false;
        var _loc10 = tf.text;
        var _loc8 = _loc10.split("<br>");
        var _loc6 = tf._parent.createEmptyMovieClip("legalTextFields", tf._parent.getNextHighestDepth());
        _loc6._x = tf._x;
        _loc6._y = tf._y;
        var _loc9 = 0;
        var _loc7 = 24;
        for (var _loc4 = 0; _loc4 < _loc8.length; ++_loc4)
        {
            var _loc3 = new TextFormat();
            _loc3.font = "$Font2";
            _loc3.size = tf.getTextFormat().size;
            _loc3.color = 13421772;
            _loc3.align = "justify";
            var _loc2 = _loc6.createTextField("tf" + _loc4, _loc6.getNextHighestDepth(), 0, _loc9, tf._width, _loc7);
            _loc2.multiline = true;
            _loc2.wordWrap = true;
            _loc2.embedFonts = true;
            _loc2.htmlText = _loc8[_loc4];
            _loc2.setTextFormat(_loc3);
            if (_loc2.textHeight <= _loc7)
            {
                _loc3.align = "left";
            } // end if
            _loc2.autoSize = "left";
            _loc2.setTextFormat(_loc3);
            _loc9 = _loc9 + (_loc2._height + 12);
        } // end of for
        _loc6._y = screenHeight / 2 - _loc6._height / 2 - offset;
    } // End of the function
    function isAmericanBuild()
    {
        com.rockstargames.ui.game.GameInterface.call("IS_AMERICAN_BUILD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, TIMELINE);
    } // End of the function
    function LEGAL(savingLabel, SocialClubLabel, loadingLabel)
    {
        var _loc2 = new TextFormat();
        _loc2.font = "$Font2";
        _loc2.color = 13421772;
        if (LEGALSCREEN == undefined)
        {
            LEGALSCREEN = CONTENT.attachMovie("legalScreenMC", "legalScreenMC", CONTENT.getNextHighestDepth());
        } // end if
        if (LEGALROCKSTAR == undefined)
        {
            LEGALROCKSTAR = CONTENT.attachMovie("legalRockstarMC", "legalRockstarMC", CONTENT.getNextHighestDepth());
        } // end if
        LEGALROCKSTAR.LEGAL_TEXT.html = false;
        LEGALROCKSTAR.LEGAL_TEXT.multiline = true;
        LEGALROCKSTAR.LEGAL_TEXT.autoSize = true;
        var _loc3;
        if (TIMELINE.isAmerican == true)
        {
            _loc3 = "LEGAL_ROCKSTAR_US";
        }
        else
        {
            _loc3 = "LEGAL_ROCKSTAR";
        } // end else if
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(LEGALROCKSTAR.LEGAL_TEXT, _loc3, 0, false);
        this.fixJustifiedLegalText(LEGALROCKSTAR.LEGAL_TEXT);
        LEGALROCKSTAR._alpha = 0;
        LEGALSCREEN.loading._visible = false;
        LEGALSCREEN.spinner._visible = false;
        LEGALSCREEN.scstar._visible = false;
        LEGALSCREEN.LEGAL_TEXT.html = false;
        LEGALSCREEN.LEGAL_TEXT.multiline = true;
        LEGALSCREEN.LEGAL_TEXT.autoSize = true;
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(LEGALSCREEN.LEGAL_TEXT, "LEGAL_SPLASH", 0, false);
        this.fixJustifiedLegalText(LEGALSCREEN.LEGAL_TEXT, 75);
        LEGALSCREEN._alpha = 0;
        if (loadingLabel != undefined)
        {
            LEGALSCREEN.LOADING_SPINNER.autoSize = true;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(LEGALSCREEN.LOADING_SPINNER, loadingLabel, 0, false);
            LEGALSCREEN.LOADING_SPINNER.setTextFormat(_loc2);
            if (LEGALSCREEN.LOADING_SPINNER.textHeight > 22)
            {
                LEGALSCREEN.LOADING_SPINNER._y = LEGALSCREEN.LOADING_SPINNER._y - 10;
            } // end if
            LEGALSCREEN.loading._visible = true;
        } // end if
        if (savingLabel != undefined)
        {
            LEGALSCREEN.SAVING_SPINNER.autoSize = true;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(LEGALSCREEN.SAVING_SPINNER, savingLabel, 0, false);
            LEGALSCREEN.SAVING_SPINNER.setTextFormat(_loc2);
            if (LEGALSCREEN.SAVING_SPINNER.textHeight > 22)
            {
                LEGALSCREEN.SAVING_SPINNER._y = LEGALSCREEN.SAVING_SPINNER._y - 10;
            } // end if
            LEGALSCREEN.spinner._visible = true;
        } // end if
        if (SocialClubLabel != undefined)
        {
            LEGALSCREEN.CLOUD_SPINNER.autoSize = true;
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(LEGALSCREEN.CLOUD_SPINNER, SocialClubLabel, 0, false);
            LEGALSCREEN.CLOUD_SPINNER.setTextFormat(_loc2);
            if (LEGALSCREEN.CLOUD_SPINNER.textHeight > 22)
            {
                LEGALSCREEN.CLOUD_SPINNER._y = LEGALSCREEN.CLOUD_SPINNER._y - 10;
            } // end if
            LEGALSCREEN.scstar._visible = true;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(LEGALROCKSTAR, 1, {_alpha: 100, onComplete: removeRockstarSplash, onCompleteScope: this});
    } // End of the function
    function fadeAndRemoveMovieClip(fadeMc, fadeDuration)
    {
        if (isNaN(fadeDuration))
        {
            fadeDuration = 1;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(fadeMc, fadeDuration, {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT, onComplete: remove, onCompleteScope: this, onCompleteArgs: {removeMc: fadeMc}});
    } // End of the function
    function remove(removeMc)
    {
        removeMc.removeMovieClip();
    } // End of the function
    function removeRockstarSplash()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(LEGALROCKSTAR, 1, {delay: 4, _alpha: 0, onComplete: remove, onCompleteScope: this, onCompleteArgs: {removeMc: LEGALROCKSTAR}});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(LEGALSCREEN, 1, {delay: 5, _alpha: 100});
    } // End of the function
    function INSTALL()
    {
        PROGRESS_BAR._visible = false;
        GTAV_LOGO._visible = true;
        this.STARTUP_LOADINGSCREENS();
        this.SET_PROGRESS_TEXT(" / ");
        currentView = 2;
        this.SET_BUTTONS(2, 33);
    } // End of the function
    function SWITCH()
    {
        PROGRESS_TEXT._visible = false;
        if (firstRun == true)
        {
            PROGRESS_BAR._visible = false;
            GTAV_LOGO._visible = true;
            this.HIDE_PROGRESS_TEXT();
            this.STARTUP_LOADINGSCREENS();
            currentView = 3;
        } // end if
    } // End of the function
    function TEST_BUTTONS(slot, icon, buttonText)
    {
        this.SET_DISPLAY_CONFIG(screenWidth, screenHeight, 0.055000, 0.945000, 0.055000, 0.945000, true);
        this.SET_BUTTONS(slot, icon, buttonText);
    } // End of the function
    function TEST_INSTALL()
    {
        this.SET_DISPLAY_CONFIG(screenWidth, screenHeight, 0.055000, 0.945000, 0.055000, 0.945000, true);
        this.SET_PROGRESS_TITLE("Installing");
        this.SET_PROGRESS_TEXT("8888 / 8888MB");
        this.SET_BUTTONS(2, 33);
    } // End of the function
    function updateButtonLayout()
    {
        LOADING_BUTTONS._visible = false;
        var _loc17 = LOADING_BUTTONS.SP_BUTTON;
        var _loc18 = LOADING_BUTTONS.MP_BUTTON;
        var _loc16 = LOADING_BUTTONS.SPECIAL_BUTTON;
        var _loc7 = PROGRESS_TEXT;
        var _loc19 = screenWidth - safeRight;
        var _loc13 = 2;
        var _loc12 = 8;
        var _loc11 = 24;
        var _loc8 = 6;
        var _loc15 = screenWidth - safeRight;
        var _loc6 = _loc8;
        var _loc14 = _loc8;
        if (_loc7._visible == true && String(_loc7.BUTTON.buttonTF.text).length < 1)
        {
            _loc7._visible = false;
        } // end if
        if (_loc7._visible == true)
        {
            _loc7.BUTTON.buttonTF._x = _loc8;
            _loc7.BUTTON.icon._x = _loc7.BUTTON.buttonTF._width + _loc12;
            if (_loc7.BUTTON.buttonTF._width < 95)
            {
                _loc14 = _loc14 + (95 + _loc11);
            }
            else
            {
                _loc14 = _loc14 + (_loc7.BUTTON.buttonTF._width + _loc11);
            } // end else if
            _loc14 = _loc14 + (_loc7.progressTitle._width + _loc8);
            _loc7.background._width = _loc14;
            _loc7.BUTTON._x = _loc14 - (_loc7.BUTTON.buttonTF._width + _loc11 + _loc8 + _loc8);
            _loc7.progressTitle._x = _loc8;
            _loc15 = _loc15 - _loc14;
            _loc7._x = _loc15;
            _loc15 = _loc15 - 3;
        } // end if
        var _loc10 = [_loc17, _loc18, _loc16];
        var _loc5 = [];
        var _loc9 = false;
        for (var _loc4 = 0; _loc4 < _loc10.length; ++_loc4)
        {
            var _loc2 = _loc10[_loc4];
            if (_loc2.buttonTF.text && _loc2.buttonTF.text != "")
            {
                if (_loc2.icon.spinner._visible == true && !_loc9)
                {
                    _loc9 = true;
                    _loc5.push(_loc2);
                }
                else
                {
                    _loc5.unshift(_loc2);
                } // end else if
            }
            else
            {
                _loc2._visible = false;
                _loc2._x = _loc8;
            } // end else if
            _loc2.buttonTF._x = 0;
            _loc2.icon._x = _loc2.buttonTF._width + _loc13;
        } // end of for
        for (var _loc3 = 0; _loc3 < _loc5.length; ++_loc3)
        {
            _loc2 = _loc5[_loc3];
            if (_loc3 > 0)
            {
                _loc6 = _loc6 + _loc12;
            } // end if
            _loc2._x = _loc6;
            _loc6 = _loc6 + (_loc2.buttonTF._width + _loc11);
            _loc2._visible = true;
            _loc2.buttonTF._visible = true;
            _loc2.icon._visible = true;
        } // end of for
        _loc6 = _loc6 + _loc8;
        LOADING_BUTTONS.background._width = _loc6;
        if (!isWideScreen)
        {
            LOADING_BUTTONS._xscale = LOADING_BUTTONS._yscale = 114;
        } // end if
        _loc15 = _loc15 - LOADING_BUTTONS._width;
        LOADING_BUTTONS._x = _loc15;
        if (_loc5.length > 0)
        {
            LOADING_BUTTONS._visible = true;
        } // end if
    } // End of the function
    function SET_BUTTONS(slot, icon, buttonText)
    {
        var _loc4 = LOADING_BUTTONS.SP_BUTTON;
        var _loc3 = LOADING_BUTTONS.MP_BUTTON;
        var _loc5 = LOADING_BUTTONS.SPECIAL_BUTTON;
        var _loc6;
        var _loc7 = new TextFormat();
        _loc7.font = "$Font2";
        switch (currentView)
        {
            case 2:
            {
                _loc4.icon.spinner._visible = false;
                _loc4.icon.button30._visible = false;
                _loc4.icon.button31._visible = false;
                _loc4.icon.button33._visible = false;
                _loc3.icon.spinner._visible = false;
                _loc3.icon.button30._visible = false;
                _loc3.icon.button31._visible = false;
                _loc3.icon.button33._visible = false;
                if (icon == 30)
                {
                    _loc3.icon.button30._visible = true;
                }
                else if (icon == 31)
                {
                    _loc3.icon.button31._visible = true;
                }
                else if (icon == 33)
                {
                    _loc3.icon.button33._visible = true;
                } // end else if
                if (icon != undefined && icon != 0)
                {
                    _loc3.buttonTF.autoSize = true;
                    com.rockstargames.ui.utils.Localisation.setTextWithTranslation(LOADING_BUTTONS.MP_BUTTON.buttonTF, "IB_SOCIAL_CLUB", 0, false);
                    _loc4.buttonTF.text = "";
                    _loc4.buttonTF._visible = false;
                    _loc4.icon._visible = false;
                    _loc4._visible = false;
                    _loc3._visible = true;
                } // end if
                break;
            } 
            case 3:
            {
                if (slot == 0)
                {
                    _loc4.icon.spinner._visible = false;
                    _loc4.icon.button30._visible = false;
                    _loc4.icon.button31._visible = false;
                    _loc4.icon.button33._visible = false;
                    _loc6 = "LOADING_SPLAYER";
                    if (icon == 44)
                    {
                        _loc4.icon.spinner._visible = true;
                        _loc6 = "LOADING_SPLAYER_L";
                    }
                    else if (icon == 30)
                    {
                        _loc4.icon.button30._visible = true;
                    }
                    else if (icon == 31)
                    {
                        _loc4.icon.button31._visible = true;
                    }
                    else if (icon == 33)
                    {
                        _loc4.icon.button33._visible = true;
                    } // end else if
                    if (icon != undefined && icon != 0)
                    {
                        LOADING_BUTTONS.SP_BUTTON.buttonTF.autoSize = true;
                        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(LOADING_BUTTONS.SP_BUTTON.buttonTF, _loc6, 0, false);
                        _loc4._visible = true;
                    } // end if
                } // end if
                if (slot == 1)
                {
                    _loc3.icon.spinner._visible = false;
                    _loc3.icon.button30._visible = false;
                    _loc3.icon.button31._visible = false;
                    _loc3.icon.button33._visible = false;
                    _loc6 = "LOADING_MPLAYER";
                    if (icon == 44)
                    {
                        _loc3.icon.spinner._visible = true;
                        _loc6 = "LOADING_MPLAYER_L";
                    }
                    else if (icon == 30)
                    {
                        _loc3.icon.button30._visible = true;
                    }
                    else if (icon == 31)
                    {
                        _loc3.icon.button31._visible = true;
                    }
                    else if (icon == 33)
                    {
                        _loc3.icon.button33._visible = true;
                    } // end else if
                    if (icon != undefined && icon != 0)
                    {
                        LOADING_BUTTONS.MP_BUTTON.buttonTF.autoSize = true;
                        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(LOADING_BUTTONS.MP_BUTTON.buttonTF, _loc6, 0, false);
                        _loc3._visible = true;
                    } // end if
                } // end if
                if (slot == 2)
                {
                    _loc5.icon.spinner._visible = false;
                    _loc5.icon.button30._visible = false;
                    _loc5.icon.button31._visible = false;
                    _loc5.icon.button33._visible = false;
                    if (icon == 44)
                    {
                        _loc5.icon.spinner._visible = true;
                    }
                    else if (icon == 30)
                    {
                        _loc5.icon.button30._visible = true;
                    }
                    else if (icon == 31)
                    {
                        _loc5.icon.button31._visible = true;
                    }
                    else if (icon == 33)
                    {
                        _loc5.icon.button33._visible = true;
                    } // end else if
                    if (icon != undefined && icon != 0 && buttonText)
                    {
                        LOADING_BUTTONS.SPECIAL_BUTTON.buttonTF.autoSize = true;
                        _loc5.buttonTF.text = buttonText;
                        _loc5._visible = true;
                    } // end if
                } // end if
                break;
            } 
        } // End of switch
        LOADING_BUTTONS.MP_BUTTON.buttonTF.setTextFormat(_loc7);
        LOADING_BUTTONS.SP_BUTTON.buttonTF.setTextFormat(_loc7);
        LOADING_BUTTONS.SPECIAL_BUTTON.buttonTF.setTextFormat(_loc7);
        this.updateButtonLayout();
    } // End of the function
    function HIDE_BUTTONS()
    {
        LOADING_BUTTONS.SP_BUTTON.buttonTF.text = "";
        LOADING_BUTTONS.SP_BUTTON._visible = false;
        LOADING_BUTTONS.MP_BUTTON.buttonTF.text = "";
        LOADING_BUTTONS.MP_BUTTON._visible = false;
        LOADING_BUTTONS.SPECIAL_BUTTON.buttonTF.text = "";
        LOADING_BUTTONS.SPECIAL_BUTTON._visible = false;
        LOADING_BUTTONS._visible = false;
        this.updateButtonLayout();
    } // End of the function
    function HIDE_PROGRESS_TEXT()
    {
        PROGRESS_TEXT._visible == false;
        this.updateButtonLayout();
    } // End of the function
    function SET_PROGRESS_BAR(percentage)
    {
    } // End of the function
    function SET_PROGRESS_TEXT(progressText)
    {
        if (progressText != undefined)
        {
            PROGRESS_TEXT.BUTTON.icon.button30._visible = false;
            PROGRESS_TEXT.BUTTON.icon.button31._visible = false;
            PROGRESS_TEXT.BUTTON.icon.button33._visible = false;
            PROGRESS_TEXT.BUTTON.icon.spinner._visible = true;
            PROGRESS_TEXT.BUTTON.buttonTF.autoSize = "right";
            PROGRESS_TEXT.BUTTON.buttonTF.htmlText = progressText;
            var _loc2 = new TextFormat();
            _loc2.font = "$Font2";
            PROGRESS_TEXT.BUTTON.buttonTF.setTextFormat(_loc2);
        } // end if
        if (PROGRESS_TEXT._visible == false)
        {
            PROGRESS_TEXT._visible = true;
        } // end if
        this.updateButtonLayout();
    } // End of the function
    function SET_PROGRESS_TITLE(progressTitle)
    {
        if (progressTitle != undefined)
        {
            PROGRESS_TEXT.BUTTON.icon.button30._visible = false;
            PROGRESS_TEXT.BUTTON.icon.button31._visible = false;
            PROGRESS_TEXT.BUTTON.icon.button33._visible = false;
            PROGRESS_TEXT.BUTTON.icon.spinner._visible = true;
            PROGRESS_TEXT.progressTitle.htmlText = progressTitle;
            PROGRESS_TEXT.progressTitle.autoSize = "right";
            var _loc2 = new TextFormat();
            _loc2.font = "$Font2";
            PROGRESS_TEXT.progressTitle.setTextFormat(_loc2);
        } // end if
        if (PROGRESS_TEXT._visible == false)
        {
            PROGRESS_TEXT._visible = true;
        } // end if
        this.updateButtonLayout();
    } // End of the function
    function initLogo()
    {
        if (GTAV_LOGO == undefined)
        {
            GTAV_LOGO = CONTENT.attachMovie("GTAV_LOGO_MC", "GTAV_LOGO", CONTENT.getDepth() + 2010);
        } // end if
        GTAV_LOGO._x = safeLeft;
        GTAV_LOGO._y = screenHeight - safeBottom;
        GTAV_LOGO._visible = false;
    } // End of the function
    function initButtons()
    {
        if (LOADING_BUTTONS == undefined)
        {
            LOADING_BUTTONS = CONTENT.attachMovie("instructionalButtonMC", "LOADING_BUTTONS", CONTENT.getDepth() + 2030);
        } // end if
        LOADING_BUTTONS._visible = false;
        LOADING_BUTTONS.MP_BUTTON._visible = false;
        LOADING_BUTTONS.SP_BUTTON._visible = false;
        LOADING_BUTTONS.SPECIAL_BUTTON._visible = false;
        LOADING_BUTTONS._x = screenWidth - safeRight;
        LOADING_BUTTONS._y = screenHeight - safeBottom;
    } // End of the function
    function initProgressBar()
    {
        if (PROGRESS_TEXT == undefined)
        {
            PROGRESS_TEXT = CONTENT.attachMovie("PROGRESS_TEXT_MC", "PROGRESS_TEXT", CONTENT.getDepth() + 2050, {_visible: false});
        } // end if
        PROGRESS_TEXT._y = screenHeight - safeBottom;
        PROGRESS_TEXT._visible = false;
    } // End of the function
    function STARTUP_LOADINGSCREENS()
    {
        if (legalOverlay)
        {
            this.removeLegals();
        } // end if
        if (!loadScreensArePlaying)
        {
            if (!loadingScreenHolder)
            {
                loadingScreenHolder = CONTENT.createEmptyMovieClip("loadingScreenHolder", nextDepth);
            } // end if
            this.updateScreenIndex();
            var _loc2 = this.getLoadingScreenObject(currentScreenIndex);
            this.loadTextures(_loc2.txd);
            nextScreenReady = true;
            animationDoneName = this.getLoadingScreenMovieClipName(0);
            this.startTransition(1);
            intervalId = setInterval(this, "SHOW_NEXT_LOADINGSCREEN", 500);
            loadScreensArePlaying = true;
        } // end if
    } // End of the function
    function SHOW_NEXT_LOADINGSCREEN()
    {
        if (this.texturesAreReadyAndAnimationIsDone())
        {
            this.updateScreenIndex();
            clearInterval(intervalId);
            intervalId = setInterval(this, "SHOW_NEXT_LOADINGSCREEN", timerDuration * 1000);
            nextScreenReady = false;
            animationDone = false;
            animationDoneName = "";
            this.startTransition();
            var _loc2 = this.getLoadingScreenObject(currentScreenIndex);
            this.loadTextures(_loc2.txd);
        }
        else
        {
            this.waitForLoadingScreen();
        } // end else if
    } // End of the function
    function waitForLoadingScreen()
    {
        clearInterval(intervalId);
        if (this.texturesAreReadyAndAnimationIsDone())
        {
            this.SHOW_NEXT_LOADINGSCREEN();
        }
        else
        {
            intervalId = setInterval(this, "waitForLoadingScreen", 1000);
        } // end else if
    } // End of the function
    function texturesAreReadyAndAnimationIsDone()
    {
        if (nextScreenReady == true && (animationDoneName == this.getLoadingScreenMovieClipName(0) || activeLoadingScreen._name))
        {
            return (true);
        }
        else
        {
            return (false);
        } // end else if
    } // End of the function
    function updateScreenIndex()
    {
        if (isNaN(currentScreenIndex))
        {
            currentScreenIndex = 0;
        }
        else
        {
            previousScreenIndex = currentScreenIndex;
            ++currentScreenIndex;
            if (currentScreenIndex >= loadingScreenOrder.length)
            {
                currentScreenIndex = 0;
            } // end if
        } // end else if
    } // End of the function
    function getLoadingScreenObject(index)
    {
        if (isNaN(index))
        {
            index = currentScreenIndex;
        } // end if
        var _loc2 = loadingScreenOrder[index];
        return (loadingScreens[_loc2]);
    } // End of the function
    function getLoadingScreenMovieClipName(index)
    {
        if (isNaN(index))
        {
            index = currentScreenIndex;
        } // end if
        var _loc3 = this.getLoadingScreenObject(index);
        return (_loc3.txd);
    } // End of the function
    function loadTextures(textureDict)
    {
        var _loc2 = this.getLoadingScreenObject();
        if (_loc2.isInFla)
        {
            this.setupLoadscreen(textureDict);
        }
        else
        {
            this.LOAD_TXD(textureDict);
        } // end else if
    } // End of the function
    function LOAD_TXD(textureDict)
    {
        com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxName, textureDict, textureDict, true);
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success == true)
        {
            this.setupLoadscreen(textureDict);
        }
        else
        {
            this.LOAD_TXD(textureDict);
        } // end else if
    } // End of the function
    function TXD_ALREADY_LOADED(textureDict, uniqueID)
    {
    } // End of the function
    function getNextLoadscreenDepth()
    {
        return (nextDepth++);
    } // End of the function
    function setupLoadscreen(textureDict)
    {
        var _loc12 = this.getNextLoadscreenDepth();
        var _loc3 = loadingScreenHolder.createEmptyMovieClip(textureDict + "_" + _loc12, _loc12, {_visible: false});
        var _loc11 = this.getLoadingScreenObject();
        var _loc5 = _loc11.layers;
        loadingScreenEmptyMcs.push({mc: _loc3, ob: _loc11});
        if (_loc11.isInFla)
        {
            for (var _loc4 = 0; _loc4 < _loc5.length; ++_loc4)
            {
                var _loc2 = _loc5[_loc4];
                var _loc6 = _loc3.attachMovie(_loc2.texture, _loc2.texture, _loc3.getNextHighestDepth(), {_visible: false});
            } // end of for
            nextScreenReady = true;
        }
        else
        {
            if (ml)
            {
                delete this.mlListener;
                ml.cleanUp(true);
                ml = null;
            } // end if
            ml = new com.rockstargames.ui.utils.MultiLoader(this, gfxName);
            for (var _loc4 = 0; _loc4 < _loc5.length; ++_loc4)
            {
                _loc2 = _loc5[_loc4];
                if (_loc2.isInFla)
                {
                    _loc6 = _loc3.attachMovie(_loc2.texture, _loc2.texture, _loc3.getNextHighestDepth(), {_visible: false});
                    continue;
                } // end if
                _loc6 = _loc3.createEmptyMovieClip(_loc2.texture, _loc3.getNextHighestDepth());
                _loc6._visible = false;
                ml.addClip("img://" + textureDict + "/" + _loc2.texture, _loc6, {onLoadProgress: loadProgress, onLoadInit: loadInit});
            } // end of for
            ml.loadClips();
            mlListener = new Object();
            mlListener.onGroupLoadInit = function (evt)
            {
                evt.scope.nextScreenReady = true;
                evt.target = null;
            };
            ml.addEventListener("onGroupLoadInit", mlListener);
        } // end else if
    } // End of the function
    function loadProgress(targetMC)
    {
    } // End of the function
    function loadInit(targetMC)
    {
        targetMC._visible = false;
    } // End of the function
    function setupLayers(loadscreenMc, loadscreenObject)
    {
        var _loc6 = loadscreenObject.layers;
        for (var _loc4 = 0; _loc4 < _loc6.length; ++_loc4)
        {
            var _loc2 = _loc6[_loc4];
            var _loc3 = loadscreenMc[_loc2.texture];
            for (var _loc7 in _loc2.setup)
            {
                var _loc5 = _loc7;
                _loc3[_loc5] = _loc2.setup[_loc7];
            } // end of for...in
            if (!isWideScreen)
            {
                if (_loc4 > 0 && _loc3._x + _loc3._width > 1280)
                {
                    _loc3._x = _loc3._x - 160;
                } // end if
            } // end if
        } // end of for
    } // End of the function
    function playLoadscreen(loadscreenMc, loadscreenObject)
    {
        activeLoadingScreen = loadscreenMc;
        activeLoadingScreenObject = loadscreenObject;
        var _loc6 = activeLoadingScreenObject.layers;
        for (var _loc2 = 0; _loc2 < _loc6.length; ++_loc2)
        {
            var _loc3 = _loc6[_loc2];
            var _loc4 = activeLoadingScreen[_loc3.texture];
            _loc4._visible = true;
            if (!isWideScreen)
            {
                var _loc5 = _loc3.tweenTo;
                if (_loc2 > 0 && _loc5._x + _loc4._width > 1280)
                {
                    _loc5._x = _loc5._x - 160;
                } // end if
            } // end if
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4, timerDuration * 3, _loc3.tweenTo);
        } // end of for
        activeLoadingScreen._visible = true;
    } // End of the function
    function startTransition(duration)
    {
        var _loc2 = 0;
        if (isNaN(duration))
        {
            duration = 2;
            _loc2 = 1;
        } // end if
        this.cleanUpTransition();
        overlay = this.createOverlay(loadingScreenHolder, this.getNextLoadscreenDepth() + 50);
        if (activeLoadingScreen && activeLoadingScreenObject)
        {
            var _loc6 = activeLoadingScreenObject.layers;
            var _loc4 = _loc6[0];
            var _loc3 = activeLoadingScreen[_loc4.texture];
            bgOverlay = this.createOverlay(_loc3, _loc3.getNextHighestDepth());
            com.rockstargames.ui.tweenStar.TweenStarLite.to(bgOverlay, 3, {_alpha: 75, ease: com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT});
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(overlay, duration, {delay: _loc2, _alpha: 99, ease: com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT, onComplete: finishTransition, onCompleteScope: this});
    } // End of the function
    function removeLoadscreen(loadingScreenMc, loadingScreenObject)
    {
        if (loadingScreenMc)
        {
            var _loc5 = activeLoadingScreenObject.layers;
            for (var _loc2 = 0; _loc2 < _loc5.length; ++_loc2)
            {
                var _loc4 = _loc5[_loc2];
                var _loc3 = loadingScreenMc[_loc4.texture];
                com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3);
                _loc3.removeMovieClip();
            } // end of for
            loadingScreenMc.removeMovieClip();
            if (loadingScreenObject.txd && !loadingScreenObject.isInFla)
            {
                com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxName, loadingScreenObject.txd);
            } // end if
        } // end if
    } // End of the function
    function getNextLoadscreenObject()
    {
        var _loc2 = null;
        if (loadingScreenEmptyMcs.length > 0)
        {
            _loc2 = loadingScreenEmptyMcs.shift();
            
        } // end if
        return (_loc2);
    } // End of the function
    function finishTransition()
    {
        animationDone = true;
        if (activeLoadingScreen)
        {
            animationDoneName = activeLoadingScreen._name;
        }
        else
        {
            animationDoneName = this.getLoadingScreenMovieClipName(0);
        } // end else if
        this.removeLoadscreen(activeLoadingScreen, activeLoadingScreenObject);
        var _loc2 = this.getNextLoadscreenObject();
        this.setupLayers(_loc2.mc, _loc2.ob);
        this.playLoadscreen(_loc2.mc, _loc2.ob);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(overlay, 4, {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT, onComplete: cleanUpTransition, onCompleteScope: this});
    } // End of the function
    function createOverlay(parentMc, depth)
    {
        var _loc1 = parentMc.createEmptyMovieClip("overlay", depth);
        _loc1.beginFill(0);
        _loc1.moveTo(-50, -50);
        _loc1.lineTo(1380, 0);
        _loc1.lineTo(1380, 820);
        _loc1.lineTo(0, 820);
        _loc1.endFill();
        _loc1._alpha = 0;
        return (_loc1);
    } // End of the function
    function cleanUpTransition()
    {
        if (overlay)
        {
            overlay.removeMovieClip();
        } // end if
        if (bgOverlay)
        {
            bgOverlay.removeMovieClip();
        } // end if
    } // End of the function
    var txdIndex = 0;
    var prevTxdIndex = 0;
    var nextDepth = 1000;
    var timerDuration = 14;
    var firstRun = true;
    var currentView = 0;
    var isAmerican = false;
    var nextScreenReady = false;
    var animationDone = false;
    var loadingScreens = [];
    var loadingScreenEmptyMcs = [];
    var loadingScreenMcs = [];
    var loadScreensArePlaying = false;
    var screenWidth = 1280;
    var screenHeight = 720;
    var safeTop = 29;
    var safeBottom = 29;
    var safeLeft = 51;
    var safeRight = 51;
    var isWideScreen = true;
    var isHiDef = true;
} // End of Class
#endinitclip
