// Action script...

// [Initial MovieClip Action of sprite 58]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CORONA_RACE extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, column3, column4, column5, column6, column7, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_CORONA_RACE()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("freemodeList", 1, 0);
        column2 = this.addColumn("mpMMCard", 2, 554);
        column3 = this.addColumn("mpPlayerCard", 3, 580);
        column4 = this.addColumn("mpMMVehicleInfo", 4, 0);
        column5 = this.addColumn("playerComparisonCard", 5, 580);
        column6 = this.addColumn("playerComparisonCard", 6, 725);
        column7 = this.addColumn("freemodeList", 7, 290);
        this.setupColumns(column1, column2, column3, column4, column5, column6, column7);
    } // End of the function
    function stateChanged(id)
    {
        if (!firstRun)
        {
            super.stateChanged(id);
            columnList = [column1, column2, column3, column4, column5, column6, column7];
            this.showColumns();
            column3.SHOW_COLUMN(false);
            column5.SHOW_COLUMN(false);
            column6.SHOW_COLUMN(false);
            firstRun = true;
        } // end if
    } // End of the function
    var firstRun = false;
} // End of Class
#endinitclip
