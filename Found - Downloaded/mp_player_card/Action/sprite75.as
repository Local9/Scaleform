// Action script...

// [Initial MovieClip Action of sprite 75]
#initclip 22
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem extends MovieClip
{
    var bgMC, innerMC;
    function PauseMPMenuPlayerCardItem()
    {
        super();
        com.rockstargames.ui.utils.Colour.ApplyHudColour(bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        innerMC.barMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(innerMC.barMC);
        _global.gfxExtensions = true;
    } // End of the function
    function init(_data)
    {
        var _loc3 = _data[3];
        var _loc2 = _data.slice(6);
        innerMC.titleTF.textAutoSize = "shrink";
        innerMC.titleTF.text = _loc2[0];
        innerMC.valTF.textAutoSize = "shrink";
        innerMC.valTF.text = _loc2[1];
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(innerMC.titleTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(innerMC.valTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        if (_loc3 == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem.TYPE_NUMERIC_STAT)
        {
            innerMC.titleTF._y = (bgMC._height - innerMC.valTF.textHeight) * 0.500000;
            innerMC.valTF._y = innerMC.titleTF._y;
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(innerMC.barMC).mc._visible = false;
        }
        else
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(innerMC.barMC).percent(_loc2[2]);
        } // end else if
    } // End of the function
    function setColour(colourEnum)
    {
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(innerMC.barMC).init(colourEnum);
    } // End of the function
    function setCustomColour(hudColour)
    {
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(innerMC.barMC).initCustom(hudColour);
    } // End of the function
    static var TYPE_NUMERIC_STAT = 1;
} // End of Class
#endinitclip
