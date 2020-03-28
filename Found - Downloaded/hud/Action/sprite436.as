// Action script...

// [Initial MovieClip Action of sprite 436]
#initclip 24
class com.rockstargames.gtav.hud.hudComponents.HUD_WEAPON_WHEEL_STATS extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var TIMELINE, CONTENT, BOUNDING_BOX, _HUD;
    function HUD_WEAPON_WHEEL_STATS()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
        CONTENT._visible = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
    } // End of the function
    function dbg(str)
    {
    } // End of the function
    function UNLOAD_WEAPON_WHEEL_STATS()
    {
        CONTENT._visible = false;
        this.REMOVE();
    } // End of the function
    function SHOW_ALL()
    {
        CONTENT._visible = true;
    } // End of the function
    function REMOVE()
    {
        _HUD.REMOVE_HUD_ITEM(com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_WHEEL_STATS);
    } // End of the function
    function DoBar(bar, base, attachment)
    {
        if (attachment >= 0)
        {
            var _loc5 = base / 100 * bar.bg._width;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.percentage, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.attPercentage, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.bg, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
            bar.bg._alpha = 50;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.percentage, STAT_TWEEN_DURATION, {_xscale: base, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
            com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.attPercentage, STAT_TWEEN_DURATION, {_x: _loc5, _xscale: attachment, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        }
        else
        {
            _loc5 = (base + attachment) / 100 * bar.bg._width;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.percentage, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.attPercentage, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(bar.bg, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY);
            bar.bg._alpha = 50;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.percentage, STAT_TWEEN_DURATION, {_xscale: base + attachment, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
            com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.attPercentage, STAT_TWEEN_DURATION, {_x: _loc5, _xscale: attachment * -1, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        } // end else if
    } // End of the function
    function SET_STATS_LABELS_AND_VALUES(params)
    {
        CONTENT._visible = true;
        CONTENT.stat1.text = params[0];
        CONTENT.stat2.text = params[1];
        CONTENT.stat3.text = params[2];
        CONTENT.stat4.text = params[3];
        this.DoBar(CONTENT.statBar1, params[4], params[8]);
        this.DoBar(CONTENT.statBar2, params[5], params[9]);
        this.DoBar(CONTENT.statBar3, params[6], params[10]);
        this.DoBar(CONTENT.statBar4, params[7], params[11]);
    } // End of the function
    function CLEAR_STATS_LABELS_AND_VALUES()
    {
        CONTENT.stat1.text = "";
        CONTENT.stat2.text = "";
        CONTENT.stat3.text = "";
        CONTENT.stat4.text = "";
    } // End of the function
    function SET_STATS_VISIBILITY(params)
    {
        CONTENT._visible = params[0];
    } // End of the function
    var STAT_TWEEN_DURATION = 0.175000;
} // End of Class
#endinitclip
