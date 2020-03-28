// Action script...

// [Initial MovieClip Action of sprite 10]
#initclip 2
class com.rockstargames.gtav.levelDesign.COUNTDOWN extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, messageMC, messageAlphaMC, messageText, messageTextOutline, startPosition;
    function COUNTDOWN()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        messageMC = CONTENT.messageMC;
        messageAlphaMC = messageMC.messageAlphaMC;
        messageText = messageAlphaMC.messageText;
        messageTextOutline = messageAlphaMC.messageTextOutline;
        messageTextOutline.outline = BIG_TEXT_OUTLINE_STRENGTH;
        startPosition = new flash.geom.Point(messageMC._x, messageMC._y);
    } // End of the function
    function SET_MESSAGE(newString, r, g, b)
    {
        com.rockstargames.ui.utils.Colour.Colourise(messageMC, r, g, b, 100);
        messageText.text = messageTextOutline.text = newString;
        this.FADE();
    } // End of the function
    function FADE()
    {
        messageMC._x = startPosition.x;
        messageMC._y = startPosition.y;
        messageMC._xscale = messageMC._yscale = 100;
        messageAlphaMC._alpha = 100;
        messageText._alpha = messageTextOutline._alpha = 100;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(messageMC, 0.300000, {_xscale: 66, _yscale: 66, delay: 0.400000, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(messageText, 0.060000, {_alpha: 0, delay: 0.600000, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(messageTextOutline, 0.050000, {_alpha: 0, delay: 0.600000, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
    } // End of the function
    function OVERRIDE_FADE_DURATION(newFadeDuration)
    {
        defaultFadeDuration = newFadeDuration;
    } // End of the function
    function IS_COUNTDOWN_VISIBLE()
    {
        return (messageText._alpha > 0);
    } // End of the function
    var defaultFadeDuration = 500;
    var BIG_TEXT_OUTLINE_STRENGTH = 9;
    var count = 0;
} // End of Class
#endinitclip
