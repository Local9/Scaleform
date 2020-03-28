// Action script...

// [Initial MovieClip Action of sprite 16]
#initclip 1
class com.rockstargames.gtav.utils.GRAPHIC_DESIGN
{
    var topPadding, bottomPadding, TIMELINE;
    function GRAPHIC_DESIGN()
    {
        topPadding = 5;
        bottomPadding = 12;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        TIMELINE.HELP_TEXT.CONTENT.helpText.html = true;
        TIMELINE.HELP_TEXT.CONTENT.helpText.wordWrap = true;
        TIMELINE.HELP_TEXT.CONTENT.helpText.autoSize = true;
        TIMELINE.HELP_TEXT_TWO.helpTextTwo.html = true;
        TIMELINE.HELP_TEXT_TWO.helpTextTwo.wordWrap = true;
        TIMELINE.HELP_TEXT_TWO.helpTextTwo.autoSize = true;
        TIMELINE.HELP_TEXT_THREE.helpTextThree.html = true;
        TIMELINE.HELP_TEXT_THREE.helpTextThree.wordWrap = true;
        TIMELINE.HELP_TEXT_THREE.helpTextThree.autoSize = true;
        com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "AM_H_SWTCH5", TIMELINE.HELP_TEXT.CONTENT, TIMELINE.HELP_TEXT.CONTENT.helpText, 0, 14.400000, 2.650000);
        com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "AM_H_SWTCH5", TIMELINE.HELP_TEXT_TWO, TIMELINE.HELP_TEXT_TWO.helpTextTwo, 0, 20, 2.650000);
        com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "AM_H_SWTCH5", TIMELINE.HELP_TEXT_THREE, TIMELINE.HELP_TEXT_THREE.helpTextThree, 0, 24, 2.650000);
    } // End of the function
    function SET_INPUT_EVENT()
    {
        var _loc5 = arguments[0];
        com.rockstargames.ui.utils.Debug.log("FLASH ::::::::::   SET_INPUT_EVENT was called with: :::: " + _loc5);
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(TIMELINE.squareMC, _loc3.r, _loc3.g, _loc3.b, 100);
        com.rockstargames.ui.utils.Debug.log("FLASH ::::::::::   SET_INPUT_EVENT was called ");
        TIMELINE.HELP_TEXT.CONTENT.helpText.html = true;
        TIMELINE.HELP_TEXT.CONTENT.helpText.wordWrap = true;
        TIMELINE.HELP_TEXT.CONTENT.helpText.autoSize = true;
        TIMELINE.HELP_TEXT_TWO.helpTextTwo.html = true;
        TIMELINE.HELP_TEXT_TWO.helpTextTwo.wordWrap = true;
        TIMELINE.HELP_TEXT_TWO.helpTextTwo.autoSize = true;
        TIMELINE.HELP_TEXT_THREE.helpTextThree.html = true;
        TIMELINE.HELP_TEXT_THREE.helpTextThree.wordWrap = true;
        TIMELINE.HELP_TEXT_THREE.helpTextThree.autoSize = true;
        com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "AM_H_SWTCH5", TIMELINE.HELP_TEXT.CONTENT, TIMELINE.HELP_TEXT.CONTENT.helpText, 0, 14.400000, 2.650000);
        com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "AM_H_SWTCH5", TIMELINE.HELP_TEXT_TWO, TIMELINE.HELP_TEXT_TWO.helpTextTwo, 0, 20, 2.650000);
        com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "AM_H_SWTCH5", TIMELINE.HELP_TEXT_THREE, TIMELINE.HELP_TEXT_THREE.helpTextThree, 0, 24, 2.650000);
        var _loc4 = 3;
        TIMELINE.HELP_TEXT.CONTENT.helpTextBackground._height = TIMELINE.HELP_TEXT.CONTENT.helpText.textHeight + topPadding + bottomPadding;
        TIMELINE.HELP_TEXT.CONTENT.helpTextBackground._height = TIMELINE.HELP_TEXT.CONTENT.helpTextBackground._height - _loc4;
    } // End of the function
    var magic = 1.277000;
} // End of Class
#endinitclip
