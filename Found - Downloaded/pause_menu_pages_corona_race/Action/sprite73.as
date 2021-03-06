﻿// Action script...

// [Initial MovieClip Action of sprite 73]
#initclip 16
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var viewLinkageList, viewContainer, itemY, __get__params, itemList, rowSpacing, direction, topEdge, visibleItems, dataList, highlightedItem;
    function PauseMPMenuMatchmakingCardView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc2._y = itemY;
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem)(_loc2);
        var _loc6 = this.__get__params().isStandalone;
        _loc3.__set__isStandalone(_loc6);
        _loc3.__set__data(_dataArray);
        itemList[i] = _loc3;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function scrollHighlightStyle(targetIndex)
    {
        var _loc6 = this.direction(targetIndex);
        if (_loc6 != 0)
        {
            var _loc3 = targetIndex;
            var _loc2 = 0;
            var _loc4 = 0;
            if (_loc6 > 0)
            {
                if (_loc3 >= topEdge + visibleItems)
                {
                    ++topEdge;
                    _loc4 = topEdge;
                }
                else
                {
                    _loc4 = topEdge;
                    if (_loc4 == dataList.length - visibleItems && _loc3 == 0)
                    {
                        _loc4 = 0;
                        topEdge = 0;
                    } // end if
                } // end else if
                _loc3 = _loc3 - topEdge;
            }
            else
            {
                if (_loc3 < topEdge)
                {
                    --topEdge;
                    _loc4 = topEdge;
                }
                else
                {
                    _loc4 = topEdge;
                    if (_loc4 == 0 && _loc3 == dataList.length - 1)
                    {
                        _loc4 = _loc3 - visibleItems + 1;
                        topEdge = _loc3 - visibleItems + 1;
                    } // end if
                } // end else if
                _loc3 = _loc3 - topEdge;
            } // end else if
            for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
            {
                itemList[_loc2].data = dataList[_loc4 + _loc2];
                itemList[_loc2].highlighted = _loc3 == _loc2;
            } // end of for
            highlightedItem = _loc3;
        }
        else
        {
            for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
            {
                itemList[_loc2].highlighted = targetIndex == _loc2;
            } // end of for
            highlightedItem = targetIndex;
        } // end else if
    } // End of the function
    var titleHeight = 25;
    var scrollJumpVal = 25;
    var scrollYPos = 0;
} // End of Class
#endinitclip
