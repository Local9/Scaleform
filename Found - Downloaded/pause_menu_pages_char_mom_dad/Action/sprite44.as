// Action script...

// [Initial MovieClip Action of sprite 44]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CHAR_MOM_DAD extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column1, column2, column3, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_CHAR_MOM_DAD()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("heritageCard", 1, 0);
        column2 = this.addColumn("lifestyleStatsList", 2, 290);
        column3 = this.addColumn("characterCard", 3, 580);
        this.setupColumns(column1, column2, column3);
    } // End of the function
    function stateChanged(id)
    {
        columnList = [column1, column2, column3];
        this.showColumns();
    } // End of the function
} // End of Class
#endinitclip
