// Action script...

// [Initial MovieClip Action of sprite 147]
#initclip 9
class com.rockstargames.gtav.levelDesign.heists.HeistControllerBase extends com.rockstargames.ui.components.GUIController
{
    var model;
    function HeistControllerBase()
    {
        super();
    } // End of the function
    function dbg(str)
    {
        com.rockstargames.ui.utils.Debug.log(str);
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        var _loc3 = arguments.slice(2);
        model.addDataToView(_viewIndex, _slotIndex, _loc3);
    } // End of the function
    function UPDATE_DATA_SLOT(viewIndex, itemIndex)
    {
        var _loc3 = (com.rockstargames.gtav.levelDesign.heists.HeistView)(model.getCurrentView(viewIndex));
        if (_loc3.__get__params().id != com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember)
        {
            super.UPDATE_DATA_SLOT(viewIndex, itemIndex);
        } // end if
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW(viewIndex, itemIndex);
    } // End of the function
    function FOCUS_VIEW(viewIndex, clearOtherViews)
    {
        super.FOCUS_VIEW(viewIndex, clearOtherViews);
    } // End of the function
    function SHOW_DEBUG(b)
    {
        dbgOn = b;
    } // End of the function
    var dbgOn = false;
} // End of Class
#endinitclip
