// Action script...

// [Initial MovieClip Action of sprite 20]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CORONA_PLAYERS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, column3, column4, column5, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_CORONA_PLAYERS()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("mpFriendsList", 1, 0);
        column2 = this.addColumn("mpPlayerModel", 2, 290);
        column3 = this.addColumn("mpPlayerCard", 3, 580);
        column4 = this.addColumn("playerComparisonCard", 4, 580);
        column5 = this.addColumn("playerComparisonCard", 5, 725);
        this.setupColumns(column1, column2, column3, column4, column5);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1, column2, column3, column4, column5];
        this.showColumns();
        column4.SHOW_COLUMN(false);
        column5.SHOW_COLUMN(false);
    } // End of the function
    function onPageExit()
    {
        column3.ON_DESTROY();
    } // End of the function
} // End of Class
#endinitclip
