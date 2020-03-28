// Action script...

// [Initial MovieClip Action of sprite 198]
#initclip 2
class com.rockstargames.gtav.store.ECOMMERCE_STORE extends com.rockstargames.gtav.store.EcommerceStoreBaseClass
{
    var TIMELINE, CONTENT, BOUNDING_BOX, HEADER, detailsMC, charMC, crewMC, bgCol, textCol, headerCol, menuBgCol, blackCol, whiteCol, currentMenu, ERRORMESSAGE, column0, column1, column2, crewImgLoaderMC, charImgLoaderMC, currentColumn, currentSelection;
    function ECOMMERCE_STORE()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth(), {_visible: false});
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
        var _loc6 = 105;
        var _loc5 = 10;
        HEADER = CONTENT.attachMovie("header", "HEADER", CONTENT.getNextHighestDepth(), {_x: 31, _y: _loc5});
        columnYpos = _loc6 + _loc5;
        HEADER.platformLogo._visible = false;
        HEADER.shopLogosMC._visible = false;
        for (var _loc2 = 0; _loc2 < 4; ++_loc2)
        {
            HEADER["headerItem" + _loc2]._visible = false;
        } // end of for
        detailsMC = HEADER.alldetailsMC.detailsMC;
        charMC = HEADER.alldetailsMC.charMC;
        crewMC = HEADER.alldetailsMC.crewMC;
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc4);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
        if (detailsMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(detailsMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        } // end if
        com.rockstargames.ui.utils.Colour.Colourise(crewMC.bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        com.rockstargames.ui.utils.Colour.Colourise(charMC.bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        bgCol = [11, 55, 123];
        textCol = [255, 255, 255];
        headerCol = bgCol;
        menuBgCol = [0, 0, 0, 50];
        blackCol = [0, 0, 0, 100];
        whiteCol = [255, 255, 255, 100];
        this.adjustHeaderPositions();
        this.SET_CHAR_IMG("", "", false);
        this.SET_CREW_IMG("", "", false);
    } // End of the function
    function getHudColours()
    {
        var _loc5 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUEDARK, _loc5);
        textCol[0] = _loc5.r;
        textCol[1] = _loc5.g;
        textCol[2] = _loc5.b;
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc2);
        menuBgCol[0] = _loc2.r;
        menuBgCol[1] = _loc2.g;
        menuBgCol[2] = _loc2.b;
        menuBgCol[3] = _loc2.a;
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc3);
        blackCol[0] = _loc3.r;
        blackCol[1] = _loc3.g;
        blackCol[2] = _loc3.b;
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc4);
        whiteCol[0] = _loc4.r;
        whiteCol[1] = _loc4.g;
        whiteCol[2] = _loc4.b;
    } // End of the function
    function BUILD_MENU(menuIndex)
    {
    } // End of the function
    function MENU_STATE(menuIndex)
    {
        this.getHudColours();
        currentMenu = menuIndex;
        for (var _loc2 = 0; _loc2 < 3; ++_loc2)
        {
            if (CONTENT["column" + _loc2] != undefined)
            {
                CONTENT["column" + _loc2].removeMovieClip();
            } // end if
        } // end of for
        if (ERRORMESSAGE != undefined)
        {
            ERRORMESSAGE.removeMovieClip();
        } // end if
        if (HEADER._visible == false)
        {
            HEADER._visible = true;
        } // end if
        column0 = CONTENT.attachMovie("verticalMenuList", "column0", CONTENT.getNextHighestDepth() + 100, {_x: 31, _y: columnYpos, _visible: false});
        column1 = CONTENT.attachMovie("contentImageList", "column1", CONTENT.getNextHighestDepth() + 200, {_x: 321, _y: columnYpos, _visible: false});
        column2 = CONTENT.attachMovie("DetailsList", "column2", CONTENT.getNextHighestDepth() + 300, {_x: 611, _y: columnYpos, _visible: false});
        column2.UPDATE_STATUS_COLOURS(bgCol, textCol);
        for (var _loc2 = 0; _loc2 < 3; ++_loc2)
        {
            HEADER["headerItem" + _loc2]._visible = true;
        } // end of for
        HEADER.headerItem3._visible = false;
        maxCol = 1;
        column0 = CONTENT.column0;
        column0.SETUP_COLUMN(column0, menuBgCol, blackCol, whiteCol);
        if (column1 != undefined)
        {
            column1 = CONTENT.column1;
            column1.SETUP_COLUMN(column1, menuBgCol, blackCol, whiteCol);
            column1.SET_FOCUS(false);
        } // end if
        if (column2 != undefined)
        {
            column2 = CONTENT.column2;
            column2.SETUP_COLUMN(column2, menuBgCol, blackCol, whiteCol);
            column2.SET_FOCUS(false);
        } // end if
        this.SET_HEADER_COLOUR();
        com.rockstargames.ui.game.GameInterface.call("LOAD_PAUSE_MENU_STORE_CONTENT", STORE_TYPE, currentMenu);
    } // End of the function
    function REMOVE_COLUMN(_column)
    {
        this.SET_DATA_SLOT_EMPTY(_column);
    } // End of the function
    function SET_DATA_SLOT_EMPTY(_column, _slot)
    {
        CONTENT["column" + _column].SET_DATA_EMPTY(_slot);
    } // End of the function
    function SET_DATA_SLOT()
    {
        var _loc3 = new Array();
        _loc3 = arguments;
        var _loc5 = arguments[0];
        var _loc4 = arguments[1];
        _loc3 = arguments.slice(2);
        CONTENT["column" + _loc5].SET_DATA(_loc4, _loc3);
    } // End of the function
    function DISPLAY_DATA_SLOT(_column)
    {
        if (CONTENT._visible == false)
        {
            CONTENT._visible = true;
        } // end if
        CONTENT["column" + _column].REDRAW();
    } // End of the function
    function UPDATE_DATA_SLOT(_column, _slotIndex)
    {
        this.SET_DATA_SLOT(arguments);
    } // End of the function
    function HIDE_COLUMN2(vis)
    {
        CONTENT.column2._visible = vis;
    } // End of the function
    function SET_HEADER_COLOUR()
    {
        var _loc3 = arguments;
        if (_loc3[0] != undefined)
        {
            headerCol = [_loc3[0], _loc3[1], _loc3[2]];
        } // end if
        this.colouriseHeader();
    } // End of the function
    function SET_STATUS_COLOURS()
    {
        var _loc3 = arguments;
        if (_loc3[0] != undefined)
        {
            bgCol = [_loc3[0], _loc3[1], _loc3[2]];
        } // end if
        if (_loc3[3] != undefined)
        {
            textCol = [_loc3[3], _loc3[4], _loc3[5]];
        } // end if
        if (currentMenu == 1)
        {
            CONTENT.column2.UPDATE_STATUS_COLOURS(bgCol, textCol);
        } // end if
    } // End of the function
    function SET_CONTENTIMAGE_SIZE(_visItems)
    {
        if (currentMenu == 1 && _visItems != undefined)
        {
            CONTENT.column1.UPDATE_CONTENTIMAGE_SIZE(_visItems);
        } // end if
    } // End of the function
    function SET_HEADER_TITLE(str)
    {
        HEADER.headingMC.headingTF.text = str;
    } // End of the function
    function SET_COLUMN_TITLE(columnIndex, str)
    {
        this.SET_MENU_HEADER_TEXT(columnIndex, str);
    } // End of the function
    function SET_MENU_HEADER_TEXT(columnIndex, str)
    {
        HEADER["headerItem" + columnIndex].labelMC.labelTF.text = str;
        HEADER["headerItem" + columnIndex]._visible = true;
    } // End of the function
    function SET_HEADING_DETAILS(str1, str2, str3, isSingleplayer, crewname)
    {
        var _loc2 = detailsMC;
        _loc2.details1TF.autoSize = _loc2.details1condTF.autoSize = "left";
        _loc2.details1TF.wordWrap = _loc2.details1condTF.wordWrap = false;
        _loc2.details1TF.multiline = _loc2.details1condTF.multiline = false;
        if (isSingleplayer)
        {
            _loc2.details1condTF.text = "";
            _loc2.details1TF.text = str1.toUpperCase();
        }
        else
        {
            _loc2.details1TF.text = "";
            _loc2.details1condTF.text = str1;
            str2 = crewname;
        } // end else if
        _loc2.details1TF._x = -_loc2.details1TF._width;
        _loc2.details1condTF._x = -_loc2.details1condTF._width;
        if (str2 != undefined)
        {
            var _loc7 = str2.split(":").length > 1;
            if (!_loc7)
            {
                _loc2.details2TF.text = str2;
                _loc2.details2TF.autoSize = "left";
                _loc2.details2TF.wordWrap = false;
                _loc2.details2TF.multiline = false;
                _loc2.details2TF._x = -_loc2.details2TF._width;
                _loc2.timeTF.text = "";
            }
            else
            {
                var _loc3 = str2.split(" ");
                var _loc5 = _loc3[_loc3.length - 1];
                _loc3.pop();
                var _loc6 = _loc3.join(" ");
                _loc2.timeTF.text = _loc5;
                _loc2.timeTF.autoSize = "left";
                _loc2.timeTF.wordWrap = false;
                _loc2.timeTF.multiline = false;
                _loc2.timeTF._x = -_loc2.timeTF._width + 1;
                _loc2.details2TF.text = _loc6;
                _loc2.details2TF.autoSize = "left";
                _loc2.details2TF.wordWrap = false;
                _loc2.details2TF.multiline = false;
                _loc2.details2TF._x = _loc2.timeTF._x - _loc2.details2TF._width - 1;
            } // end if
        } // end else if
        if (str3 != undefined)
        {
            _loc2.details3TF.text = str3;
            _loc2.details3TF.autoSize = "left";
            _loc2.details3TF.wordWrap = false;
            _loc2.details3TF.multiline = false;
            _loc2.details3TF._x = -_loc2.details3TF._width;
        } // end if
    } // End of the function
    function SET_CREW_IMG(txd, crewTexturePath, show)
    {
        showCrew = show;
        if (showCrew)
        {
            if (txd != "")
            {
                if (crewImgLoaderMC == undefined)
                {
                    crewImgLoaderMC = (com.rockstargames.ui.media.ImageLoaderMC)(crewMC.attachMovie("txdLoader", "crewsImageMC", crewMC.getNextHighestDepth(), {_x: -imgSize}));
                } // end if
                if (crewImgLoaderMC.isLoaded == true)
                {
                    crewImgLoaderMC.removeTxdRef();
                } // end if
                crewImgLoaderMC.init(gfxFileName, txd, crewTexturePath, imgSize, imgSize);
                var _loc3 = 3;
                var _loc2 = String(crewImgLoaderMC).split(".");
                var _loc4 = _loc2.slice(_loc2.length - _loc3).join(".");
                crewImgLoaderMC.addTxdRef(_loc4, loadedCrewImg, this);
                crewImgLoaderMC._alpha = 0;
            } // end if
            crewMC._visible = true;
        }
        else
        {
            crewMC._visible = false;
        } // end else if
        this.adjustHeaderPositions();
    } // End of the function
    function loadedCrewImg()
    {
        var _loc2 = 0.200000;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(crewImgLoaderMC, _loc2, {_alpha: 100});
    } // End of the function
    function SET_CHAR_IMG(txd, charTexturePath, show)
    {
        showChar = show;
        if (showChar)
        {
            if (txd != "")
            {
                if (charImgLoaderMC == undefined)
                {
                    charImgLoaderMC = (com.rockstargames.ui.media.ImageLoaderMC)(charMC.attachMovie("txdLoader", "charImageMC", charMC.getNextHighestDepth(), {_x: -imgSize}));
                } // end if
                if (charImgLoaderMC.isLoaded == true)
                {
                    charImgLoaderMC.removeTxdRef();
                } // end if
                charImgLoaderMC.init(gfxFileName, txd, charTexturePath, imgSize, imgSize);
                var _loc3 = 3;
                var _loc2 = String(charImgLoaderMC).split(".");
                var _loc4 = _loc2.slice(_loc2.length - _loc3).join(".");
                charImgLoaderMC.addTxdRef(_loc4, loadedCharImg, this);
                charImgLoaderMC._alpha = 0;
            } // end if
            charMC._visible = true;
        }
        else
        {
            charMC._visible = false;
        } // end else if
        this.adjustHeaderPositions();
    } // End of the function
    function loadedCharImg()
    {
        var _loc2 = 0.200000;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(charImgLoaderMC, _loc2, {_alpha: 100});
    } // End of the function
    function adjustHeaderPositions()
    {
        if (showChar == false && showCrew == false)
        {
            detailsMC._x = detailsXPositions[0];
        }
        else if (showChar == false && showCrew == true)
        {
            crewMC._x = detailsXPositions[0];
            detailsMC._x = detailsXPositions[1];
        }
        else if (showChar == true && showCrew == false)
        {
            charMC._x = detailsXPositions[0];
            detailsMC._x = detailsXPositions[1];
        }
        else if (showChar == true && showCrew == true)
        {
            charMC._x = detailsXPositions[0];
            crewMC._x = detailsXPositions[1];
            detailsMC._x = detailsXPositions[2];
        } // end else if
    } // End of the function
    function SHOW_PLAYSTATION_LOGO(vis)
    {
        HEADER.platformLogo._visible = vis;
    } // End of the function
    function SET_SHOP_LOGO(_logo)
    {
        if (_logo > 0)
        {
            var _loc2 = "logo" + _logo.toString();
            HEADER.shopLogosMC.gotoAndStop(_loc2);
            this.SHOW_SHOP_LOGO(true);
        }
        else
        {
            this.SHOW_SHOP_LOGO(false);
        } // end else if
    } // End of the function
    function SHOW_SHOP_LOGO(vis)
    {
        HEADER.shopLogosMC._visible = vis;
    } // End of the function
    function SET_DESCRIPTION(column, priceTitle, itemPrice, numPlayers, statusText, statusColour, priceVis, playersVis, statusVis)
    {
        if (currentMenu == 1)
        {
            column2.SET_DESCRIPTION(priceTitle, itemPrice, numPlayers, statusText, statusColour, priceVis, playersVis, statusVis);
        } // end if
    } // End of the function
    function HIGHLIGHT_ITEM(_column, _itemIndex)
    {
        this.HIGHLIGHT_COLUMN(_column);
        CONTENT["column" + _column].highlightItem(_itemIndex);
    } // End of the function
    function HIGHLIGHT_COLUMN(_column)
    {
        if (_column != undefined)
        {
            var _loc3;
            for (var _loc2 = 0; _loc2 < 2; ++_loc2)
            {
                _loc3 = "column" + _loc2;
                if (_loc2 == _column)
                {
                    if (CONTENT[_loc3] != undefined)
                    {
                        CONTENT[_loc3].SET_FOCUS(true);
                    } // end if
                    continue;
                } // end if
                if (CONTENT[_loc3] != undefined && _loc2 != 0)
                {
                    CONTENT[_loc3].SET_FOCUS(false);
                } // end if
            } // end of for
            if (currentMenu == 1 && _column == 1)
            {
                if (CONTENT.column2 != undefined)
                {
                    CONTENT.column2.SET_FOCUS(true);
                } // end if
            }
            else if (currentMenu == 1 && _column == 0)
            {
                if (CONTENT.column2 != undefined)
                {
                    CONTENT.column2.SET_FOCUS(false);
                } // end if
            } // end else if
            if (CONTENT[_loc3] != undefined)
            {
                CONTENT[_loc3].CURRENT_COLUMN(_column);
            } // end if
            currentColumn = _column;
            this.colouriseHeader();
        } // end if
    } // End of the function
    function GET_CURRENT_SELECTION(_column)
    {
        var _loc3;
        if (_column == undefined)
        {
            _loc3 = this.GET_CURRENT_COLUMN();
        }
        else
        {
            _loc3 = _column;
        } // end else if
        var _loc2 = "column" + _loc3;
        currentSelection = CONTENT[_loc2].GET_CURRENT_SELECTION();
        if (currentSelection == -1 && CONTENT[_loc2].data.length > 0)
        {
            currentSelection = 0;
        } // end if
        return (currentSelection);
    } // End of the function
    function GET_CURRENT_START_INDEX(_column)
    {
        var _loc3;
        if (_column == undefined)
        {
            _loc3 = 1;
        }
        else
        {
            _loc3 = _column;
        } // end else if
        var _loc4 = "column" + _loc3;
        var _loc2 = CONTENT[_loc4].arrayStartPoint;
        if (_loc2 == undefined || _loc2 == NaN)
        {
            _loc2 = -1;
        } // end if
        return (_loc2);
    } // End of the function
    function GET_CURRENT_END_INDEX(_column)
    {
        var _loc3;
        if (_column == undefined)
        {
            _loc3 = 1;
        }
        else
        {
            _loc3 = _column;
        } // end else if
        var _loc4 = "column" + _loc3;
        var _loc2 = CONTENT[_loc4].endIndex;
        if (_loc2 == undefined || _loc2 == NaN)
        {
            _loc2 = -1;
        } // end if
        return (_loc2);
    } // End of the function
    function GET_CURRENT_COLUMN()
    {
        return (currentColumn);
    } // End of the function
    function DISPLAY_ERROR_MESSAGE(titleStr, msgStr)
    {
        HEADER._visible = false;
        column0._visible = false;
        if (column1 != undefined)
        {
            column1._visible = false;
        } // end if
        if (column2 != undefined)
        {
            column2._visible = false;
        } // end if
        ERRORMESSAGE = CONTENT.attachMovie("errorMessage", "errorMessage", CONTENT.getNextHighestDepth());
        ERRORMESSAGE.errorHeaderTF.text = titleStr;
        ERRORMESSAGE.errorMessageTF.text = msgStr;
    } // End of the function
    function colouriseHeader()
    {
        var _loc6 = headerCol[0];
        var _loc7 = headerCol[1];
        var _loc5 = headerCol[2];
        com.rockstargames.ui.utils.Colour.Colourise(HEADER.headingMC, whiteCol[0], whiteCol[1], whiteCol[2], 100);
        if (HEADER.headerItem3.tabMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(HEADER.headerItem3.tabMC, _loc6, _loc7, _loc5, 100);
        } // end if
        if (HEADER.headerItem3.bgMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(HEADER.headerItem3.bgMC, whiteCol[0], whiteCol[1], whiteCol[2], 100);
        } // end if
        if (HEADER.headerItem3.labelMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(HEADER.headerItem3.labelMC, 0, 0, 0, 100);
        } // end if
        for (var _loc4 = 0; _loc4 < 3; ++_loc4)
        {
            var _loc2 = HEADER["headerItem" + _loc4];
            if (_loc2.tabMC != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc2.tabMC, _loc6, _loc7, _loc5, 100);
            } // end if
            if (_loc4 == currentColumn)
            {
                _loc2.tabMC._visible = true;
                if (_loc2.bgMC != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(_loc2.bgMC, whiteCol[0], whiteCol[1], whiteCol[2], 100);
                } // end if
                if (_loc2.labelMC != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(_loc2.labelMC, 0, 0, 0, 100);
                } // end if
                continue;
            } // end if
            if (currentMenu == 1 && currentColumn == 1 && _loc4 == 2)
            {
                _loc2.tabMC._visible = true;
                if (_loc2.bgMC != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(_loc2.bgMC, whiteCol[0], whiteCol[1], whiteCol[2], 100);
                } // end if
                if (_loc2.labelMC != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(_loc2.labelMC, 0, 0, 0, 100);
                } // end if
                continue;
            } // end if
            _loc2.tabMC._visible = false;
            var _loc3 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            if (_loc2.bgMC != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc2.bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
            } // end if
            if (_loc2.labelMC != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc2.labelMC, whiteCol[0], whiteCol[1], whiteCol[2], 50);
            } // end if
        } // end of for
    } // End of the function
    function SHUTDOWN_MOVIE()
    {
        if (column0 != undefined)
        {
            column0._visible = false;
        } // end if
        if (column1 != undefined)
        {
            column1._visible = false;
        } // end if
        if (column2 != undefined)
        {
            column2._visible = false;
        } // end if
        CONTENT.column1.clearTXDs();
        if (column0 != undefined)
        {
            this.SET_DATA_SLOT_EMPTY(0);
        } // end if
        if (column1 != undefined)
        {
            this.SET_DATA_SLOT_EMPTY(1);
        } // end if
        if (column2 != undefined)
        {
            this.SET_DATA_SLOT_EMPTY(2);
        } // end if
        HEADER.removeMovieClip();
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                CONTENT["column" + currentColumn].SET_INPUT_EVENT(direction);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                if (currentColumn < maxCol)
                {
                    CONTENT["column" + currentColumn].SET_FOCUS(false);
                    ++currentColumn;
                    CONTENT["column" + currentColumn].SET_FOCUS(true);
                    this.HIGHLIGHT_COLUMN(currentColumn);
                    com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET");
                } // end if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                CONTENT["column" + currentColumn].SET_INPUT_EVENT(direction);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                if (currentColumn > 0)
                {
                    CONTENT["column" + currentColumn].SET_FOCUS(false);
                    --currentColumn;
                    CONTENT["column" + currentColumn].SET_FOCUS(true);
                    this.HIGHLIGHT_COLUMN(currentColumn);
                    com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET");
                } // end if
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_INPUT_EVENT_CIRCLE()
    {
        if (currentColumn > 0)
        {
            --currentColumn;
            this.HIGHLIGHT_COLUMN(currentColumn);
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET");
        } // end if
    } // End of the function
    function SET_INPUT_EVENT_CROSS()
    {
        if (column1 != undefined)
        {
            column1.REDRAW();
        } // end if
        if (column2 != undefined)
        {
            column2.REDRAW();
        } // end if
        com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET");
    } // End of the function
    function SET_ANALOG_STICK_INPUT(isLeftStick, inputX, inputY)
    {
        if (currentMenu == 1)
        {
            if (isLeftStick == false)
            {
                if (Math.abs(inputY) > 40)
                {
                    var _loc2 = com.rockstargames.ui.game.GamePadConstants.DPADUP;
                    if (inputY > 0)
                    {
                        _loc2 = com.rockstargames.ui.game.GamePadConstants.DPADDOWN;
                    } // end if
                    CONTENT.column2.SET_INPUT_EVENT(_loc2);
                } // end if
            } // end if
        } // end if
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        com.rockstargames.ui.utils.Debug.log("uniqueID --------------->> " + uniqueID);
        if (currentMenu == 1)
        {
            CONTENT.column1.ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success);
        } // end if
    } // End of the function
    function traceOut(str)
    {
        trace (str);
    } // End of the function
    var STORE_TYPE = 7;
    var maxCol = 2;
    var columnYpos = 121;
    var _highlighted = false;
    var gfxFileName = "PAUSE_MENU_STORE_CONTENT";
    var detailsXPositions = [868, 826, 784];
    var showChar = false;
    var showCrew = false;
    var imgSize = 37;
} // End of Class
#endinitclip
