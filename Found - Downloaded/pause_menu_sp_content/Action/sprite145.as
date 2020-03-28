// Action script...

// [Initial MovieClip Action of sprite 145]
#initclip 24
class com.rockstargames.gtav.pauseMenu.PAUSE_MENU_SP_CONTENT extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuContentBase
{
    var dbgID, dbgOn, __set__debug, __get__debug, menuList, dbg, headerMethod, menuGFXList, currentPage, __get__inTopMenu, MENU_INTERACTION, GET_COLUMN, menuState, menuLevel, MENU_SET_FOCUS, MENU_CHANGE_STATE, getSelectedMenuItem, menuUniqueID, menuLevelOld, isReadyToRender, pageLoaderObject, errorImgMC, context, contextMenu, inContext, errorMsg, CONTENT, FOCUS_CONTENT, blipLayer, menuceptionDepth, storedMenuState, GET_PAGE, LOAD_PAGE, menuIndex, content, isExitBlocked, TRIGGER_PAUSE_MENU_EVENT, localdebug;
    function PAUSE_MENU_SP_CONTENT()
    {
        super();
        dbgID = "PAUSE_MENU_SP_CONTENT";
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        dbgOn = Boolean(0);
        this.__set__debug(Boolean(0));
    } // End of the function
    function SHOW_DEBUG(b)
    {
        dbgOn = b;
    } // End of the function
    function set debug(d)
    {
        //return (this.debug());
        null;
    } // End of the function
    function localLoad()
    {
    } // End of the function
    function SET_TEXT_SIZE(isAsian, sizeOverride)
    {
        var _loc3 = 16;
        var _loc2 = 13;
        if (isAsian != undefined && isAsian == true)
        {
            _loc2 = _loc3;
        } // end if
        if (sizeOverride != undefined)
        {
            if (sizeOverride > 18)
            {
                sizeOverride = 18;
            } // end if
            if (sizeOverride < 13)
            {
                sizeOverride = 13;
            } // end if
            _loc2 = sizeOverride;
        } // end if
        com.rockstargames.ui.utils.UIText.SIZE = _loc2;
    } // End of the function
    function INSTRUCTIONAL_BUTTONS(func)
    {
        var _loc2 = arguments.slice(1);
        com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "PAUSE_MENU_INSTRUCTIONAL_BUTTONS", func, _loc2 == undefined ? ([]) : (_loc2));
    } // End of the function
    function BLOCK_HEADER_ADVANCE(b)
    {
        canHeaderAdvance = !b;
    } // End of the function
    function BUILD_MENU()
    {
        menuList = arguments;
        this.dbg("BUILD_MENU " + arguments);
        this.headerMethod("BUILD_MENU", arguments);
    } // End of the function
    function BUILD_MENU_GFX_FILES()
    {
        menuGFXList = arguments;
        this.dbg("BUILD_MENU_GFX_FILES " + arguments);
        this.headerMethod("BUILD_MENU_GFX_FILES", arguments);
    } // End of the function
    function SET_HEADER_TITLE()
    {
        this.headerMethod("SET_HEADER_TITLE", arguments);
    } // End of the function
    function SET_HEADING_DETAILS()
    {
        this.headerMethod("SET_HEADING_DETAILS", arguments);
    } // End of the function
    function SET_MENU_HEADER_TEXT_BY_INDEX()
    {
        this.headerMethod("SET_MENU_HEADER_TEXT_BY_INDEX", arguments);
    } // End of the function
    function SET_MENU_ITEM_COLOUR()
    {
        this.headerMethod("SET_MENU_ITEM_COLOUR", arguments);
    } // End of the function
    function SET_CHAR_IMG()
    {
        this.headerMethod("SET_CHAR_IMG", arguments);
    } // End of the function
    function SET_CREW_IMG()
    {
        this.headerMethod("SET_CREW_IMG", arguments);
    } // End of the function
    function SET_CREW_TAG()
    {
        this.headerMethod("SET_CREW_TAG", arguments);
    } // End of the function
    function SCROLL_MENU_IN_DIR()
    {
        this.headerMethod("SCROLL_MENU_IN_DIR", arguments);
    } // End of the function
    function HIGHLIGHT_MENU()
    {
        this.headerMethod("HIGHLIGHT_MENU", arguments);
    } // End of the function
    function LOCK_MENU_ITEM()
    {
        this.headerMethod("LOCK_MENU_ITEM", arguments);
    } // End of the function
    function SET_CONTENT_SCALED(isScaled, tlx, tly, brx, bry)
    {
        currentPage.setScaledContent(true, tlx, tly, brx, bry);
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen)
    {
        currentPage.setDisplayConfig(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen);
    } // End of the function
    function SET_INPUT_EVENT(inputID)
    {
        if (this.__get__inTopMenu())
        {
            return;
        } // end if
        switch (inputID)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                this.MENU_INTERACTION(inputID);
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_COLUMN_INPUT_EVENT()
    {
        var _loc5 = arguments[0];
        var _loc4 = arguments[1];
        var _loc3 = this.GET_COLUMN(_loc5);
        this.dbg("SET_COLUMN_INPUT_EVENT columnMC: " + _loc3 + " | inputID: " + _loc4);
        if (_loc3 != undefined)
        {
            _loc3.SET_INPUT_EVENT.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function GET_COLUMN_SELECTION()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("GET_COLUMN_SELECTION columnMC: " + _loc3 + " | selection: " + _loc3.model.getCurrentSelection());
        if (_loc3 != undefined)
        {
            return (_loc3.model.getCurrentSelection());
        } // end if
    } // End of the function
    function SET_COLUMN_TITLE()
    {
        var _loc4 = arguments[0];
        var _loc5 = arguments[1];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("SET_COLUMN_TITLE columnMC: " + _loc3 + " | columnTitle params: " + arguments);
        if (_loc3 != undefined)
        {
            _loc3.SET_TITLE.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function SET_DESCRIPTION()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("SET_DESCRIPTION columnIndex: " + _loc4 + " | description params: " + arguments);
        if (_loc3 != undefined)
        {
            _loc3.SET_DESCRIPTION.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function SET_COLUMN_FOCUS()
    {
        var _loc10 = arguments[0];
        var _loc4 = true;
        var _loc12 = false;
        var _loc8 = true;
        if (arguments[1] != undefined)
        {
            _loc4 = arguments[1];
        } // end if
        if (arguments[2] != undefined)
        {
            _loc12 = arguments[2];
        } // end if
        if (arguments[3] != undefined)
        {
            _loc8 = arguments[3];
        } // end if
        this.dbg("columnIndex " + _loc10);
        this.dbg("highlighted " + _loc4);
        this.dbg("moveFocus " + _loc12);
        this.dbg("prevHightlight " + _loc8);
        var _loc5 = this.GET_COLUMN(_loc10);
        if (_loc5 != undefined)
        {
            _loc5.SET_FOCUS.apply(_loc5, [_loc4]);
            if (_loc12)
            {
                var _loc9 = menuState;
                var _loc14 = menuLevel;
                var _loc15 = _loc10 + 1;
                if (!_loc8)
                {
                    this.MENU_SET_FOCUS(false);
                } // end if
                menuLevel = _loc15;
                this.MENU_SET_FOCUS(_loc4);
                var _loc6 = -1;
                _loc5 = this.GET_COLUMN(menuLevel - 1);
                this.MENU_CHANGE_STATE(_loc5);
                if (_loc5 != undefined)
                {
                    var _loc3 = this.getSelectedMenuItem(_loc5);
                    _loc6 = _loc3.uniqueID;
                } // end if
                this.dbg("----------------------------------- ");
                this.dbg("oldMenuState " + _loc9);
                this.dbg("oldMenuLevel " + _loc14);
                this.dbg("targetLevel " + _loc15);
                this.dbg("uniqueID " + _loc6);
                this.dbg("----------------------------------- ");
                if (_loc6 != undefined)
                {
                    menuUniqueID = _loc6;
                    var _loc7 = menuLevel - _loc14;
                    this.dbg("DIRECTION AFTER SET COLUMN FOCUS " + _loc7);
                    if (_loc7 > 0)
                    {
                        var _loc11 = this.getSelectedMenuItem(this.GET_COLUMN(menuLevel));
                        var _loc13 = -1;
                        if (_loc11.menuID != undefined || _loc11.menuID != null)
                        {
                            _loc13 = _loc11.menuID;
                        } // end if
                        _loc3 = this.getSelectedMenuItem(_loc5);
                        if (_loc3 != undefined)
                        {
                            com.rockstargames.ui.game.GameInterface.call("TRIGGER_PAUSE_MENU_EVENT", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, _loc3.menuID, _loc3.uniqueID, _loc13);
                            this.dbg("TRIGGER_PAUSE_MENU_EVENT | currMenuItem.menuID: " + _loc3.menuID + " | currMenuItem.uniqueID: " + _loc3.uniqueID + " nextMenuID: " + _loc13);
                        } // end if
                    }
                    else
                    {
                        com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, _loc9, menuState, menuUniqueID, _loc7);
                        this.dbg("---->LAYOUT_CHANGED oldMenuState: " + _loc9 + " | menuState: " + menuState + " | menuUniqueID: " + menuUniqueID + " | dir: " + _loc7);
                    } // end else if
                    com.rockstargames.ui.game.GameInterface.call("IS_NAVIGATING_CONTENT", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, true);
                } // end if
                menuLevelOld = menuLevel;
            } // end if
        } // end if
    } // End of the function
    function SET_COLUMN_HIGHLIGHT()
    {
        var _loc6 = arguments[0];
        var _loc5 = arguments[1];
        var _loc8 = false;
        var _loc4 = false;
        if (arguments[3] != undefined)
        {
            _loc4 = arguments[3];
        } // end if
        var _loc3 = this.GET_COLUMN(_loc6);
        this.dbg("SET_COLUMN_HIGHLIGHT " + arguments);
        this.dbg("SET_COLUMN_HIGHLIGHT scriptSetUnqID " + _loc4);
        this.dbg("SET_COLUMN_HIGHLIGHT ____> columnMC: " + _loc3);
        this.dbg("SET_COLUMN_HIGHLIGHT ____> highlightIndex: " + _loc5);
        if (_loc3 != undefined)
        {
            _loc3.SET_HIGHLIGHT.apply(_loc3, [_loc5]);
            if (_loc4 == true)
            {
                var _loc7 = this.getSelectedMenuItem(_loc3);
                menuUniqueID = _loc7.uniqueID;
                this.dbg("*****************");
                this.dbg("menuUniqueID set to " + menuUniqueID);
                this.dbg("*****************");
            } // end if
        } // end if
    } // End of the function
    function INIT_COLUMN_SCROLL()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("INIT_COLUMN_SCROLL ____> arguments: " + arguments);
        if (_loc3 != undefined)
        {
            _loc3.INIT_SCROLL_BAR.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function SET_COLUMN_SCROLL()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("SET_COLUMN_SCROLL ____> arguments: " + arguments);
        this.dbg("SET_COLUMN_SCROLL ____> columnMC: " + _loc3);
        if (_loc3 != undefined)
        {
            _loc3.SET_SCROLL_BAR.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function SET_COLUMN_CAN_JUMP()
    {
        var _loc5 = arguments[0];
        var _loc4 = arguments[1];
        var _loc3 = this.GET_COLUMN(_loc5);
        if (_loc3 != undefined)
        {
            _loc3.SET_COLUMN_CAN_JUMP.apply(_loc3, [_loc4]);
        } // end if
    } // End of the function
    function SET_DATA_SLOT()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("SET_DATA_SLOT " + arguments);
        this.dbg("SET_DATA_SLOT ____> columnMC: " + _loc3);
        if (_loc3 != undefined)
        {
            _loc3.SET_DATA_SLOT.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function UPDATE_SLOT()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("UPDATE_SLOT" + arguments);
        this.dbg("UPDATE_SLOT columnMC: " + _loc3);
        if (_loc3 != undefined)
        {
            _loc3.UPDATE_SLOT.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function ADD_SLOT()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("ADD_SLOT" + arguments);
        this.dbg("ADD_SLOT columnMC: " + _loc3);
        if (_loc3 != undefined)
        {
            _loc3.ADD_SLOT.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function DISPLAY_DATA_SLOT()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("DISPLAY_DATA_SLOT : " + arguments);
        this.dbg("DISPLAY_DATA_SLOT columnMC: " + _loc3);
        if (_loc3 != undefined)
        {
            _loc3.DISPLAY_VIEW.apply(_loc3, [0]);
        } // end if
        if (!isReadyToRender)
        {
            com.rockstargames.ui.game.GameInterface.call("PAUSE_MENU_READY_TO_RENDER", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
            isReadyToRender = true;
        } // end if
    } // End of the function
    function SET_DATA_SLOT_EMPTY()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("SET_DATA_SLOT_EMPTY " + arguments);
        this.dbg("SET_DATA_SLOT_EMPTY _____> columnMC: " + _loc3);
        if (_loc3 != undefined)
        {
            _loc3.SET_DATA_SLOT_EMPTY.apply(_loc3, [0]);
        } // end if
    } // End of the function
    function SHOW_COLUMN()
    {
        var _loc4 = arguments[0];
        var _loc3 = this.GET_COLUMN(_loc4);
        this.dbg("SHOW_COLUMN " + arguments);
        this.dbg("SHOW_COLUMN _____> columnMC: " + _loc3);
        if (_loc3 != undefined)
        {
            _loc3.SHOW_COLUMN.apply(_loc3, arguments.slice(1));
        } // end if
    } // End of the function
    function SHOW_AND_CLEAR_COLUMNS()
    {
        var _loc6 = arguments.length;
        if (_loc6 % 2 != 0)
        {
            this.dbg("AN IMPROPER NUMBER OF ARGUMENTS WAS PASSED INTO SHOW_AND_CLEAR_COLUMNS");
            return;
        } // end if
        for (var _loc3 = 0; _loc3 < _loc6; _loc3 = _loc3 + 2)
        {
            var _loc4 = arguments[_loc3];
            var _loc5 = arguments[_loc3 + 1];
            this.SET_DATA_SLOT_EMPTY(_loc4);
            this.SHOW_COLUMN(_loc4, _loc5);
        } // end of for
    } // End of the function
    function KILL_PAGE()
    {
        this.dbg("KILL_PAGE " + currentPage);
        this.dbg("pageLoaderObject._mc " + pageLoaderObject._mc);
        this.SHOW_WARNING_MESSAGE(false);
        if (errorImgMC.isLoaded)
        {
            errorImgMC.removeTxdRef();
        } // end if
        this.SHOW_CONTEXT_MENU(false);
        if (pageLoaderObject._mc != undefined)
        {
            currentPage.onPageExit();
            pageLoaderObject._mc.removeMovieClip();
        } // end if
        pageLoaderObject = null;
        currentPage = null;
    } // End of the function
    function SHOW_CONTEXT_MENU(bool)
    {
        if (context != undefined)
        {
            context.removeMovieClip();
        } // end if
        if (bool)
        {
            var _loc3 = arguments[1];
            context = (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)(contextMenu.attachMovie("verticalMenuList", "verticalMenuListMC", contextMenu.getNextHighestDepth()));
            context.INITIALISE();
            context._x = (columnWidth + 2) * _loc3;
            inContext = true;
        }
        else
        {
            inContext = false;
        } // end else if
    } // End of the function
    function SET_CONTEXT_SLOT()
    {
        if (context != undefined)
        {
            context.SET_DATA_SLOT.apply(context, arguments.slice(1));
        } // end if
    } // End of the function
    function SET_CONTEXT_EMPTY()
    {
        if (context != undefined)
        {
            context.SET_DATA_SLOT_EMPTY.apply(context, [0]);
        } // end if
    } // End of the function
    function DISPLAY_CONTEXT_SLOT()
    {
        if (context != undefined)
        {
            context.DISPLAY_VIEW.apply(context, [0]);
        } // end if
        context.SET_FOCUS(true);
    } // End of the function
    function SHOW_WARNING_MESSAGE(bShow, columnIndex, numCols, bodyStr, titleStr, bgHeight, txd, txn, imgAlignment)
    {
        var _loc27 = 0;
        var _loc14 = 1;
        var _loc19 = 2;
        if (errorMsg == undefined)
        {
            errorMsg = CONTENT.attachMovie("errorMessage", "errorMessageMC", CONTENT.getNextHighestDepth(), {_visible: false});
            errorMsg.titleTF.textAutoSize = "shrink";
            com.rockstargames.ui.utils.Colour.ApplyHudColour(errorMsg.tileBGMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(errorMsg.titleTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        } // end if
        if (bShow && arguments[1] != undefined)
        {
            errorMsg._x = (columnWidth + 2) * columnIndex;
            if (numCols == undefined || numCols <= 0)
            {
                numCols = 1;
            } // end if
            var _loc23 = columnWidth * numCols + 2 * (numCols - 1);
            errorMsg.tileBGMC.bgMC._width = _loc23;
            if (bgHeight > 10)
            {
                errorMsg.tileBGMC.bgMC._height = bgHeight;
            }
            else
            {
                errorMsg.tileBGMC.bgMC._height = 430;
            } // end else if
            var _loc15 = 81;
            var _loc13 = 111;
            var _loc5;
            var _loc6;
            errorMsg.titleTF.text = arguments[4] == undefined ? ("") : (arguments[4]);
            var _loc9 = errorMsg.titleTF.getTextFormat();
            if (numCols == 1)
            {
                _loc5 = 12;
                _loc6 = 240;
                _loc9.size = 35;
            }
            else
            {
                _loc5 = 21;
                _loc6 = 530;
                _loc9.size = 55;
                if (numCols == 3)
                {
                    this.FOCUS_CONTENT(true);
                } // end if
            } // end else if
            if (imgAlignment == _loc14)
            {
                _loc15 = 225;
                _loc13 = 236;
            } // end if
            if (txd != undefined && txn != undefined && txd != "" && txn != "")
            {
                if (!errorImgMC)
                {
                    errorImgMC = (com.rockstargames.ui.media.ImageLoaderMC)(errorMsg.attachMovie("errorImgMC", "errorImgMC", errorMsg.getNextHighestDepth()));
                } // end if
                var _loc7;
                var _loc11;
                if (imgAlignment == _loc14)
                {
                    _loc7 = 578;
                    _loc11 = 160;
                    errorImgMC._x = 0;
                    errorImgMC._y = 0;
                }
                else if (imgAlignment == _loc19)
                {
                    _loc7 = 288;
                    _loc11 = 430;
                    errorImgMC._x = errorMsg.tileBGMC.bgMC._width - _loc7;
                    errorImgMC._y = 0;
                } // end else if
                var _loc16 = false;
                if (errorImgMC.textureDict == txd && errorImgMC.textureFilename == txn)
                {
                    _loc16 = true;
                }
                else if (errorImgMC.isLoaded)
                {
                    errorImgMC.removeTxdRef();
                } // end else if
                errorImgMC.init("pause_menu_sp_content", txd, txn, _loc7, _loc11);
                errorImgMC.requestTxdRef("errorImgMC", _loc16, onWarningImgLoaded, this);
            }
            else if (errorImgMC.isLoaded)
            {
                errorImgMC.removeTxdRef();
            } // end else if
            errorMsg.bodyTF._x = _loc5;
            errorMsg.bodyTF._y = _loc13;
            errorMsg.bodyTF._width = _loc6;
            if (blipLayer)
            {
                blipLayer.removeMovieClip();
            } // end if
            blipLayer = errorMsg.createEmptyMovieClip("blipLayer", 1000);
            var _loc26 = new com.rockstargames.ui.utils.Text();
            _loc26.setTextWithIcons("~HUD_COLOUR_WHITE~" + arguments[3], blipLayer, errorMsg.bodyTF, 0, com.rockstargames.ui.utils.UIText.SIZE, 4, false);
            var _loc8 = new TextFormat();
            _loc8.font = "$Font2";
            _loc8.size = com.rockstargames.ui.utils.UIText.SIZE;
            errorMsg.bodyTF.setTextFormat(_loc8);
            errorMsg.titleTF._width = _loc6;
            errorMsg.titleTF._x = _loc5;
            errorMsg.titleTF._y = _loc15 - errorMsg.titleTF.textHeight;
            errorMsg.titleTF.setTextFormat(_loc9);
            for (var _loc3 = 0; _loc3 < 3; ++_loc3)
            {
                errorMsg.tileBGMC["col" + _loc3 + "MC"]._visible = _loc3 < numCols;
            } // end of for
        }
        else if (!bShow)
        {
            var _loc20 = errorMsg._visible;
            var _loc10 = errorMsg.tileBGMC;
            var _loc25 = _loc10.col0MC._visible;
            var _loc24 = _loc10.col1MC._visible;
            var _loc22 = _loc10.col2MC._visible;
            if (_loc20 && _loc25 && _loc24 && _loc22 && menuceptionDepth == 0)
            {
                this.FOCUS_CONTENT(false);
            } // end if
        } // end else if
        errorMsg._visible = bShow;
    } // End of the function
    function SET_SC_LOGGED(logged)
    {
        this.dbg("SET_SC_LOGGED | logged: " + logged);
        isLoggedSC = logged;
    } // End of the function
    function SET_CONTROL_LABELS()
    {
        var _loc3 = this.GET_COLUMN(1);
        if (_loc3 != undefined)
        {
            _loc3.SET_CONTROL_LABELS.apply(_loc3, arguments);
        } // end if
    } // End of the function
    function MENU_STATE(id)
    {
        var _loc3 = menuState;
        this.dbg("--- DYNAMIC EXTERNAL LOAD FROM XML --- menuLevel: " + menuLevel);
        storedMenuState = id;
        var _loc4 = true;
        if (menuLevel == 0)
        {
            var _loc2 = this.GET_PAGE(storedMenuState);
            if (_loc2 != "")
            {
                this.LOAD_PAGE(_loc2);
            }
            else
            {
                menuState = menuList[menuIndex];
                this.MENU_STATE_LOAD(_loc3);
            } // end else if
            _loc4 = false;
        } // end if
        if (_loc4)
        {
            currentPage.stateChanged(storedMenuState);
            this.MENU_STATE_LOAD(_loc3);
        } // end if
    } // End of the function
    function LOAD_CHILD_PAGE(gfxFilePath, _menustate, inceptDir)
    {
        this.dbg("LOAD_CHILD_PAGE: " + arguments);
        this.KILL_PAGE();
        menuLevel = 0;
        if (inceptDir > 0)
        {
            menuceptionDepth = menuceptionDepth + inceptDir;
        } // end if
        storedMenuState = _menustate;
        this.LOAD_PAGE(gfxFilePath);
    } // End of the function
    function LOADED_PAGE()
    {
        super.LOADED_PAGE();
        this.PAGE_FADE_IN();
    } // End of the function
    function PAGE_FADE_IN()
    {
        errorMsg._alpha = content._alpha = context._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(errorMsg, 0.300000, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(content, 0.300000, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(context, 0.300000, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
    } // End of the function
    function MENU_SECTION_JUMP(mindex, loadContent, scriptLayoutChange)
    {
        if (isExitBlocked)
        {
            return;
        } // end if
        if (loadContent == undefined)
        {
            loadContent = true;
        } // end if
        this.dbg("MENU SECTION JUMP mindex: " + mindex + " : " + loadContent + " " + scriptLayoutChange);
        menuLevel = 0;
        menuceptionDepth = 0;
        menuIndex = mindex;
        if (menuIndex < 0)
        {
            menuIndex = 0;
        } // end if
        if (menuIndex > menuList.length - 1)
        {
            menuIndex = menuList.length - 1;
        } // end if
        this.headerMethod("HIGHLIGHT_MENU", [menuIndex]);
        var _loc2 = menuList[menuIndex];
        var _loc3 = menuState;
        this.dbg("** CHANGE ** menuList: " + menuList);
        this.dbg("** CHANGE ** menustateID: " + _loc2);
        if (loadContent)
        {
            this.KILL_PAGE();
            menuLevel = 0;
            this.dbg("** SET menuLevel ** " + menuLevel);
            this.MENU_STATE(_loc2);
        } // end if
        if (scriptLayoutChange == undefined)
        {
            scriptLayoutChange = false;
        } // end if
        if (scriptLayoutChange)
        {
            menuState = _loc2;
            com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED_FOR_SCRIPT_ONLY", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, _loc3, menuState, -1, 0);
            this.dbg("LAYOUT_CHANGED_FOR_SCRIPT_ONLY mindex: " + _loc3 + " : " + menuState + " " + " -1 " + " 0 ");
        } // end if
    } // End of the function
    function FRONTEND_CONTEXT_PRESS()
    {
        var _loc3 = menuState;
        if (arguments.length > 0)
        {
            _loc3 = arguments[0];
        } // end if
        switch (_loc3)
        {
            case com.rockstargames.gtav.constants.PauseMenuLUT.MAP_LEGEND:
            {
                var _loc4 = this.GET_COLUMN(0);
                _loc4.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.FRONTEND_CONTEXT_BUTTON);
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_LIST:
            {
                menuLevel = 1;
                this.MENU_STATE(com.rockstargames.gtav.constants.PauseMenuLUT.CREW);
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_OPTIONS:
            {
                menuLevel = 2;
                this.MENU_STATE(com.rockstargames.gtav.constants.PauseMenuLUT.CREWS);
                break;
            } 
        } // End of switch
    } // End of the function
    function MENU_KEY_PRESS_ACTIONS(dir)
    {
        this.dbg("---->MENU_KEY_PRESS_ACTIONS <----- menu state : " + menuState);
        var _loc3 = true;
        if (!canHeaderAdvance)
        {
            this.TRIGGER_PAUSE_MENU_EVENT();
            return (false);
        } // end if
        var _loc2 = this.GET_COLUMN(menuLevel - 1);
        var _loc6 = this.getSelectedMenuItem(_loc2);
        if (menuLevel > 0 && dir > 0)
        {
            if (_loc6.isSelectable == -1)
            {
                return (false);
            } // end if
        } // end if
        this.dbg("COLUMN canJump? " + _loc2.canJump);
        if (_loc2.canJump == false)
        {
            if (dir > 0)
            {
                this.TRIGGER_PAUSE_MENU_EVENT();
            } // end if
            return (false);
        } // end if
        if (!isLoggedSC && menuState == com.rockstargames.gtav.constants.PauseMenuLUT.SOCIALCLUB)
        {
            this.KILL_PAGE();
            com.rockstargames.ui.game.GameInterface.call("ENTER_SC_MENU", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
            return (false);
        } // end if
        if (inContext)
        {
            if (dir > 0)
            {
                this.TRIGGER_PAUSE_MENU_EVENT();
            } // end if
            return (false);
        } // end if
        var _loc4 = com.rockstargames.gtav.constants.PauseMenuLookup.lookUp(menuState).menuAdvance;
        this.dbg("LIST ADVANCE: " + _loc4);
        if (_loc4 == false && dir > 0)
        {
            _loc3 = false;
            this.TRIGGER_PAUSE_MENU_EVENT();
        } // end if
        return (_loc3);
    } // End of the function
    function MENU_STATE_LOAD(oldMenuState)
    {
        this.dbg("------->MENU_STATE_LOAD with, menuState: " + menuState + " oldMenuState: " + oldMenuState);
        if (localdebug)
        {
            this.localLoad();
        }
        else
        {
            var _loc3 = 1;
            this.dbg("******** CALL -- LAYOUT_CHANGED with oldMenuState: " + oldMenuState + " menuState: " + menuState + " menuUniqueID: " + menuUniqueID + " dir");
            if (menuUniqueID == undefined)
            {
                menuUniqueID = -1;
                this.dbg("********  menuUniqueID was undefined so chnaged to " + menuUniqueID);
            } // end if
            com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, oldMenuState, menuState, menuUniqueID, _loc3);
        } // end else if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        this.dbg("TXD_HAS_LOADED textureDict: " + textureDict + " success: " + success + " uniqueID: " + uniqueID);
        if (success == true)
        {
            if (uniqueID == "errorImgMC")
            {
                this.errorImgMC.displayTxdResponse(textureDict);
            }
            else
            {
                var pMC = this.pageLoaderObject._mc;
                var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(pMC + ".pageMC." + uniqueID));
                this.dbg("******************COMPARE******************");
                this.dbg("pageLoaderObject._mc:: pMC\t\t" + pMC);
                this.dbg("pageLoaderObject._mc:: il\t" + il);
                this.dbg("pageLoaderObject._mc:: fucntion\t\t" + il.displayTxdResponse);
                this.dbg("***********************************************");
                if (il != undefined)
                {
                    il.displayTxdResponse(textureDict, success);
                } // end if
            } // end if
        } // end else if
    } // End of the function
    function TXD_ALREADY_LOADED(textureDict, uniqueID)
    {
        this.dbg("TXD_ALREADY_LOADED textureDict: " + textureDict + " uniqueID: " + uniqueID);
        if (uniqueID == "errorImgMC")
        {
            this.errorImgMC.displayTxdResponse(textureDict);
        }
        else
        {
            var pMC = this.pageLoaderObject._mc;
            var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(pMC + ".pageMC." + uniqueID));
            this.dbg("******************COMPARE******************");
            this.dbg("pageLoaderObject._mc:: pMC\t\t" + pMC);
            this.dbg("pageLoaderObject._mc:: il\t" + il);
            this.dbg("pageLoaderObject._mc:: fucntion\t\t" + il.displayTxdResponse);
            this.dbg("***********************************************");
            if (il != undefined)
            {
                il.displayTxdResponse(textureDict, true);
            } // end if
        } // end else if
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        this.dbg("ADD_TXD_REF_RESPONSE textureDict: " + textureDict + " uniqueID: " + uniqueID + " success: " + success);
        if (success == true)
        {
            if (uniqueID == "errorImgMC")
            {
                this.errorImgMC.displayTxdResponse(textureDict);
            }
            else
            {
                var pMC = this.pageLoaderObject._mc;
                var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(pMC + ".pageMC." + uniqueID));
                this.dbg("******************COMPARE******************");
                this.dbg("pageLoaderObject._mc:: pMC\t\t" + pMC);
                this.dbg("pageLoaderObject._mc:: il\t" + il);
                this.dbg("pageLoaderObject._mc:: function\t\t" + il.displayTxdResponse);
                this.dbg("***********************************************");
                if (il)
                {
                    il.displayTxdResponse(textureDict);
                } // end if
            } // end if
        } // end else if
    } // End of the function
    function onWarningImgLoaded()
    {
        errorImgMC._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(errorImgMC, com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION, {_alpha: 100});
    } // End of the function
    var columnWidth = 288;
    var canHeaderAdvance = true;
    var isLoggedSC = false;
} // End of Class
#endinitclip
