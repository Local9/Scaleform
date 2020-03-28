// Action script...

// [Initial MovieClip Action of sprite 47]
#initclip 15
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFriendsStatsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var medalMC, labelMC, itemTextRight, __get__data, initialIndex, bgMC, snapBGGrid, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function PauseMenuFriendsStatsItem()
    {
        super();
        medalMC._visible = false;
        itemTextRight = labelMC.valueTF;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        if (this.__get__data()[1] != undefined && this.__get__data()[1] != "")
        {
            com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, this.__get__data()[1], true);
        } // end if
        if (initialIndex == 0)
        {
            bgMC._visible = false;
        } // end if
        this.snapBGGrid(bgMC);
        var _loc3 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_30;
        com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3[1], _loc3[2], _loc3[3], _loc3[4]);
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        var _loc2 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.WHITE;
        if (_h)
        {
            var _loc3 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK;
            com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc3[1], _loc3[2], _loc3[3], _loc3[4]);
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc2[1], _loc2[2], _loc2[3], _loc2[4]);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2[1], _loc2[2], _loc2[3], _loc2[4]);
            var _loc4 = com.rockstargames.gtav.constants.PauseMenuColoursLUT.BLACK_ALPHA_30;
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc4[1], _loc4[2], _loc4[3], _loc4[4]);
        } // end else if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
