// Action script...

// [Initial MovieClip Action of sprite 175]
#initclip 9
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, viewIndex;
    function PauseMenuMissionHelpModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function removeDataFromSlot(_viewIndex, _slotIndex)
    {
        var _loc2 = viewList[_viewIndex];
        _loc2.destroy();
        viewIndex = 0;
    } // End of the function
} // End of Class
#endinitclip
