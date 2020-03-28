// Action script...

// [Initial MovieClip Action of sprite 143]
#initclip 25
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_FRIENDS_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, model;
    function PAUSE_MP_MENU_FRIENDS_LIST()
    {
        super();
        dbgID = "PAUSE_MP_MENU_FRIENDS_LIST";
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
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, container: CONTENT, linkage: ["mpFriendsListItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
        CONTENT.joiningMC._visible = false;
    } // End of the function
    function UPDATE_SLOT(_viewIndex, _slotIndex)
    {
        this.parseIcons(arguments);
        model.updateSlot(0, _viewIndex, arguments);
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        this.parseIcons(arguments);
        model.addDataToView(0, _viewIndex, arguments);
    } // End of the function
    function parseIcons(args)
    {
        for (var _loc1 = com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_FRIENDS_LIST.ICON_START_INDEX; _loc1 < com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_FRIENDS_LIST.ICON_START_INDEX + 3; ++_loc1)
        {
            var _loc2 = args[_loc1];
            if (_loc2 == undefined)
            {
                _loc2 = 0;
            } // end if
            var _loc3 = com.rockstargames.gtav.constants.MPIconLabels.lookUp(_loc2)[1];
            args[_loc1] = _loc3;
        } // end of for
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        if (viewIndex == undefined)
        {
            viewIndex = 0;
        } // end if
        super.DISPLAY_VIEW(viewIndex, itemIndex);
    } // End of the function
    function SET_DESCRIPTION(joiningStr, yPos)
    {
        var _loc2 = joiningStr != "";
        CONTENT.joiningMC._visible = _loc2;
        CONTENT.joiningMC.titleTF.text = joiningStr;
        CONTENT.joiningMC.spinnerMC.gotoAndStop(_loc2 ? ("loop") : (1));
        CONTENT.joiningMC._y = yPos;
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        model.getCurrentView().__set__index(i);
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
    function ON_DESTROY()
    {
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListView)(model.getCurrentView()).animateKickOut();
    } // End of the function
    static var ICON_START_INDEX = 9;
} // End of Class
#endinitclip
