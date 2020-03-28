// Action script...

// [Initial MovieClip Action of sprite 50]
#initclip 7
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, dataList, topEdge, visibleItems, highlightedItem;
    function PauseMenuVerticalView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc2._y = itemY;
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem)(_loc2);
        _loc3.initStoreMethod(storeDataChange, this);
        _loc3.__set__data(_dataArray);
        itemList[i] = _loc3;
        itemY = itemY + (_loc2._height + rowSpacing);
    } // End of the function
    function storeDataChange(dataIndex, value)
    {
        var _loc2 = 3;
        dataList[dataIndex][_loc2] = value;
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
} // End of Class
#endinitclip
