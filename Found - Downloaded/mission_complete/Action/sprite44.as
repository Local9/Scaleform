// Action script...

// [Initial MovieClip Action of sprite 44]
#initclip 11
class com.rockstargames.gtav.levelDesign.MissionCompleteView extends com.rockstargames.ui.components.GUIView
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, dataList;
    function MissionCompleteView()
    {
        super();
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
        itemY = itemY + (_loc3.bgMC._height + rowSpacing);
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
