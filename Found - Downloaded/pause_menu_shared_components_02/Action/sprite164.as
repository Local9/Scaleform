// Action script...

// [Initial MovieClip Action of sprite 164]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var bgMC, viewContainer, __get__params, itemY, rowSpacing, viewLinkageList, visibleItems, itemList, dataList, topEdge, highlightedItem, __set__params;
    function PauseMenuSettingsView()
    {
        super();
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        if (bgMC == undefined)
        {
            bgMC = viewContainer.attachMovie("settingsBg", "settingsBgMC", -1);
            var _loc3 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
            bgMC._visible = false;
        } // end if
        //return (this.params());
        null;
    } // End of the function
    function displayView()
    {
        super.displayView();
        bgMC._height = itemY - rowSpacing;
        bgMC._visible = true;
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc3 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc3._y = itemY;
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem)(_loc3);
        _loc2.initStoreMethod(storeDataChange, this);
        _loc2.__set__isLastItem(i + 1 == visibleItems);
        _loc2.__set__data(_dataArray);
        itemList[i] = _loc2;
        itemY = itemY + (_loc3.bgMC._height + rowSpacing);
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
