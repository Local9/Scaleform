// Action script...

// [Initial MovieClip Action of sprite 41]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage extends MovieClip
{
    var timelineMC, pageMC;
    function PauseMenuBasePage()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        timelineMC = mc;
        columnList = new Array();
    } // End of the function
    function setupPage()
    {
        if (pageMC != undefined)
        {
            pageMC.removeMovieClip();
        } // end if
        pageMC = timelineMC.createEmptyMovieClip("pageMC", 1);
    } // End of the function
    function setupColumns()
    {
        for (var _loc3 = 0; _loc3 < arguments.length; ++_loc3)
        {
            var _loc4 = arguments[_loc3];
            _loc4.INITIALISE();
            columnList[_loc3] = _loc4;
        } // end of for
        this.hideColumns();
    } // End of the function
    function setScaledContent()
    {
    } // End of the function
    function setDisplayConfig()
    {
    } // End of the function
    function setupScroll(visible, columnIndex, columns, scrollType, arrowPosition, override, columnXOffset)
    {
        var _loc2 = this["column" + columnIndex];
        _loc2.INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, columnXOffset);
    } // End of the function
    function stateChanged(id)
    {
        this.hideColumns();
    } // End of the function
    function addColumn(linkageID, depth, xpos)
    {
        var _loc2 = pageMC.attachMovie(linkageID, "c" + depth + "MC", depth, {_x: xpos});
        return ((com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)(_loc2));
    } // End of the function
    function getColumn(i)
    {
        return ((com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)(columnList[i]));
    } // End of the function
    function getMaxColumns()
    {
        return (columnList.length);
    } // End of the function
    function hideColumns()
    {
        for (var _loc2 in columnList)
        {
            columnList[_loc2]._visible = false;
        } // end of for...in
        columnList = [];
    } // End of the function
    function showColumns()
    {
        for (var _loc2 in columnList)
        {
            columnList[_loc2]._visible = true;
        } // end of for...in
    } // End of the function
    function onPageExit()
    {
        var _loc3 = columnList.length;
        for (var _loc2 = 0; _loc2 < _loc3; ++_loc2)
        {
            (com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase)(columnList[_loc2]).ON_DESTROY();
        } // end of for
    } // End of the function
    var columnList = new Array();
} // End of Class
#endinitclip
