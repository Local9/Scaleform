// Action script...

// [Initial MovieClip Action of sprite 37]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_GAME extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, column3, column4, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_GAME()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("replayMenuList", 1, 0);
        column2 = this.addColumn("settingsList", 2, 290);
        column3 = this.addColumn("replayMenuList", 3, 290);
        column4 = this.addColumn("missionReplayCard", 4, 580);
        this.setupColumns(column1, column2, column3, column4);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        com.rockstargames.ui.utils.Debug.log("My state is " + id);
        switch (id)
        {
            case com.rockstargames.gtav.constants.PauseMenuLUT.GAME:
            case com.rockstargames.gtav.constants.PauseMenuLUT.NEW_GAME:
            {
                columnList = [column1];
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.LOAD_GAME:
            case com.rockstargames.gtav.constants.PauseMenuLUT.SAVE_GAME_LIST:
            {
                columnList = [column1, column2];
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.REPLAY_RANDOM:
            case com.rockstargames.gtav.constants.PauseMenuLUT.REPLAY_MISSION:
            case com.rockstargames.gtav.constants.PauseMenuLUT.REPLAY_MISSION_LIST:
            case com.rockstargames.gtav.constants.PauseMenuLUT.REPLAY_MISSION_ACTIVITY:
            default:
            {
                columnList = [column1, column3, column4];
                break;
            } 
        } // End of switch
        this.showColumns();
    } // End of the function
} // End of Class
#endinitclip
