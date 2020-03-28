// Action script...

// [Initial MovieClip Action of sprite 14]
#initclip 2
class com.rockstargames.gtav.levelDesign.CAR_FIXING extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT;
    function CAR_FIXING()
    {
        super();
    } // End of the function
    function SET_CAR_FIX_PERCENT(percentageValue)
    {
        percentageValue = Math.max(0, Math.min(percentageValue, 100));
        CONTENT.carMC.barMC.gotoAndStop(percentageValue);
    } // End of the function
    function SET_CARFIX_COLOUR(r, g, b, a)
    {
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.carMC.outerMC, r, g, b, a);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.carMC.colourMC, r, g, b, a);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.carMC.barMC, r, g, b, a);
    } // End of the function
} // End of Class
#endinitclip
