// Action script...

// [Initial MovieClip Action of sprite 28]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_CASH_CHANGE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var TIMELINE, CONTENT, BOUNDING_BOX, defaultX, defaultY, FADE_DURATION, ON_SCREEN_DURATION, _enumID, _HUD;
    function HUD_CASH_CHANGE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        defaultX = TIMELINE._x;
        defaultY = TIMELINE._y;
        CONTENT._alpha = 0;
    } // End of the function
    function SET_PLAYER_CASH_CHANGE(params)
    {
        var _loc3 = params[0];
        var _loc4 = params[1];
        var _loc2;
        if (_loc4)
        {
            _loc2 = "+$";
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT, 102, 152, 104, 100);
        }
        else
        {
            _loc2 = "-$";
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT, 194, 80, 80, 100);
        } // end else if
        if (_loc3 <= 9999999999.000000)
        {
            CONTENT.cashTF.text = _loc2 + String(_loc3);
        } // end if
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
