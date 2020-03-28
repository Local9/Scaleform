// Action script...

// [Initial MovieClip Action of sprite 146]
#initclip 5
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, dataList, itemSelectStyle, visibleItems, maxVisibleItems, _index, topEdge, highlightedItem;
    function PauseMenuMapView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc2._y = itemY;
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapItem)(_loc2);
        _loc3.initStoreMethod(storeDataChange, this);
        _loc3.__set__data(_dataArray);
        itemList[i] = _loc3;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function storeDataChange(dataIndex, paramIndex, value)
    {
        dataList[dataIndex][paramIndex] = value;
    } // End of the function
    function addDisplayItemOnce(i, _dataArray)
    {
        if (itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE)
        {
            if (dataList.length > visibleItems && dataList.length <= maxVisibleItems)
            {
                visibleItems = dataList.length;
            } // end if
        } // end if
        if (itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE)
        {
            visibleItems = dataList.length;
        } // end if
        this.addDisplayItem(i, dataList[i]);
    } // End of the function
    function jumpTo(targetIndex)
    {
        _index = targetIndex;
        var _loc4;
        var _loc3;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            _loc4 = itemList[_loc2];
            _loc3 = targetIndex == _loc2;
            if (_loc4.__get__highlighted() != _loc3)
            {
                _loc4.__set__highlighted(_loc3);
            } // end if
        } // end of for
    } // End of the function
    function scrollHighlightStyle(targetIndex)
    {
        targetIndex = Math.max(0, Math.min(targetIndex, dataList.length - 1));
        var _loc2 = 0;
        var _loc6 = 0;
        if (targetIndex > topEdge + visibleItems - 1)
        {
            _loc6 = _loc6 + (targetIndex - (visibleItems - 1));
            topEdge = _loc6;
            targetIndex = visibleItems - 1;
        }
        else if (targetIndex < topEdge)
        {
            _loc6 = targetIndex;
            topEdge = _loc6;
            targetIndex = 0;
        }
        else
        {
            _loc6 = topEdge;
            targetIndex = targetIndex - topEdge;
        } // end else if
        var _loc3;
        var _loc4;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            _loc3 = itemList[_loc2];
            _loc3.__set__data(dataList[_loc6 + _loc2]);
            _loc4 = targetIndex == _loc2;
            if (_loc3.__get__highlighted() != _loc4)
            {
                _loc3.__set__highlighted(_loc4);
            } // end if
        } // end of for
        highlightedItem = targetIndex;
    } // End of the function
} // End of Class
#endinitclip
