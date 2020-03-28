// Action script...

// [Initial MovieClip Action of sprite 136]
#initclip 18
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_TEXT_LIST_DOUBLE extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var scrollMask, bgMC, CONTENT, scrollableContent, model, titleHeight;
    function PAUSE_MENU_TEXT_LIST_DOUBLE()
    {
        super();
        scrollMask._visible = false;
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
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
        scrollableContent = CONTENT.createEmptyMovieClip("scrollContent", 0);
        scrollableContent.setMask(scrollMask);
        var _loc3 = scrollableContent.createEmptyMovieClip("scrollContent", 0);
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: -2, columnSpacing: 0, maskHeight: 430, titleHeight: titleHeight, container: _loc3, linkage: ["textListDoubleItem"], visibleItems: 15, selectstyle: com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE});
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW.apply(this, arguments);
        if (scrollableContent._height > 430)
        {
            com.rockstargames.ui.game.GameInterface.call("COLUMN_CAN_SCROLL", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, true);
        } // end if
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        model.getCurrentView().viewContainer._y = 0;
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
