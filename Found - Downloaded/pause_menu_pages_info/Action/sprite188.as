// Action script...

// [Initial MovieClip Action of sprite 188]
#initclip 22
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FEED extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var scrollMask, CONTENT, getNextHighestDepth, containerMC, model, titleHeight, SET_SCROLL_BAR;
    function PAUSE_MENU_FEED()
    {
        super();
        scrollMask._visible = false;
    } // End of the function
    function INITIALISE(mc)
    {
        if (mc)
        {
            super.INITIALISE(mc);
        }
        else
        {
            CONTENT = this;
        } // end else if
        containerMC = CONTENT.createEmptyMovieClip("containerMC", this.getNextHighestDepth());
        containerMC.setMask(scrollMask);
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFeedModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 11, columnSpacing: 0, maskHeight: scrollMask._height, titleHeight: titleHeight, container: containerMC, linkage: ["feedItem"], visibleItems: 50, selectstyle: com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE});
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW.apply(this, arguments);
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFeedView)(model.getCurrentView()).scrollToBottom();
        if (containerMC._height > scrollMask._height)
        {
            this.SET_SCROLL_BAR(0, 0);
            com.rockstargames.ui.game.GameInterface.call("COLUMN_CAN_SCROLL", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, true);
        } // end if
    } // End of the function
    function SET_FOCUS(isFocused)
    {
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        this.ON_DESTROY();
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        model.getCurrentView().viewContainer._y = 0;
    } // End of the function
    function ON_DESTROY()
    {
        var _loc3 = model.getCurrentView().itemList;
        for (var _loc2 = 0; _loc2 < _loc3.length; ++_loc2)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem)(_loc3[_loc2]).onDestroy();
        } // end of for
    } // End of the function
} // End of Class
#endinitclip
