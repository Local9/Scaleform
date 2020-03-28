// Action script...

// [Initial MovieClip Action of sprite 167]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_INFO extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, column3, column4, column5, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_INFO()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("verticalMenuList", 1, 0);
        column2 = this.addColumn("missionHelpList", 2, 290);
        column3 = this.addColumn("rockstarNewswire", 3, 290);
        column4 = this.addColumn("dialogueList", 4, 290);
        column5 = this.addColumn("feedList", 5, 290);
        this.setupColumns(column1, column2, column3, column4, column5);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        switch (id)
        {
            case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_FEED:
            {
                columnList = [column1, column5];
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_NEWSWIRE:
            {
                columnList = [column1, column3];
                column5.ON_DESTROY();
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_BRIEF:
            {
                columnList = [column1, column4];
                column5.ON_DESTROY();
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_MISSION:
            case com.rockstargames.gtav.constants.PauseMenuLUT.HOME_HELP:
            case com.rockstargames.gtav.constants.PauseMenuLUT.INFO:
            default:
            {
                columnList = [column1, column2];
                column5.ON_DESTROY();
                break;
            } 
        } // End of switch
        this.showColumns();
    } // End of the function
} // End of Class
#endinitclip
