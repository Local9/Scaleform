// Action script...

// [Initial MovieClip Action of sprite 19]
#initclip 7
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextFullView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, dataList, topEdge, visibleItems, highlightedItem;
    function PauseMenuTextFullView()
    {
        super();
    } // End of the function
    function PauseMenuSettingsView()
    {
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc3 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc3, _loc3 + i + "MC", i);
        _loc2._y = itemY;
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListFullItem)(_loc2);
        _loc4.__set__data(_dataArray);
        itemList[i] = _loc4;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function storeDataChange(dataIndex, value)
    {
        dataList[dataIndex][initialValueIndex] = value;
    } // End of the function
    function scrollHighlightStyle(targetIndex)
    {
        targetIndex = Math.max(0, Math.min(targetIndex, dataList.length - 1));
        var _loc2 = 0;
        var _loc4 = 0;
        if (targetIndex > topEdge + visibleItems - 1)
        {
            _loc4 = _loc4 + (targetIndex - (visibleItems - 1));
            topEdge = _loc4;
            targetIndex = visibleItems - 1;
        }
        else if (targetIndex < topEdge)
        {
            _loc4 = targetIndex;
            topEdge = _loc4;
            targetIndex = 0;
        }
        else
        {
            _loc4 = topEdge;
            targetIndex = targetIndex - topEdge;
        } // end else if
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            itemList[_loc2].data = dataList[_loc4 + _loc2];
            itemList[_loc2].highlighted = targetIndex == _loc2;
        } // end of for
        highlightedItem = targetIndex;
    } // End of the function
    var initialValueIndex = 4;
} // End of Class
#endinitclip
