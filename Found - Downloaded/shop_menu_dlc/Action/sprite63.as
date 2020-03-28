// Action script...

// [Initial MovieClip Action of sprite 63]
#initclip 11
class com.rockstargames.gtav.levelDesign.ShopView extends com.rockstargames.ui.components.GUIView
{
    var direction, dataList, itemList, highlightedItem, viewLinkageList, viewContainer, itemY, rowSpacing, _highlighted, __get__index, __get__highlighted, __set__highlighted;
    function ShopView()
    {
        super();
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
        itemY = itemY + (22 + rowSpacing);
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            itemList[_loc2].highlighted = _loc2 == this.__get__index();
        } // end of for
        //return (this.highlighted());
        null;
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
    var selectableList = new Array();
} // End of Class
#endinitclip
