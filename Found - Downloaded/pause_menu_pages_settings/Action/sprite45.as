// Action script...

// [Initial MovieClip Action of sprite 45]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase extends com.rockstargames.ui.components.GUIView
{
    var visibleItems, __get__params, __set__params;
    function PauseMenuViewBase()
    {
        super();
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        maxVisibleItems = visibleItems;
        //return (this.params());
        null;
    } // End of the function
    function displayView()
    {
        visibleItems = maxVisibleItems;
        super.displayView();
    } // End of the function
    var maxVisibleItems = 16;
} // End of Class
#endinitclip
