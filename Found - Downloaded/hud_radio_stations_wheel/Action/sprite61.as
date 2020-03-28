// Action script...

// [Initial MovieClip Action of sprite 61]
#initclip 8
class com.rockstargames.gtav.hud.NEW_HUD extends com.rockstargames.ui.core.BaseContainer
{
    var loadedHudComps, listArray, listManager, charColourEnum, COMPONENT_ARRAY, MAX_HUD_COMPONENTS, loadedCompPrefix, IS_HUD_VISIBLE, mcPrefix, TIMELINE, NEEDS_BIGGER_HELP_AND_SUBTITLES;
    function NEW_HUD()
    {
        super();
        loadedHudComps = {};
        listArray = [];
        listManager = [];
        charColourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
    } // End of the function
    function SET_CHARACTER_COLOUR(colourEnum)
    {
        charColourEnum = colourEnum;
    } // End of the function
    function SET_WEAPON_WHEEL_ACTIVE(bool)
    {
        weaponWheelActive = bool;
    } // End of the function
    function GET_CURRENT_WEAPON_WHEEL_HASH()
    {
        if (_isWeaponSelectable)
        {
            return (weaponTypeHash);
        }
        else
        {
            return (Number(_isWeaponSelectable));
        } // end else if
    } // End of the function
    function SET_CURRENT_WEAPON_WHEEL_HASH(newWeaponHash, isWeaponSelectable)
    {
        _isWeaponSelectable = isWeaponSelectable;
        weaponTypeHash = newWeaponHash;
    } // End of the function
    function setupComponent(componentID)
    {
        super.setupComponent(componentID);
        var _loc3 = COMPONENT_ARRAY[componentID];
        var _loc5 = _loc3._mc;
        if (componentID == com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1 || componentID == com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_2)
        {
            _loc5._x = 0;
            _loc5._y = 0;
        } // end if
        if (componentID < MAX_HUD_COMPONENTS)
        {
            loadedHudComps[loadedCompPrefix + componentID] = _loc3;
        } // end if
        if (_loc3._displayList != -1)
        {
            this.addObjectToList(componentID, _loc3._displayList, _loc3._displayListPriority);
        } // end if
    } // End of the function
    function setAllHudIntendedVisibility(isVisible)
    {
        var _loc4;
        for (var _loc3 = 0; _loc3 < MAX_HUD_COMPONENTS; ++_loc3)
        {
            _loc4 = super.checkForCompInfo(_loc3 + 1);
            _loc4._intendedVisibleState = isVisible;
        } // end of for
    } // End of the function
    function SHOW(componentID)
    {
        var _loc3 = super.checkForCompInfo(componentID);
        _loc3._intendedVisibleState = true;
        if (_loc3._status == com.rockstargames.ui.core.BaseContainer.HIDDEN)
        {
            _loc3._mc._visible = true;
            _loc3._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
        } // end if
        this.reorderList(_loc3._displayList);
    } // End of the function
    function HIDE(componentID)
    {
        var _loc3 = super.checkForCompInfo(componentID);
        _loc3._intendedVisibleState = false;
        if (_loc3._status == com.rockstargames.ui.core.BaseContainer.ONSCREEN)
        {
            _loc3._mc._visible = false;
            _loc3._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
        } // end if
        this.reorderList(_loc3._displayList);
    } // End of the function
    function SHOW_ALL()
    {
        this.setAllHudIntendedVisibility(true);
        for (var _loc3 in loadedHudComps)
        {
            var _loc2 = loadedHudComps[_loc3];
            if (_loc2._status == com.rockstargames.ui.core.BaseContainer.HIDDEN)
            {
                _loc2._mc._visible = true;
                _loc2._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
            } // end if
        } // end of for...in
        this.reorderAllKnownLists();
        IS_HUD_VISIBLE = true;
    } // End of the function
    function HIDE_ALL()
    {
        this.setAllHudIntendedVisibility(false);
        for (var _loc3 in loadedHudComps)
        {
            var _loc2 = loadedHudComps[_loc3];
            if (_loc2._status == com.rockstargames.ui.core.BaseContainer.ONSCREEN)
            {
                _loc2._mc._visible = false;
                _loc2._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
            } // end if
        } // end of for...in
        this.reorderAllKnownLists();
        IS_HUD_VISIBLE = false;
    } // End of the function
    function REMOVE_HUD_ITEM(componentID, wasCalledFromCode)
    {
        if (wasCalledFromCode == undefined)
        {
            wasCalledFromCode = false;
        } // end if
        var _loc2 = COMPONENT_ARRAY[componentID];
        var _loc6 = _loc2._displayList;
        _loc2._status = com.rockstargames.ui.core.BaseContainer.NOT_LOADED;
        if (_loc2._hasGfx)
        {
            var _loc5 = mcPrefix + componentID;
            TIMELINE[_loc5].removeMovieClip();
            _loc2._mc.removeMovieClip();
            _loc2.sanitise();
            loadedHudComps[loadedCompPrefix + componentID] = null;
            delete loadedHudComps[loadedCompPrefix + componentID];
            if (componentID == 16)
            {
                delete com.rockstargames.gtav.hud.hudComponents.HUD_RADIO_STATIONS_WHEEL;
            } // end if
            com.rockstargames.ui.game.GameInterface.call("SET_HUD_COMPONENT_AS_NO_LONGER_NEEDED", com.rockstargames.ui.game.GameInterface.HUD_TYPE, componentID, wasCalledFromCode);
        }
        else
        {
            _loc2._status = com.rockstargames.ui.core.BaseContainer.DEACTIVATED;
            _loc2._mc._visible = false;
            com.rockstargames.ui.game.GameInterface.call("SET_HUD_COMPONENT_AS_NO_LONGER_NEEDED", com.rockstargames.ui.game.GameInterface.HUD_TYPE, componentID, wasCalledFromCode);
        } // end else if
        this.reorderList(_loc6);
    } // End of the function
    function addObjectToList(componentID, listID, rowPriority)
    {
        if (listArray[listID] == undefined)
        {
            listArray[listID] = [];
            listManager.push(listID);
        } // end if
        if (rowPriority != undefined)
        {
            listArray[listID][rowPriority] = componentID;
        }
        else
        {
            listArray[listID].push(componentID);
        } // end else if
        this.reorderList(listID);
    } // End of the function
    function reorderAllKnownLists()
    {
        var _loc2;
        for (var _loc2 in listManager)
        {
            this.reorderList(listManager[_loc2]);
        } // end of for...in
    } // End of the function
    function reorderList(listID)
    {
        if (listID < 0 || listID == undefined)
        {
            return;
        } // end if
        var _loc8 = listArray[listID];
        var _loc2;
        var _loc6;
        var _loc7;
        var _loc9 = _loc8.length;
        var _loc3 = null;
        var _loc10 = 8;
        for (var _loc4 = 0; _loc4 < _loc9; ++_loc4)
        {
            var _loc5 = COMPONENT_ARRAY[_loc8[_loc4]];
            _loc2 = _loc5._mc;
            _loc6 = _loc5._status;
            if (_loc6 == com.rockstargames.ui.core.BaseContainer.ONSCREEN)
            {
                if (_loc3 != null)
                {
                    _loc7 = _loc3._y + _loc3.BOUNDING_BOX._height + _loc10 + _loc3.getBottomCompOffset();
                    _loc2._y = _loc7 + _loc2.getTopCompOffset();
                }
                else
                {
                    _loc2._y = _loc2.TIMELINE.defaultY;
                } // end else if
                if (_loc2 != undefined)
                {
                    _loc3 = _loc2;
                } // end if
            } // end if
        } // end of for
    } // End of the function
    function createComponentMovieClip(currentComp)
    {
        currentComp._status = com.rockstargames.ui.core.BaseContainer.LOADED;
        var _loc5 = currentComp._enumId;
        var _loc4 = currentComp._depth;
        var _loc3 = mcPrefix + _loc5;
        var _loc7 = "HUD_SUBTITLE_TEXT";
        var _loc6 = "HUD_HELP_TEXT";
        if (NEEDS_BIGGER_HELP_AND_SUBTITLES)
        {
            _loc7 = "HUD_SUBTITLE_TEXT_BIG";
            _loc6 = "HUD_HELP_TEXT_BIG";
        } // end if
        switch (_loc5)
        {
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_HELP_TEXT:
            {
                currentComp._mc = TIMELINE.attachMovie(_loc6, _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_FLOATING_HELP_TEXT_1", _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_2:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_FLOATING_HELP_TEXT_2", _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_ICON:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_WEAPON_ICON", _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_WHEEL:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_WEAPON_WHEEL", _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_WHEEL_STATS:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_WEAPON_WHEEL_STATS", _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WANTED_STARS:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_WANTED_STARS", _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_SUBTITLE_TEXT:
            {
                currentComp._mc = TIMELINE.attachMovie(_loc7, _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_VEHICLE_CLASS:
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_VEHICLE_NAME:
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_STREET_NAME:
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_AREA_NAME:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_AREA_VEHICLE_STREET_NAME", _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_CASH:
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_CASH_CHANGE:
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_MP_CASH:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_CASH", _loc3, _loc4);
                break;
            } 
            case com.rockstargames.gtav.constants.HudComponentConstants.HUD_RADIO_STATIONS:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_RADIO_WHEEL", _loc3, _loc4);
                break;
            } 
            case 125:
            case 126:
            case 127:
            case 128:
            case 129:
            case 130:
            case 131:
            case 132:
            case 133:
            case 134:
            case 135:
            case 136:
            case 137:
            case 138:
            case 139:
            {
                currentComp._mc = TIMELINE.attachMovie("HUD_MP_INVENTORY", _loc3, _loc4);
                break;
            } 
            case 140:
            {
                currentComp._mc = TIMELINE.attachMovie("MP_RANK_BAR", _loc3, _loc4);
                break;
            } 
        } // End of switch
        com.rockstargames.ui.game.GameInterface.call("SET_ACTIVE_STATE", com.rockstargames.ui.game.GameInterface.HUD_TYPE, currentComp._enumId, true);
        currentComp._mc.INITIALISE();
        currentComp._mc._visible = false;
        this.setupComponent(_loc5);
    } // End of the function
    var weaponWheelActive = false;
    var weaponTypeHash = 0;
    var _isWeaponSelectable = true;
} // End of Class
#endinitclip
