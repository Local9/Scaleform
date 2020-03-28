// Action script...

// [Initial MovieClip Action of sprite 28]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_CASH extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var fadeState, isFadingOut, isFadingIn, TIMELINE, CONTENT, BOUNDING_BOX, defaultX, defaultY, bSettingSPCash, stayOnForever, FADE_DURATION, ON_SCREEN_DURATION, _enumID, _HUD;
    function HUD_CASH()
    {
        super();
        fadeState = 0;
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
    function SET_PLAYER_CASH(params)
    {
        bSettingSPCash = true;
        var _loc2 = params[0];
        if (_loc2 <= 9999999999.000000)
        {
            CONTENT.cashTF.text = "$" + String(_loc2);
        } // end if
        this.SHOW(params[1]);
    } // End of the function
    function SET_PLAYER_MP_CASH(params)
    {
        bSettingSPCash = false;
        var _loc2 = params[0];
        stayOnForever = params[1];
        if (_loc2 <= 9999999999.000000)
        {
            CONTENT.cashTF.text = "$" + String(_loc2);
        } // end if
        this.SHOW();
    } // End of the function
    function REMOVE_PLAYER_MP_CASH()
    {
        this.HIDE();
    } // End of the function
    function SHOW(bSkipFade)
    {
        if (bSettingSPCash)
        {
            if (fadeState != 1)
            {
                if (bSkipFade)
                {
                    com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100});
                }
                else
                {
                    com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100, onCompleteScope: this, onComplete: STAY_ON_SCREEN});
                } // end else if
                fadeState = 1;
            } // end if
        }
        else if (!isFadingIn)
        {
            isFadingIn = true;
            if (stayOnForever)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100});
            }
            else
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 100, onCompleteScope: this, onComplete: STAY_ON_SCREEN});
            } // end else if
        } // end else if
    } // End of the function
    function STAY_ON_SCREEN()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, ON_SCREEN_DURATION / 1000, {onComplete: HIDE, onCompleteScope: this});
    } // End of the function
    function HIDE()
    {
        if (bSettingSPCash)
        {
            if (fadeState != -1)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 0, onCompleteScope: this, onComplete: REMOVE});
                fadeState = -1;
            } // end if
        }
        else if (!isFadingOut)
        {
            isFadingOut = true;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 0, onCompleteScope: this, onComplete: REMOVE});
        } // end else if
    } // End of the function
    function REMOVE()
    {
        fadeState = 0;
        isFadingOut = false;
        isFadingIn = false;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    function getTopCompOffset()
    {
        return (-3);
    } // End of the function
    function getBottomCompOffset()
    {
        return (-7);
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
} // End of Class
#endinitclip
