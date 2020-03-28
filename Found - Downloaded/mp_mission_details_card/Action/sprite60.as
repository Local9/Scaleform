// Action script...

// [Initial MovieClip Action of sprite 60]
#initclip 21
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, viewIndex, getCurrentView;
    function PauseMenuFreemodeDetailsModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsView();
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
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsView)(this.getCurrentView());
    } // End of the function
} // End of Class
#endinitclip
