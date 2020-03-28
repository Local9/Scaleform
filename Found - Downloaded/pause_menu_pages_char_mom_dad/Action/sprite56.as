// Action script...

// [Initial MovieClip Action of sprite 56]
#initclip 13
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CHARACTER_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, SET_FOCUS, hudColorEnum, hudColor, highlightColor, highlightBitmask, CREW_TAG, model;
    function PAUSE_MENU_CHARACTER_CARD()
    {
        super();
        _global.gfxExtensions = true;
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
        this.SET_FOCUS(false);
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc4);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.statsMC.statsBG, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.statsMC.statsLabelContainer, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        hudColorEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
        hudColor = new com.rockstargames.ui.utils.HudColour();
        highlightColor = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(hudColorEnum, highlightColor);
        highlightBitmask = new com.rockstargames.ui.utils.BitMask();
        CREW_TAG = CONTENT.CREW_TAG;
        CREW_TAG._alpha = 0;
        CONTENT.statsMC._visible = false;
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardModel();
        model.createView(0, {id: 0, x: 0, y: 405, rowSpacing: 2, columnSpacing: 0, container: CONTENT, linkage: ["heritageCardItem"], visibleItems: 1, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
    } // End of the function
    function SET_TITLE(str)
    {
        if (arguments[1] != undefined)
        {
            hudColorEnum = arguments[1];
        } // end if
        var _loc7 = arguments[2];
        var _loc6 = 216;
        if (_loc7 == true)
        {
            _loc6 = 243;
        } // end if
        CONTENT.statsMC._y = _loc6;
        var _loc5 = 3;
        for (var _loc3 = _loc5; _loc3 < arguments.length; ++_loc3)
        {
            var _loc4 = CONTENT.statsMC.statsLabelContainer["stat" + (_loc3 - _loc5)];
            if (_loc4 != undefined)
            {
                _loc4.text = arguments[_loc3];
            } // end if
        } // end of for
    } // End of the function
    function SET_DESCRIPTION(bitmask)
    {
        highlightBitmask.__set__bitfield(bitmask != undefined ? (bitmask) : (0));
        if (bitmask != undefined)
        {
            for (var _loc3 = 0; _loc3 < arguments.length - 1; ++_loc3)
            {
                var _loc4 = CONTENT.statsMC["statBarN" + _loc3];
                if (_loc4 != undefined)
                {
                    _loc4.init(hudColorEnum, 125);
                    _loc4.percent(arguments[_loc3 + 1] * 100, false);
                } // end if
            } // end of for
            if (!CONTENT.statsMC._visible)
            {
                CONTENT.statsMC._visible = true;
            } // end if
        }
        else
        {
            CONTENT.statsMC._visible = false;
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
