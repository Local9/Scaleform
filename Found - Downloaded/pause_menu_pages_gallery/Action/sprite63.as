// Action script...

// [Initial MovieClip Action of sprite 63]
#initclip 23
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList;
    function PauseMenuGalleryModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function initMaxGalleryItems(max)
    {
        var _loc2 = viewList[0];
        _loc2.maxGalleryItems = max;
    } // End of the function
    function onDestroy()
    {
        var _loc3 = viewList[0];
        var _loc4 = _loc3.itemList.length;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)(_loc3.itemList[_loc2]).ON_DESTROY();
        } // end of for
    } // End of the function
    function removeTxdFromSlot(_index)
    {
        var _loc2 = viewList[0];
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)(_loc2.itemList[_index]).ON_DESTROY();
    } // End of the function
} // End of Class
#endinitclip
