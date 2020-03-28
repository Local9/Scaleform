// Action script...

// [Initial MovieClip Action of sprite 52]
#initclip 20
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing;
    function PauseMenuFriendsStatsView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc3 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc3, _loc3 + i + "MC", i);
        _loc2._y = itemY;
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsItem)(_loc2);
        _loc4.__set__data(_dataArray);
        itemList[i] = _loc4;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
} // End of Class
#endinitclip
