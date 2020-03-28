class com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS extends com.rockstargames.ui.core.BaseScreenLayout
{
    var _leadingSize, lineYPosition, spaceBetweenInstructions, spaceBetweenSpaceAndButton, maxLines, dataArray, DispConf, getDisplayConfig, buttonList, backgrounds, backgroundMCS, instructionalTextFormat, FOUR_THREE_PADDING, container, respawn_spinnerMC, savingIconID, screenWidthPixels, background, screenHeightPixels, CONTENT, backgroundColours, FILE_WIDTH;
    function INSTRUCTIONAL_BUTTONS()
    {
        super();
        this.CONSTRUCTION_INNARDS();
    } // End of the function
    function CONSTRUCTION_INNARDS()
    {
        _leadingSize = 2;
        lineYPosition = 0;
        spaceBetweenInstructions = 12;
        spaceBetweenSpaceAndButton = 6;
        maxLines = 20;
        dataArray = [];
        DispConf = new com.rockstargames.ui.utils.DisplayConfig();
        DispConf = this.getDisplayConfig(true);
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        buttonList = [];
        backgrounds = [];
        backgroundMCS = [];
        instructionalTextFormat = new TextFormat();
        instructionalTextFormat.font = "$Font2";
        instructionalTextFormat.size = 12;
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc4);
        instructionalTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc4.r, _loc4.g, _loc4.b);
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG, _loc3);
        this.SET_BACKGROUND_COLOUR(_loc3.r, _loc3.g, _loc3.b, _loc3.a);
    } // End of the function
    function initScreenLayout()
    {
        if (!DispConf.isWideScreen)
        {
            Stage.scaleMode = "noBorder";
            DispConf.screenWidth = 960;
            FOUR_THREE_PADDING = 160;
        } // end if
        container._x = FOUR_THREE_PADDING + DispConf.safeRight * DispConf.screenWidth;
        container._y = DispConf.safeBottom * DispConf.screenHeight;
        var _loc6;
        var _loc5;
        var _loc4;
        var _loc3;
        for (var _loc2 = 0; _loc2 < backgroundMCS.length; ++_loc2)
        {
            _loc4 = backgrounds[_loc2];
            if (_loc2 < 1)
            {
                _loc4 = _loc4 + PADDING * 2;
            } // end if
            _loc6 = FOUR_THREE_PADDING + (DispConf.safeRight * DispConf.screenWidth - _loc4);
            _loc5 = DispConf.safeBottom * DispConf.screenHeight - (iconSize + _leadingSize) * _loc2 - iconSize;
            if (backgroundMCS[_loc2] != undefined)
            {
                _loc3 = backgroundMCS[_loc2];
                _loc3._x = _loc6;
                _loc3._y = _loc5;
            } // end if
        } // end of for
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept)
    {
        DispConf.isCircleAccept = _isCircleAccept;
        DispConf.isWideScreen = _isWideScreen;
        DispConf.safeBottom = _safeBottomPercent;
        DispConf.safeLeft = _safeLeftPercent;
        DispConf.safeRight = _safeRightPercent;
        DispConf.safeTop = _safeTopPercent;
        DispConf.screenHeight = _screenHeightPixels;
        DispConf.screenWidth = _screenWidthPixels;
        this.initScreenLayout();
    } // End of the function
    function debug()
    {
        this.SET_DISPLAY_CONFIG(960, 720, 0.050000, 0.950000, 0.050000, 0.950000, false, true);
        this.SET_DATA_SLOT(0, 44, "Leaderboard ending... 60");
        this.SET_DATA_SLOT(1, 30, "ACCEPT");
        this.SET_DATA_SLOT(2, 31, "BACK");
        this.DRAW_INSTRUCTIONAL_BUTTONS(1);
    } // End of the function
    function saveSpinerFrame()
    {
        if (typeof(respawn_spinnerMC) == "movieclip")
        {
            var _loc2 = respawn_spinnerMC.spinner;
            if (_loc2 != undefined)
            {
                respawn_spinner_frame = _loc2._currentframe;
            } // end if
        } // end if
    } // End of the function
    function SET_SAVING_TEXT(iconEnum, saveStr)
    {
        savingText = saveStr;
        savingIconID = iconEnum;
        var _loc9 = 0;
        var _loc5 = 1;
        var _loc8 = 2;
        var _loc10 = 3;
        var _loc7 = 4;
        var _loc6 = 5;
        if (saveStr == undefined)
        {
            saveStr = "";
        } // end if
        var _loc2 = 48;
        if (iconEnum == _loc5)
        {
            _loc2 = 50;
        } // end if
        if (iconEnum == _loc7)
        {
            _loc2 = 49;
        } // end if
        if (iconEnum == _loc6)
        {
            _loc2 = 48;
        } // end if
        if (is_saving)
        {
            this.REMOVE_SAVING();
        } // end if
        dataArray.unshift([_loc2, saveStr]);
        this.CLEAR_RENDER();
        this.DRAW_INSTRUCTIONAL_BUTTONS(stackType);
        is_saving = true;
    } // End of the function
    function REMOVE_SAVING()
    {
        if (is_saving)
        {
            dataArray.shift();
            this.CLEAR_RENDER();
            this.DRAW_INSTRUCTIONAL_BUTTONS(stackType);
        } // end if
        is_saving = false;
    } // End of the function
    function CLEAR_ALL()
    {
        this.saveSpinerFrame();
        buttonList = [];
        backgrounds = [];
        this.CREATE_CONTAINER();
        dataArray = new Array();
        this.CLEAR_BACKGROUNDS();
        if (is_saving)
        {
            this.SET_SAVING_TEXT(savingIconID, savingText);
        } // end if
    } // End of the function
    function CLEAR_RENDER()
    {
        this.saveSpinerFrame();
        buttonList = [];
        backgrounds = [];
        backgroundMCS = [];
        this.CREATE_CONTAINER();
        this.CLEAR_BACKGROUNDS();
    } // End of the function
    function OVERRIDE_POSITION(newX, newY, alignBottomRight)
    {
        if (alignBottomRight == undefined)
        {
            alignBottomRight = false;
        } // end if
        container._x = -screenWidthPixels + (screenWidthPixels - background._x);
        container._y = -screenHeightPixels + (screenHeightPixels - background._y);
        container._x = container._x + newX;
        container._y = container._y + newY;
        if (alignBottomRight)
        {
            container._x = container._x - container._width;
            container._y = container._y - container._height;
        } // end if
    } // End of the function
    function SET_CLEAR_SPACE(clearSpace)
    {
        this.SET_MAX_WIDTH((DispConf.screenWidth - clearSpace) / DispConf.screenWidth);
    } // End of the function
    function SET_LEADING(newLeading)
    {
    } // End of the function
    function SET_DATA_SLOT()
    {
        var _loc3 = arguments[0];
        if (is_saving)
        {
            ++_loc3;
        } // end if
        dataArray[_loc3] = arguments.slice(1);
    } // End of the function
    function SET_DATA_SLOT_EMPTY()
    {
        this.CLEAR_ALL();
    } // End of the function
    function CREATE_CONTAINER()
    {
        if (container)
        {
            container.removeMovieClip();
        } // end if
        container = CONTENT.createEmptyMovieClip("container", 100, {_x: 0, _y: 0});
    } // End of the function
    function CLEAR_BACKGROUNDS()
    {
        for (var _loc2 = 0; _loc2 < backgroundMCS.length; ++_loc2)
        {
            backgroundMCS[_loc2].removeMovieClip();
        } // end of for
        backgroundMCS = [];
    } // End of the function
    function DRAW_INSTRUCTIONAL_BUTTONS(layoutType)
    {
        fullWidth = 0;
        if (layoutType == 1)
        {
            this.SET_MAX_WIDTH(0);
        } // end if
        if (layoutType == -1)
        {
            this.SET_MAX_WIDTH(1);
            OVERRIDE_BUTTON_SWAP = true;
        }
        else
        {
            OVERRIDE_BUTTON_SWAP = false;
        } // end else if
        if (layoutType == undefined)
        {
            this.SET_MAX_WIDTH(1);
            layoutType = 0;
        } // end if
        stackType = layoutType;
        if (dataArray.length > 0)
        {
            lineYPosition = 1;
            this.CREATE_CONTAINER();
            buttonList = [];
            backgrounds = [];
            backgroundMCS = [];
            this.createLineOfButtons(0, 0);
        } // end if
        this.SET_BACKGROUND();
        return (1);
    } // End of the function
    function createLineOfButtons(Xpos, startIndex)
    {
        var _loc11;
        var _loc3 = startIndex;
        var _loc6 = 0;
        var _loc9 = 0;
        var _loc10;
        var _loc2;
        var _loc4;
        var _loc12;
        var _loc5;
        for (var _loc3 = startIndex; _loc3 < dataArray.length; ++_loc3)
        {
            _loc2 = this.createItem(dataArray[_loc3]);
            buttonList.push(_loc2);
            if (_loc3 > 0)
            {
                _loc4 = buttonList[_loc3 - 1];
                _loc2._x = _loc4._x - (_loc2._width + spaceBetweenInstructions);
                _loc2._y = _loc4._y;
                _loc5 = _loc2._width + spaceBetweenInstructions;
                if (_loc5 + fullWidth <= _maxWidth)
                {
                    fullWidth = fullWidth + (_loc2._width + spaceBetweenInstructions);
                }
                else
                {
                    backgrounds.push(fullWidth);
                    fullWidth = 0;
                    ++numberOfLines;
                    _loc2._y = _loc4._y - _leadingSize - iconSize;
                    _loc2._x = Xpos - (_loc2._width - 6);
                    fullWidth = fullWidth + (_loc2._width + spaceBetweenInstructions);
                    this.createLineOfButtons(0, _loc3 + 1);
                    return (0);
                } // end else if
            }
            else
            {
                fullWidth = fullWidth + _loc2._width;
            } // end else if
            if (_loc6 > maxLines)
            {
                return (0);
            } // end if
        } // end of for
        backgrounds.push(fullWidth);
    } // End of the function
    function createItem(item)
    {
        item.reverse();
        ++numberOfItems;
        var _loc4 = [];
        var _loc10 = [];
        var _loc5 = container.createEmptyMovieClip("item" + numberOfItems, container.getNextHighestDepth());
        _loc5._y = -iconSize;
        var _loc8;
        var _loc12 = 0;
        var _loc6 = 0;
        var _loc7;
        var _loc11;
        for (var _loc2 = 0; _loc2 < item.length; ++_loc2)
        {
            if (typeof(item[_loc2]) == "string")
            {
                _loc10.push(true);
                var _loc9 = -1;
                if (typeof(item[_loc2 + 1]) == "number")
                {
                    _loc9 = item[_loc2 + 1];
                } // end if
                _loc7 = this.generateTextField("TF_" + _loc2, item[_loc2], _loc5, _loc9);
                fullTextHeight = _loc7.textHeight;
                _loc7._y = _loc7._y + fullTextHeight / 5;
                _loc4.push(_loc7);
            } // end if
            if (typeof(item[_loc2]) == "number")
            {
                _loc10.push(false);
                _loc11 = this.createButtonIcon(item[_loc2], _loc5);
                _loc4.push(_loc11);
            } // end if
            if (_loc2 > 0)
            {
                _loc8 = _loc4[_loc2 - 1];
                if (_loc10[_loc2 - 1])
                {
                    _loc6 = _loc8.textWidth;
                }
                else
                {
                    _loc6 = _loc8._width;
                } // end else if
                _loc4[_loc2]._x = _loc8._x + _loc6 + spaceBetweenSpaceAndButton;
            }
            else
            {
                _loc4[_loc2]._x = -iconSize / 2;
            } // end else if
            _loc5._x = _loc5._x - (_loc6 + spaceBetweenSpaceAndButton) - PADDING;
        } // end of for
        item.reverse();
        return (_loc5);
    } // End of the function
    function createButtonIcon(buttonID, buttonParent)
    {
        if (!OVERRIDE_BUTTON_SWAP)
        {
            if (DispConf.isCircleAccept)
            {
                if (buttonID == 30)
                {
                    buttonID = 31;
                }
                else if (buttonID == 31)
                {
                    buttonID = 30;
                } // end if
            } // end if
        } // end else if
        var _loc3 = buttonParent.attachMovie("button_" + buttonID, "button_" + buttonID, buttonID, {_width: 20, _height: 20, _x: 2, _y: 2});
        if (buttonID == 44)
        {
            respawn_spinnerMC = _loc3;
            respawn_spinnerMC.spinner.gotoAndPlay(respawn_spinner_frame);
        } // end if
        return (_loc3);
    } // End of the function
    function ADD_OUTLINE(tf)
    {
    } // End of the function
    function SET_BACKGROUND()
    {
        var _loc6;
        var _loc5;
        var _loc3;
        var _loc4;
        for (var _loc2 = 0; _loc2 < backgrounds.length; ++_loc2)
        {
            _loc3 = backgrounds[_loc2];
            if (_loc2 < 1)
            {
                _loc3 = _loc3 + PADDING * 2;
            } // end if
            _loc6 = FOUR_THREE_PADDING + (DispConf.safeRight * DispConf.screenWidth - _loc3);
            _loc5 = DispConf.safeBottom * DispConf.screenHeight - (iconSize + _leadingSize) * _loc2 - iconSize;
            _loc4 = CONTENT.attachMovie("backgroundShape", "background" + _loc2, 10 + _loc2, {_width: _loc3, _x: _loc6, _y: _loc5, _height: iconSize});
            backgroundMCS.push(_loc4);
            com.rockstargames.ui.utils.Colour.Colourise(_loc4, backgroundColours[0], backgroundColours[1], backgroundColours[2], backgroundColours[3]);
        } // end of for
        var _loc11 = (iconSize - fullTextHeight) / 2;
        this.initScreenLayout();
    } // End of the function
    function generateTextField(textFieldName, textString, parentMovieClip, buttonID)
    {
        var _loc2 = parentMovieClip[textFieldName];
        if (_loc2 == undefined)
        {
            _loc2 = parentMovieClip.createTextField(textFieldName, parentMovieClip.getNextHighestDepth(), 0, 0, 10, 10);
        } // end if
        _loc2.embedFonts = true;
        _loc2.autoSize = true;
        if (textString != undefined)
        {
            if (buttonID < 48 || buttonID > 50)
            {
                textString = textString.toUpperCase();
            } // end if
            _loc2.text = textString;
        } // end if
        _loc2.setTextFormat(instructionalTextFormat);
        return (_loc2);
    } // End of the function
    function SET_PADDING(top, right, bottom, left)
    {
        PADDING = top;
    } // End of the function
    function SET_BACKGROUND_COLOUR(r, g, b, a)
    {
        backgroundColours = [r, g, b, a];
        if (background)
        {
            com.rockstargames.ui.utils.Colour.Colourise(background, r, g, b, a);
        } // end if
    } // End of the function
    function SET_TEXT_COLOUR(r, g, b)
    {
    } // End of the function
    function OVERRIDE_RESPAWN_TEXT(id, txt)
    {
        if (is_saving)
        {
            ++id;
        } // end if
        var _loc2 = buttonList[id].TF_0;
        _loc2.text = txt.toUpperCase();
        _loc2.setTextFormat(instructionalTextFormat);
    } // End of the function
    function SET_MAX_WIDTH(maxWidth)
    {
        _maxWidth = maxWidth * DispConf.screenWidth;
    } // End of the function
    function getFourThreeSafeZoneOffset(screenWidthPixels)
    {
        var _loc2 = 0;
        if (FILE_WIDTH >= screenWidthPixels)
        {
            _loc2 = (FILE_WIDTH - screenWidthPixels) / 2 / 2;
        } // end if
        return (_loc2);
    } // End of the function
    var PADDING = 6;
    var respawn_spinner_frame = 1;
    var numberOfItems = 0;
    var iconSize = 24;
    var fullWidth = 0;
    var fullTextHeight = 0;
    var _maxWidth = 1280;
    var numberOfLines = 1;
    var is_saving = false;
    var savingText = "";
    var stackType = 0;
    var OVERRIDE_BUTTON_SWAP = false;
} // End of Class
