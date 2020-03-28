// Action script...

// [Initial MovieClip Action of sprite 64]
#initclip 21
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, __get__params, direction, dataList, __set__params;
    function PauseMenuStatsView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc3 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc3, _loc3 + i + "MC", i);
        _loc2._y = itemY;
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuStatsListItem)(_loc2);
        _loc4.__set__data(_dataArray);
        itemList[i] = _loc4;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        if (_p.titleHeight != undefined)
        {
            titleHeight = _p.titleHeight;
        } // end if
        scrollJumpVal = titleHeight;
        //return (this.params());
        null;
    } // End of the function
    function lockedHighlightStyle(targetIndex)
    {
        var _loc6 = this.direction(targetIndex);
        if (_loc6 != 0)
        {
            var _loc3;
            var _loc2;
            var _loc4 = Math.min(targetIndex, dataList.length - itemList.length);
            for (var _loc2 = 0; _loc2 < targetIndex + itemList.length; ++_loc2)
            {
                _loc3 = itemList[_loc2];
                _loc3.__set__data(dataList[_loc2 + _loc4]);
            } // end of for
        } // end if
    } // End of the function
    var titleHeight = 25;
    var scrollJumpVal = 25;
    var scrollYPos = 0;
} // End of Class
#endinitclip
