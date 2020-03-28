// Action script...

// [Initial MovieClip Action of sprite 292]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_WEAPONS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_WEAPONS()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("mpWeapons", 1, 0);
        this.setupColumns(column1);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1];
        this.showColumns();
    } // End of the function
} // End of Class
#endinitclip
