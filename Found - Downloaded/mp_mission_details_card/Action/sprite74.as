// Action script...

// [Initial MovieClip Action of sprite 74]
#initclip 35
class com.rockstargames.gtav.Multiplayer.ROCKSTAR_VERIFIED extends MovieClip
{
    var VERIFIED;
    function ROCKSTAR_VERIFIED()
    {
        super();
        VERIFIED = this;
    } // End of the function
    function SET_VERIFIED(type, colourEnum)
    {
        var _loc5 = 0;
        var _loc4 = 1;
        var _loc6 = 2;
        VERIFIED.gotoAndStop(type + 1);
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        if (colourEnum == undefined)
        {
            colourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_NORTH_BLUE;
        } // end if
        com.rockstargames.ui.utils.Colour.setHudColour(colourEnum, _loc2);
        com.rockstargames.ui.utils.Colour.Colourise(VERIFIED, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
    } // End of the function
} // End of Class
#endinitclip
