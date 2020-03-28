// Action script...

// [Initial MovieClip Action of sprite 127]
#initclip 14
class com.rockstargames.ui.loadingScreens.LoadScreenView extends com.rockstargames.ui.components.GUIView
{
    var itemList, dataList, topEdge, viewLinkageList, viewContainer, itemY, rowSpacing, direction, visibleItems, viewIndex, highlightedItem;
    function LoadScreenView()
    {
        super();
    } // End of the function
    function destroy()
    {
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            itemList[_loc2].removeMovieClip();
        } // end of for
        itemList = [];
        dataList = [];
        topEdge = 0;
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        if (viewLinkageList[i] == undefined)
        {
            viewLinkageList[i] = viewLinkageList[i - 1];
        } // end if
        var _loc4 = viewLinkageList[i];
        var _loc3 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc3._y = itemY;
        var _loc5 = (com.rockstargames.ui.components.GUIMenuItem)(_loc3);
        _loc5.__set__data(_dataArray);
        itemList[i] = _loc5;
        itemY = itemY + (_loc3._height + rowSpacing);
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
                    _loc4 = 0;
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
            if (viewIndex == 0)
            {
                if (_loc6 < -2)
                {
                    _loc3 = 1;
                    _loc4 = 0;
                    topEdge = 0;
                } // end if
                if (_loc6 > 2)
                {
                    var _loc7 = visibleItems - 1;
                    _loc3 = _loc7;
                    _loc4 = topEdge = dataList.length - _loc7 - 1;
                } // end if
            } // end if
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
} // End of Class
#endinitclip
