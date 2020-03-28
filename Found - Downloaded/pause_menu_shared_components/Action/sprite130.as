// Action script...

// [Initial MovieClip Action of sprite 130]
#initclip 12
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_VERTICAL_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, model;
    function PAUSE_MENU_VERTICAL_LIST()
    {
        super();
        dbgID = "PAUSE_MENU_VERTICAL_LIST";
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
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, container: CONTENT, linkage: ["verticalMenuListItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalView)(model.getCurrentView());
        _loc2.__set__index(i);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc2 = 0;
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
