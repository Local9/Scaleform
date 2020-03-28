// Action script...

// [Initial MovieClip Action of sprite 154]
#initclip 1
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
        var _loc6 = _data[3];
        var _loc5 = _data.slice(6);
        var _loc4 = _loc5[0];
        var _loc2 = _loc5[1];
        var _loc3 = 8;
        if (_loc4.length > _loc3 && bgMC._width < 200)
        {
            _loc4 = _loc4.substr(0, _loc3) + "...";
        } // end if
        if (_loc2.length > _loc3 && bgMC._width < 200)
        {
            _loc2 = _loc2.substr(0, _loc3) + "...";
        } // end if
        com.rockstargames.ui.utils.UIText.setSizedText(innerMC.titleTF, _loc4, true);
        com.rockstargames.ui.utils.UIText.setSizedText(innerMC.valTF, _loc2, true);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(innerMC.titleTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(innerMC.valTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        if (_loc6 == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuPlayerCardItem.TYPE_NUMERIC_STAT)
        {
            innerMC.titleTF._y = (bgMC._height - innerMC.valTF.textHeight) * 0.500000;
            innerMC.valTF._y = innerMC.titleTF._y;
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(innerMC.barMC).mc._visible = false;
        }
        else
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(innerMC.barMC).percent(_loc5[2]);
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
