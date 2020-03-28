// Action script...

// [Initial MovieClip Action of sprite 63]
#initclip 20
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, viewIndex, getCurrentView, setItem;
    function PauseMenuStatsModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView();
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
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView)(this.getCurrentView());
    } // End of the function
    function nextItem()
    {
        var _loc2 = this.getCurrentView();
        var _loc3 = _loc2.__get__index() + 1;
        var _loc4 = _loc2.dataList.length - _loc2.itemList.length;
        if (_loc3 >= _loc4)
        {
            _loc3 = _loc4;
        } // end if
        this.setItem(_loc2, _loc3);
    } // End of the function
    function prevItem()
    {
        var _loc3 = this.getCurrentView();
        var _loc2 = _loc3.__get__index() - 1;
        if (_loc2 < 0)
        {
            _loc2 = 0;
        } // end if
        this.setItem(_loc3, _loc2);
    } // End of the function
} // End of Class
#endinitclip
