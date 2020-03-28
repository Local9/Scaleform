// Action script...

// [Initial MovieClip Action of sprite 134]
#initclip 16
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var bgMC, __get__data, itemTextLeft, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function PauseMenuTextListItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        this.snapBGGrid(bgMC);
        bgMC._visible = false;
        //return (this.data());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        var _loc2 = Math.ceil(itemTextLeft.textHeight / 27);
        bgMC._height = _loc2 * 27 - 2;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
