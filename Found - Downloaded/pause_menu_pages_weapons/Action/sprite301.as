// Action script...

// [Initial MovieClip Action of sprite 301]
#initclip 10
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var weaponMC, attachments, isSelectable, wDisplayBM, initialIndex, attDisplayBM, lockedMC, type, __get__data, highlightMC, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function PauseMPMenuWeaponsItem()
    {
        super();
        weaponMC.gotoAndStop(1);
        attachments = ["suppressorMC", "flashlightMC", "scope02MC", "laserMC", "clip01MC", "clip02MC", "scope01MC", "gripMC"];
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        wDisplayBM = new com.rockstargames.ui.utils.BitMonger(isSelectable);
        attDisplayBM = new com.rockstargames.ui.utils.BitMonger(initialIndex);
        lockedMC._visible = false;
        if (wDisplayBM.__get__bitfield() == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BITMASK_DISPLAY_EMPTY)
        {
            weaponMC._visible = false;
            return;
        } // end if
        weaponMC.gotoAndStop("INT" + type);
        this.colourWeapon();
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        highlightMC._visible = _h;
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    function colourWeapon()
    {
        var _loc11;
        if (wDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_WEAPON_DISPLAY_PURCHASED))
        {
            _loc11 = new flash.geom.ColorTransform();
        }
        else
        {
            var _loc10 = wDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_WEAPON_DISPLAY_LOCKED);
            lockedMC._visible = _loc10;
            if (_loc10)
            {
                com.rockstargames.ui.utils.Colour.ApplyHudColour(lockedMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
            } // end if
            var _loc9 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(_loc10 ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PM_WEAPONS_LOCKED) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PM_WEAPONS_PURCHASABLE), _loc9);
            _loc11 = new flash.geom.ColorTransform(0, 0, 0, 1, _loc9.r, _loc9.g, _loc9.b, 0);
        } // end else if
        weaponMC.weaponMC.transform.colorTransform = _loc11;
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        for (var _loc2 = 0; _loc2 < com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.NUM_ATTACHMENTS; ++_loc2)
        {
            var _loc5 = attachments[_loc2];
            var _loc4 = weaponMC.attachmentMC[_loc5];
            if (!_loc4)
            {
                continue;
            } // end if
            var _loc7;
            var _loc6 = _loc2 * com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.NUM_DISPLAY_STATES;
            if (attDisplayBM.isBitSet(_loc6 + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_PURCHASED))
            {
                _loc7 = new flash.geom.ColorTransform();
                this.handleExclusiveAtt(_loc5);
            }
            else
            {
                var _loc8 = attDisplayBM.isBitSet(_loc6 + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_LOCKED);
                com.rockstargames.ui.utils.Colour.setHudColour(_loc8 ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PM_WEAPONS_LOCKED) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PM_WEAPONS_PURCHASABLE), _loc3);
                _loc7 = new flash.geom.ColorTransform(0, 0, 0, 1, _loc3.r, _loc3.g, _loc3.b, 0);
            } // end else if
            _loc4.transform.colorTransform = _loc7;
        } // end of for
    } // End of the function
    function handleExclusiveAtt(attName)
    {
        if (attName == "clip01MC" && attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.CLIP_02_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED))
        {
            weaponMC.attachmentMC.clip01MC._visible = false;
        }
        else if (attName == "clip02MC" && attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.CLIP_01_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED))
        {
            weaponMC.attachmentMC.clip02MC._visible = false;
        }
        else if (attName == "scope01MC" && attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.SCOPE_02_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED))
        {
            weaponMC.attachmentMC.scope01MC._visible = false;
        }
        else if (attName == "scope02MC" && attDisplayBM.isBitSet(com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.SCOPE_01_ATTACHMENT_DISPLAY + com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem.BIT_DISPLAY_EQUIPPED))
        {
            weaponMC.attachmentMC.scope02MC._visible = false;
        } // end else if
    } // End of the function
    static var SUPPRESSOR_ATTACHMENT_DISPLAY = 0;
    static var FLASHLIGHT_ATTACHMENT_DISPLAY = 4;
    static var SCOPE_02_ATTACHMENT_DISPLAY = 8;
    static var LASER_ATTACHMENT_DISPLAY = 12;
    static var CLIP_01_ATTACHMENT_DISPLAY = 16;
    static var CLIP_02_ATTACHMENT_DISPLAY = 20;
    static var SCOPE_01_ATTACHMENT_DISPLAY = 24;
    static var GRIP_ATTACHMENT_DISPLAY = 28;
    static var NUM_ATTACHMENTS = 8;
    static var NUM_DISPLAY_STATES = 3;
    static var BIT_DISPLAY_PURCHASED = 0;
    static var BIT_DISPLAY_LOCKED = 1;
    static var BIT_DISPLAY_EQUIPPED = 2;
    static var BITMASK_DISPLAY_EMPTY = 0;
    static var BIT_WEAPON_DISPLAY_PURCHASED = 0;
    static var BIT_WEAPON_DISPLAY_PURCHASABLE = 1;
    static var BIT_WEAPON_DISPLAY_LOCKED = 2;
    static var BIT_WEAPON_DISPLAY_EQUIPED = 3;
} // End of Class
#endinitclip
