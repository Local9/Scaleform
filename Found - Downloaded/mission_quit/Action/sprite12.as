// Action script...

// [Initial MovieClip Action of sprite 12]
#initclip 2
class com.rockstargames.gtav.levelDesign.MISSION_QUIT extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT;
    function MISSION_QUIT()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function SET_TEXT(title, copy)
    {
        CONTENT.txt_title.text = title;
        CONTENT.txt_copy.htmlText = copy;
    } // End of the function
    function TRANSITION_IN(duration)
    {
        CONTENT._visible = true;
        if (duration == undefined || duration == 0)
        {
            CONTENT._alpha = 100;
            return;
        } // end if
        duration = duration / 1000;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, duration, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
    } // End of the function
    function TRANSITION_OUT(duration)
    {
        if (duration == undefined || duration == 0)
        {
            CONTENT._alpha = 0;
            this._handleTransitionOutComplete();
            return;
        } // end if
        duration = duration / 1000;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, duration, {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN, onComplete: _handleTransitionOutComplete, onCompleteScope: this});
    } // End of the function
    function _handleTransitionOutComplete()
    {
        CONTENT._visible = false;
    } // End of the function
} // End of Class
#endinitclip
