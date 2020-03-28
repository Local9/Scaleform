// Action script...

// [Initial MovieClip Action of sprite 128]
#initclip 8
class com.rockstargames.gtav.levelDesign.PAUSE_MENU_INSTRUCTIONAL_BUTTONS extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
    var SET_BACKGROUND_COLOUR;
    function PAUSE_MENU_INSTRUCTIONAL_BUTTONS()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
        this.SET_BACKGROUND_COLOUR(_loc3.r, _loc3.g, _loc3.b, _loc3.a);
    } // End of the function
} // End of Class
#endinitclip
