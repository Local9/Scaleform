// Action script...

// [Initial MovieClip Action of sprite 72]
#initclip 10
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRanksView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, __get__params, __set__params;
    function PauseMenuCrewRanksView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc3 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc3._y = itemY;
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewRankItem)(_loc3);
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
    var titleHeight = 25;
} // End of Class
#endinitclip
