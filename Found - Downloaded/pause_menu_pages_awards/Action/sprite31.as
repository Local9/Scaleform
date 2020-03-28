// Action script...

// [Initial MovieClip Action of sprite 31]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_AWARDS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_AWARDS()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("verticalMenuList", 1, 0);
        column2 = this.addColumn("mpAwards", 2, 290);
        this.setupColumns(column1, column2);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1, column2];
        this.showColumns();
    } // End of the function
    function onPageExit()
    {
        column2.ON_DESTROY();
    } // End of the function
} // End of Class
#endinitclip
