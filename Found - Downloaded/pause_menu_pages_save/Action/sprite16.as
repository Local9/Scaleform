// Action script...

// [Initial MovieClip Action of sprite 16]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_TEXT_LIST_FULL extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, scrollableContent, model, titleHeight;
    function PAUSE_MENU_TEXT_LIST_FULL()
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
        this.SET_FOCUS(false);
        scrollableContent = CONTENT.createEmptyMovieClip("scrollContent", 0);
        var _loc3 = scrollableContent.createEmptyMovieClip("scrollContent", 0);
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextFullModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, maskHeight: 430, titleHeight: titleHeight, container: _loc3, linkage: ["textListFullItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        if (isFocused)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextFullModel)(model).highlightNext();
        }
        else
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextFullModel)(model).clearHighlight();
        } // end else if
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
