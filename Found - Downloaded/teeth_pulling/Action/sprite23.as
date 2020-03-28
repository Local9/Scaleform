// Action script...

// [Initial MovieClip Action of sprite 23]
#initclip 2
class com.rockstargames.gtav.levelDesign.TEETH_PULLING extends com.rockstargames.ui.core.BaseScriptUI
{
    var CONTENT, toothMC;
    function TEETH_PULLING()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        toothMC = CONTENT.teethMC.toothMC;
    } // End of the function
    function update()
    {
        if (Key.isDown(38))
        {
            depth = depth + 10;
            this.SET_TEETH_BRITTLE(depth);
        } // end if
        if (Key.isDown(40))
        {
            depth = depth - 10;
            this.SET_TEETH_BRITTLE(depth);
        } // end if
        if (Key.isDown(37))
        {
            angle = angle - 1;
            this.SET_TEETH_ANGLE(angle);
        } // end if
        if (Key.isDown(39))
        {
            angle = angle + 1;
            this.SET_TEETH_ANGLE(angle);
        } // end if
    } // End of the function
    function tortureSuccess()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(toothMC, 0.200000, {_rotation: 0});
        angle = 30;
    } // End of the function
    function tortureFail()
    {
        if (toothMC.innerMC.painMC._currentFrame == 1)
        {
            toothMC.innerMC.painMC.gotoAndPlay("out");
        } // end if
        toothMC.innerMC.painMC.gradMC._alpha = 0;
    } // End of the function
    function SET_TEETH_BRITTLE(amount)
    {
        var _loc2 = Math.max(0, Math.min(amount, 100));
        toothMC.innerMC.painMC.gradMC._alpha = _loc2;
        isBroken = _loc2 >= 100;
        if (isBroken)
        {
            this.tortureFail();
        } // end if
    } // End of the function
    function SET_TEETH_ANGLE(amount)
    {
        var _loc2 = Math.max(0, Math.min(amount, 60));
        var _loc3 = (330 + _loc2) % 360;
        if (!isFinished)
        {
            toothMC._rotation = _loc3;
        } // end if
    } // End of the function
    function SET_TEETH_DEPTH(amount)
    {
        var _loc3 = Math.max(0, Math.min(amount, 100));
        var _loc2 = 45 * _loc3 / 100;
        var _loc4 = 10 - _loc2;
        toothMC.innerMC._y = _loc4;
        isFinished = amount >= 100;
        if (isFinished)
        {
            this.tortureSuccess();
        } // end if
    } // End of the function
    function CLEANUP_MOVIE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(toothMC);
    } // End of the function
    var depth = 0;
    var angle = 30;
    var isFinished = false;
    var isBroken = false;
} // End of Class
#endinitclip
