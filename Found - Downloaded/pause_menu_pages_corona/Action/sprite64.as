// Action script...

// [Initial MovieClip Action of sprite 64]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_MAP extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT;
    function PAUSE_MENU_FREEMODE_MAP()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        if (mc != undefined)
        {
            super.INITIALISE(mc);
        }
        else
        {
            CONTENT = this;
        } // end else if
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_ORANGELIGHT, _loc4);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.detailsMC.titleMC.titleBGMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.detailsMC.infoMC.infoBGMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        CONTENT.detailsMC._visible = false;
    } // End of the function
    function SET_TITLE()
    {
        CONTENT.detailsMC._visible = true;
        var _loc6 = arguments[0];
        var _loc4 = arguments[1];
        var _loc5 = arguments[2];
        var _loc3 = CONTENT.detailsMC;
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.titleMC.titleTF, _loc6, true);
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.infoMC.nameTF, _loc4, true);
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.infoMC.timeTF, _loc5, true);
    } // End of the function
} // End of Class
#endinitclip
