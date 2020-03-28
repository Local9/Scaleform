// Action script...

// [Initial MovieClip Action of sprite 28]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_MP_MESSAGE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var CONTENT, messageMC, TIMELINE, defaultX, defaultY, FADE_DURATION, ON_SCREEN_DURATION, _enumID, _HUD;
    function HUD_MP_MESSAGE()
    {
        super();
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        messageMC = CONTENT.attachMovie("messageMC", "messageMC", CONTENT.getNextHighestDepth());
        defaultX = TIMELINE._x;
        defaultY = TIMELINE._y;
        CONTENT._alpha = 0;
    } // End of the function
    function SET_MP_MESSAGE(params)
    {
        var _loc3 = CONTENT.messageMC.messageTF;
        var _loc2 = String(params[0]);
        _loc3.htmlText = _loc2;
        this.SHOW();
    } // End of the function
    function SHOW()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100, onCompleteScope: this, onComplete: STAY_ON_SCREEN});
    } // End of the function
    function STAY_ON_SCREEN()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, ON_SCREEN_DURATION / 1000, {onComplete: HIDE, onCompleteScope: this});
    } // End of the function
    function HIDE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 0, onCompleteScope: this, onComplete: REMOVE});
    } // End of the function
    function REMOVE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
} // End of Class
#endinitclip
