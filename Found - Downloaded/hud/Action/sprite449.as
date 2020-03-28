// Action script...

// [Initial MovieClip Action of sprite 449]
#initclip 37
class com.rockstargames.gtav.hud.hudComponents.HUD_FLOATING_HELP_TEXT_1 extends com.rockstargames.gtav.hud.hudComponents.HUD_FLOATING_HELP_TEXT
{
    var hudCompEnum, helpTextType, TIMELINE, CONTENT, BOUNDING_BOX;
    function HUD_FLOATING_HELP_TEXT_1()
    {
        super();
        hudCompEnum = com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1;
        helpTextType = 1;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
    } // End of the function
} // End of Class
#endinitclip
