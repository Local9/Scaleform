// Action script...

// [Initial MovieClip Action of sprite 36]
#initclip 22
class com.rockstargames.gtav.hud.hudComponents.HUD_DRUGS_PURSE extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var CONTENT, _enumID, _HUD;
    function HUD_DRUGS_PURSE()
    {
        super();
    } // End of the function
    function SET_DRUG_AMOUNT_AND_TYPE(params)
    {
        var _loc2 = params[0];
        var _loc3 = params[1];
        CONTENT.drugsTF.text = _loc3;
        CONTENT.iconMC.gotoAndStop(_loc2 + 1);
        CONTENT._alpha = 100;
    } // End of the function
    function REMOVE_DRUG_PURSE()
    {
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
} // End of Class
#endinitclip
