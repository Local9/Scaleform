// Action script...

// [Initial MovieClip Action of sprite 5]
#initclip 1
class com.rockstargames.gtav.store.STORE_BLACKOUT extends MovieClip
{
    var TIMELINE, CONTENT, BOUNDING_BOX;
    function STORE_BLACKOUT()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        CONTENT._alpha = 0;
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
    } // End of the function
    function FADE_TO_BLACK(_speed)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, _speed / 1000, {_alpha: 100, onComplete: CALL_FADETOBLACK_COMPLETED, onCompleteScope: this});
    } // End of the function
    function CALL_FADETOBLACK_COMPLETED()
    {
        com.rockstargames.ui.game.GameInterface.call("FADE_TO_BLACK_COMPLETED", com.rockstargames.ui.game.GameInterface.STORE);
    } // End of the function
    function FADE_TO_TRANSPARENT(_speed)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, _speed / 1000, {_alpha: 0, onComplete: CALL_FADETOTRANSPARENT_COMPLETED, onCompleteScope: this});
    } // End of the function
    function CALL_FADETOTRANSPARENT_COMPLETED()
    {
        com.rockstargames.ui.game.GameInterface.call("FADE_TO_TRANSPARENT_COMPLETED", com.rockstargames.ui.game.GameInterface.STORE);
    } // End of the function
} // End of Class
#endinitclip
