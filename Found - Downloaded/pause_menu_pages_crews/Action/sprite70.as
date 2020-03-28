// Action script...

// [Initial MovieClip Action of sprite 70]
#initclip 8
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CREWS_LIST extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, scrollableContent, model, titleHeight, scrollBase, CLEAR_HIGHLIGHT;
    function PAUSE_MENU_CREWS_LIST()
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
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, maskHeight: 430 - titleHeight, titleHeight: titleHeight, container: scrollableContent, linkage: ["crewsListItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        if (isFocused)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListModel)(model).highlightNext();
        }
        else
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListModel)(model).clearHighlight();
        } // end else if
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
            scrollBase._visible = isFocused && scrollBase.displayEnabled();
        } // end if
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        this.CLEAR_HIGHLIGHT();
        var _loc3 = (com.rockstargames.ui.components.GUIView)(model.getCurrentView());
        _loc3.__set__index(i);
        super.SET_FOCUS(true);
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
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        (com.rockstargames.ui.components.GUIView)(model.getCurrentView()).__set__index(0);
    } // End of the function
} // End of Class
#endinitclip
