// Action script...

// [Initial MovieClip Action of sprite 14]
#initclip 2
class com.rockstargames.gtav.levelDesign.STUNGUN_TUTORIAL extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, ProgressBarMC, maxChargeTime;
    function STUNGUN_TUTORIAL()
    {
        super();
    } // End of the function
    function STUNG_GUN_TUTORIAL()
    {
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        ProgressBarMC = CONTENT.ProgressBarMC;
        ProgressBarMC.animMC.gotoAndStop(102);
        maxChargeTime = 0;
    } // End of the function
    function SET_CHARGE_VALUE(chargeTime)
    {
        if (chargeTime > maxChargeTime)
        {
            maxChargeTime = chargeTime;
        } // end if
        var _loc4 = chargeTime / maxChargeTime * 100;
        var _loc2 = Math.max(0, Math.min(_loc4, 100));
        _loc2 = 100 - _loc2 + 2;
        ProgressBarMC.animMC.gotoAndStop(_loc2);
    } // End of the function
    function START_METER_FLASHING(blinkSpeed)
    {
        this.flashOff(ProgressBarMC, blinkSpeed);
    } // End of the function
    function STOP_METER_FLASHING()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(ProgressBarMC);
        ProgressBarMC._alpha = 100;
    } // End of the function
    function flashOn(mc, blinkSpeed)
    {
        mc._alpha = 100;
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc, blinkSpeed, {onCompleteScope: this, onComplete: flashOff, onCompleteArgs: [mc, blinkSpeed]});
    } // End of the function
    function flashOff(mc, blinkSpeed)
    {
        mc._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc, blinkSpeed, {onCompleteScope: this, onComplete: flashOn, onCompleteArgs: [mc, blinkSpeed]});
    } // End of the function
} // End of Class
#endinitclip
