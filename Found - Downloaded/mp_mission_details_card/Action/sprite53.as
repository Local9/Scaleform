// Action script...

// [Initial MovieClip Action of sprite 53]
#initclip 14
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTitleItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var bgMC, __get__data, itemTextLeft, __set__data;
    function PauseMenuTitleItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        this.snapBGGrid(bgMC);
        //return (this.data());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        var _loc2 = Math.ceil(itemTextLeft.textHeight / 27);
        bgMC._height = _loc2 * 27 - 2;
    } // End of the function
    function highlightTitle(_h)
    {
        super.__set__highlighted(_h);
    } // End of the function
} // End of Class
#endinitclip
