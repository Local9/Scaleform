// Action script...

// [Initial MovieClip Action of sprite 442]
#initclip 30
class com.rockstargames.gtav.hud.hudComponents.WeaponAmmoCounter extends MovieClip
{
    var ammoTF, clipTF, ammoCenterTF, ammoStrokeTF, clipStrokeTF, ammoCenterStrokeTF;
    function WeaponAmmoCounter()
    {
        super();
    } // End of the function
    function SET_AMMO_COUNT(params)
    {
        var _loc4 = params[3];
        switch (_loc4)
        {
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_STUNGUN:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_UNARMED:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_WRENCH:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_SHOVEL:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_NIGHTSTICK:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_LASSO:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_KNIFE:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HAMMER:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_CROWBAR:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_BAT:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_GOLFCLUB:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_FIRE_EXTINGUISHER:
            case com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_JERRY_CAN:
            {
                ammoTF.text = "";
                clipTF.text = "";
                ammoCenterTF.text = "";
                break;
            } 
            default:
            {
                var _loc2 = String(params[0]);
                var _loc3 = String(params[1]);
                var _loc6 = params[2];
                if (_loc6 <= 1)
                {
                    clipTF.text = "";
                }
                else
                {
                    clipTF.text = "/ " + _loc3;
                } // end else if
                if (_loc2 == "-1")
                {
                    if (_loc3 == "-1")
                    {
                        clipTF.text = "";
                    } // end if
                    _loc2 = "";
                } // end if
                if (_loc2 == "-2")
                {
                    _loc2 = "<";
                    if (_loc3 == "-1")
                    {
                        clipTF.text = "";
                    } // end if
                } // end if
                if (_loc4 == com.rockstargames.gtav.constants.WeaponsLUT.WEAPON_HEAVY_MINIGUN)
                {
                    clipTF.text = "";
                } // end if
                this.adjustAmmo(clipTF.text == "", _loc2);
                break;
            } 
        } // End of switch
        ammoStrokeTF.text = ammoTF.text;
        clipStrokeTF.text = clipTF.text;
        ammoCenterStrokeTF.text = ammoCenterTF.text;
    } // End of the function
    function adjustAmmo(isCentered, ammoStr)
    {
        ammoTF.text = isCentered ? ("") : (ammoStr);
        ammoCenterTF.text = isCentered ? (ammoStr) : ("");
    } // End of the function
} // End of Class
#endinitclip
