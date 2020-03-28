// Action script...

// [Initial MovieClip Action of sprite 166]
#initclip 13
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_PLAYER_COMPARISON_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.MP_PLAYER_CARD
{
    var CONTENT;
    function PAUSE_MP_MENU_PLAYER_COMPARISON_CARD()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc, true);
    } // End of the function
    function SET_TITLE(title)
    {
        super.SET_TITLE.apply(this, arguments);
        com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.titleTF, title, true);
    } // End of the function
} // End of Class
#endinitclip
