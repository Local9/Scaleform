// Action script...

// [Initial MovieClip Action of sprite 105]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_RETICLE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var DEFAULT_COLOUR, STYLES, CONTENT, reticleMC, hitmarker, FLASH_COLOUR, _enumID, _HUD;
    function HUD_RETICLE()
    {
        super();
        DEFAULT_COLOUR = [225, 225, 225, 100];
        var _loc4 = [194, 80, 80, 100];
        var _loc6 = [225, 225, 225, 50];
        var _loc5 = [155, 155, 155, 50];
        var _loc3 = [80, 194, 80, 100];
        STYLES = [DEFAULT_COLOUR, _loc4, _loc6, _loc5, _loc3];
        this.READY(com.rockstargames.gtav.constants.HudComponentConstants.HUD_RETICLE);
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        CONTENT._visible = false;
        reticleMC = CONTENT.reticleMC;
        hitmarker = reticleMC.hitmarker;
    } // End of the function
    function LOAD_RETICLE()
    {
        CONTENT._visible = false;
    } // End of the function
    function SET_RETICLE_TYPE_EXTERNAL(weaponID, hasAccuracyAnim, hasReticleData, hasCompass, isSniper)
    {
        this.SET_RETICLE_TYPE([weaponID, hasAccuracyAnim, hasReticleData, hasCompass, isSniper]);
    } // End of the function
    function SET_RETICLE_TYPE(params)
    {
        this.STOP_FLASHING_RETICLE();
        weaponID = params[0];
        hasAccuracyAnim = params[1];
        hasReticleData = params[2];
        hasCompass = params[3];
        var _loc3 = params[4];
        var _loc2;
        switch (weaponID)
        {
            case WEAPON_INVALID:
            {
                _loc2 = "WEAPON_INVALID";
                break;
            } 
            case WEAPON_UNARMED:
            {
                _loc2 = "WEAPON_UNARMED";
                break;
            } 
            case WEAPONTYPE_SMG:
            {
                hasAccuracyAnim = true;
                _loc2 = "WEAPONTYPE_SMG";
                break;
            } 
            case WEAPONTYPE_RIFLE:
            {
                hasAccuracyAnim = true;
                _loc2 = "WEAPONTYPE_RIFLE";
                break;
            } 
            case WEAPONTYPE_SHOTGUN:
            {
                hasAccuracyAnim = true;
                _loc2 = "WEAPONTYPE_SHOTGUN";
                break;
            } 
            case WEAPON_THROWN:
            {
                _loc2 = "WEAPON_THROWN";
                break;
            } 
            case WEAPON_PROGRAMMABLE_AR:
            {
                _loc2 = "WEAPON_PROGRAMMABLE_AR";
                _loc3 = true;
                hasReticleData = true;
                break;
            } 
            case WEAPON_HEAVY_RPG:
            {
                _loc2 = "WEAPON_HEAVY_RPG";
                hasAccuracyAnim = true;
                break;
            } 
            case WEAPON_HEAVY_GRENADE_LAUNCHER:
            {
                _loc2 = "WEAPON_HEAVY_GRENADE_LAUNCHER";
                break;
            } 
            case WEAPON_TANK:
            {
                _loc2 = "WEAPON_TANK";
                break;
            } 
            case WEAPON_VULKAN_GUNS:
            {
                _loc2 = "WEAPON_VULKAN_GUNS";
                break;
            } 
            case SIMPLE_RETICLE:
            {
                _loc2 = "SIMPLE_RETICLE";
                break;
            } 
            case SNIPER_MAX:
            {
                _loc2 = "WEAPON_SNIPER_HEAVY";
                _loc3 = true;
                break;
            } 
            case SNIPER_LARGE:
            {
                _loc2 = "WEAPON_SNIPER";
                _loc3 = true;
                break;
            } 
            case COCKPIT_VIEW:
            {
                _loc2 = "COCKPIT_VIEW";
                hasCompass = true;
                break;
            } 
            case VULKAN_ROCKET:
            {
                _loc2 = "WEAPON_VULKAN_ROCKETS";
                break;
            } 
            case VULKAN_ROCKET_COCKPIT_VIEW:
            {
                _loc2 = "VULKAN_ROCKET_COCKPIT_VIEW";
                hasCompass = true;
                break;
            } 
            case WEAPON_PISTOL:
            default:
            {
                _loc2 = "WEAPON_PISTOL";
                weaponID = WEAPON_PISTOL;
                break;
            } 
        } // End of switch
        reticleMC.gotoAndStop(_loc2);
        this.initSpreadComponents();
        if (_loc3)
        {
            reticleMC.zoomMC.markerMC._visible = false;
        } // end if
    } // End of the function
    function initSpreadComponents()
    {
        var _loc2;
        var _loc5 = 0;
        while (_loc2 = reticleMC.reticle["positionalComponentMC" + _loc5])
        {
            if (_loc2.dx0 != undefined)
            {
                break;
            } // end if
            var _loc4 = _loc2._x;
            var _loc3 = _loc2._y;
            _loc2.dx0 = _loc2._x;
            _loc2.dy0 = _loc2._y;
            _loc2.d0 = Math.sqrt(_loc4 * _loc4 + _loc3 * _loc3);
            ++_loc5;
        } // end while
    } // End of the function
    function SET_RETICLE_ACCURACY_EXTERNAL(accuracyScalar)
    {
        this.SET_RETICLE_ACCURACY([accuracyScalar]);
    } // End of the function
    function SET_RETICLE_ACCURACY(params)
    {
        var _loc8 = params[0];
        var _loc7 = _loc8 * ACCURACY_SCALAR_TO_PX;
        var _loc6 = 0;
        var _loc2;
        while (_loc2 = reticleMC.reticle["positionalComponentMC" + _loc6])
        {
            var _loc3 = _loc2.d0;
            var _loc5 = _loc3 + _loc7;
            var _loc4 = _loc5 / _loc3;
            _loc2._x = _loc2.dx0 * _loc4;
            _loc2._y = _loc2.dy0 * _loc4;
            ++_loc6;
        } // end while
    } // End of the function
    function SET_SCOPE_LOCK_EXTERNAL(isLocked, lockedStr)
    {
        this.SET_SCOPE_LOCK([isLocked, lockedStr]);
    } // End of the function
    function SET_SCOPE_LOCK(params)
    {
        if (hasReticleData)
        {
            switch (weaponID)
            {
                case WEAPON_PROGRAMMABLE_AR:
                {
                    var _loc2 = params[0];
                    var _loc3 = params[1];
                    reticleMC.reticle.lockedMC.gotoAndStop(int(_loc2) + 1);
                    if (_loc2)
                    {
                        reticleMC.reticle.lockedMC.lockedTF.text = _loc3;
                    } // end if
                    break;
                } 
            } // End of switch
        } // end if
    } // End of the function
    function SET_SCOPE_DIST_EXTERNAL(distStr, feetStr)
    {
        this.SET_SCOPE_DIST([distStr, feetStr]);
    } // End of the function
    function SET_SCOPE_DIST(params)
    {
        if (hasReticleData)
        {
            switch (weaponID)
            {
                case WEAPON_PROGRAMMABLE_AR:
                {
                    var _loc3 = params[0];
                    var _loc2 = params[1];
                    reticleMC.reticle.distMC.distTF.text = _loc3;
                    reticleMC.reticle.distMC.feetTF.text = _loc2;
                    break;
                } 
            } // End of switch
        } // end if
    } // End of the function
    function SET_RETICLE_ZOOM_EXTERNAL(zoomLevel)
    {
        this.SET_RETICLE_ZOOM([zoomLevel]);
    } // End of the function
    function SET_RETICLE_ZOOM(params)
    {
        var _loc3 = Math.max(0, Math.min(params[0], 100));
        var _loc2 = 0;
        switch (weaponID)
        {
            case SNIPER_MAX:
            {
                _loc2 = _loc3 / 100 * 189;
                reticleMC.zoomMC.markerMC._x = _loc2;
                if (!reticleMC.zoomMC.markerMC._visible)
                {
                    reticleMC.zoomMC.markerMC._visible = true;
                } // end if
                break;
            } 
            case SNIPER_LARGE:
            case WEAPON_PROGRAMMABLE_AR:
            {
                _loc2 = _loc3 / 100 * 88;
                reticleMC.zoomMC.markerMC._x = _loc2;
                if (!reticleMC.zoomMC.markerMC._visible)
                {
                    reticleMC.zoomMC.markerMC._visible = true;
                } // end if
                break;
            } 
        } // End of switch
    } // End of the function
    function START_DIM_RETICLE_EXTERNAL(newAlpha)
    {
        this.START_DIM_RETICLE([newAlpha]);
    } // End of the function
    function START_DIM_RETICLE(params)
    {
        switch (weaponID)
        {
            case SNIPER_MAX:
            case SNIPER_LARGE:
            case WEAPON_PROGRAMMABLE_AR:
            {
                break;
            } 
            default:
            {
                this.STOP_FLASHING_RETICLE();
                var _loc2 = params[0];
                reticleMC.reticle._alpha = _loc2;
                break;
            } 
        } // End of switch
    } // End of the function
    function RESET_RETICLE_EXTERNAL()
    {
        this.RESET_RETICLE();
    } // End of the function
    function RESET_RETICLE()
    {
        this.STOP_FLASHING_RETICLE();
        reticleMC.reticle._alpha = DEFAULT_COLOUR[3];
    } // End of the function
    function START_FLASHING_RETICLE_EXTERNAL(r, g, b, a)
    {
        this.START_FLASHING_RETICLE([r, g, b, a]);
    } // End of the function
    function START_FLASHING_RETICLE(params)
    {
        var _loc3 = params[0];
        var _loc6 = params[1];
        var _loc2 = params[2];
        var _loc4 = params[3];
        com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, _loc3, _loc6, _loc2, _loc4);
        FLASH_COLOUR = [_loc3, _loc6, _loc2, _loc4];
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, FLASH_DURATION, {onComplete: flashDefaultColour, onCompleteScope: this});
    } // End of the function
    function STOP_FLASHING_RETICLE()
    {
        if (typeof(reticleMC.reticle) == "movieclip")
        {
            FLASH_COLOUR = DEFAULT_COLOUR;
            com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, DEFAULT_COLOUR[0], DEFAULT_COLOUR[1], DEFAULT_COLOUR[2], DEFAULT_COLOUR[3]);
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
    } // End of the function
    function flashNewColour()
    {
        com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, FLASH_COLOUR[0], FLASH_COLOUR[1], FLASH_COLOUR[2], FLASH_COLOUR[3]);
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, FLASH_DURATION, {onComplete: flashDefaultColour, onCompleteScope: this});
    } // End of the function
    function flashDefaultColour()
    {
        com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, DEFAULT_COLOUR[0], DEFAULT_COLOUR[1], DEFAULT_COLOUR[2], DEFAULT_COLOUR[3]);
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, FLASH_DURATION, {onComplete: flashNewColour, onCompleteScope: this});
    } // End of the function
    function SET_RETICLE_VISIBLE_EXTERNAL(isVisible)
    {
        this.SET_RETICLE_VISIBLE([isVisible]);
    } // End of the function
    function SET_RETICLE_VISIBLE(params)
    {
        var _loc2 = params[0];
        CONTENT._visible = _loc2;
        hitmarker.gotoAndStop(0);
    } // End of the function
    function SET_RETICLE_POSITION_EXTERNAL(newX, newY, aspectRatioMultiplier)
    {
        this.SET_RETICLE_POSITION([newX, newY, aspectRatioMultiplier]);
    } // End of the function
    function SET_RETICLE_POSITION(params)
    {
        var _loc6 = params[0];
        var _loc5 = params[1];
        var _loc3 = 1;
        if (params[2] != undefined)
        {
            _loc3 = params[2];
        } // end if
        var _loc2 = this.COORDS_TO_SCREEN(_loc6, _loc5, _loc3);
        _loc2.x = _loc2.x - reticleMC._x;
        _loc2.y = _loc2.y - reticleMC._y;
        reticleMC.reticle._x = _loc2.x;
        reticleMC.reticle._y = _loc2.y;
    } // End of the function
    function SHOW_HITMARKER_EXTERNAL(hitmarkerFrame)
    {
        this.SHOW_HITMARKER([hitmarkerFrame]);
    } // End of the function
    function SHOW_HITMARKER(params)
    {
        if (params[0] == 1)
        {
            hitmarker.gotoAndPlay("playHitmarkerKill");
        }
        else if (params[0] == 2)
        {
            hitmarker.gotoAndPlay("playHitmarkerShot");
        } // end else if
    } // End of the function
    function SHOW_FRIENDLY_FIRE_EXTERNAL(reticleVis)
    {
        this.SHOW_FRIENDLY_FIRE([reticleVis]);
    } // End of the function
    function SHOW_FRIENDLY_FIRE(params)
    {
        var _loc2 = params[0];
        if (_loc2 == true)
        {
            reticleMC.reticle._alpha = 50;
            reticleMC.zoomMC._alpha = 50;
        }
        else
        {
            reticleMC.reticle._alpha = 100;
            reticleMC.zoomMC._alpha = 100;
        } // end else if
    } // End of the function
    function SET_RETICLE_STYLE_EXTERNAL(myStyle)
    {
        this.SET_RETICLE_STYLE([myStyle]);
    } // End of the function
    function SET_RETICLE_STYLE(params)
    {
        var _loc2 = params[0];
        var _loc3 = false;
        if (reticleMC.reticle != undefined)
        {
            _loc3 = true;
            com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, STYLES[_loc2][0], STYLES[_loc2][1], STYLES[_loc2][2], STYLES[_loc2][3]);
        } // end if
        return (_loc3);
    } // End of the function
    function SET_RETICLE_LOCKON_TYPE_EXTERNAL(lockOnType)
    {
        this.SET_RETICLE_LOCKON_TYPE([lockOnType]);
    } // End of the function
    function SET_RETICLE_LOCKON_TYPE(params)
    {
        var _loc2 = params[0];
        reticleMC.reticle._xscale = 100;
        reticleMC.reticle._yscale = 100;
        switch (_loc2)
        {
            case -1:
            case 0:
            {
                DEFAULT_COLOUR = [225, 225, 225, 100];
                this.STOP_FLASHING_RETICLE();
                reticleMC.reticle.gotoAndStop(1);
                com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, 255, 255, 255, 100);
                break;
            } 
            case 1:
            {
                DEFAULT_COLOUR = [225, 225, 225, 100];
                this.STOP_FLASHING_RETICLE();
                reticleMC.reticle.gotoAndStop(1);
                com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, 0, 204, 51, 100);
                break;
            } 
            case 2:
            {
                DEFAULT_COLOUR = [255, 153, 0, 100];
                this.START_FLASHING_RETICLE([204, 153, 0, 100]);
                com.rockstargames.ui.tweenStar.TweenStarLite.to(reticleMC.reticle, 0.500000, {_xscale: 115, _yscale: 115});
                reticleMC.reticle.gotoAndStop(1);
                break;
            } 
            case 3:
            {
                DEFAULT_COLOUR = [225, 225, 225, 100];
                this.STOP_FLASHING_RETICLE();
                com.rockstargames.ui.tweenStar.TweenStarLite.to(reticleMC.reticle, 0.500000, {_xscale: 115, _yscale: 115});
                reticleMC.reticle.gotoAndStop(2);
                com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, 204, 0, 0, 100);
                break;
            } 
            default:
            {
                DEFAULT_COLOUR = [225, 225, 225, 100];
                this.STOP_FLASHING_RETICLE();
                reticleMC.reticle.gotoAndStop(1);
                com.rockstargames.ui.utils.Colour.Colourise(reticleMC.reticle, 255, 255, 255, 100);
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_CAM_HEADING_EXTERNAL(a)
    {
        this.SET_CAM_HEADING([a]);
    } // End of the function
    function SET_CAM_HEADING(params)
    {
        if (hasCompass)
        {
            var _loc3 = params[0];
            var _loc6 = Math.max(0, Math.min(_loc3, 360));
            var _loc2 = reticleMC.Compass._width * 2;
            var _loc4 = -_loc6 / 360 * _loc2;
            var _loc5 = _loc4 % 28;
            reticleMC.Compass._x = 14 + _loc5;
        } // end if
    } // End of the function
    function SHOW_SNIPER_HIT_EXTERNAL()
    {
        this.SHOW_SNIPER_HIT();
    } // End of the function
    function SHOW_SNIPER_HIT()
    {
        reticleMC.hitmarkerMC.gotoAndPlay("hitmarker");
    } // End of the function
    function COORDS_TO_SCREEN(posX, posY, aspectRatioMultiplier)
    {
        posX = 0.500000 + (posX - 0.500000) * aspectRatioMultiplier;
        return (new flash.geom.Point(posX * screenWidth, posY * screenHeight));
    } // End of the function
    function REMOVE()
    {
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    var weaponID = 0;
    var screenWidth = 1280;
    var screenHeight = 720;
    var FLASH_DURATION = 0.500000;
    var hasAccuracyAnim = false;
    var hasReticleData = false;
    var hasCompass = false;
    var WEAPON_INVALID = 946056827;
    var WEAPON_UNARMED = -318101735;
    var WEAPONTYPE_SMG = 1358501004;
    var WEAPONTYPE_RIFLE = -1105352287;
    var WEAPONTYPE_SHOTGUN = 1234424921;
    var WEAPON_THROWN = 963175564;
    var WEAPON_PISTOL = 453432689;
    var WEAPON_PROGRAMMABLE_AR = -409475165;
    var WEAPON_HEAVY_RPG = 610367993;
    var WEAPON_HEAVY_GRENADE_LAUNCHER = -135852371;
    var WEAPON_TANK = -1073134675;
    var WEAPON_VULKAN_GUNS = -33414211;
    var SIMPLE_RETICLE = 90280964;
    var SNIPER_MAX = -740620376;
    var SNIPER_LARGE = -1013321135;
    var COCKPIT_VIEW = 1931187857;
    var VULKAN_ROCKET = -807018074;
    var VULKAN_ROCKET_COCKPIT_VIEW = -199376390;
    var ACCURACY_SCALAR_TO_PX = 2.500000;
} // End of Class
#endinitclip
