// Action script...

// [Initial MovieClip Action of sprite 15]
#initclip 2
class com.rockstargames.gtav.levelDesign.ECG_MONITOR extends com.rockstargames.ui.core.BaseScriptUI
{
    var CONTENT, heartRateTF;
    function ECG_MONITOR()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        heartRateTF = CONTENT.displayMC.heartRateTF;
    } // End of the function
    function removeBeat(args)
    {
        args.mc.removeMovieClip();
    } // End of the function
    function SET_HEART_RATE(rate)
    {
        heartRateTF.text = String(rate + " BPM");
    } // End of the function
    function SET_HEART_BEAT(speed)
    {
        var _loc2 = 2;
        if (speed != undefined)
        {
            _loc2 = speed;
        } // end if
        heartBeatsIndex > 100 ? (heartBeatsIndex = 0) : (heartBeatsIndex++);
        var _loc3 = CONTENT.displayMC.attachMovie("heartBeat", "heartBeatMC" + heartBeatsIndex, heartBeatsIndex, {_x: 1285, _y: CONTENT.displayMC.lineMC._y});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3, _loc2, {_x: -85, onComplete: removeBeat, onCompleteScope: this, onCompleteArgs: {mc: _loc3}});
    } // End of the function
    function SET_HEALTH(amount)
    {
        CONTENT.displayMC.healthBarMC._xScale = Math.max(Math.min(100, amount), 0);
    } // End of the function
    function SET_ECG_HEALTH(amount)
    {
        CONTENT.displayMC.healthBarMC._xScale = Math.max(Math.min(100, amount), 0);
    } // End of the function
    function SET_COLOUR(r, g, b)
    {
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.displayMC, r, g, b);
    } // End of the function
    var heartBeatsList = new Array();
    var heartBeatsIndex = 0;
} // End of Class
#endinitclip
