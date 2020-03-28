// Action script...

// [Initial MovieClip Action of sprite 13]
#initclip 2
class com.rockstargames.gtav.store.STORE_BACKGROUND extends com.rockstargames.ui.core.BaseScriptUI
{
    var TIMELINE, CONTENT, BOUNDING_BOX;
    function STORE_BACKGROUND()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth(), {_visible: false});
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth(), {_visible: false});
        this.fadeInBackground();
    } // End of the function
    function fadeInBackground()
    {
        CONTENT._alpha = 0;
        CONTENT.stripsUp._alpha = 0;
        CONTENT.stripsDown._alpha = 0;
        CONTENT._visible = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, fadeInTime, {_alpha: 100, delay: 0.500000, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteScope: this, onCompleteArgs: [CONTENT]});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.stripsUp, fadeInTime + 0.125000, {_alpha: 100, delay: 0.500000, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteScope: this, onCompleteArgs: [CONTENT.stripsUp]});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.stripsDown, fadeInTime + 0.125000, {_alpha: 100, delay: 0.500000, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteScope: this, onCompleteArgs: [CONTENT.stripsDown]});
    } // End of the function
    function ANIMATE_BACKGROUND(_speed)
    {
        if (_speed == undefined)
        {
            _speed = 240;
        } // end if
        this.scrollUp(CONTENT.stripsUp, _speed);
        this.scrollDown(CONTENT.stripsDown, _speed);
    } // End of the function
    function scrollUp(mc, _speed)
    {
        if (typeof(mc) == "movieclip")
        {
            if (mc != undefined)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
                mc._y = 0;
                com.rockstargames.ui.tweenStar.TweenStarLite.to(mc, _speed, {_y: -512, onCompleteScope: this, onComplete: scrollUp, onCompleteArgs: [mc, _speed]});
            } // end if
        } // end if
    } // End of the function
    function scrollDown(mc, _speed)
    {
        if (typeof(mc) == "movieclip")
        {
            if (mc != undefined)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
                mc._y = -768;
                com.rockstargames.ui.tweenStar.TweenStarLite.to(mc, _speed, {_y: -256, onCompleteScope: this, onComplete: scrollDown, onCompleteArgs: [mc, _speed]});
            } // end if
        } // end if
    } // End of the function
    var fadeInTime = 1;
} // End of Class
#endinitclip
