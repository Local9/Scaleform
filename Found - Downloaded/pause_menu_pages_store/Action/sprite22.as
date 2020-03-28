// Action script...

// [Initial MovieClip Action of sprite 22]
#initclip 20
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_STORE extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, storeNewsColumn, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_STORE()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        storeNewsColumn = this.addColumn("storeNews", 1, 0);
        this.setupColumns(storeNewsColumn);
    } // End of the function
    function stateChanged(id)
    {
        columnList = [storeNewsColumn];
        this.showColumns();
    } // End of the function
} // End of Class
#endinitclip
