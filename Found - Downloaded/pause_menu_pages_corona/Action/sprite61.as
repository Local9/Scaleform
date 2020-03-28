// Action script...

// [Initial MovieClip Action of sprite 61]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CORONA extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, column3, column4, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_CORONA()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("freemodeList", 1, 0);
        column2 = this.addColumn("freemodeDetails", 2, 580);
        column3 = this.addColumn("freemodeMap", 3, 580);
        column4 = this.addColumn("mpFriendsList", 4, 290);
        this.setupColumns(column1, column2, column3, column4);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1, column2, column3, column4];
        this.showColumns();
    } // End of the function
    function onPageExit()
    {
        column2.ON_DESTROY();
    } // End of the function
} // End of Class
#endinitclip
