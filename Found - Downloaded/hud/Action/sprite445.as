// Action script...

// [Initial MovieClip Action of sprite 445]
#initclip 33
class com.rockstargames.gtav.hud.hudComponents.HUD_SUBTITLE_TEXT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var ON_SCREEN_DURATION_ONE_FRAME, ON_SCREEN_DURATION_PER_WORD, TIMELINE, CONTENT, BOUNDING_BOX, subtitleTextField, blipLayer, ON_SCREEN_DURATION, ON_SCREEN_DURATION_TOTAL, _HUD, _enumID;
    function HUD_SUBTITLE_TEXT()
    {
        super();
        ON_SCREEN_DURATION_ONE_FRAME = 66;
        ON_SCREEN_DURATION_PER_WORD = 333;
    } // End of the function
    function INITIALISE(mc)
    {
        initCalled = true;
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
        subtitleTextField = CONTENT.subtitleText;
        subtitleTextField.wordWrap = true;
        subtitleTextField.autoSize = true;
        CONTENT._alpha = 0;
        this.clearBlipLayer();
    } // End of the function
    function clearBlipLayer()
    {
        if (blipLayer != undefined)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = CONTENT.createEmptyMovieClip("blipLayer", 1000);
    } // End of the function
    function SET_SUBTITLE_TEXT_CUTSCENE(params)
    {
        this.SET_SUBTITLE_TEXT_RAW([params[0], true]);
    } // End of the function
    function SET_SUBTITLE_TEXT_RAW(params)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION;
        var _loc5 = params[0];
        var _loc2 = 1280;
        var _loc3 = WIDTH_SCALE_HD;
        if (!_HUD.isWideScreen)
        {
            _loc3 = WIDTH_SCALE_STANDARD;
            _loc2 = 960;
        } // end if
        subtitleTextField._width = _loc3 * _loc2;
        if (params[1])
        {
            subtitleTextField._width = WIDTH_SCALE_CUTSCENE * _loc2;
        } // end if
        var _loc6 = new com.rockstargames.ui.utils.Text();
        var _loc4 = 20;
        if (_HUD.NEEDS_BIGGER_HELP_AND_SUBTITLES)
        {
            _loc4 = 25;
        } // end if
        _loc6.setTextWithIcons(_loc5, blipLayer, CONTENT.subtitleText, 0, _loc4, 3, true);
        subtitleTextField._y = 120 - subtitleTextField._height;
        subtitleTextField._x = -subtitleTextField._width / 2;
        blipLayer._x = subtitleTextField._x;
        blipLayer._y = subtitleTextField._y;
        CONTENT._alpha = 100;
    } // End of the function
    function CLEAR_SUBTITLE_TEXT()
    {
        CONTENT._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, 5, {onComplete: REMOVE, onCompleteScope: this});
    } // End of the function
    function CLEAR_SUBTITLE_TEXT_NOW()
    {
        CONTENT._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, 5, {onComplete: REMOVE, onCompleteScope: this});
    } // End of the function
    function REMOVE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    var initCalled = false;
    var NEEDS_BIGGER_HELP_AND_SUBTITLES = false;
    var WIDTH_SCALE_STANDARD = 0.415000;
    var WIDTH_SCALE_HD = 0.532813;
    var WIDTH_SCALE_CUTSCENE = 0.683594;
} // End of Class
#endinitclip
