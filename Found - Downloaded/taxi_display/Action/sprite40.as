// Action script...

// [Initial MovieClip Action of sprite 40]
#initclip 3
class com.rockstargames.ui.components.GUIController extends com.rockstargames.gtav.levelDesign.BaseScriptUI implements com.rockstargames.ui.components.IController
{
    var model;
    function GUIController()
    {
        super();
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (model.getCurrentSelection());
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        var _loc3 = arguments.slice(2);
        model.addDataToView(_viewIndex, _slotIndex, _loc3);
    } // End of the function
    function UPDATE_DATA_SLOT(_viewIndex, _slotIndex)
    {
        var _loc3 = arguments.slice(2);
        model.updateSlot(_viewIndex, _slotIndex, _loc3);
    } // End of the function
    function ADD_SLOT(_viewIndex, _slotIndex)
    {
        var _loc3 = arguments.slice(2);
        model.addSlot(_viewIndex, _slotIndex, _loc3);
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        model.removeDataFromSlot(viewIndex, itemIndex);
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        if (itemIndex == undefined)
        {
            itemIndex = 0;
        } // end if
        model.displayView(viewIndex, itemIndex);
    } // End of the function
    function FOCUS_VIEW(viewIndex, clearOtherViews)
    {
        if (clearOtherViews == undefined)
        {
            clearOtherViews = 1;
        } // end if
        model.focusView(viewIndex, clearOtherViews);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                model.prevItem();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                model.nextView();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                model.nextItem();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                model.prevView();
                break;
            } 
        } // End of switch
    } // End of the function
} // End of Class
#endinitclip
