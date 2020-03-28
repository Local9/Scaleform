// Action script...

// [Initial MovieClip Action of sprite 64]
#initclip 9
class com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase extends com.rockstargames.ui.components.GUIController
{
    var model, scrollBase, CONTENT;
    function PauseMenuComponentBase()
    {
        super();
    } // End of the function
    function dbg(dbgStr)
    {
        if (dbgOn)
        {
            com.rockstargames.ui.utils.Debug.log("*** SCALEFORM | " + dbgID + " : " + dbgStr);
        } // end if
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        model.addDataToView(0, _viewIndex, arguments);
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
        } // end if
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        model.getCurrentView().topEdge = 0;
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
        } // end if
    } // End of the function
    function ADD_SLOT(_viewIndex, _slotIndex)
    {
        model.addSlot(0, _viewIndex, arguments);
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
        } // end if
    } // End of the function
    function UPDATE_SLOT(_viewIndex, _slotIndex)
    {
        model.updateSlot(0, _viewIndex, arguments);
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
        } // end if
    } // End of the function
    function CLEAR_HIGHLIGHT()
    {
        model.getCurrentView().highlightedItem = 0;
        model.getCurrentView().topEdge = 0;
        model.getCurrentView().__set__index(0);
    } // End of the function
    function SHOW_COLUMN(bool)
    {
        CONTENT._visible = bool;
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
        } // end if
    } // End of the function
    function SET_COLUMN_CAN_JUMP(b)
    {
        canJump = b;
    } // End of the function
    function ON_FOCUS_PAGE_CONTENT(bFocused)
    {
    } // End of the function
    function SET_TITLE(str)
    {
    } // End of the function
    function SET_DESCRIPTION()
    {
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
    } // End of the function
    function SET_STATE(i)
    {
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        var _loc3 = model.getCurrentView().itemList;
        for (var _loc2 = 0; _loc2 < _loc3.length; ++_loc2)
        {
            _loc3[_loc2].highlighted = isFocused ? (model.getCurrentView().highlightedItem == _loc2) : (false);
        } // end of for
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
            scrollBase._visible = isFocused && scrollBase.displayEnabled();
        } // end if
    } // End of the function
    function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, xColOffset)
    {
        if (scrollBase == undefined)
        {
            scrollBase = (com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase)(CONTENT.attachMovie("PM_ScrollBase", "scrollBase", CONTENT.getNextHighestDepth()));
        } // end if
        if (!override)
        {
            scrollBase.setComponent(this);
        } // end if
        scrollBase.INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, xColOffset);
    } // End of the function
    function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption)
    {
        if (scrollBase != undefined)
        {
            scrollBase.SET_SCROLL_BAR.apply(scrollBase, arguments);
        } // end if
    } // End of the function
    function getTxdData()
    {
        var _loc1;
        return (_loc1);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        super.SET_INPUT_EVENT(direction);
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
        } // end if
    } // End of the function
    function ON_DESTROY()
    {
    } // End of the function
    var titleHeight = 27;
    var preloadTxds = false;
    var dbgID = "";
    var dbgOn = false;
    var canJump = true;
} // End of Class
#endinitclip
