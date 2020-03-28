// Action script...

// [Initial MovieClip Action of sprite 65]
#initclip 3
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var _sidecarColumn, highlightedItem, __get__sidecarColumn, viewLinkageList, viewContainer, itemY, itemList, rowSpacing, __get__params, direction, topEdge, visibleItems, dataList, __set__params, __set__sidecarColumn;
    function PauseMenuCrewListView()
    {
        super();
    } // End of the function
    function get sidecarColumn()
    {
        return (_sidecarColumn);
    } // End of the function
    function set sidecarColumn(newSidecar)
    {
        _sidecarColumn = newSidecar;
        if (_sidecarColumn != undefined)
        {
            _sidecarColumn.__set__index(highlightedItem);
        } // end if
        //return (this.sidecarColumn());
        null;
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc3 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc3._y = itemY;
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListItem)(_loc3);
        _loc2.__set__data(_dataArray);
        itemList[i] = _loc2;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        if (_p.titleHeight != undefined)
        {
            titleHeight = _p.titleHeight;
        } // end if
        //return (this.params());
        null;
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
        if (_sidecarColumn != undefined)
        {
            _sidecarColumn.__set__index(highlightedItem);
        } // end if
    } // End of the function
    var titleHeight = 25;
} // End of Class
#endinitclip
