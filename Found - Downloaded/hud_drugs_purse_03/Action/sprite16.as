// Action script...

// [Initial MovieClip Action of sprite 16]
#initclip 2
class com.rockstargames.gtav.hud.hudComponents.HUD_DRUGS_PURSE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var CONTENT, _enumID;
    function HUD_DRUGS_PURSE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.READY();
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        CONTENT._alpha = 0;
    } // End of the function
    function SET_DRUG_AMOUNT_AND_TYPE(params)
    {
        var _loc2 = params[0];
        var _loc3 = params[1];
        CONTENT.drugsTF.text = _loc3;
        CONTENT.iconMC.gotoAndPlay(_loc2 + 1);
        CONTENT._alpha = 100;
    } // End of the function
    function REMOVE_DRUG_PURSE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        com.rockstargames.ui.game.GameInterface.call("REQUEST_REMOVAL", com.rockstargames.ui.game.GameInterface.HUD_TYPE, _enumID);
    } // End of the function
} // End of Class
#endinitclip
