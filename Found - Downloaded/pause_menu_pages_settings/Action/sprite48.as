// Action script...

// [Initial MovieClip Action of sprite 48]
#initclip 7
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar extends MovieClip
{
    var mc;
    function PauseMenuColourBar(_mc)
    {
        super();
        if (_mc == undefined)
        {
            mc = this;
        }
        else
        {
            mc = _mc;
        } // end else if
    } // End of the function
    function init(hudColourEnum, width, height)
    {
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(hudColourEnum, _loc2);
        this.initCustom(_loc2, width, height);
    } // End of the function
    function initCustom(hudColour, width, height)
    {
        com.rockstargames.ui.utils.Colour.Colourise(mc.barfillMC, hudColour.r, hudColour.g, hudColour.b, hudColour.a);
        com.rockstargames.ui.utils.Colour.Colourise(mc.baralphaMC, hudColour.r, hudColour.g, hudColour.b, 30);
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(mc.blackMC, _loc3.r, _loc3.g, _loc3.b, 50);
        if (width != undefined)
        {
            w = width;
            mc.barfillMC._width = mc.baralphaMC._width = mc.blackMC._width = w;
        } // end if
        if (height != undefined)
        {
            mc.barfillMC._height = mc.baralphaMC._height = mc.blackMC._height = height;
        } // end if
    } // End of the function
    function setBarAlpha(fillA, unfilledA)
    {
        mc.barfillMC._alpha = fillA;
        mc.baralphaMC._alpha = unfilledA;
    } // End of the function
    function setFillX(x)
    {
        mc.barfillMC._x = x;
    } // End of the function
    function percent(p, tween)
    {
        this.setPercentageBar(p, tween, 0, 100);
    } // End of the function
    function percentDecimal(pDec, tween)
    {
        this.setPercentageBar(pDec, tween, 0, 1);
    } // End of the function
    function setPercentageBar(pVal, tween, min, max)
    {
        var _loc3 = Math.max(min, Math.min(pVal, max));
        var _loc2 = Math.round(w * (_loc3 / max));
        if (tween)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(mc.barfillMC, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar.DEFAULT_TWEEN_DURATION, {_width: _loc2, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        }
        else
        {
            mc.barfillMC._width = _loc2;
        } // end else if
    } // End of the function
    static var DEFAULT_TWEEN_DURATION = 0.175000;
    var w = 125;
} // End of Class
#endinitclip
