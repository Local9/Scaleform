// Action script...

// [Initial MovieClip Action of sprite 28]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_MP_CASH extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var isFadingOut, isFadingIn, TIMELINE, CONTENT, BOUNDING_BOX, defaultX, defaultY, stayOnForever, FADE_DURATION, ON_SCREEN_DURATION, _enumID, _HUD;
    function HUD_MP_CASH()
    {
        super();
        isFadingOut = false;
        isFadingIn = false;
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
    function SET_PLAYER_MP_CASH(params)
    {
        var _loc2 = params[0];
        stayOnForever = params[1];
        if (_loc2 <= 9999999999.000000)
        {
            CONTENT.cashTF.text = "$" + String(_loc2);
        } // end if
        this.SHOW();
    } // End of the function
    function SHOW()
    {
        if (!isFadingIn)
        {
            isFadingIn = true;
            if (stayOnForever)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100});
            }
            else
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100, onCompleteScope: this, onComplete: STAY_ON_SCREEN});
            } // end if
        } // end else if
    } // End of the function
    function STAY_ON_SCREEN()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, ON_SCREEN_DURATION / 1000, {onComplete: HIDE, onCompleteScope: this});
    } // End of the function
    function REMOVE_PLAYER_MP_CASH()
    {
        this.HIDE();
    } // End of the function
    function HIDE()
    {
        if (!isFadingOut)
        {
            isFadingOut = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 0, onCompleteScope: this, onComplete: REMOVE});
        } // end if
    } // End of the function
    function REMOVE()
    {
        isFadingOut = false;
        isFadingIn = false;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
} // End of Class
#endinitclip
