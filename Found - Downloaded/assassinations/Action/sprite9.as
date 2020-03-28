// Action script...

// [Initial MovieClip Action of sprite 9]
#initclip 2
class com.rockstargames.gtav.levelDesign.ASSASSINATIONS extends com.rockstargames.ui.core.BaseScriptUI
{
    var headingMC, CONTENT;
    function ASSASSINATIONS()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function SHOW_ASSASSINATIONS_TITLE(_fadeTime)
    {
        headingMC._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(headingMC, _fadeTime == undefined ? (fadeTime) : (_fadeTime), {_alpha: 100});
    } // End of the function
    function HIDE_ASSASSINATIONS_TITLE(_fadeTime)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(headingMC, _fadeTime == undefined ? (fadeTime) : (_fadeTime), {_alpha: 0, onCompleteScope: this, onComplete: HideRampageTitleComplete});
    } // End of the function
    function HideRampageTitleComplete()
    {
        if (headingMC != undefined)
        {
            headingMC.removeMovieClip();
        } // end if
    } // End of the function
    function SET_ASSASSINATIONS_TITLE()
    {
        var _loc5 = arguments[0];
        var _loc4 = arguments[1];
        var _loc6 = arguments[2];
        var _loc3 = arguments[3];
        this.HideRampageTitleComplete();
        headingMC = CONTENT.attachMovie("HEADER", "headerMC", CONTENT.getNextHighestDepth());
        headingMC.rampageTitleMC.labelTF.text = _loc5;
        com.rockstargames.ui.utils.Colour.Colourise(headingMC.rampageTitleMC, _loc4, _loc6, _loc3);
    } // End of the function
    var fadeTime = 1;
} // End of Class
#endinitclip
