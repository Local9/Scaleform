// Action script...

// [Initial MovieClip Action of sprite 73]
#initclip 2
class com.rockstargames.gtav.levelDesign.ALIEN_RUNES_OVERLAY extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, fade;
    function ALIEN_RUNES_OVERLAY()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        fade = CONTENT.fadeOut;
    } // End of the function
    function FADE_FOR_DURATION(duration, isFadeToBlack)
    {
        if (isFadeToBlack)
        {
            fade._alpha = 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(fade, duration, {_alpha: 100});
        }
        else
        {
            fade._alpha = 100;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(fade, duration, {_alpha: 0});
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
