// Action script...

// [Initial MovieClip Action of sprite 123]
#initclip 2
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuContentBase extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, content, contextMenu, __set__debug, __get__debug, currentPage, context, thisObj, __get__inTopMenu;
    function PauseMenuContentBase()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        content = CONTENT.createEmptyMovieClip("contentMC", CONTENT.getNextHighestDepth());
        contextMenu = CONTENT.createEmptyMovieClip("contextMC", CONTENT.getNextHighestDepth());
        columnList = [];
        this.__set__debug(localdebug);
    } // End of the function
    function dbg(dbgStr)
    {
        if (dbgOn)
        {
            var _loc2 = "  " + dbgStr;
            com.rockstargames.ui.utils.Debug.log(_loc2);
            if (localdebug)
            {
                trace (_loc2);
            } // end if
        } // end if
    } // End of the function
    function set debug(d)
    {
        //return (this.debug());
        null;
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(50))
        {
            this.MENU_SECTION_JUMP(1);
        }
        else if (Key.isDown(49))
        {
            this.MENU_SECTION_JUMP(-1);
        }
        else if (Key.isDown(38))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
        }
        else if (Key.isDown(40))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
        }
        else if (Key.isDown(37))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADLEFT);
        }
        else if (Key.isDown(39))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADRIGHT);
        }
        else if (Key.isDown(32))
        {
            this.MENU_SHIFT_DEPTH(1);
        }
        else if (Key.isDown(16))
        {
            this.MENU_SHIFT_DEPTH(-1);
        }
        else if (Key.isDown(88))
        {
        }
        else if (Key.isDown(90))
        {
        } // end else if
    } // End of the function
    function setDebug(params)
    {
        this.__set__debug(params[0]);
    } // End of the function
    function SET_INPUT_EVENT(inputID)
    {
    } // End of the function
    function MENU_SECTION_JUMP(dir)
    {
    } // End of the function
    function MENU_SECTION_MOVE(dir)
    {
        menuIndex = menuIndex + dir;
        this.dbg("** CONTENT ** MENU_SECTION_MOVE | dir: " + dir + " menuIndex: " + menuIndex);
        if (menuIndex < 0)
        {
            menuIndex = menuIndex + menuList.length;
        } // end if
        if (menuIndex > menuList.length - 1)
        {
            menuIndex = menuIndex - menuList.length;
        } // end if
        this.headerMethod("HIGHLIGHT_MENU", [menuIndex]);
        this.KILL_PAGE();
        var _loc2 = menuList[menuIndex];
        this.dbg("** CHANGE ** menuList: " + menuList);
        this.dbg("** CHANGE ** menustateID: " + _loc2);
        menuLevel = 0;
        this.dbg("** SET menuLevel ** " + menuLevel);
        this.MENU_STATE(_loc2);
    } // End of the function
    function get inTopMenu()
    {
        menuLevel == 0 ? (isTopMenu = true) : (isTopMenu = false);
        this.dbg("isTopMenu " + isTopMenu + " menuLevel: " + menuLevel);
        return (isTopMenu);
    } // End of the function
    function BEGIN_EXIT_PAUSE_MENU()
    {
        this.CLEAN_UP_PAUSE_MENU("EXIT_PAUSE_MENU");
    } // End of the function
    function BEGIN_RESTART_PAUSE_MENU()
    {
        isReadyToRender = false;
        this.dbg("################ BEGIN_RESTART_PAUSE_MENU ################");
        this.dbg("menuUniqueID " + menuUniqueID);
        this.dbg("menuState " + menuState);
        menuUniqueID = -1;
        menuState = 0;
        isExitBlocked = false;
        this.CLEAN_UP_PAUSE_MENU("RESTART_PAUSE_MENU");
    } // End of the function
    function CLEAN_UP_PAUSE_MENU(codeAction)
    {
        this.dbg("----> clean up dangling header refs <---- ");
        this.headerMethod("REMOVE_MENU", [codeAction == "RESTART_PAUSE_MENU" ? (true) : (false)]);
        this.dbg("----> clean up dangling refs <---- ");
        this.KILL_PAGE();
        this.dbg("----> " + codeAction + " <---- ");
        com.rockstargames.ui.game.GameInterface.call(codeAction, com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
    } // End of the function
    function SET_DIMMABLE(d)
    {
        isDimmable = d;
    } // End of the function
    function FOCUS_CONTENT(f)
    {
        com.rockstargames.ui.utils.Debug.log("===FOCUS_CONTENT " + f);
        if (isDimmable)
        {
            var _loc5 = 1;
            var _loc7 = 1;
            if (!f)
            {
                var _loc6 = new com.rockstargames.ui.utils.HudColour();
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_DESELECT, _loc6);
                _loc5 = _loc6.r / 100;
                _loc7 = Math.round(_loc6.a) / 100;
            } // end if
            var _loc8 = new flash.geom.Transform(CONTENT);
            var _loc9 = new flash.geom.ColorTransform(_loc5, _loc5, _loc5, _loc7, 0, 0, 0, 0);
            _loc8.colorTransform = _loc9;
            var _loc3 = currentPage.columnList.length;
            for (var _loc2 = 0; _loc2 < _loc3; ++_loc2)
            {
                (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)(currentPage.columnList[_loc2]).ON_FOCUS_PAGE_CONTENT(f);
            } // end of for
        } // end if
    } // End of the function
    function startInteraction(action)
    {
        var _loc2 = CONTENT.frameDelayMC;
        this.dbg("=========== startInteraction " + this.menuInteractState() + " = " + interact_idle);
        if (this.menuInteractState(action) == interact_idle)
        {
            this.dbg("=========== play " + _loc2);
            _loc2.gotoAndPlay(2);
            lastActionTaken = action;
        } // end if
    } // End of the function
    function menuInteractState(action)
    {
        var _loc3 = CONTENT.frameDelayMC;
        var _loc2 = 0;
        this.dbg("=========== fMC._currentframe " + _loc3._currentframe + " action: " + action + ", last Action: " + lastActionTaken);
        if (action == lastActionTaken || _loc3._currentframe <= 1)
        {
            _loc2 = interact_idle;
        }
        else
        {
            _loc2 = interact_active;
        } // end else if
        this.dbg(">>>>>>>>>>>>>>>>>> menuInteractState " + _loc2);
        return (_loc2);
    } // End of the function
    function MENU_SHIFT_DEPTH(dir, DontFallOff, SkipChecks)
    {
        if (this.menuInteractState(dir) == interact_idle || SkipChecks)
        {
            if (dir < 0 && (menuLevel == 0 || menuLevel == 1 && menuceptionDepth > 0))
            {
                if (menuceptionDepth > 0)
                {
                    com.rockstargames.ui.game.GameInterface.call("MENUCEPTION_KICK", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE);
                    --menuceptionDepth;
                    return;
                }
                else if (!DontFallOff)
                {
                    isExitBlocked = true;
                } // end else if
                this.BEGIN_EXIT_PAUSE_MENU();
                return;
            } // end if
            var _loc14 = this.MENU_KEY_PRESS_ACTIONS(dir);
            if (_loc14)
            {
                var _loc12 = menuState;
                this.dbg("MENU_SHIFT_DEPTH | direction=(1/-1): " + dir);
                if (dir > 0 && !SkipChecks)
                {
                    this.TRIGGER_PAUSE_MENU_EVENT();
                } // end if
                var _loc7 = menuLevel + dir;
                var _loc11 = currentPage.getMaxColumns();
                if (_loc7 < 0)
                {
                    _loc7 = 0;
                } // end if
                if (_loc7 > _loc11)
                {
                    _loc7 = _loc11;
                } // end if
                this.dbg("MENU_SHIFT_DEPTH | targetLevel: " + _loc7);
                var _loc9;
                var _loc16 = menuState != com.rockstargames.gtav.constants.PauseMenuLUT.MAP && (SkipChecks == undefined || SkipChecks == false);
                if (dir < 0)
                {
                    this.dbg("MENU_SHIFT_DEPTH | focus going back");
                    this.MENU_SET_FOCUS(false);
                }
                else if (_loc16)
                {
                    _loc9 = this.GET_COLUMN(_loc7 - 1);
                    if (_loc9 == undefined)
                    {
                        this.dbg("No column there! Bailing!");
                        return;
                    } // end if
                    if (!_loc9._visible)
                    {
                        this.dbg("Column isn\'t visible; assuming there\'s a warning up or something!");
                        return;
                    } // end if
                    var _loc6 = _loc9.model.getCurrentView().itemList;
                    if (_loc6 == undefined)
                    {
                        this.dbg("Couldn\'t get a model/view/itemlist out of it, so bailing!");
                        return;
                    } // end if
                    var _loc4 = _loc6.length;
                    if (_loc4 == undefined || _loc4 <= 0)
                    {
                        this.dbg("No viewlist/length/insufficient items (" + _loc4 + "), bailing!");
                        return;
                    } // end if
                    var _loc8 = false;
                    for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
                    {
                        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem)(_loc6[_loc2]);
                        if (_loc3 != undefined && _loc3.isSelectable >= 1)
                        {
                            _loc8 = true;
                            break;
                        } // end if
                    } // end of for
                    if (!_loc8)
                    {
                        this.dbg("No selectable items! Bailing!");
                        return;
                    } // end if
                    this.dbg("Passed sufficient-stuff-having checks!");
                } // end else if
                menuLevel = _loc7;
                this.dbg("MENU_SHIFT_DEPTH | focus going forwards " + menuLevel);
                this.MENU_SET_FOCUS(true);
                var _loc10 = -1;
                if (menuLevel == 0)
                {
                    var _loc15 = menuList[menuIndex];
                    menuState = _loc15;
                    this.dbg("IS_NAVIGATING_CONTENT | called false");
                    com.rockstargames.ui.game.GameInterface.call("IS_NAVIGATING_CONTENT", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, false);
                    this.FOCUS_CONTENT(false);
                }
                else
                {
                    this.MENU_CHANGE_STATE(_loc9);
                    this.dbg("IS_NAVIGATING_CONTENT | called true");
                    com.rockstargames.ui.game.GameInterface.call("IS_NAVIGATING_CONTENT", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, true);
                    this.FOCUS_CONTENT(true);
                } // end else if
                if (_loc9 != undefined)
                {
                    var _loc17 = this.getSelectedMenuItem(_loc9);
                    _loc10 = _loc17.uniqueID;
                } // end if
                if (_loc10 != undefined)
                {
                    menuUniqueID = _loc10;
                    if (dir < 0)
                    {
                        com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, _loc12, menuState, menuUniqueID, dir);
                        this.dbg("---->LAYOUT_CHANGED oldMenuState: " + _loc12 + " | menuState: " + menuState + " | menuUniqueID: " + menuUniqueID + " | dir: " + dir);
                    } // end if
                } // end if
                menuLevelOld = menuLevel;
                this.startInteraction(dir);
            } // end if
        } // end if
    } // End of the function
    function MENU_KEY_PRESS_ACTIONS()
    {
        this.dbg("---->MENU_KEY_PRESS_ACTIONS <----- ");
        var _loc2 = true;
        return (_loc2);
    } // End of the function
    function MENU_SET_FOCUS(isFocused, clearAll)
    {
        var _loc2 = this.GET_COLUMN(menuLevel - 1);
        _loc2.SET_FOCUS.apply(_loc2, [isFocused, clearAll]);
        this.dbg("MENU_SET_FOCUS | columnMC " + _loc2);
        this.MENU_CHANGE_STATE(_loc2);
        this.dbg("MENU_SET_FOCUS | menuState " + menuState);
    } // End of the function
    function MENU_INTERACTION(inputID)
    {
        var _loc3 = inputID == com.rockstargames.ui.game.GamePadConstants.NO_BUTTON_PRESSED;
        if (this.menuInteractState(inputID) == interact_idle || _loc3)
        {
            var _loc4;
            if (inputID == com.rockstargames.ui.game.GamePadConstants.NO_BUTTON_PRESSED)
            {
                _loc4 = this.GET_COLUMN(0);
            }
            else if (inContext)
            {
                _loc4 = context;
            }
            else
            {
                _loc4 = this.GET_COLUMN(menuLevel - 1);
            } // end else if
            _loc4.SET_INPUT_EVENT.apply(_loc4, [inputID]);
            if (inputID == com.rockstargames.ui.game.GamePadConstants.DPADDOWN || inputID == com.rockstargames.ui.game.GamePadConstants.DPADUP || _loc3)
            {
                this.dbg("MENU_INTERACTION");
                this.dbg("columnMC " + _loc4);
                var _loc2 = this.getSelectedMenuItem(_loc4);
                this.dbg("currMenuItem:: " + _loc2);
                this.dbg("---------------------- ");
                this.dbg("menuState is differnt " + (_loc2.menuID != menuState));
                this.dbg("unique is differnt " + (_loc2.uniqueID != menuUniqueID));
                this.dbg("---------------------- ");
                this.dbg("MOVING TO : ");
                this.dbg("currMenuItem.menuID:: " + _loc2.menuID);
                if (_loc2.menuID != undefined)
                {
                    this.dbg("currMenuItem.uniqueID " + _loc2.uniqueID);
                    this.dbg("FROM : ");
                    this.dbg("menuState " + menuState);
                    this.dbg("menuUniqueID " + menuUniqueID);
                    if (_loc2.menuID != menuState || _loc2.uniqueID != menuUniqueID)
                    {
                        var _loc10 = 0;
                        this.dbg("INCONTEXT inContext:" + inContext);
                        if (inContext)
                        {
                            com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, menuState, _loc2.menuID, _loc2.uniqueID, _loc10);
                            menuUniqueID = _loc2.uniqueID;
                            this.dbg(" ");
                            this.dbg("*****************");
                            this.dbg("INCONTEXT menuUniqueID changed to " + menuUniqueID);
                            this.dbg("*****************");
                            this.dbg(" ");
                            return;
                        } // end if
                        this.dbg("exceptions ! " + _loc2.menuID);
                        var _loc6 = com.rockstargames.gtav.constants.PauseMenuLookup.lookUp(_loc2.menuID);
                        var _loc11 = _loc6.menuChanged;
                        var _loc12 = _loc6.clearRootColumns;
                        var _loc7 = _loc6.callImmediately;
                        var _loc8 = !_loc7;
                        this.dbg("LIST MOVE: clearRootColumns: " + _loc12 + " menuChanged: " + _loc11 + " callImmediately: " + _loc7 + " wantsMenuStateChange: " + _loc8);
                        if (!_loc3 && _loc12)
                        {
                            this.REMOVE_ROOT_COLUMNS();
                            this.dbg("DID call remove root columns!");
                        }
                        else
                        {
                            this.dbg("Didn\'t call remove root columns!");
                        } // end else if
                        var _loc9 = menuUniqueID;
                        this.dbg("old menu unique ID " + _loc9);
                        menuUniqueID = _loc2.uniqueID;
                        this.dbg(" ");
                        this.dbg("*****************");
                        this.dbg("menuUniqueID changed to " + menuUniqueID);
                        this.dbg("*****************");
                        this.dbg(" ");
                        if (_loc11)
                        {
                            if (_loc3)
                            {
                                this.dbg("CHANGE ------------------- LAYOUT_CHANGE_INITIAL_FILL : menuState: " + menuState + " new menu state: " + _loc2.menuID + " menuUniqueID: " + menuUniqueID + " old menuUniqueID: " + _loc9);
                                com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGE_INITIAL_FILL", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, menuState, _loc2.menuID, menuUniqueID, _loc10, _loc8);
                            }
                            else
                            {
                                this.dbg("CHANGE ------------------- LAYOUT_CHANGED : menuState: " + menuState + " new menu state: " + _loc2.menuID + " menuUniqueID: " + menuUniqueID + " old menuUniqueID: " + _loc9 + " AND onComplete:MENU_INTERACTION_RESPONSE");
                                com.rockstargames.ui.game.GameInterface.call("LAYOUT_CHANGED", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, menuState, _loc2.menuID, menuUniqueID, _loc10, _loc8);
                            } // end if
                        } // end else if
                        if (!_loc3)
                        {
                            menuState = _loc2.menuID;
                            this.dbg("Set menuState here ! " + menuState);
                        } // end if
                        if (_loc7)
                        {
                            currentPage.stateChanged(menuState);
                            this.dbg("trying to get to LOAD PAUSE MENU_CONTENT ------------------- MENU_STATE: " + _loc2.menuID);
                        } // end if
                    } // end if
                } // end if
            } // end if
            if (!_loc3)
            {
                this.startInteraction(inputID);
            } // end if
        } // end if
    } // End of the function
    function MENU_INTERACTION_RESPONSE(codeMenuState)
    {
        this.dbg("go, I\'ve got it a response ------------------- MENU_STATE: " + menuState + " currentPage " + currentPage);
        if (codeMenuState != undefined)
        {
            currentPage.stateChanged(codeMenuState);
        }
        else
        {
            currentPage.stateChanged(menuState);
        } // end else if
    } // End of the function
    function MENU_CHANGE_STATE(columnMC)
    {
        var _loc2 = this.getSelectedMenuItem(columnMC);
        if (_loc2.menuID != -1 && _loc2.menuID != undefined)
        {
            menuState = _loc2.menuID;
        } // end if
    } // End of the function
    function MENU_STATE(id)
    {
    } // End of the function
    function MENU_STATE_LOAD(oldMenuState)
    {
    } // End of the function
    function TRIGGER_PAUSE_MENU_EVENT()
    {
        this.dbg("TRIGGER_PAUSE_MENU_EVENT menuLevel: " + menuLevel);
        var _loc3 = -1;
        var _loc7 = -1;
        var _loc2;
        if (menuLevel > 0)
        {
            var _loc6;
            if (inContext)
            {
                _loc6 = context;
            }
            else
            {
                _loc6 = this.GET_COLUMN(menuLevel - 1);
            } // end else if
            this.dbg("TRIGGER_PAUSE_MENU_EVENT columnMC: " + _loc6 + " len: " + columnList.length);
            if (_loc6 != undefined)
            {
                var _loc4 = this.getSelectedMenuItem(_loc6);
                _loc2 = this.getSelectedMenuItem(this.GET_COLUMN(menuLevel));
                if (_loc2.menuID != undefined || _loc2.menuID != null)
                {
                    _loc3 = _loc2.menuID;
                } // end if
                if (_loc2.uniqueID != undefined || _loc2.uniqueID != null)
                {
                    _loc7 = _loc2.uniqueID;
                } // end if
                if (_loc4 != undefined)
                {
                    com.rockstargames.ui.game.GameInterface.call("TRIGGER_PAUSE_MENU_EVENT", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, _loc4.menuID, _loc4.uniqueID, _loc3, _loc7);
                    this.dbg("TRIGGER_PAUSE_MENU_EVENT | currMenuItem.menuID: " + _loc4.menuID + " | currMenuItem.uniqueID: " + _loc4.uniqueID + " nextMenuID: " + _loc3);
                } // end if
            } // end if
        }
        else
        {
            var _loc5 = menuList[menuIndex];
            this.dbg("TRIGGER_PAUSE_MENU_EVENT | from top: menuEnum" + _loc5 + " menuIndex " + menuIndex);
            _loc2 = this.getSelectedMenuItem(this.GET_COLUMN(menuLevel));
            if (_loc2.menuID != undefined || _loc2.menuID != null)
            {
                _loc3 = _loc2.menuID;
            } // end if
            if (_loc2.uniqueID != undefined || _loc2.uniqueID != null)
            {
                _loc7 = _loc2.uniqueID;
            } // end if
            if (_loc5 != com.rockstargames.gtav.constants.PauseMenuLUT.SAVE_GAME)
            {
                com.rockstargames.ui.game.GameInterface.call("TRIGGER_PAUSE_MENU_EVENT", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, _loc5, 0, _loc3, _loc7);
                this.dbg("TRIGGER_PAUSE_MENU_EVENT | currMenuItem.menuID: " + _loc5 + " | currMenuItem.uniqueID: 0 nextMenuID: " + _loc3);
            } // end if
        } // end else if
    } // End of the function
    function getSelectedMenuItem(columnMC)
    {
        var _loc1 = columnMC.model.getCurrentView(0).highlightedItem;
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem)(columnMC.model.getCurrentView().itemList[_loc1]);
        return (_loc2);
    } // End of the function
    function SHOW_WARNING_MESSAGE(show)
    {
    } // End of the function
    function SHOW_CONTEXT_MENU(bool)
    {
    } // End of the function
    function GET_PAGE(menuEnum)
    {
        var _loc4 = false;
        var _loc3;
        for (var _loc2 = 0; _loc2 < menuList.length; ++_loc2)
        {
            if (menuEnum == menuList[_loc2])
            {
                _loc3 = menuGFXList[_loc2];
                _loc4 = true;
                break;
            } // end if
        } // end of for
        this.dbg("GET_PAGE to LOAD " + _loc3);
        if (_loc3 == undefined || _loc3 == false)
        {
            _loc3 = "";
            this.dbg("GET_PAGE | gfxfilePath ID not found");
        } // end if
        this.dbg("found " + _loc4);
        if (!_loc4)
        {
            _loc3 = "";
            this.dbg("GET_PAGE | menu ID not found");
        } // end if
        return (_loc3);
    } // End of the function
    function LOAD_PAGE(gfxfile)
    {
        this.dbg("--------------LOAD_PAGE--------> " + gfxfile);
        var thisObj = this;
        pageLoaderObject = new Object();
        pageLoaderObject._path = gfxfile;
        pageLoaderObject._mc = content.createEmptyMovieClip("pageContainerMC", content.getNextHighestDepth());
        pageLoaderObject._loader = new MovieClipLoader();
        pageLoaderObject._listener = new Object();
        pageLoaderObject._loader.addListener(pageLoaderObject._listener);
        pageLoaderObject._listener.thisObj = thisObj;
        pageLoaderObject._listener.onLoadInit = function (target_mc)
        {
            var _loc2 = thisObj.pageLoaderObject;
            _loc2._loader.removeListener(_loc2._listener);
            _loc2._loader = null;
        };
        pageLoaderObject._loader.loadClip(gfxfile, pageLoaderObject._mc);
    } // End of the function
    function LOADED_PAGE()
    {
        this.dbg("LOADED_PAGE PAGE LOADED " + pageLoaderObject._path);
        var _loc2 = menuState;
        menuState = storedMenuState;
        this.dbg("menuState " + menuState + " :: oldMenuState" + _loc2);
        currentPage = pageLoaderObject._mc.TIMELINE;
        currentPage.setupPage();
        currentPage.stateChanged(menuState);
        this.dbg("### CURRENT PAGE IS:" + currentPage);
        this.MENU_STATE_LOAD(_loc2);
        this.FOCUS_CONTENT(false);
    } // End of the function
    function KILL_PAGE()
    {
    } // End of the function
    function ADD_COLUMN(columnIndex, columnStrID)
    {
        var _loc3 = [0, 290, 580];
        var _loc4 = content.attachMovie(columnStrID, columnStrID + "MC", content.getNextHighestDepth(), {_x: _loc3[columnIndex]});
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)(_loc4);
        _loc2.INITIALISE();
        columnList[columnIndex] = _loc2;
    } // End of the function
    function REMOVE_COLUMN(columnIndex)
    {
        var _loc2 = this.GET_COLUMN(columnIndex);
        _loc2.SET_DATA_SLOT_EMPTY(0);
        _loc2.CLEAR_HIGHLIGHT();
    } // End of the function
    function REMOVE_ROOT_COLUMNS()
    {
        this.dbg("menuLevel: " + menuLevel);
        this.dbg("currentPageList: " + currentPage.columnList);
        for (var _loc2 = menuLevel; _loc2 < currentPage.columnList.length; ++_loc2)
        {
            this.REMOVE_COLUMN(_loc2);
        } // end of for
    } // End of the function
    function REMOVE_ALL_COLUMNS()
    {
        for (var _loc2 = 0; _loc2 < currentPage.columnList.length; ++_loc2)
        {
            this.REMOVE_COLUMN(_loc2);
        } // end of for
    } // End of the function
    function GET_COLUMN(columnIndex)
    {
        var _loc2 = currentPage.getColumn(columnIndex);
        return (_loc2);
    } // End of the function
    function headerMethod(func, params)
    {
        this.dbg("HEADER METHOD CALLED  : " + func + "  ====   " + params);
        com.rockstargames.ui.game.GameInterface.call("CALL_METHOD_ON_MOVIE", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, com.rockstargames.gtav.constants.PauseMenuComponentLUT.SP_HEADER[1], func, params == undefined ? ([]) : (params));
    } // End of the function
    function REQUEST_TXD(txd, filename)
    {
        com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, filename, txd);
    } // End of the function
    function TXD_HAS_LOADED(txd, hasLoaded)
    {
    } // End of the function
    var inContext = false;
    var isReadyToRender = false;
    var columnList = new Array();
    var menuUniqueID = -1;
    var menuState = 0;
    var storedMenuState = 0;
    var menuIndex = 0;
    var menuList = new Array();
    var menuGFXList = new Array();
    var menuLevel = 0;
    var menuLevelOld = 0;
    var menuceptionDepth = 0;
    var interact_idle = 0;
    var interact_active = 1;
    var lastActionTaken = -1000;
    var pageLoaderObject = new Object();
    var localdebug = false;
    var isTopMenu = true;
    var isDimmable = true;
    var isExitBlocked = false;
    var dbgID = "";
    var dbgOn = true;
} // End of Class
#endinitclip
