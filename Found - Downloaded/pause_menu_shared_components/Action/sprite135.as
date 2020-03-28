// Action script...

// [Initial MovieClip Action of sprite 135]
#initclip 17
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListDoubleItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem
{
    var index, menuID, uniqueID, type, initialIndex, isSelectable, _data, bgMC, blipLayer, labelMC, itemTextLeft, __get__data, __set__data;
    function PauseMenuTextListDoubleItem()
    {
        super();
    } // End of the function
    function PauseMenuTextListItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        index = _d[0];
        menuID = _d[1];
        uniqueID = _d[2];
        type = _d[3];
        initialIndex = _d[4];
        isSelectable = _d[5];
        if (_d.length >= 7)
        {
            _data = _d.slice(6);
        } // end if
        bgMC._visible = false;
        if (blipLayer != undefined)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = labelMC.createEmptyMovieClip("blipLayer", 1000);
        itemTextLeft.autoSize = true;
        var _loc3 = new com.rockstargames.ui.utils.Text();
        _loc3.setTextWithIcons(_data[0], blipLayer, itemTextLeft, 0, 13, 4.500000, false);
        this.snapBGGrid(bgMC);
        //return (this.data());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        var _loc4 = Math.ceil(itemTextLeft.textHeight / 27);
        var _loc3 = itemTextLeft._height;
        var _loc2 = itemTextLeft._y * 2 + _loc3;
        bgMC._height = _loc2;
    } // End of the function
} // End of Class
#endinitclip
