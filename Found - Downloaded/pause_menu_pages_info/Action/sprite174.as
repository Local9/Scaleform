// Action script...

// [Initial MovieClip Action of sprite 174]
#initclip 8
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MISSION_HELP_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var scrollMask, CONTENT, containerMC, model, titleHeight, SET_SCROLL_BAR;
    function PAUSE_MENU_MISSION_HELP_LIST()
    {
        super();
        scrollMask._visible = false;
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
        containerMC = CONTENT.createEmptyMovieClip("scrollContent", 0);
        containerMC.setMask(scrollMask);
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 8, columnSpacing: 0, maskHeight: scrollMask._height, titleHeight: titleHeight, container: containerMC, linkage: ["missionHelpListItem"], visibleItems: 15, selectstyle: com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE});
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW.apply(this, arguments);
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpView)(model.getCurrentView()).scrollToBottom();
        if (containerMC._height > scrollMask._height)
        {
            this.SET_SCROLL_BAR(0, 0);
            com.rockstargames.ui.game.GameInterface.call("COLUMN_CAN_SCROLL", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, true);
        } // end if
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        model.getCurrentView().viewContainer._y = 0;
        model.getCurrentView().__set__index(0);
    } // End of the function
    function SET_FOCUS(isFocused)
    {
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
        {
            model.prevItem();
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
        {
            model.nextItem();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
