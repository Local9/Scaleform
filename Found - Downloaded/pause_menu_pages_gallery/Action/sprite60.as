// Action script...

// [Initial MovieClip Action of sprite 60]
#initclip 20
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_GALLERY extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var timelineMC, columnList, addColumn, column1, setupColumns, showColumns;
    function PAUSE_MENU_PAGES_GALLERY()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        timelineMC = mc;
        columnList = new Array();
        this.setupPage();
        this.stateChanged(0);
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column1 = this.addColumn("spGallery", 1, 0);
        this.setupColumns(column1);
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1];
        this.showColumns();
    } // End of the function
    function onPageExit()
    {
        column1.ON_DESTROY();
    } // End of the function
} // End of Class
#endinitclip
