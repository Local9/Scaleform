// Action script...

// [Initial MovieClip Action of sprite 443]
#initclip 31
class com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_ICON extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var IS_AIMING, ON_SCREEN_DURATION, TIMELINE, CONTENT, BOUNDING_BOX, hudColourRed, hudColourWhite, WEAPON_ICONS, ammoText, clipCountText, ammoStrokeTF, clipCountStrokeTF, defaultX, defaultY, FADE_DURATION, weaponId, marginForBlur, _enumID, _HUD;
    function HUD_WEAPON_ICON()
    {
        super();
        IS_AIMING = false;
        ON_SCREEN_DURATION = 5000;
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
        hudColourRed = new com.rockstargames.ui.utils.HudColour();
        hudColourRed.r = 194;
        hudColourRed.g = 80;
        hudColourRed.b = 80;
        hudColourWhite = new com.rockstargames.ui.utils.HudColour();
        hudColourWhite.r = 225;
        hudColourWhite.g = 225;
        hudColourWhite.b = 225;
    } // End of the function
    function getTopCompOffset()
    {
        return (-2);
    } // End of the function
    function getBottomCompOffset()
    {
        return (-4);
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        this.setAsActive();
        WEAPON_ICONS = CONTENT;
        ammoText = WEAPON_ICONS.ammo;
        clipCountText = WEAPON_ICONS.clipCounter;
        ammoStrokeTF = WEAPON_ICONS.ammoStroke;
        clipCountStrokeTF = WEAPON_ICONS.clipCounterStroke;
        ammoStrokeTF.outline = clipCountStrokeTF.outline = 15;
        CONTENT._alpha = 0;
        defaultX = TIMELINE._x;
        defaultY = TIMELINE._y;
        WEAPON_ICONS.ProgressBarMC._visible = false;
    } // End of the function
    function SET_WEAPONS_AND_AMMO_FOREVER(params)
    {
        this.setAsActive();
        IS_AIMING = Boolean(params[0]);
        if (!IS_AIMING)
        {
            this.STAY_ON_SCREEN();
        } // end if
    } // End of the function
    function fadeInAndDoNothing()
    {
        if (!isFadingIn)
        {
            isFadingIn = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100});
        } // end if
    } // End of the function
    function SHOW_GRENADE_DROP(params)
    {
    } // End of the function
    function SET_WEAPON_TIMER(params)
    {
        this.setAsActive();
        var _loc3 = params[0];
        var _loc2 = 1 + Math.max(0, Math.min(_loc3, 100));
        switch (weaponId)
        {
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STUNGUN:
            {
                _loc2 = Math.round(101 - _loc2);
                this.setTextFields(String(_loc2), "", "");
                break;
            } 
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_THROWN_GRENADE:
            {
                _loc2 = 101 - _loc2;
                if (_loc2 == 100)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 98 && _loc2 <= 99)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 92 && _loc2 <= 94)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 85 && _loc2 <= 88)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 77 && _loc2 <= 80)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 67 && _loc2 <= 71)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 56 && _loc2 <= 61)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 43 && _loc2 <= 49)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 27 && _loc2 <= 35)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else if (_loc2 >= 8 && _loc2 <= 18)
                {
                    this.setAmmoStateForGrenade(true);
                }
                else
                {
                    this.setAmmoStateForGrenade(false);
                } // end else if
                break;
            } 
        } // End of switch
    } // End of the function
    function setAmmoStateForGrenade(isStandard)
    {
        if (isStandard)
        {
            com.rockstargames.ui.utils.Colour.Colourise(WEAPON_ICONS, hudColourWhite.r, hudColourWhite.g, hudColourWhite.b);
            IS_RED = false;
        }
        else if (!IS_RED)
        {
            com.rockstargames.ui.utils.Colour.Colourise(WEAPON_ICONS, hudColourRed.r, hudColourRed.g, hudColourRed.b);
            IS_RED = true;
        } // end else if
    } // End of the function
    function SET_AMMO_COUNT(params)
    {
        this.setAsActive();
        WEAPON_ICONS.ProgressBarMC._visible = false;
        switch (weaponId)
        {
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STUNGUN:
            {
                this.SET_WEAPON_TIMER([0]);
            } 
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_UNARMED:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_OBJECT:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_WRENCH:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_SHOVEL:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_NIGHTSTICK:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_LASSO:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_KNIFE:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HAMMER:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_CROWBAR:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BAT:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_GOLFCLUB:
            {
                ammoText.text = ammoStrokeTF.text = "";
                clipCountText.text = clipCountStrokeTF.text = "";
                break;
            } 
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_FIRE_EXTINGUISHER:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_JERRY_CAN:
            {
                WEAPON_ICONS.ProgressBarMC._visible = false;
                var _loc4 = params[1] / params[2] * 100;
                var _loc3 = Math.floor(Math.max(0, Math.min(_loc4, 100)));
                this.setTextFields(String(_loc3), "", "");
                break;
            } 
            default:
            {
                this.setTextFields(String(params[0]), String(params[1]), params[2]);
                break;
            } 
        } // End of switch
        if (isWeaponWheelActive == false)
        {
            this.SHOW();
        } // end if
    } // End of the function
    function setTextFields(ammoCount, clipCount, clipSize)
    {
        if (clipSize <= 1)
        {
            clipCountText.text = "";
        }
        else
        {
            clipCountText.text = clipCount;
        } // end else if
        ammoText.text = ammoCount;
        if (clipCount != undefined)
        {
            marginForBlur = 4;
        }
        else
        {
            marginForBlur = 0;
        } // end else if
        if (ammoCount == "-1")
        {
            if (clipCount == "-1")
            {
                clipCountText.text = "";
            } // end if
            ammoText.text = "";
        } // end if
        if (ammoCount == "-2")
        {
            ammoText.text = "";
            if (clipCount == "-1")
            {
                clipCountText.text = "";
            } // end if
        } // end if
        if (weaponId == com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HEAVY_MINIGUN)
        {
            clipCountText.text = "";
        } // end if
        if (isWeaponWheelActive)
        {
            clipCountText.autoSize = "left";
            clipCountText.multiline = false;
            clipCountText.wordWrap = false;
            clipCountText._x = -clipCountText._width - marginForBlur * 0.500000;
            ammoText.autoSize = "left";
            ammoText.multiline = false;
            ammoText.wordWrap = false;
            ammoText._x = marginForBlur * 0.500000;
        }
        else
        {
            var _loc4 = BOUNDING_BOX._width;
            clipCountText._x = _loc4 - clipCountText.textWidth - marginForBlur;
            ammoText._x = clipCountText._x - ammoText._width;
        } // end else if
        ammoStrokeTF._x = ammoText._x;
        ammoStrokeTF.text = ammoText.text;
        clipCountStrokeTF._x = clipCountText._x;
        clipCountStrokeTF.text = clipCountText.text;
    } // End of the function
    function SET_PLAYER_WEAPON(params)
    {
        this.setAsActive();
        weaponId = params[0];
        var _loc2 = params[1];
        if (_loc2 == com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_ICON.ONSCREEN)
        {
            CONTENT._alpha = 100;
            this.STAY_ON_SCREEN();
        }
        else
        {
            this.SHOW();
        } // end else if
        this.setAmmoStateForGrenade(true);
    } // End of the function
    function SHOW()
    {
        this.setAsActive();
        if (!isAnimating)
        {
            isAnimating = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100, onCompleteScope: this, onComplete: STAY_ON_SCREEN});
        } // end if
    } // End of the function
    function STAY_ON_SCREEN()
    {
        this.setAsActive();
        if (IS_AIMING == false)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, ON_SCREEN_DURATION / 1000, {_alpha: 100, onCompleteScope: this, onComplete: HIDE});
        } // end if
        isAnimating = false;
    } // End of the function
    function HIDE()
    {
        this.setAsActive();
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 0, onCompleteScope: this, onComplete: REMOVE});
    } // End of the function
    function REMOVE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(WEAPON_ICONS);
        ACTIVE_STATE = false;
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    function setAsActive()
    {
        if (!ACTIVE_STATE)
        {
            ACTIVE_STATE = true;
            com.rockstargames.ui.game.GameInterface.call("SET_ACTIVE_STATE", com.rockstargames.ui.game.GameInterface.HUD_TYPE, _enumID, ACTIVE_STATE);
        } // end if
    } // End of the function
    var isAnimating = false;
    var isFadingIn = false;
    var isWeaponWheelActive = false;
    var IS_RED = false;
    var ACTIVE_STATE = false;
    static var ONSCREEN = 7;
} // End of Class
#endinitclip
