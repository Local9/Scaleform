// Action script...

// [Initial MovieClip Action of sprite 16]
#initclip 2
class com.rockstargames.gtav.levelDesign.PLAYER_SWITCH_STATS_PANEL extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, panelMC, BOUNDING_BOX;
    function PLAYER_SWITCH_STATS_PANEL()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        panelMC = CONTENT.panel;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(panelMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
    } // End of the function
    function SET_STATS_LABELS(charColourEnum)
    {
        var _loc14 = arguments.length;
        var _loc11 = (_loc14 - 1) / 2;
        var _loc12 = BOUNDING_BOX._height - (5 + _loc11 * (STAT_HEIGHT - 1));
        for (var _loc4 = 0; _loc4 < MAX_STAT_ITEMS; ++_loc4)
        {
            var _loc3 = panelMC["statMC" + _loc4];
            if (_loc3.statBar == undefined)
            {
                _loc3.attachMovie("GenericColourBar", "statBar", _loc3.getNextHighestDepth(), {_x: _loc3.statBarMaskMC._x, _y: _loc3.statBarMaskMC._y});
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(_loc3.statBar).setMask(_loc3.statBarMaskMC);
            } // end if
            var _loc5 = _loc4 < _loc11;
            var _loc8 = _loc3.nameTF;
            var _loc6 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(_loc3.statBar);
            _loc8._visible = _loc5;
            _loc6.mc._visible = _loc5;
            if (_loc5)
            {
                var _loc7 = 1 + _loc4 * 2;
                _loc6.init(charColourEnum, _loc3.statBarMaskMC._width, _loc3.statBarMaskMC._height);
                _loc6.percent(com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(arguments[_loc7], 20.400000, 2, 5));
                _loc8.text = arguments[_loc7 + 1];
                _loc3._y = _loc12 + _loc4 * (STAT_HEIGHT - 1);
            } // end if
        } // end of for
        panelMC.bgMC._height = _loc11 * STAT_HEIGHT;
        panelMC.bgMC._y = BOUNDING_BOX._height - panelMC.bgMC._height;
    } // End of the function
    function SHOW()
    {
        CONTENT._visible = true;
    } // End of the function
    function HIDE()
    {
        CONTENT._visible = false;
    } // End of the function
    var MAX_STAT_ITEMS = 8;
    var STAT_HEIGHT = 31;
} // End of Class
#endinitclip
