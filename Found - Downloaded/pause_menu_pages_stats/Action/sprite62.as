// Action script...

// [Initial MovieClip Action of sprite 62]
#initclip 19
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_STATS_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, scrollableContent, model, titleHeight, bgMC;
    function PAUSE_MENU_STATS_LIST()
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
        scrollableContent = CONTENT.createEmptyMovieClip("scrollContent", 0);
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, maskHeight: 430 - titleHeight, titleHeight: titleHeight, container: scrollableContent, linkage: ["statsListItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE});
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.helpMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.helpMC.helpTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        CONTENT.helpMC.helpTF.wordWrap = true;
        CONTENT.helpMC.helpTF.autoSize = true;
        CONTENT.helpMC._visible = false;
    } // End of the function
    function SET_TITLE(str, highlightTitle)
    {
    } // End of the function
    function SET_DESCRIPTION(helpStr)
    {
        if (helpStr != undefined)
        {
            CONTENT.helpMC.helpTF.text = helpStr;
        } // end if
        CONTENT.helpMC._visible = helpStr != "";
        var _loc4 = 27;
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView)(model.getCurrentView());
        CONTENT.helpMC._y = _loc3.dataList.length * _loc4;
        CONTENT.helpMC.bgMC._height = CONTENT.helpMC.helpTF.textHeight + 12;
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW(viewIndex, itemIndex);
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView)(model.getCurrentView(0)).itemList.length;
        var _loc5 = 2;
        var _loc4 = 25;
        bgMC._height = (_loc3 - 1) * _loc5 + _loc3 * _loc4;
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        super.SET_FOCUS(isFocused);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                model.prevItem();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                model.nextItem();
                break;
            } 
            default:
            {
                break;
            } 
        } // End of switch
    } // End of the function
    var _highlightTitle = false;
} // End of Class
#endinitclip
