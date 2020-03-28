// Action script...

// [Initial MovieClip Action of sprite 49]
#initclip 17
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FRIENDS_STATS_SP extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, model;
    function PAUSE_MENU_FRIENDS_STATS_SP()
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
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 0, columnSpacing: 0, maskHeight: 430, container: CONTENT, linkage: ["mpFriendsStatsListItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
    } // End of the function
    function debug()
    {
        var _loc2 = new Object();
        _loc2.onKeyDown = mx.utils.Delegate.create(this, getKeys);
        Key.addListener(_loc2);
        this.SET_DATA_SLOT(0, 999, 0, 0, "Menu item 0 this is an example of text going way over the length");
        this.SET_DATA_SLOT(1, 999, 0, 0, "Menu item 1 this is an example of text going way over the length and a little more here maybe going over 3 lines");
        this.SET_DATA_SLOT(2, 999, 0, 0, "Menu item 2");
        this.SET_DATA_SLOT(3, 999, 0, 0, "Menu item 3");
        this.SET_DATA_SLOT(4, 999, 0, 0, "Menu item 4");
        this.DISPLAY_VIEW(0);
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        var _loc3 = arguments;
        model.addDataToView(0, _viewIndex, _loc3);
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        model.displayView(0);
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(38))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
        }
        else if (Key.isDown(40))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
        } // end else if
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
