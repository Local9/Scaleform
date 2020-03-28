// Action script...

// [Initial MovieClip Action of sprite 50]
#initclip 3
class com.rockstargames.gtav.levelDesign.PlayerSwitchChar extends MovieClip
{
    var mc, characterImageMC, stateMC, counterMC, damageMC, hintedMC;
    function PlayerSwitchChar()
    {
        super();
    } // End of the function
    function init(i)
    {
        characterImageMC = mc.imagesMC;
    } // End of the function
    function setSlot(params)
    {
        var _loc2 = params[0];
        var _loc5 = [com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRANKLIN, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_CHOP, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_CHOP, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_CHOP, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR];
        var _loc4 = _loc5[_loc2];
        if (charID != _loc2)
        {
            charID = _loc2;
            characterImageMC.gotoAndStop(charID + 1);
            stateMC = characterImageMC.stateMC;
            counterMC = stateMC.counterMC;
            damageMC = stateMC.damage;
            hintedMC = stateMC.hintedMC;
            hintedMC._alpha = hintedAlpha;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(stateMC.charColourBGMC, _loc4);
            stateMC.charColourBGMC._alpha = 40;
        } // end if
        stateMC.bgMC._visible = true;
        this.highlighted(bHighlighted);
        if (params[2])
        {
            stateMC.selectedMC._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(stateMC.selectedMC, _loc4);
        }
        else
        {
            stateMC.selectedMC._visible = false;
        } // end else if
        hintedMC._visible = false;
        if (params[3] != undefined)
        {
            this.hinted(params[3]);
        } // end if
    } // End of the function
    function showDamageIndicator(bVisible, bFlash)
    {
        bDamaged = bVisible;
        damageMC._visible = bVisible;
        hintedMC._visible = !bVisible;
        if (bVisible)
        {
            if (bFlash)
            {
                if (!bPlayingDamageAnim)
                {
                    bPlayingDamageAnim = true;
                    damageMC.gotoAndPlay("anim");
                } // end if
            }
            else
            {
                bPlayingDamageAnim = false;
                damageMC.gotoAndStop("anim");
            } // end else if
        }
        else
        {
            bPlayingDamageAnim = false;
            damageMC.gotoAndStop(1);
        } // end else if
    } // End of the function
    function hinted(h)
    {
        bHinted = h;
        hintedMC._visible = bHinted && !bDamaged;
        if (bHinted)
        {
            hintedMC.gotoAndPlay("anim");
        }
        else
        {
            hintedMC.gotoAndStop(1);
        } // end else if
        if (bHinted && bHighlighted)
        {
            hintedMC._alpha = 0;
            stateMC.bgMC._visible = true;
        } // end if
    } // End of the function
    function highlighted(h)
    {
        bHighlighted = h;
        stateMC.charColourBGMC._visible = h;
        stateMC.bgMC._alpha = bHighlighted ? (50) : (15);
        if (bHinted && bHighlighted)
        {
            hintedMC._alpha = 0;
            stateMC.bgMC._visible = true;
        } // end if
        if (bHinted && !bHighlighted)
        {
            hintedMC._alpha = hintedAlpha;
            hintedMC._visible = true;
            stateMC.bgMC._visible = false;
        } // end if
    } // End of the function
    var charID = -1;
    var bHighlighted = false;
    var bHinted = false;
    var bDamaged = false;
    var bPlayingDamageAnim = false;
    var hintedAlpha = 60;
} // End of Class
#endinitclip
