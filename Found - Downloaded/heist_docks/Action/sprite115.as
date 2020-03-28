// Action script...

// [Initial MovieClip Action of sprite 115]
#initclip 6
class com.rockstargames.ui.components.GUIView
{
    var viewContainer, __get__params, __get__index, __get__maxitems, __get__highlighted, __set__highlighted, __set__index, __set__params;
    function GUIView(_mc)
    {
        dataList = new Array();
        itemList = new Array();
        viewLinkageList = new Array();
    } // End of the function
    function displayView()
    {
        if (itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE)
        {
            if (dataList.length < visibleItems)
            {
                visibleItems = dataList.length;
            } // end if
        } // end if
        if (itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE)
        {
            visibleItems = dataList.length;
        } // end if
        itemY = 0;
        for (var _loc2 = 0; _loc2 < dataList.length; ++_loc2)
        {
            if (_loc2 < visibleItems || itemSelectStyle == com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE)
            {
                this.addDisplayItem(_loc2, dataList[_loc2]);
            } // end if
        } // end of for
    } // End of the function
    function addItem(i, _dataArray)
    {
        dataList[i] = _dataArray;
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
    function addDisplayItemOnce(i, _dataArray)
    {
        if (itemSelectStyle == com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE)
        {
            if (dataList.length > visibleItems)
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
    function set params(_p)
    {
        var _loc3 = _p.container;
        var _loc4 = _loc3.getNextHighestDepth();
        viewContainer = _loc3.createEmptyMovieClip("dataViewMC" + _loc4, _loc4);
        if (_p.id != undefined)
        {
            viewID = _p.id;
        } // end if
        if (_p.linkage != undefined)
        {
            viewLinkageList = _p.linkage;
        } // end if
        if (_p.x != undefined)
        {
            viewContainer._x = viewContainerX = _p.x;
        } // end if
        if (_p.y != undefined)
        {
            viewContainer._y = viewContainerY = _p.y;
        } // end if
        if (_p.maskHeight != undefined)
        {
            viewMaskHeight = _p.maskHeight;
        } // end if
        if (_p.rowSpacing != undefined)
        {
            rowSpacing = _p.rowSpacing;
        } // end if
        if (_p.columnSpacing != undefined)
        {
            columnSpacing = _p.columnSpacing;
        } // end if
        if (_p.selectstyle != undefined)
        {
            itemSelectStyle = _p.selectstyle;
        } // end if
        if (_p.visibleItems != undefined && itemSelectStyle != com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE)
        {
            visibleItems = _p.visibleItems;
        } // end if
        _params = _p;
        //return (this.params());
        null;
    } // End of the function
    function get params()
    {
        return (_params);
    } // End of the function
    function updateParams(_p)
    {
        if (_p.id != undefined)
        {
            viewID = _params.id = _p.id;
        } // end if
        if (_p.linkage != undefined)
        {
            viewLinkageList = _params.linkage = _p.linkage;
        } // end if
        if (_p.x != undefined)
        {
            viewContainer._x = viewContainerX = _params.x = _p.x;
        } // end if
        if (_p.y != undefined)
        {
            viewContainer._y = viewContainerY = _params.y = _p.y;
        } // end if
        if (_p.maskHeight != undefined)
        {
            viewMaskHeight = _params.maskHeight = _p.maskHeight;
        } // end if
        if (_p.rowSpacing != undefined)
        {
            rowSpacing = _params.rowSpacing = _p.rowSpacing;
        } // end if
        if (_p.columnSpacing != undefined)
        {
            columnSpacing = _params.columnSpacing = _p.columnSpacing;
        } // end if
        if (_p.selectstyle != undefined)
        {
            itemSelectStyle = _params.selectstyle = _p.selectstyle;
        } // end if
        if (_p.visibleItems != undefined && itemSelectStyle != com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE)
        {
            visibleItems = _params.visibleItems = _p.visibleItems;
        } // end if
    } // End of the function
    function get index()
    {
        return (_index);
    } // End of the function
    function set index(_i)
    {
        switch (itemSelectStyle)
        {
            case com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE:
            {
                this.focusHighlightStyle(_i);
                break;
            } 
            case com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE:
            {
                this.lockedHighlightStyle(_i);
                break;
            } 
            case com.rockstargames.ui.components.GUIView.REORDER_SELECTSTYLE:
            {
                this.reorderHighlightStyle(_i);
                break;
            } 
            case com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE:
            {
                this.scrollHighlightStyle(_i);
                break;
            } 
            case com.rockstargames.ui.components.GUIView.SCROLLALL_SELECTSTYLE:
            {
                this.scrollAllHighlightStyle(_i);
                break;
            } 
        } // End of switch
        _index = _i;
        //return (this.index());
        null;
    } // End of the function
    function direction(targetIndex)
    {
        var _loc2 = targetIndex - _index;
        if (this.__get__maxitems() > 1)
        {
            if (targetIndex == 0 && _index == this.__get__maxitems() - 1)
            {
                _loc2 = 1;
            } // end if
            if (targetIndex == this.__get__maxitems() - 1 && _index == 0)
            {
                _loc2 = -1;
            } // end if
        } // end if
        return (_loc2);
    } // End of the function
    function focusHighlightStyle(targetIndex)
    {
        var _loc3;
        var _loc2 = 0;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            _loc3 = itemList[_loc2];
            _loc3.__set__highlighted(_loc2 == targetIndex);
        } // end of for
        highlightedItem = targetIndex;
    } // End of the function
    function lockedHighlightStyle(targetIndex)
    {
        itemList[0].highlighted = true;
        var _loc3 = this.direction(targetIndex);
        if (_loc3 != 0)
        {
            _loc3 == 1 ? (dataList.splice(this.__get__maxitems(), 0, dataList.shift())) : (dataList.splice(0, 0, dataList.pop()));
            var _loc2 = 0;
            for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
            {
                itemList[_loc2].data = dataList[_loc2];
            } // end of for
        } // end if
    } // End of the function
    function reorderHighlightStyle(targetIndex)
    {
        var _loc5 = this.direction(targetIndex);
        if (_loc5 != 0)
        {
            var _loc3 = targetIndex;
            if (_loc3 > dataList.length - itemList.length)
            {
                targetIndex = dataList.length - itemList.length;
            } // end if
            _loc3 = _loc3 - targetIndex;
            var _loc2 = 0;
            for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
            {
                itemList[_loc2].data = dataList[_loc2 + targetIndex];
                itemList[_loc2].highlighted = _loc3 == _loc2;
            } // end of for
            highlightedItem = _loc3;
        } // end if
    } // End of the function
    function scrollHighlightStyle(targetIndex)
    {
        var _loc5 = this.direction(targetIndex);
        if (_loc5 != 0)
        {
            var _loc3 = targetIndex;
            var _loc2 = 0;
            var _loc4 = 0;
            if (_loc5 > 0)
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
        } // end if
    } // End of the function
    function scrollAllHighlightStyle(targetIndex)
    {
        var _loc8 = this.direction(targetIndex);
        if (_loc8 != 0)
        {
            var _loc6 = (com.rockstargames.ui.components.GUIMenuItem)(itemList[targetIndex]);
            var _loc4 = 0;
            var _loc5 = _loc6._y + _loc6._height - rowSpacing;
            var _loc7 = _loc6._y;
            if (_loc8 > 0)
            {
                if (_loc5 > topEdge + viewMaskHeight)
                {
                    _loc4 = viewMaskHeight - _loc5;
                    topEdge = _loc5 - viewMaskHeight;
                    viewContainer._y = _loc4;
                }
                else if (_index == itemList.length - 1 && targetIndex == 0)
                {
                    _loc4 = 0;
                    topEdge = 0;
                    viewContainer._y = _loc4;
                } // end else if
            }
            else if (_loc7 < topEdge)
            {
                _loc4 = -_loc7;
                topEdge = _loc7;
                viewContainer._y = _loc4;
            }
            else if (_index == 0 && targetIndex == itemList.length - 1)
            {
                _loc4 = viewMaskHeight - _loc5;
                topEdge = viewContainer._height - viewMaskHeight;
                viewContainer._y = _loc4;
            } // end else if
            var _loc2 = 0;
            for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
            {
                itemList[_loc2].highlighted = _loc2 == targetIndex;
            } // end of for
            highlightedItem = targetIndex;
        } // end if
    } // End of the function
    function get maxitems()
    {
        _maxitems = dataList.length;
        return (_maxitems);
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            itemList[_loc2].highlighted = false;
        } // end of for
        //return (this.highlighted());
        null;
    } // End of the function
    function get highlighted()
    {
        return (_highlighted);
    } // End of the function
    function destroy()
    {
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            itemList[_loc2].removeMovieClip();
        } // end of for
        itemList = [];
        dataList = [];
    } // End of the function
    var viewID = 0;
    var viewIndex = 0;
    var viewContainerX = 0;
    var viewContainerY = 0;
    var viewMaskHeight = 0;
    var viewLinkageList = new Array();
    var rowSpacing = 10;
    var columnSpacing = 10;
    var itemY = 0;
    var visibleItems = 1;
    var highlightedItem = 0;
    var _highlighted = false;
    var _index = 0;
    var _maxitems = 0;
    var _params = 0;
    var itemList = new Array();
    var dataList = new Array();
    var itemSelectStyle = 0;
    static var FOCUS_SELECTSTYLE = 0;
    static var LOCKED_SELECTSTYLE = 1;
    static var REORDER_SELECTSTYLE = 2;
    static var SCROLL_SELECTSTYLE = 3;
    static var SCROLLALL_SELECTSTYLE = 4;
    var topEdge = 0;
} // End of Class
#endinitclip
