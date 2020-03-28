// Action script...

// [Initial MovieClip Action of sprite 44]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_STATS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, column3, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_STATS()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("statsVerticalMenuList", 1, 0);
        column2 = this.addColumn("statsList", 2, 290);
        column3 = this.addColumn("spPlayerStatsList", 3, 290);
        this.setupColumns(column1, column2, column3);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1, column2, column3];
        this.showColumns();
        column3.SHOW_COLUMN(false);
    } // End of the function
} // End of Class
#endinitclip
