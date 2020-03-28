// Action script...

// [Initial MovieClip Action of sprite 22]
#initclip 2
class com.rockstargames.ui.core.BaseContainer extends MovieClip
{
    var COMPONENT_ARRAY, mcPrefix, loadedCompPrefix, MAX_HUD_COMPONENTS, isWeaponWheelActive, TIMELINE, WEAPON_HUD_COMPONENTS_START, SCRIPT_HUD_COMPONENTS_START, thisObj, componentID;
    function BaseContainer()
    {
        super();
        _global.gfxExtensions = true;
        COMPONENT_ARRAY = [];
        mcPrefix = "COMP_";
        loadedCompPrefix = "lc_";
        MAX_HUD_COMPONENTS = com.rockstargames.gtav.constants.HudComponentConstants.MAX_HUD_COMPONENTS;
        isWeaponWheelActive = false;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        this.TOGGLE_SAFEZONE_DEBUG(false);
    } // End of the function
    function CONTAINER_METHOD()
    {
        var _loc4 = [];
        _loc4 = arguments;
        var _loc6 = _loc4[0];
        var _loc3 = this.checkForCompInfo(_loc6);
        var _loc5 = _loc3._status;
        if (_loc5 == undefined)
        {
            _loc3.sanitise();
            _loc5 = _loc3._status;
        } // end if
        switch (_loc5)
        {
            case com.rockstargames.ui.core.BaseContainer.NOT_LOADED:
            {
                if (_loc4[1].split("CLEAR_").length <= 1)
                {
                    _loc3._status = com.rockstargames.ui.core.BaseContainer.STREAMING;
                    _loc3._functionCache.push(_loc4.slice(1));
                    this.ACTIVATE_COMPONENT(_loc6);
                } // end if
                break;
            } 
            case com.rockstargames.ui.core.BaseContainer.LOADED:
            case com.rockstargames.ui.core.BaseContainer.ONSCREEN:
            case com.rockstargames.ui.core.BaseContainer.HIDDEN:
            {
                var _loc7 = _loc4[1];
                _loc3._mc.TIMELINE[_loc7](_loc4.slice(2));
                break;
            } 
            case com.rockstargames.ui.core.BaseContainer.STREAMING:
            case com.rockstargames.ui.core.BaseContainer.LOADING:
            {
                _loc3._functionCache.push(_loc4.slice(1));
                break;
            } 
            case com.rockstargames.ui.core.BaseContainer.DEACTIVATED:
            {
                _loc3._mc._visible = _loc3._intendedVisibleState;
                if (_loc3._intendedVisibleState)
                {
                    _loc3._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
                }
                else
                {
                    _loc3._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
                } // end else if
                _loc7 = _loc4[1];
                _loc3._mc.TIMELINE[_loc7](_loc4.slice(2));
                com.rockstargames.ui.game.GameInterface.call("SET_ACTIVE_STATE", com.rockstargames.ui.game.GameInterface.HUD_TYPE, _loc3._enumId, true);
                this.reorderList(_loc3._displayList);
                break;
            } 
        } // End of switch
    } // End of the function
    function ACTIVATE_COMPONENT(componentID)
    {
        com.rockstargames.ui.game.GameInterface.call("ACTIVATE_COMPONENT", com.rockstargames.ui.game.GameInterface.HUD_TYPE, componentID);
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isNonLatin)
    {
        NEEDS_BIGGER_HELP_AND_SUBTITLES = _isNonLatin;
        safeLeft = _safeLeftPercent * _screenWidthPixels;
        safeRight = (1 - _safeRightPercent) * _screenWidthPixels;
        safeTop = _safeTopPercent * _screenHeightPixels;
        safeBottom = (1 - _safeBottomPercent) * _screenHeightPixels;
        screenWidth = _screenWidthPixels;
        screenHeight = _screenHeightPixels;
        isWideScreen = _isWideScreen;
        isHiDef = _isHiDef;
        this.REPOSITION_HUD_FOR_CONFIG_CHANGE();
        TIMELINE.frameMC._x = safeLeft;
        TIMELINE.frameMC._y = safeTop;
        TIMELINE.frameMC._width = screenWidth - (safeLeft + safeRight);
        TIMELINE.frameMC._height = screenHeight - (safeTop + safeBottom);
    } // End of the function
    function SET_COMPONENT_VALUES(componentID, filesMemoryAddress, alignX, alignY, W, H, r, g, b, a, d, listId, listPriority, hasGfx, posX, posY)
    {
        var _loc2 = this.checkForCompInfo(componentID);
        _loc2._size = [W, H];
        _loc2._colour = [r, g, b, a];
        _loc2._depth = d;
        _loc2._displayList = listId;
        _loc2._displayListPriority = listPriority;
        _loc2._hasGfx = hasGfx;
        if (typeof(alignX) == "string")
        {
            _loc2._position = [alignX, alignY, posX, posY];
        }
        else
        {
            _loc2._position = ["", "", alignX, alignY];
        } // end else if
        if (hasGfx)
        {
            this.loadComponent(componentID, filesMemoryAddress);
        }
        else
        {
            this.createComponentMovieClip(_loc2);
        } // end else if
    } // End of the function
    function HIDE(componentID)
    {
        var _loc2 = COMPONENT_ARRAY[componentID];
        _loc2._intendedVisibleState = false;
        if (_loc2._status == com.rockstargames.ui.core.BaseContainer.ONSCREEN)
        {
            _loc2._mc._visible = false;
            _loc2._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
        } // end if
    } // End of the function
    function SHOW(componentID)
    {
        var _loc2 = COMPONENT_ARRAY[componentID];
        _loc2._intendedVisibleState = true;
        if (_loc2._status == com.rockstargames.ui.core.BaseContainer.HIDDEN)
        {
            _loc2._mc._visible = true;
            _loc2._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
        } // end if
    } // End of the function
    function SET_COMPONENT_RELATIVE_TO_TARGET(isInFront, componentID, componentTargetID)
    {
        var _loc3;
        var _loc9;
        var _loc5 = COMPONENT_ARRAY[componentID];
        var _loc8 = COMPONENT_ARRAY[componentTargetID];
        var _loc4 = _loc5._mc;
        var _loc6 = _loc8._mc;
        var _loc2 = _loc6.getDepth();
        if (isInFront)
        {
            ++_loc2;
        }
        else
        {
            --_loc2;
        } // end else if
        var _loc7 = TIMELINE.getInstanceAtDepth(_loc2);
        if (_loc7 != undefined)
        {
            _loc4.swapDepths(_loc2);
            _loc3 = true;
        }
        else
        {
            _loc3 = false;
        } // end else if
        return (_loc3);
    } // End of the function
    function SET_COMPONENT_TO_FRONT(componentID)
    {
        var _loc8 = HIGHEST_DEPTH_IN_XML;
        var _loc3;
        var _loc5 = COMPONENT_ARRAY[componentID];
        var _loc4 = _loc5._mc;
        var _loc6 = TIMELINE.getNextHighestDepth();
        var _loc2 = Math.max(_loc8, _loc6);
        ++_loc2;
        var _loc7 = TIMELINE.getInstanceAtDepth(_loc2);
        if (_loc7 != undefined)
        {
            _loc4.swapDepths(_loc2);
            _loc3 = true;
        }
        else
        {
            _loc3 = false;
        } // end else if
        return (_loc3);
    } // End of the function
    function SET_COMPONENT_TO_BACK(componentID)
    {
        var _loc2 = 10;
        var _loc3;
        var _loc6 = COMPONENT_ARRAY[componentID];
        var _loc5 = _loc6._mc;
        --_loc2;
        var _loc4 = TIMELINE.getInstanceAtDepth(_loc2);
        if (_loc4 != undefined)
        {
            _loc5.swapDepths(_loc2);
            _loc3 = true;
        }
        else
        {
            _loc3 = false;
        } // end else if
        return (_loc3);
    } // End of the function
    function GET_COMPONENT_STATUS(componentID)
    {
        var _loc2;
        var _loc3 = COMPONENT_ARRAY[componentID];
        if (_loc3 != undefined)
        {
            _loc2 = _loc3._status;
        }
        else
        {
            _loc2 = com.rockstargames.ui.core.BaseContainer.NOT_LOADED;
        } // end else if
        return (_loc2);
    } // End of the function
    function SET_WIDESCREEN(isWidescreen)
    {
    } // End of the function
    function MULTIPLAYER_IS_ACTIVE(isActive)
    {
        MP_IS_ACTIVE = isActive;
    } // End of the function
    function SET_HIGHEST_DEPTH_FROM_XML(highestStoredDepth)
    {
        HIGHEST_DEPTH_IN_XML = highestStoredDepth;
    } // End of the function
    function REMOVE_HUD_ITEM(componentID)
    {
        var _loc2 = COMPONENT_ARRAY[componentID];
        var _loc3 = mcPrefix + _loc2._enumId;
        _loc2._status = com.rockstargames.ui.core.BaseContainer.NOT_LOADED;
        TIMELINE[_loc3].removeMovieClip();
        com.rockstargames.ui.game.GameInterface.call("SET_HUD_COMPONENT_AS_NO_LONGER_NEEDED", com.rockstargames.ui.game.GameInterface.HUD_TYPE, _loc2._enumId);
        _loc2.sanitise();
    } // End of the function
    function OVERIDE_POSITION(componentID, w, h, x, y)
    {
        var _loc3 = COMPONENT_ARRAY[componentID];
        var _loc2 = false;
        if (_loc3 == undefined)
        {
            _loc2 = false;
        }
        else
        {
            _loc2 = true;
            _loc3._position = [x, y];
            _loc3._size = [w, h];
        } // end else if
        return (_loc2);
    } // End of the function
    function OVERRIDE_COMPONENT_POSITION(componentID, newX, newY)
    {
        var _loc2 = COMPONENT_ARRAY[componentID];
        var _loc6 = _loc2._mc;
        if (newX == -1)
        {
            newX = _loc2._position[2];
        } // end if
        if (newY == -1)
        {
            newY = _loc2._position[3];
        } // end if
        this.SET_COMPONENT_POSITION(componentID, _loc2._size[0], _loc2._size[1], _loc2._position[0], _loc2._position[1], newX, newY);
    } // End of the function
    function OVERRIDE_COMPONENT_POSITION_PIXELS(componentID, newX, newY)
    {
        var _loc2 = COMPONENT_ARRAY[componentID];
        var _loc3 = _loc2._mc;
        _loc3._x = newX;
        _loc3._y = newY;
        _loc2._position[0] = newX / screenWidth;
        _loc2._position[1] = newY / screenHeight;
    } // End of the function
    function SET_COMPONENT_COLOUR(componentID, r, g, b, a)
    {
        var _loc3 = false;
        var _loc2 = COMPONENT_ARRAY[componentID];
        if (_loc2 == undefined)
        {
            _loc3 = false;
        } // end if
        if (_loc2._status == com.rockstargames.ui.core.BaseContainer.ONSCREEN || _loc2._status == com.rockstargames.ui.core.BaseContainer.HIDDEN)
        {
            var _loc7 = _loc2._mc;
            _loc2._colour[0] = r;
            _loc2._colour[1] = g;
            _loc2._colour[2] = b;
            _loc2._colour[3] = a;
            if (r != undefined && g != undefined && b != undefined && a != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc7.CONTENT, r, g, b, a);
                _loc3 = true;
            }
            else
            {
                _loc3 = false;
            } // end else if
        }
        else
        {
            _loc3 = false;
        } // end else if
        return (_loc3);
    } // End of the function
    function SET_COMPONENT_POSITION(componentID, w, h, alignX, alignY, offsetX, offsetY)
    {
        var _loc6 = COMPONENT_ARRAY[componentID];
        var _loc4 = _loc6._mc;
        var _loc3 = 0;
        var _loc2 = 0;
        var _loc7 = w * screenWidth;
        var _loc5 = h * screenHeight;
        switch (alignX)
        {
            case "L":
            {
                _loc3 = safeLeft;
                break;
            } 
            case "R":
            {
                _loc3 = screenWidth - safeRight - _loc7;
                break;
            } 
            case "C":
            {
                _loc3 = screenWidth / 2 - _loc7 / 2;
                break;
            } 
            case "I":
            {
                _loc3 = 0;
                break;
            } 
        } // End of switch
        if (offsetX != undefined)
        {
            var _loc8 = offsetX * screenWidth;
            _loc3 = _loc3 + _loc8;
        } // end if
        switch (alignY)
        {
            case "T":
            {
                _loc2 = safeTop;
                break;
            } 
            case "B":
            {
                _loc2 = screenHeight - safeBottom - _loc5;
                break;
            } 
            case "C":
            {
                _loc2 = screenHeight / 2 - _loc5 / 2;
                break;
            } 
            case "I":
            {
                _loc2 = 0;
                break;
            } 
        } // End of switch
        if (offsetY != undefined)
        {
            var _loc9 = offsetY * screenHeight;
            _loc2 = _loc2 + _loc9;
        } // end if
        if (_loc6._displayList == -2)
        {
            _loc2 = _loc2 - _loc6._displayListPriority * (_loc5 + 8);
        } // end if
        switch (componentID)
        {
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1:
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_2:
            {
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_HELP_TEXT:
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_ICON:
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_RETICLE:
            {
                _loc4._x = Math.round(_loc3);
                _loc4._y = Math.round(_loc2);
                break;
            } 
            default:
            {
                _loc4._width = Math.round(_loc7);
                _loc4._height = Math.round(_loc5);
                _loc4._x = Math.round(_loc3);
                _loc4._y = Math.round(_loc2);
            } 
        } // End of switch
    } // End of the function
    function SET_HUD_COMPONENT_RANGE(weaponStart, scriptedHudCompStart)
    {
        WEAPON_HUD_COMPONENTS_START = weaponStart;
        SCRIPT_HUD_COMPONENTS_START = scriptedHudCompStart;
    } // End of the function
    function loadComponent(componentID, filesMemoryAddress)
    {
        var thisObj = this;
        var _loc2 = COMPONENT_ARRAY[componentID];
        _loc2._status = com.rockstargames.ui.core.BaseContainer.LOADING;
        var _loc5 = _loc2._depth;
        var _loc4 = mcPrefix + _loc2._enumId;
        _loc2._mc = TIMELINE.createEmptyMovieClip(_loc4, _loc5);
        _loc2._loader = new MovieClipLoader();
        _loc2._listener = new Object();
        _loc2._loader.addListener(_loc2._listener);
        _loc2._listener.thisObj = thisObj;
        _loc2._listener.componentID = componentID;
        _loc2._listener.onLoadInit = function (target_mc)
        {
            var _loc2 = thisObj.COMPONENT_ARRAY[this.componentID];
            _loc2._status = 5;
            _loc2._mc._visible = false;
            thisObj.setupComponent(this.componentID);
            _loc2._loader.removeListener(_loc2._listener);
            com.rockstargames.ui.game.GameInterface.call("SET_COMPONENT_LOADED", com.rockstargames.ui.game.GameInterface.HUD_TYPE, _loc2._enumId, true);
        };
        _loc2._loader.loadClip(filesMemoryAddress, _loc2._mc);
    } // End of the function
    function setupComponent(componentID)
    {
        var _loc2 = COMPONENT_ARRAY[componentID];
        _loc2._mc.TIMELINE.SET_HUD(_level0.HUD);
        if (_loc2._intendedVisibleState)
        {
            _loc2._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
        }
        else
        {
            _loc2._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
        } // end else if
        var _loc4 = _loc2._mc;
        var _loc7 = _loc2._enumId;
        var _loc6 = _loc2._size;
        var _loc5 = _loc2._position;
        var _loc3 = _loc2._colour;
        this.SET_COMPONENT_POSITION(componentID, _loc6[0], _loc6[1], _loc5[0], _loc5[1], _loc5[2], _loc5[3]);
        if (_loc3[0] != undefined && _loc3[1] != undefined && _loc3[2] != undefined && _loc3[3] != undefined && typeof(_loc4.CONTENT) == "movieclip")
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc4.CONTENT, _loc3[0], _loc3[1], _loc3[2], _loc3[3]);
        } // end if
        if (_loc4.TIMELINE.firstRunFlag)
        {
            _loc4.TIMELINE.READY(_loc7);
            _loc4.TIMELINE.firstRunFlag = false;
        } // end if
        _loc2._mc.TIMELINE.MP_IS_ACTIVE = MP_IS_ACTIVE;
        _loc4._visible = _loc2._intendedVisibleState;
        this.callCachedMethods(componentID);
    } // End of the function
    function callCachedMethods(componentID)
    {
        var _loc5 = COMPONENT_ARRAY[componentID];
        var _loc2 = 0;
        var _loc6 = _loc5._functionCache.length;
        var _loc4;
        var _loc3 = [];
        _loc3 = _loc5._functionCache;
        for (var _loc2 = 0; _loc2 < _loc6; ++_loc2)
        {
            _loc4 = _loc3[_loc2][0];
            _loc5._mc.TIMELINE[_loc4](_loc3[_loc2].slice(1));
        } // end of for
        _loc5._functionCache = new Array();
    } // End of the function
    function reorderList(listID)
    {
    } // End of the function
    function checkForCompInfo(componentID)
    {
        var _loc2;
        if (COMPONENT_ARRAY[componentID] != undefined)
        {
            _loc2 = COMPONENT_ARRAY[componentID];
        }
        else
        {
            _loc2 = new com.rockstargames.ui.core.BaseComponentInfo(componentID);
            COMPONENT_ARRAY[componentID] = _loc2;
        } // end else if
        return (_loc2);
    } // End of the function
    function createComponentMovieClip(currentComp)
    {
    } // End of the function
    function SET_MAX_HUD_COMPONENTS(max)
    {
        MAX_HUD_COMPONENTS = max;
    } // End of the function
    function REPOSITION_HUD_FOR_CONFIG_CHANGE()
    {
        var _loc3;
        var _loc2 = 0;
        var _loc5;
        var _loc7;
        var _loc6;
        var _loc4;
        for (var _loc2 = 0; _loc2 < com.rockstargames.gtav.constants.HudComponentConstants.MAX_SCRIPTED_HUD_COMPONENTS; ++_loc2)
        {
            if (COMPONENT_ARRAY[_loc2] != undefined)
            {
                _loc3 = COMPONENT_ARRAY[_loc2];
                _loc5 = _loc3._enumId;
                _loc7 = _loc3._size[0];
                _loc6 = _loc3._size[1];
                _loc4 = _loc3._position;
                this.SET_COMPONENT_POSITION(_loc5, _loc7, _loc6, _loc4[0], _loc4[1], _loc4[2], _loc4[3]);
            } // end if
        } // end of for
        this.reorderAllKnownLists();
    } // End of the function
    function reorderAllKnownLists()
    {
    } // End of the function
    function SHOW_BOUNDING_BOX(componentID)
    {
        var _loc3 = 0;
        var _loc4;
        for (var _loc3 = 0; _loc3 < MAX_HUD_COMPONENTS; ++_loc3)
        {
            _loc4 = super.checkForCompInfo(_loc3 + 1);
            _loc4._mc.BOUNDING_BOX._visible = true;
        } // end of for
    } // End of the function
    function TOGGLE_SAFEZONE_DEBUG(isVisible)
    {
        TIMELINE.frameMC._visible = isVisible;
    } // End of the function
    var NEEDS_BIGGER_HELP_AND_SUBTITLES = false;
    var screenWidth = 1280;
    var screenHeight = 720;
    var safeTop = 96;
    var safeBottom = 96;
    var safeLeft = 54;
    var safeRight = 54;
    var isWideScreen = true;
    var isHiDef = true;
    var MP_IS_ACTIVE = false;
    var HIGHEST_DEPTH_IN_XML = 0;
    static var NOT_IN_LIST = -1;
    static var NOT_LOADED = 0;
    static var STREAMING = 1;
    static var LOADING = 2;
    static var LOAD_IN_PROGRESS = 3;
    static var LOAD_COMPLETE = 4;
    static var LOADED = 5;
    static var LOAD_ERROR = 6;
    static var ONSCREEN = 7;
    static var HIDDEN = 8;
    static var DEACTIVATED = 9;
} // End of Class
#endinitclip
