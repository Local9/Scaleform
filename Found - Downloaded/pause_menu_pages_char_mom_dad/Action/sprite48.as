// Action script...

// [Initial MovieClip Action of sprite 48]
#initclip 5
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuLifestyleStatsModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, viewIndex, getCurrentView;
    function PauseMenuLifestyleStatsModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuLifestyleStatsView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function removeDataFromSlot(_viewIndex, _slotIndex)
    {
        var _loc2 = viewList[_viewIndex];
        _loc2.destroy();
        _loc2.topEdge = 0;
        viewIndex = 0;
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuLifestyleStatsView)(this.getCurrentView());
    } // End of the function
} // End of Class
#endinitclip
