﻿// Action script...

// [Initial MovieClip Action of sprite 50]
#initclip 18
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList;
    function PauseMenuFriendsStatsModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
} // End of Class
#endinitclip
