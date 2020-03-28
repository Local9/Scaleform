// Action script...

// [Initial MovieClip Action of sprite 27]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_STREET_NAME extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var ON_SCREEN_DURATION, CONTENT, FADE_DURATION, _enumID, _HUD;
    function HUD_STREET_NAME()
    {
        super();
        ON_SCREEN_DURATION = 2500;
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        CONTENT._alpha = 0;
    } // End of the function
    function SET_STREET_NAME(newName)
    {
        var _loc2 = CONTENT.nameText;
        _loc2.text = newName;
        var _loc3 = _loc2.getTextFormat();
        _loc3.rightMargin = 2;
        _loc2.setTextFormat(_loc3);
        this.SHOW();
    } // End of the function
    function FORCE_SHOW(_forceShow)
    {
        forceShow = _forceShow == "true";
    } // End of the function
    function SHOW()
    {
        if (forceShow)
        {
            CONTENT._alpha = 100;
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100, onComplete: STAY_ON_SCREEN, onCompleteScope: this});
        } // end else if
    } // End of the function
    function STAY_ON_SCREEN()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, ON_SCREEN_DURATION / 1000, {onComplete: HIDE, onCompleteScope: this});
    } // End of the function
    function HIDE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 0, onComplete: REMOVE, onCompleteScope: this});
    } // End of the function
    function REMOVE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    var forceShow = false;
} // End of Class
#endinitclip
