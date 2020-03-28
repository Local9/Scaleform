// Action script...

// [Initial MovieClip Action of sprite 25]
#initclip 8
class com.rockstargames.gtav.levelDesign.CUSTOM_WARNING_SCREEN extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
    var CONTENT, BOUNDING_BOX;
    function CUSTOM_WARNING_SCREEN()
    {
        super();
        CONTENT.DividerMC._visible = false;
        CONTENT.WarningScreenListMC.reset();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function SHOW_CUSTOM_WARNING_SCREEN()
    {
        var _loc12 = CONTENT.HeaderTF;
        var _loc13 = CONTENT.DescriptionTF;
        var _loc10 = CONTENT.WarningScreenListMC;
        var _loc15 = CONTENT.Divider1MC;
        var _loc14 = CONTENT.Divider2MC;
        var _loc11 = arguments[6];
        var _loc3;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.HeaderTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW);
        _loc12.text = arguments[7];
        _loc13.text = arguments[8];
        _loc10.reset();
        for (var _loc3 = 0; _loc3 < _loc11; ++_loc3)
        {
            _loc10.setItem(arguments[_loc3]);
        } // end of for
        var _loc16 = 10;
        var _loc17 = 0;
        var _loc6 = new Array();
        _loc6.push([_loc12, 5]);
        _loc6.push([_loc15, _loc16]);
        _loc6.push([_loc13, _loc16]);
        _loc6.push([_loc10, 5]);
        _loc6.push([_loc14, 0]);
        var _loc9 = _loc6.length;
        var _loc7 = 0;
        for (var _loc3 = 0; _loc3 < _loc9; ++_loc3)
        {
            var _loc5 = _loc6[_loc3];
            _loc7 = _loc7 + _loc5[0]._height;
            _loc7 = _loc7 + _loc5[1];
        } // end of for
        var _loc8 = (BOUNDING_BOX._height - _loc7) * 0.500000;
        for (var _loc3 = 0; _loc3 < _loc9; ++_loc3)
        {
            _loc5 = _loc6[_loc3];
            var _loc4 = _loc5[0];
            _loc4._y = _loc8;
            _loc8 = _loc8 + (_loc4._height + _loc5[1]);
        } // end of for
        _loc10.setSelectedItem(0);
        CONTENT._visible = true;
        _loc12._visible = true;
        _loc13._visible = true;
        _loc15._visible = true;
        _loc14._visible = true;
        CONTENT.WarningScreenListMC._visible = true;
    } // End of the function
    function HIDE_CUSTOM_WARNING_SCREEN(msecs)
    {
        CONTENT.WarningScreenListMC.reset();
        CONTENT._visible = false;
        CONTENT.HeaderTF._visible = false;
        CONTENT.DescriptionTF._visible = false;
        CONTENT.DividerMC._visible = false;
        CONTENT.WarningScreenListMC._visible = false;
    } // End of the function
    function SET_SELECTED_INDEX()
    {
        CONTENT.WarningScreenListMC.setSelectedItem(arguments[0] - 1);
    } // End of the function
    function debug()
    {
        CONTENT.HeaderTF.text = "TITLE";
        CONTENT.DescriptionTF.text = "MESSASGE";
        CONTENT._visible = true;
        CONTENT.HeaderTF._visible = true;
        CONTENT.DescriptionTF._visible = true;
        CONTENT.DividerMC._visible = true;
    } // End of the function
} // End of Class
#endinitclip
