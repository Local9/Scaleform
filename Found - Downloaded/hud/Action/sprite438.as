// Action script...

// [Initial MovieClip Action of sprite 438]
#initclip 26
class com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var FADE_DURATION, ON_SCREEN_DURATION, TIMELINE, CONTENT, BOUNDING_BOX, _HUD, _alpha;
    function HUD_WEAPON_WHEEL()
    {
        super();
        FADE_DURATION = HUD_WEAPON_ICON_FADE_TIME;
        ON_SCREEN_DURATION = 5000;
        slotList = [];
        slotIndexList = [];
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
        CONTENT.wheelMC.arrowsMC._visible = CONTENT.wheelMC.arrowsMCOutline._visible = false;
        CONTENT.parachuteMC._visible = false;
        CONTENT.attachMovie("SLOT_WEAPONS_0", "wT0", CONTENT.getNextHighestDepth(), {_x: 256, _y: 90});
        CONTENT.attachMovie("SLOT_WEAPONS_1", "wT1", CONTENT.getNextHighestDepth(), {_x: 372, _y: 144});
        CONTENT.attachMovie("SLOT_WEAPONS_2", "wT2", CONTENT.getNextHighestDepth(), {_x: 418, _y: 256});
        CONTENT.attachMovie("SLOT_WEAPONS_3", "wT3", CONTENT.getNextHighestDepth(), {_x: 372, _y: 368});
        CONTENT.attachMovie("SLOT_WEAPONS_4", "wT4", CONTENT.getNextHighestDepth(), {_x: 256, _y: 418});
        CONTENT.attachMovie("SLOT_WEAPONS_5", "wT5", CONTENT.getNextHighestDepth(), {_x: 140, _y: 368});
        CONTENT.attachMovie("SLOT_WEAPONS_6", "wT6", CONTENT.getNextHighestDepth(), {_x: 94, _y: 256});
        CONTENT.attachMovie("SLOT_WEAPONS_7", "wT7", CONTENT.getNextHighestDepth(), {_x: 140, _y: 144});
        CONTENT.WEAPON_IN_CAR.attachMovie("MASTER_WEAPONS", "wT8", CONTENT.WEAPON_IN_CAR.getNextHighestDepth(), {_x: 0, _y: 0});
        CONTENT.wT0.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.wT0.getNextHighestDepth(), {_x: -2, _y: 35});
        CONTENT.wT1.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.wT1.getNextHighestDepth(), {_x: 20, _y: 37});
        CONTENT.wT2.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.wT2.getNextHighestDepth(), {_x: -9, _y: 46});
        CONTENT.wT3.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.wT3.getNextHighestDepth(), {_x: -15, _y: 35});
        CONTENT.wT4.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.wT4.getNextHighestDepth(), {_x: -5, _y: 52});
        CONTENT.wT5.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.wT5.getNextHighestDepth(), {_x: 12, _y: 35});
        CONTENT.wT6.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.wT6.getNextHighestDepth(), {_x: -3, _y: 46});
        CONTENT.wT7.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.wT7.getNextHighestDepth(), {_x: -12, _y: 37});
        CONTENT.WEAPON_IN_CAR.wT8.attachMovie("AMMO_MASTER", "ammoMC", CONTENT.WEAPON_IN_CAR.wT8.getNextHighestDepth(), {_x: 0, _y: 70});
        this.SET_WHEEL_IN_CAR_MODE([false]);
    } // End of the function
    function dbg(str)
    {
        com.rockstargames.ui.utils.Debug.log("SCALEFORM | " + str);
    } // End of the function
    function READY(id)
    {
        super.READY(id);
    } // End of the function
    function SET_INPUT_EVENT(params)
    {
        var _loc2 = params[0];
        switch (_loc2)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                this.cycleWeapons(-1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                this.cycleWeapons(1);
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_PARACHUTE_IS_VISIBLE(params)
    {
        CONTENT.parachuteMC._visible = params[0];
    } // End of the function
    function SET_ATTACHMENT_LABELS(params)
    {
        var _loc4 = params[0];
        var _loc2 = CONTENT.wheelMC.attachmentsTF;
        var _loc3 = CONTENT.wheelMC.attachmentsTFOutline;
        _loc2.htmlText = _loc3.htmlText = _loc4;
        _loc2._visible = _loc3._visible = true;
        _loc2._alpha = _loc3._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2, 0.200000, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3, 0.350000, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
    } // End of the function
    function setWeaponLabel(weaponData)
    {
        var _loc4 = weaponData[ARG_WEAPON_HASH] ? (weaponData[ARG_WEAPON_NAME]) : ("");
        var _loc3 = CONTENT.wheelMC.weaponTextLabel;
        _loc3.resetDelay();
        _loc3.setDelayTimeout(WEAPON_NAME_SCROLL_DELAY);
        _loc3.txtString.text = _loc4;
        var _loc2 = CONTENT.wheelMC.weaponTextLabelOutline;
        _loc2.resetDelay();
        _loc2.setDelayTimeout(WEAPON_NAME_SCROLL_DELAY);
        _loc2.txtString.text = _loc4;
    } // End of the function
    function setWeaponPaging(pageIndex, pageMax)
    {
        CONTENT.wheelMC.arrowsMC.countTF.text = CONTENT.wheelMC.arrowsMCOutline.countTF.text = pageIndex;
        CONTENT.wheelMC.arrowsMC.maxTF.text = CONTENT.wheelMC.arrowsMCOutline.maxTF.text = pageMax;
        CONTENT.wheelMC.arrowsMC._visible = CONTENT.wheelMC.arrowsMCOutline._visible = pageMax > 1;
    } // End of the function
    function setWeaponLabelAndPage()
    {
        var _loc2 = slotList[weaponTypeIndex];
        if (_loc2 != undefined)
        {
            var _loc3 = slotIndexList[weaponTypeIndex].index;
            var _loc4 = _loc2[_loc3];
            this.setWeaponLabel(_loc4.data);
            this.setWeaponPaging(_loc3 + 1, _loc2.length);
        }
        else
        {
            this.hideArrows();
        } // end else if
        this.highlightWeapon();
    } // End of the function
    function highlightWeapon()
    {
        for (var _loc2 = 0; _loc2 < 8; ++_loc2)
        {
            var _loc3 = CONTENT.wheelMC["s" + _loc2 + "MC"];
            var _loc4 = _loc2 == weaponTypeIndex;
            _loc3.bgMC._alpha = _loc4 ? (WEAPON_BG_ALPHA_SELECT) : (WEAPON_BG_ALPHA_UNSELECT);
        } // end of for
    } // End of the function
    function SET_PLAYER_WEAPON_WHEEL(params)
    {
        var _loc2 = params[0];
        var _loc5 = params[1];
        var _loc3 = params[ARG_WEAPON_HASH];
        var _loc7 = params[3];
        if (_loc3 != com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_INVALID)
        {
            _HUD.SET_WEAPON_WHEEL_ACTIVE(true);
            var _loc6 = slotList[_loc2];
            if (_loc6 == undefined)
            {
                slotList[_loc2] = [];
            } // end if
            slotList[_loc2][_loc5] = {data: params, id: _loc3};
            if (_loc7)
            {
                slotIndexList[_loc2] = {index: _loc5, id: _loc3};
            } // end if
        } // end if
    } // End of the function
    function loadWeapon(weaponData, slotTypeIndex)
    {
        var _loc3 = weaponData[ARG_WEAPON_EQUIPPED];
        var _loc4 = _isInCar ? (CONTENT.WEAPON_IN_CAR) : (CONTENT.wheelMC["s" + slotTypeIndex + "MC"]);
        _loc4.outlineMC._visible = !_loc3;
        _loc4.outlineHighlightMC._visible = _loc3;
        if (_loc3 && _HUD.charColourEnum)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc4.outlineHighlightMC, _HUD.charColourEnum);
        } // end if
        var _loc7 = weaponData[ARG_WEAPON_HASH];
        var _loc6 = weaponData[4];
        var _loc9 = weaponData[5];
        var _loc10 = weaponData[6];
        var _loc8 = true;
        if (weaponData[7] != undefined)
        {
            _loc8 = weaponData[7];
        } // end if
        var _loc5 = _isInCar ? (CONTENT.WEAPON_IN_CAR.wT8) : (CONTENT["wT" + slotTypeIndex]);
        _loc5._alpha = _loc8 ? (100) : (30);
        var _loc11 = _loc5.ammoMC;
        _loc5.gotoAndStop("INT" + _loc7);
        if (_loc6 != undefined && _loc9 != undefined)
        {
            _loc11.SET_AMMO_COUNT([_loc6, _loc9, _loc10, _loc7]);
        } // end if
    } // End of the function
    function cycleWeapons(dir)
    {
        if (canCycle)
        {
            var _loc4 = slotList[weaponTypeIndex];
            if (_loc4 != undefined)
            {
                var _loc3 = _loc4.length;
                if (_loc3 > 1)
                {
                    var _loc6 = slotIndexList[weaponTypeIndex].index;
                    var _loc2 = _loc6;
                    if (dir > 0)
                    {
                        _loc2 + 1 > _loc3 - 1 ? (_loc2 = 0, 0) : (_loc2++);
                    }
                    else if (dir < 0)
                    {
                        _loc2 - 1 < 0 ? (_loc2 = _loc3 - 1, _loc3 - 1) : (_loc2--);
                    } // end else if
                    var _loc5 = _loc4[_loc2];
                    this.loadWeapon(_loc5.data, weaponTypeIndex);
                    this.setWeaponLabel(_loc5.data);
                    this.setWeaponPaging(_loc2 + 1, _loc3);
                    slotIndexList[weaponTypeIndex].index = _loc2;
                    this.setHudWeaponWheelHash();
                    com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "DPAD_WEAPON_SCROLL", "HUD_FRONTEND_DEFAULT_SOUNDSET");
                    com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, -50, 0.080000, 200);
                }
                else
                {
                    this.hideArrows();
                } // end if
            } // end if
        } // end else if
        com.rockstargames.ui.game.GameInterface.call("SET_WEAPON_WHEEL_SLOT_SELECTION", com.rockstargames.ui.game.GameInterface.HUD_TYPE, weaponTypeIndex, weaponHash);
    } // End of the function
    function TOGGLE_POINTER_AND_WEAPON_NAME_VISIBILITY(params)
    {
        CONTENT.wheelMC.arrowsMC._visible = CONTENT.wheelMC.arrowsMCOutline._visible = false;
        var _loc4 = slotList[weaponTypeIndex];
        if (_loc4 != undefined)
        {
            var _loc6 = _loc4.length;
            if (_loc6 > 1)
            {
                CONTENT.wheelMC.arrowsMC._visible = CONTENT.wheelMC.arrowsMCOutline._visible = params[0];
            } // end if
        } // end if
        CONTENT.wheelMC.weaponTextLabel._visible = CONTENT.wheelMC.weaponTextLabelOutline._visible = params[0];
        CONTENT.wheelMC.attachmentsTF._visible = CONTENT.wheelMC.attachmentsTFOutline._visible = !_isInCar && params[0];
        if (params[0] == false)
        {
            for (var _loc2 = 0; _loc2 < 8; ++_loc2)
            {
                var _loc3 = CONTENT.wheelMC["s" + _loc2 + "MC"];
                _loc3._alpha = WEAPON_BG_ALPHA_UNSELECT;
            } // end of for
        } // end if
    } // End of the function
    function SET_POINTER(params)
    {
        var _loc3 = params[0];
        var _loc4 = params[1];
        pAngle = _loc3;
        if (_loc4)
        {
            pAngle = 45 * _loc3;
            weaponTypeIndex = _loc3;
        }
        else
        {
            for (var _loc2 = pAngle + 25.500000; _loc2 > 360; _loc2 = _loc2 - 360)
            {
            } // end of for
            weaponTypeIndex = int(_loc2 / 45);
        } // end else if
        if (_loc4 && weaponTypeIndex == 8)
        {
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "DPAD_WEAPON_SCROLL", "HUD_FRONTEND_DEFAULT_SOUNDSET");
        }
        else
        {
            if (oldweaponTypeIndex != weaponTypeIndex)
            {
                this.setHudWeaponWheelHash();
                CONTENT.wheelMC.attachmentsTF._visible = CONTENT.wheelMC.attachmentsTFOutline._visible = false;
                this.highlightWeapon();
                this.setWeaponLabel(this.getCurrentWeaponData().data);
                var _loc5 = slotList[weaponTypeIndex];
                if (_loc5 != undefined)
                {
                    var _loc6 = slotIndexList[weaponTypeIndex].index;
                    this.setWeaponPaging(_loc6 + 1, _loc5.length);
                    com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, -50, 0.080000, 200);
                }
                else
                {
                    CONTENT.wheelMC.arrowsMC._visible = CONTENT.wheelMC.arrowsMCOutline._visible = false;
                    com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, -100, 0.040000, 200);
                } // end else if
                com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "DPAD_WEAPON_SCROLL", "HUD_FRONTEND_DEFAULT_SOUNDSET");
            } // end if
            oldweaponTypeIndex = weaponTypeIndex;
        } // end else if
    } // End of the function
    function getScreenCoords(x, y)
    {
        var _loc1 = new flash.geom.Point(x, y);
        _loc1.x = x / 1280;
        _loc1.y = y / 720;
        return (_loc1);
    } // End of the function
    function setHudWeaponWheelHash()
    {
        var _loc3 = com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_INVALID;
        var _loc2 = this.getCurrentWeaponData();
        if (_loc2 != undefined)
        {
            _loc3 = _loc2.data[ARG_WEAPON_HASH];
        } // end if
        if (_loc2.data[7] != undefined)
        {
            _HUD.SET_CURRENT_WEAPON_WHEEL_HASH(_loc3, _loc2.data[7]);
        }
        else
        {
            _HUD.SET_CURRENT_WEAPON_WHEEL_HASH(_loc3, true);
        } // end else if
        weaponHash = _loc3;
        var _loc4 = CONTENT.wheelMC.attachmentsTF;
        var _loc5 = CONTENT.wheelMC.attachmentsTFOutline;
        _loc4._visible = _loc5._visible = false;
        _loc4._alpha = _loc5._alpha = 0;
        _loc4._text = _loc5._text = "";
        if (!_isInCar)
        {
            com.rockstargames.ui.game.GameInterface.call("UPDATE_WEAPON_ATTACHMENT_FROM_SLOT", com.rockstargames.ui.game.GameInterface.HUD_TYPE, weaponHash);
        } // end if
    } // End of the function
    function getCurrentWeaponData()
    {
        var _loc3 = slotList[weaponTypeIndex];
        var _loc2 = slotIndexList[weaponTypeIndex].index;
        return (_loc3[_loc2]);
    } // End of the function
    function SHOW()
    {
        canCycle = false;
        CONTENT.wheelMC.attachmentsTF._visible = CONTENT.wheelMC.attachmentsTFOutline._visible = false;
        for (var _loc2 = 0; _loc2 < 9; ++_loc2)
        {
            var _loc4 = slotIndexList[_loc2];
            if (_loc4 != undefined)
            {
                var _loc6 = _loc4.index;
                var _loc3 = slotList[_loc2][_loc6].data;
                var _loc7 = _loc3[0];
                var _loc8 = _loc3[3];
                if (_loc8)
                {
                    this.loadWeapon(_loc3, _loc7);
                } // end if
                continue;
            } // end if
            var _loc5 = CONTENT.wheelMC["s" + _loc2 + "MC"];
            _loc5.outlineMC._visible = true;
            _loc5.outlineHighlightMC._visible = false;
        } // end of for
        this.SHOW_ALL();
    } // End of the function
    function START_CROSSFADE(params)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, params[0], {_alpha: params[1], begin: _alpha, onComplete: fadeComplete, onCompleteScope: this});
    } // End of the function
    function fadeComplete()
    {
        com.rockstargames.ui.game.GameInterface.call("WEAPON_WHEEL_FADE_COMPLETE", com.rockstargames.ui.game.GameInterface.HUD_TYPE);
    } // End of the function
    function SHOW_ALL()
    {
        if (CONTENT._alpha != 100)
        {
            CONTENT._alpha = 100;
        } // end if
        this.setWeaponLabelAndPage();
        canCycle = true;
    } // End of the function
    function CLEAR_PLAYER_WEAPON_WHEEL(params)
    {
        slotList = [];
        slotIndexList = [];
        for (var _loc2 = 0; _loc2 < 8; ++_loc2)
        {
            CONTENT["wT" + _loc2].gotoAndStop(1);
            CONTENT["wT" + _loc2].ammoMC.SET_AMMO_COUNT([-1, -1, -1, -98]);
        } // end of for
        CONTENT.WEAPON_IN_CAR.wT8.gotoAndStop(1);
        CONTENT.WEAPON_IN_CAR.wT8.ammoMC.SET_AMMO_COUNT([-1, -1, -1, -98]);
    } // End of the function
    function UNLOAD_WEAPON_WHEEL()
    {
        canCycle = false;
        CONTENT._alpha = 0;
        this.REMOVE();
    } // End of the function
    function REMOVE()
    {
        this.CLEAR_PLAYER_WEAPON_WHEEL();
        _HUD.SET_WEAPON_WHEEL_ACTIVE(false);
        _HUD.REMOVE_HUD_ITEM(com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_WHEEL);
    } // End of the function
    function SET_WHEEL_IN_CAR_MODE(params)
    {
        var _loc3;
        _isInCar = params[0];
        for (var _loc2 = 0; _loc2 < 8; ++_loc2)
        {
            _loc3 = CONTENT.wheelMC["s" + _loc2 + "MC"];
            _loc3._visible = !_isInCar;
        } // end of for
        CONTENT.wheelMC.rings._visible = !_isInCar;
        CONTENT.WEAPON_IN_CAR._visible = _isInCar;
        if (_isInCar)
        {
            CONTENT.parachuteMC._x = CONTENT.WEAPON_IN_CAR._x;
            CONTENT.parachuteMC._y = 229;
            CONTENT.wheelMC.attachmentsTF._visible = CONTENT.wheelMC.attachmentsTFOutline._visible = false;
        }
        else
        {
            CONTENT.parachuteMC._x = 424;
            CONTENT.parachuteMC._y = 424;
        } // end else if
    } // End of the function
    function hideArrows()
    {
        CONTENT.wheelMC.arrowsMC._visible = CONTENT.wheelMC.arrowsMCOutline._visible = false;
    } // End of the function
    var WEAPON_BG_ALPHA_SELECT = 100;
    var WEAPON_BG_ALPHA_UNSELECT = 30;
    var HUD_WEAPON_ICON_FADE_TIME = 400;
    var WEAPON_NAME_SCROLL_DELAY = 120;
    var ARG_WEAPON_HASH = 2;
    var ARG_WEAPON_NAME = 8;
    var ARG_WEAPON_EQUIPPED = 9;
    var weaponHash = 0;
    var weaponTypeIndex = 0;
    var oldweaponTypeIndex = -1;
    var pAngle = 0;
    var slotList = new Array();
    var slotIndexList = new Array();
    var canCycle = false;
    var _isInCar = false;
} // End of Class
#endinitclip
