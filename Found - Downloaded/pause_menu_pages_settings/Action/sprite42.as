// Action script...

// [Initial MovieClip Action of sprite 42]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_SETTINGS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_SETTINGS()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("verticalMenuList", 1, 0);
        column2 = this.addColumn("settingsList", 2, 290);
        this.setupColumns(column1, column2);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1, column2];
        switch (id)
        {
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS:
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_CONTROLS:
            {
                column2.SET_STATE(com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_CONTROLS);
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_FACEBOOK:
            {
                column2.SET_STATE(com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL);
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_AUDIO:
            {
                column2.SET_STATE(com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_AUDIO);
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_DISPLAY:
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_SIXAXIS:
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_SAVEGAME:
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_FEED:
            case com.rockstargames.gtav.constants.PauseMenuLUT.SETTINGS_CAMERA:
            {
                column2.SET_STATE(0);
                break;
            } 
            default:
            {
                break;
            } 
        } // End of switch
        this.showColumns();
    } // End of the function
} // End of Class
#endinitclip
