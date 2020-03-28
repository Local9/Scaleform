// Action script...

// [Initial MovieClip Action of sprite 65]
#initclip 22
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuSPCardItem extends MovieClip
{
    var progBarMC, bgMC, nameTF, valueTF;
    function PauseMenuSPCardItem()
    {
        super();
        _global.gfxExtensions = true;
        progBarMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(progBarMC);
        bgMC._visible = false;
    } // End of the function
    function init(_data)
    {
        var _loc2 = _data.slice(6);
        nameTF.textAutoSize = "shrink";
        var _loc3 = _loc2[0];
        var _loc4 = 8;
        if (_loc3.length > _loc4 && bgMC._width < 200)
        {
            _loc3 = _loc3.substr(0, _loc4) + "...";
        } // end if
        com.rockstargames.ui.utils.UIText.setSizedText(nameTF, _loc3, true);
        com.rockstargames.ui.utils.UIText.setSizedText(valueTF, _loc2[1]);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(nameTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(valueTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        progBarMC.init(_loc2[3]);
        progBarMC.percentDecimal(_loc2[2]);
    } // End of the function
} // End of Class
#endinitclip
