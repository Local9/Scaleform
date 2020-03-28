// Action script...

// [Initial MovieClip Action of sprite 38]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_MISSIONCREATOR extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, column3, column4, column5, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_MISSIONCREATOR()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("freemodeList", 1, 0);
        column2 = this.addColumn("freemodeList", 2, 290);
        column3 = this.addColumn("freemodeDetails", 3, 580);
        column4 = this.addColumn("freemodeList", 4, 580);
        column5 = this.addColumn("settingsList", 5, 290);
        this.setupColumns(column1, column2, column3, column4, column5);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1, column2, column3, column4, column5];
        this.showColumns();
    } // End of the function
} // End of Class
#endinitclip
