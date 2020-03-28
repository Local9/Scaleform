// Action script...

// [Initial MovieClip Action of sprite 54]
#initclip 11
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_HERITAGE_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, model;
    function PAUSE_MENU_HERITAGE_CARD()
    {
        super();
        dbgID = "PAUSE_MENU_HERITAGE_CARD";
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
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, container: CONTENT, linkage: ["heritageCardItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
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
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADRIGHT)
        {
            _loc2 = model.getCurrentSelection();
            model.getCurrentView().itemList[_loc2].stepVal(1);
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADLEFT)
        {
            _loc2 = model.getCurrentSelection();
            model.getCurrentView().itemList[_loc2].stepVal(-1);
        } // end if
    } // End of the function
} // End of Class
#endinitclip
