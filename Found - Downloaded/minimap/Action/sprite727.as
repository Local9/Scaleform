// Action script...

// [Initial MovieClip Action of sprite 727]
#initclip 22
class com.rockstargames.gtav.minimap.ColourMeBlip extends MovieClip
{
    var innerMC, outerMC;
    function ColourMeBlip()
    {
        super();
    } // End of the function
    function addColour(innerColour, outerColour)
    {
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(innerColour, _loc2);
        com.rockstargames.ui.utils.Colour.Colourise(innerMC, _loc2.r, _loc2.g, _loc2.b);
        com.rockstargames.ui.utils.Colour.setHudColour(outerColour, _loc2);
        com.rockstargames.ui.utils.Colour.Colourise(outerMC, _loc2.r, _loc2.g, _loc2.b);
    } // End of the function
} // End of Class
#endinitclip
