// Action script...

// [Initial MovieClip Action of sprite 444]
#initclip 32
class com.rockstargames.gtav.hud.hudComponents.HUD_WANTED_STARS extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var TIMELINE, CONTENT, BOUNDING_BOX, defaultX, defaultY, flashStarsForever, flashWholeMovie, _enumID, _HUD;
    function HUD_WANTED_STARS()
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
        CONTENT.stars._alpha = 0;
        flashStarsForever = false;
        flashWholeMovie = false;
    } // End of the function
    function SET_PLAYER_WANTED_LEVEL(params)
    {
        var _loc3 = params[0];
        for (var _loc2 = 1; _loc2 < 6; ++_loc2)
        {
            if (_loc2 <= _loc3)
            {
                CONTENT.stars["star" + _loc2]._visible = true;
                continue;
            } // end if
            CONTENT.stars["star" + _loc2]._visible = false;
        } // end of for
        flashCycleCount = 4;
        CONTENT.stars._alpha = 100;
    } // End of the function
    function STOP_FLASHING_WANTED_STARS()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.stars);
        flashCycleCount = 0;
        flashStarsForever = false;
        flashWholeMovie = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.stars, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE);
    } // End of the function
    function FLASH_WANTED_STARS(params)
    {
        flashCycleCount = 0;
        flashStarsForever = params[0];
        wantedEvasionTime = (params[1] != undefined ? (params[1]) : (50000)) / 1000;
        flashWholeMovie = params[2] != undefined ? (params[2]) : (false);
        timeSpentFlashing = 0;
        this.STAY_OFF_SCREEN();
    } // End of the function
    function GetAndAdjustBlinkRate()
    {
        if (!flashStarsForever)
        {
            return (0.500000);
        } // end if
        var _loc3 = 0.200000;
        var _loc4 = 1.500000;
        var _loc6 = timeSpentFlashing / wantedEvasionTime;
        var _loc5 = com.rockstargames.ui.tweenStar.easing.Quad.easeIn;
        var _loc2 = _loc5(_loc6, _loc3, _loc4 - _loc3, 1);
        _loc2 = Math.max(Math.min(_loc4, _loc2), _loc3);
        timeSpentFlashing = timeSpentFlashing + _loc2;
        return (_loc2);
    } // End of the function
    function STAY_ON_SCREEN()
    {
        ++flashCycleCount;
        CONTENT._visible = true;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.stars, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE);
        if (flashStarsForever && !flashWholeMovie)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.stars, this.GetAndAdjustBlinkRate(), {onComplete: STAY_OFF_SCREEN, onCompleteScope: this});
        }
        else if (flashCycleCount < 6 || flashWholeMovie)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.stars, 0.500000, {onComplete: STAY_OFF_SCREEN, onCompleteScope: this});
        } // end else if
    } // End of the function
    function STAY_OFF_SCREEN()
    {
        ++flashCycleCount;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.stars, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MID_GREY_MP);
        CONTENT._visible = !flashWholeMovie;
        if (flashStarsForever && !flashWholeMovie)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.stars, this.GetAndAdjustBlinkRate(), {onComplete: STAY_ON_SCREEN, onCompleteScope: this});
        }
        else if (flashCycleCount < 6 || flashWholeMovie)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.stars, 0.500000, {onComplete: STAY_ON_SCREEN, onCompleteScope: this});
        } // end else if
    } // End of the function
    function REMOVE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.stars);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    var flashCycleCount = 0;
    var wantedEvasionTime = 0;
    var timeSpentFlashing = 0;
} // End of Class
#endinitclip
