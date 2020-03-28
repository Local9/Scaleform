// Action script...

// [Initial MovieClip Action of sprite 31]
#initclip 5
class com.rockstargames.gtav.loadingScreens.OPENING_CREDITS extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, dispConf, getDisplayConfig, safeLeft, safeRight, safeTop, safeBottom, screenWidthPixels, screenHeightPixels, isWideScreen;
    function OPENING_CREDITS(mc)
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        CONTENT = mc;
        dispConf = new com.rockstargames.ui.utils.DisplayConfig();
        dispConf = this.getDisplayConfig(true);
        if (!dispConf.isWideScreen)
        {
            Stage.scaleMode = "noBorder";
            dispConf.screenWidth = 960;
        } // end if
    } // End of the function
    function TEST_LOGO(fadeInDuration, fadeOutDuration, logoFadeInDuration, logoFadeOutDuration, logoFadeInDelay, logoFadeOutDelay, logoScaleDuration)
    {
        this.SHOW_LOGO("logo", fadeInDuration, fadeOutDuration, logoFadeInDuration, logoFadeOutDuration, logoFadeInDelay, logoFadeOutDelay, logoScaleDuration);
    } // End of the function
    function TEST_CREDIT_BLOCK(role, names, align, xOffset, namesXOffset, stepDuration, animInStyle, animInValue, animOutValue)
    {
        this.SETUP_CREDIT_BLOCK("art", xOffset, 350, align, 0.500000, 0.500000);
        this.ADD_ROLE_TO_CREDIT_BLOCK("art", role, 0, "HUD_COLOUR_MICHAEL", true);
        this.ADD_NAMES_TO_CREDIT_BLOCK("art", names, namesXOffset, ",", true);
        this.SHOW_CREDIT_BLOCK("art", stepDuration);
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, 5, {onComplete: HIDE, onCompleteScope: this, onCompleteArgs: ["art", stepDuration, animInStyle, animOutValue]});
    } // End of the function
    function TEST_SINGLE_LINE(animInStyle, animInValue, animOutValue)
    {
        this.SETUP_SINGLE_LINE("presents", 0.500000, 0.500000, 70, 125, "left");
        this.ADD_TEXT_TO_SINGLE_LINE("presents", "a", "$font5", "HUD_COLOUR_MICHAEL", true);
        this.ADD_TEXT_TO_SINGLE_LINE("presents", "ROCKSTAR GAMES", "$font2", "HUD_COLOUR_WHITE", true);
        this.ADD_TEXT_TO_SINGLE_LINE("presents", "production", "$font5", "HUD_COLOUR_MICHAEL", true);
        this.ADD_TEXT_TO_SINGLE_LINE("presents", "ROCKSTAR GAMES", "$font2", "HUD_COLOUR_WHITE", true);
        this.ADD_TEXT_TO_SINGLE_LINE("presents", "normal", "$font5", "HUD_COLOUR_MICHAEL", true);
        this.SHOW_SINGLE_LINE("presents", animInStyle, animInValue);
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, 5, {onComplete: HIDE, onCompleteScope: this, onCompleteArgs: ["presents", 0, animInStyle, animOutValue]});
    } // End of the function
    function SETUP_SINGLE_LINE(mcName, fadeInDuration, fadeOutDuration, x, y, align)
    {
        this.REMOVE_ALL();
        currentX = 0;
        if (isNaN(fadeInDuration))
        {
            fadeInDuration = defaultFadeDuration;
        } // end if
        if (isNaN(fadeOutDuration))
        {
            fadeOutDuration = fadeInDuration;
        } // end if
        if (isNaN(x))
        {
            x = 0;
        } // end if
        if (isNaN(y))
        {
            y = 0;
        } // end if
        var _loc2 = CONTENT.createEmptyMovieClip(mcName, CONTENT.getNextHighestDepth());
        _loc2._alpha = 20;
        var _loc3 = {mcName: mcName, mc: _loc2, fadeInDuration: fadeInDuration, fadeOutDuration: fadeOutDuration, align: this.setAlignment(align), xOffset: x, yOffset: y};
        creditBlockList.push(_loc3);
    } // End of the function
    function ADD_TEXT_TO_SINGLE_LINE(mcName, text, font, colour, isRawText, language, yOffset)
    {
        if (font == FONT5)
        {
            var _loc6 = this.getMovieClipFromName(mcName).attachMovie("role", "sl_" + this.getMovieClipFromName(mcName).getNextHighestDepth(), this.getMovieClipFromName(mcName).getNextHighestDepth());
            var _loc2 = _loc6.roleTxt;
            var _loc9 = text.split("");
            var _loc8 = _loc9[0];
            if (this.stringInArray(descendersList, _loc8))
            {
                text = " " + text;
                currentX = currentX - 8;
            } // end if
            if (isRawText)
            {
                _loc2.text = text;
            }
            else
            {
                com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2, text, 0, false);
            } // end else if
            if (isNaN(yOffset) || !yOffset || yOffset == 0)
            {
                var _loc5 = new TextFormat();
                switch (language)
                {
                    case "ja":
                    case "japanese":
                    case "ko":
                    case "korean":
                    {
                        _loc5.size = 46;
                        _loc2.setTextFormat(_loc5);
                        _loc6._y = _loc6._y + 10;
                        break;
                    } 
                    case "zh":
                    case "chinese":
                    {
                        _loc5.size = 46;
                        _loc2.setTextFormat(_loc5);
                        break;
                    } 
                    default:
                    {
                        _loc6._y = _loc6._y + 15;
                        break;
                    } 
                } // End of switch
            }
            else
            {
                _loc6._y = _loc6._y + yOffset;
            } // end else if
        }
        else
        {
            _loc6 = this.getMovieClipFromName(mcName).attachMovie("name_singleline", "sl_" + this.getMovieClipFromName(mcName).getNextHighestDepth(), this.getMovieClipFromName(mcName).getNextHighestDepth());
            _loc2 = _loc6.nameTxt;
            if (isRawText)
            {
                _loc2.text = text;
            }
            else
            {
                com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc2, text, 0, false);
            } // end else if
            _loc2.text = _loc2.text.toUpperCase();
        } // end else if
        _loc6._x = currentX;
        _loc2.textColor = this.getColour(colour);
        _loc2.autoSize = "left";
        _loc2.wordWrap = false;
        _loc2.embedFonts = true;
        currentX = currentX + (_loc6._width + 6);
    } // End of the function
    function SHOW_SINGLE_LINE(mcName, animInStyle, animInValue)
    {
        var _loc2 = this.getMovieClipFromName(mcName);
        var _loc3 = this.getObjectFromMcName(mcName);
        _loc2._visible = true;
        var _loc6 = dispConf.screenWidth - safeLeft * 2;
        if (_loc2._width > _loc6)
        {
            _loc2._xscale = _loc2._yscale = _loc6 / _loc2._width * 100;
            _loc3.xOffset = 0;
        } // end if
        switch (_loc3.align)
        {
            case ALIGN_LEFT:
            {
                _loc2._x = safeLeft + _loc3.xOffset;
                if (_loc2._x < safeLeft)
                {
                    _loc2._x = safeLeft;
                } // end if
                break;
            } 
            case ALIGN_RIGHT:
            {
                _loc2._x = safeRight - (_loc2._width + _loc3.xOffset);
                if (_loc2._x + _loc2._width > safeRight)
                {
                    _loc2._x = safeRight - _loc2._width;
                } // end if
                break;
            } 
            default:
            {
                _loc2._x = dispConf.screenWidth / 2 - _loc2._width / 2;
                break;
            } 
        } // End of switch
        if (!dispConf.isWideScreen)
        {
            _loc2._x = _loc2._x + 160;
        } // end if
        _loc2._y = dispConf.screenHeight / 2 - _loc2._height / 2 - 12;
        _loc2._y = _loc2._y + _loc3.yOffset;
        if (_loc2._y < safeTop)
        {
            _loc2._y = safeTop;
        } // end if
        if (_loc2._y + _loc2._height > safeBottom)
        {
            _loc2._y = safeBottom - _loc2._height;
        } // end if
        var _loc4 = {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_IN};
        if (this.getAnimInStyle(animInStyle) && !isNaN(animInValue))
        {
            var _loc7 = _loc2[this.getAnimInStyle(animInStyle)];
            _loc4[this.getAnimInStyle(animInStyle)] = _loc7;
            _loc2[this.getAnimInStyle(animInStyle)] = _loc2[this.getAnimInStyle(animInStyle)] + animInValue;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2, _loc3.fadeInDuration, _loc4);
    } // End of the function
    function SETUP_CREDIT_BLOCK(mcName, x, y, align, fadeInDuration, fadeOutDuration)
    {
        this.REMOVE_ALL();
        currentY = 0;
        if (isNaN(y))
        {
            y = 0;
        } // end if
        if (isNaN(x))
        {
            x = 0;
        } // end if
        if (isNaN(fadeInDuration))
        {
            fadeInDuration = defaultFadeDuration;
        } // end if
        if (isNaN(fadeOutDuration))
        {
            fadeOutDuration = fadeInDuration;
        } // end if
        var _loc2 = CONTENT.createEmptyMovieClip(mcName, CONTENT.getNextHighestDepth());
        _loc2._alpha = 0;
        _loc2._visible = false;
        _loc2._y = dispConf.safeTop * dispConf.screenHeight + y;
        var _loc5 = {mcName: mcName, mc: _loc2, xOffset: x, align: this.setAlignment(align), fadeInDuration: fadeInDuration, fadeOutDuration: fadeOutDuration};
        creditBlockList.push(_loc5);
    } // End of the function
    function ADD_ROLE_TO_CREDIT_BLOCK(mcName, role, xOffset, colour, isRawText, language)
    {
        if (!this.getMovieClipFromName(mcName))
        {
            this.SETUP_CREDIT_BLOCK(mcName);
        } // end if
        if (currentY > 0)
        {
            currentY = currentY + 6;
        } // end if
        var _loc6 = this.getMovieClipFromName(mcName).attachMovie("role", "role_" + this.getMovieClipFromName(mcName).getNextHighestDepth(), this.getMovieClipFromName(mcName).getNextHighestDepth(), {_x: xOffset, _y: currentY});
        var _loc3 = _loc6.roleTxt;
        _loc3.textColor = this.getColour(colour);
        _loc3.autoSize = "left";
        _loc3.embedFonts = true;
        if (isRawText)
        {
            _loc3.text = role;
        }
        else
        {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3, role, 0, false);
        } // end else if
        switch (language)
        {
            case "ja":
            case "japanese":
            case "ko":
            case "korean":
            {
                var _loc8 = new TextFormat();
                _loc8.size = 42;
                _loc3.setTextFormat(_loc8);
                _loc3._y = _loc3._y + 10;
                currentY = currentY + (_loc6._height + 10);
                break;
            } 
            case "zh":
            case "chinese":
            {
                _loc8 = new TextFormat();
                _loc8.size = 42;
                _loc3.setTextFormat(_loc8);
                currentY = currentY + _loc6._height;
                break;
            } 
            default:
            {
                currentY = currentY + (_loc6._height - 24);
                break;
            } 
        } // End of switch
        var _loc4 = false;
        var _loc5 = String(_loc3.text).split("");
        for (var _loc2 = 0; _loc2 < descendersList.length; ++_loc2)
        {
            if (this.stringInArray(_loc5, descendersList[_loc2]))
            {
                _loc4 = true;
                break;
            } // end if
        } // end of for
        if (_loc4)
        {
            currentY = currentY + 8;
        } // end if
    } // End of the function
    function ADD_NAMES_TO_CREDIT_BLOCK(mcName, names, xOffset, delimiter, isRawText)
    {
        if (!delimiter)
        {
            delimiter = ",";
        } // end if
        var _loc15 = this.getObjectFromMcName(mcName);
        var _loc12 = this.getMovieClipFromName(mcName).attachMovie("name", "name_" + this.getMovieClipFromName(mcName).getNextHighestDepth(), this.getMovieClipFromName(mcName).getNextHighestDepth(), {_x: xOffset, _y: currentY});
        var _loc11 = _loc12.nameTxt;
        if (isRawText)
        {
            _loc11.text = names;
        }
        else
        {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc11, names, 0, false);
        } // end else if
        var _loc6 = _loc11.text.split(delimiter);
        var _loc9 = [];
        _loc12.removeMovieClip();
        for (var _loc4 = 0; _loc4 < _loc6.length; ++_loc4)
        {
            var _loc3 = this.getMovieClipFromName(mcName).attachMovie("name", "name_" + this.getMovieClipFromName(mcName).getNextHighestDepth(), this.getMovieClipFromName(mcName).getNextHighestDepth(), {_x: xOffset, _y: currentY});
            var _loc2 = _loc3.nameTxt;
            _loc9.push(_loc3);
            _loc2.textColor = this.getColour("HUD_COLOUR_WHITE");
            _loc2.autoSize = "left";
            _loc2.wordWrap = false;
            _loc2.multiline = false;
            _loc2.html = true;
            _loc2.htmlText = String(_loc6[_loc4]);
            currentY = currentY + (_loc3._height - 17);
        } // end of for
    } // End of the function
    function SHOW_CREDIT_BLOCK(mcName, stepDuration, animInStyle, animInValue)
    {
        var _loc2 = this.getMovieClipFromName(mcName);
        var _loc14 = this.getObjectFromMcName(mcName);
        _loc2._visible = true;
        if (_loc14.align == ALIGN_RIGHT)
        {
            this.normaliseXRightAlignment(mcName);
            _loc2._x = dispConf.safeRight * dispConf.screenWidth - (_loc2._width + _loc14.xOffset);
            if (_loc2._x + _loc2._width > dispConf.safeRight * dispConf.screenWidth)
            {
                _loc2._x = dispConf.safeRight * dispConf.screenWidth - _loc2._width;
            } // end if
        }
        else
        {
            _loc2._x = dispConf.safeLeft * dispConf.screenWidth + _loc14.xOffset;
            if (_loc2._x - _loc2._width < dispConf.safeLeft * dispConf.screenWidth)
            {
                _loc2._x = dispConf.safeLeft * dispConf.screenWidth;
            } // end if
        } // end else if
        if (!dispConf.isWideScreen)
        {
            _loc2._x = _loc2._x + 160;
        } // end if
        if (_loc2._y + _loc2._height > dispConf.safeBottom * dispConf.screenHeight)
        {
            _loc2._y = dispConf.safeBottom * dispConf.screenHeight - _loc2._height;
        } // end if
        if (isNaN(stepDuration) || stepDuration == 0)
        {
            for (var _loc3 in _loc2)
            {
                if (typeof(_loc2[_loc3]) == "movieclip")
                {
                    (MovieClip)(_loc2[_loc3])._alpha = 100;
                } // end if
            } // end of for...in
            var _loc7 = {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_IN};
            if (this.getAnimInStyle(animInStyle) && !isNaN(animInValue))
            {
                var _loc8 = _loc2[this.getAnimInStyle(animInStyle)];
                _loc7[this.getAnimInStyle(animInStyle)] = _loc8;
                _loc2[this.getAnimInStyle(animInStyle)] = _loc2[this.getAnimInStyle(animInStyle)] + animInValue;
            } // end if
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2, _loc14.fadeInDuration, _loc7);
        }
        else
        {
            var _loc6 = [];
            for (var _loc3 in _loc2)
            {
                if (typeof(_loc2[_loc3]) == "movieclip")
                {
                    _loc6[_loc2[_loc3].getDepth()] = _loc2[_loc3];
                } // end if
            } // end of for...in
            var _loc10 = 0;
            for (var _loc3 = 0; _loc3 < _loc6.length; ++_loc3)
            {
                var _loc4 = (MovieClip)(_loc6[_loc3]);
                _loc4._alpha = 0;
                _loc7 = {delay: stepDuration * _loc10, _alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_IN};
                if (this.getAnimInStyle(animInStyle) != "" && !isNaN(animInValue))
                {
                    _loc8 = _loc4[this.getAnimInStyle(animInStyle)];
                    _loc7[this.getAnimInStyle(animInStyle)] = _loc8;
                    _loc4[this.getAnimInStyle(animInStyle)] = _loc4[this.getAnimInStyle(animInStyle)] + animInValue;
                } // end if
                com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc6[_loc3], _loc14.fadeInDuration, _loc7);
                ++_loc10;
            } // end of for
            _loc2._alpha = 100;
        } // end else if
    } // End of the function
    function SHOW_LOGO(mcName, fadeInDuration, fadeOutDuration, logoFadeInDuration, logoFadeOutDuration, logoFadeInDelay, logoFadeOutDelay, logoScaleDuration)
    {
        if (isNaN(fadeInDuration))
        {
            fadeInDuration = defaultFadeDuration;
        } // end if
        if (isNaN(fadeOutDuration))
        {
            fadeOutDuration = fadeInDuration;
        } // end if
        if (isNaN(logoFadeInDuration))
        {
            logoFadeInDuration = fadeInDuration;
        } // end if
        if (isNaN(logoFadeOutDuration))
        {
            logoFadeOutDuration = fadeInDuration;
        } // end if
        if (isNaN(logoFadeInDelay))
        {
            logoFadeInDelay = fadeInDuration;
        } // end if
        if (isNaN(logoFadeOutDelay))
        {
            logoFadeOutDelay = fadeInDuration;
        } // end if
        if (isNaN(logoScaleDuration))
        {
            logoScaleDuration = fadeInDuration * 6;
        } // end if
        var _loc3 = CONTENT.createEmptyMovieClip(mcName, CONTENT.getNextHighestDepth());
        var _loc5 = this.createOverlay(_loc3, _loc3.getNextHighestDepth());
        _loc5._alpha = 0;
        var _loc2 = _loc3.attachMovie("logo", "logo", _loc3.getNextHighestDepth(), {_x: screenWidthPixels / 2, _y: screenWidthPixels / 2, _xrotation: -10, _xscale: 55, _yscale: 55, _visible: false});
        var _loc4 = this.createOverlay(_loc2, _loc2.getNextHighestDepth());
        _loc4._x = _loc4._x - _loc4._width / 2;
        _loc4._y = _loc4._y - _loc4._height / 2;
        _loc4._alpha = 100;
        _loc2._x = screenWidthPixels / 2;
        _loc2._y = screenHeightPixels / 2 - 10;
        if (!isWideScreen)
        {
            _loc2._x = _loc2._x + 160;
        } // end if
        var _loc6 = {mcName: mcName, mc: _loc3, overlayMc: _loc5, logoMc: _loc2, fadeInDuration: fadeInDuration, fadeOutDuration: fadeOutDuration, logoFadeInDuration: logoFadeInDuration, logoFadeOutDuration: logoFadeOutDuration, logoFadeInDelay: logoFadeInDelay, logoFadeOutDelay: logoFadeOutDelay, logoScaleDuration: logoScaleDuration * 1.200000};
        creditBlockList.push(_loc6);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5, _loc6.fadeInDuration, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, _loc6.logoFadeInDelay, {onComplete: unhideLogo, onCompleteScope: this, onCompleteArgs: [mcName]});
    } // End of the function
    function unhideLogo(mcName)
    {
        var _loc2 = this.getObjectFromMcName(mcName);
        var _loc3 = _loc2.logoMc;
        var _loc4 = _loc3.overlay;
        _loc3._visible = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3, _loc2.logoScaleDuration, {_xscale: 85, _yscale: 85, _xrotation: 0, ease: com.rockstargames.ui.tweenStar.Ease.LINEAR});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4, _loc2.logoFadeInDuration, {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
    } // End of the function
    function HIDE_LOGO(mcToHide)
    {
        var _loc2 = this.getObjectFromMcName(mcToHide);
        var _loc3 = _loc2.logoMc;
        var _loc4 = _loc3.overlay;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4, _loc2.logoFadeInDuration, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT, onComplete: REMOVE_MC, onCompleteScope: this, onCompleteArgs: [_loc3]});
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, _loc2.logoFadeOutDelay, {onComplete: HIDE, onCompleteScope: this, onCompleteArgs: [mcToHide]});
    } // End of the function
    function HIDE(mcToHide, stepDuration, animOutStyle, animOutValue)
    {
        var _loc3 = this.getMovieClipFromName(mcToHide);
        var _loc11 = this.getObjectFromMcName(mcToHide);
        var _loc5 = {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.SINE_OUT, onCompleteScope: this};
        if (isNaN(stepDuration) || stepDuration == 0)
        {
            if (this.getAnimInStyle(animOutStyle) && !isNaN(animOutValue))
            {
                var _loc8 = _loc3[this.getAnimInStyle(animOutStyle)] + animOutValue;
                _loc5[this.getAnimInStyle(animOutStyle)] = _loc8;
            } // end if
            _loc5.onComplete = REMOVE;
            _loc5.onCompleteArgs = mcToHide;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.getMovieClipFromName(mcToHide), _loc11.fadeOutDuration, _loc5);
        }
        else
        {
            var _loc4 = [];
            for (var _loc2 in _loc3)
            {
                if (typeof(_loc3[_loc2]) == "movieclip")
                {
                    _loc4[_loc3[_loc2].getDepth()] = _loc3[_loc2];
                } // end if
            } // end of for...in
            var _loc9 = 0;
            for (var _loc2 = _loc4.length; _loc2 >= 0; --_loc2)
            {
                var _loc7 = (MovieClip)(_loc4[_loc2]);
                _loc5.delay = stepDuration * _loc9;
                if (this.getAnimInStyle(animOutStyle) != "" && !isNaN(animOutValue))
                {
                    _loc8 = _loc7[this.getAnimInStyle(animOutStyle)] + animOutValue;
                    _loc5[this.getAnimInStyle(animOutStyle)] = _loc8;
                } // end if
                com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4[_loc2], _loc11.fadeOutDuration, _loc5);
                ++_loc9;
            } // end of for
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, _loc11.fadeOutDuration * (_loc9 + 1), {onComplete: REMOVE, onCompleteScope: this, onCompleteArgs: [mcToHide]});
        } // end else if
    } // End of the function
    function REMOVE(mcToRemove)
    {
        this.getMovieClipFromName(mcToRemove).removeMovieClip();
    } // End of the function
    function REMOVE_MC(mcToRemove)
    {
        mcToRemove.removeMovieClip();
    } // End of the function
    function REMOVE_ALL()
    {
        for (var _loc2 = 0; _loc2 < creditBlockList.length; ++_loc2)
        {
            var _loc4 = creditBlockList[_loc2];
            var _loc3 = this.getMovieClipFromName(_loc4.mcName);
            _loc3.removeMovieClip();
        } // end of for
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
    function getMovieClipFromName(mcName)
    {
        return (CONTENT[mcName]);
    } // End of the function
    function normaliseXRightAlignment(mcName)
    {
        var _loc3 = 0;
        var _loc2 = this.getMovieClipFromName(mcName);
        for (var _loc5 in _loc2)
        {
            if (typeof(_loc2[_loc5]) == "movieclip")
            {
                if (_loc2[_loc5]._x < _loc3)
                {
                    _loc3 = _loc2[_loc5]._x;
                } // end if
            } // end if
        } // end of for...in
        for (var _loc4 in _loc2)
        {
            if (typeof(_loc2[_loc4]) == "movieclip")
            {
                _loc2[_loc4]._x = _loc2[_loc4]._x + _loc3 * -1;
            } // end if
        } // end of for...in
    } // End of the function
    function setAlignment(align)
    {
        switch (align)
        {
            case "right":
            case "RIGHT":
            {
                return (ALIGN_RIGHT);
                break;
            } 
            case "center":
            case "CENTER":
            case "centre":
            case "CENTRE":
            {
                return (ALIGN_CENTER);
                break;
            } 
            default:
            {
                return (ALIGN_LEFT);
                break;
            } 
        } // End of switch
    } // End of the function
    function getAnimInStyle(animStyle)
    {
        switch (animStyle)
        {
            case "x":
            case "_x":
            case "X":
            {
                return (ANIM_IN_X);
                break;
            } 
            case "y":
            case "_y":
            case "Y":
            {
                return (ANIM_IN_Y);
                break;
            } 
            case "xrotation":
            case "_xrotation":
            {
                return (ANIM_IN_XROT);
                break;
            } 
            case "yrotation":
            case "_yrotation":
            {
                return (ANIM_IN_YROT);
                break;
            } 
        } // End of switch
        return ("");
    } // End of the function
    function getColour(col)
    {
        var _loc1 = new com.rockstargames.ui.utils.HudColour();
        var _loc2 = com.rockstargames.ui.utils.HudColour[col];
        if (isNaN(_loc2))
        {
            _loc2 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
        } // end if
        com.rockstargames.ui.utils.Colour.setHudColour(_loc2, _loc1);
        return (_loc1.r * 65536 + _loc1.g * 256 + _loc1.b);
    } // End of the function
    function getObjectFromMcName(mcName)
    {
        for (var _loc2 = 0; _loc2 < creditBlockList.length; ++_loc2)
        {
            var _loc3 = creditBlockList[_loc2];
            if (_loc3.mcName == mcName)
            {
                return (_loc3);
            } // end if
        } // end of for
        return ({});
    } // End of the function
    function stringInArray(input, what)
    {
        for (var _loc1 = 0; _loc1 < input.length; ++_loc1)
        {
            if (input[_loc1] == what)
            {
                return (true);
            } // end if
        } // end of for
        return (false);
    } // End of the function
    var creditBlockList = [];
    var defaultFadeDuration = 2;
    var yAdjustment = -60;
    var currentY = 0;
    var currentX = 0;
    var ALIGN_LEFT = "left";
    var ALIGN_RIGHT = "right";
    var ALIGN_CENTER = "center";
    var ANIM_IN_XROT = "_xrotation";
    var ANIM_IN_YROT = "_yrotation";
    var ANIM_IN_X = "_x";
    var ANIM_IN_Y = "_y";
    var FONT2 = "$font2";
    var FONT5 = "$font5";
    var descendersList = ["q", "y", "p", "g", "j"];
} // End of Class
#endinitclip
