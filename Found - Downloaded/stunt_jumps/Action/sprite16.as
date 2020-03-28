// Action script...

// [Initial MovieClip Action of sprite 16]
#initclip 5
class com.rockstargames.gtav.levelDesign.STUNT_JUMPS extends com.rockstargames.ui.core.BaseScreenLayout
{
    var TIMELINE, CONTENT, screenHeightPixels;
    function STUNT_JUMPS()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("GENERIC_SECONDARY_INFO", "GENERIC_SECONDARY_INFO", 10);
        CONTENT._x = 640;
    } // End of the function
    function SET_STUNT_JUMP_TITLE_AND_DESCRIPTION(stuntJumpTitle, stuntJumpDescription, stuntJumpProgress)
    {
        CONTENT.TITLE.textAutoSize = "shrink";
        CONTENT.TITLE.htmlText = stuntJumpTitle;
        CONTENT.DESCRIPTION.htmlText = stuntJumpProgress;
        CONTENT.DESCRIPTION_BLACK.htmlText = stuntJumpProgress;
        CONTENT._visible = true;
    } // End of the function
    function SET_STUNT_JUMP_COLOR(hudColourId)
    {
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.TITLE, hudColourId);
    } // End of the function
    function SET_VISIBLE(isVisible)
    {
        CONTENT._visible = isVisible;
    } // End of the function
    function debug()
    {
        this.SET_STUNT_JUMP_TITLE_AND_DESCRIPTION("Stunt Jump complete", "Success!", "21 Stunt Jumps left to do");
    } // End of the function
    function OVERRIDE_Y_POSITION(newYPosition)
    {
        CONTENT._y = newYPosition * screenHeightPixels;
    } // End of the function
} // End of Class
#endinitclip
