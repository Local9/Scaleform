// Action script...

// [Initial MovieClip Action of sprite 45]
#initclip 15
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList;
    function PauseMPMenuAwardsModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function onDestroy()
    {
        var _loc3 = viewList[0];
        var _loc4 = _loc3.itemList.length;
        var _loc2 = 0;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsItem)(_loc3.itemList[_loc2]).ON_DESTROY();
        } // end of for
    } // End of the function
} // End of Class
#endinitclip
