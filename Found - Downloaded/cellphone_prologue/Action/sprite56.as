// Action script...

// [Initial MovieClip Action of sprite 56]
#initclip 2
class com.rockstargames.ui.core.PhoneUIComponent extends MovieClip
{
    var dataProviderUI, linkageKey, container, removeMovieClip, header, headerTextfield, numberOfColumns, numberOfVisibleRows, offsetX, offsetY, levelDepth, needsScrollbars;
    function PhoneUIComponent()
    {
        super();
        dataProviderUI = new Array();
    } // End of the function
    function construct(parentContainer, linkageID, params)
    {
        linkageKey = linkageID;
        if (container)
        {
            this.removeMovieClip();
        } // end if
        container = parentContainer.createEmptyMovieClip("container", 1000);
        if (header)
        {
            header.removeMovieClip();
        } // end if
        header = container.attachMovie("header", "header", 1100);
        headerTextfield = header.headerText;
        container._x = 0;
        if (params.numberOfColumns)
        {
            numberOfColumns = params.numberOfColumns;
        } // end if
        if (params.numberOfVisibleRows)
        {
            numberOfVisibleRows = params.numberOfVisibleRows;
        } // end if
        if (params.rowSpace)
        {
            rowSpace = params.rowSpace;
        } // end if
        if (params.dataProviderUI)
        {
            dataProviderUI = params.dataProviderUI;
        } // end if
        if (params.offsetX)
        {
            offsetX = params.offsetX;
        } // end if
        if (params.offsetY)
        {
            offsetY = params.offsetY;
        } // end if
        if (params.levelDepth)
        {
            levelDepth = params.levelDepth;
        } // end if
        if (params.columnSpace)
        {
            columnSpace = params.columnSpace;
        } // end if
        if (params.isLandscape)
        {
            isLandscape = params.isLandscape;
        } // end if
        if (numberOfVisibleRows >= dataProviderUI.length)
        {
            numberOfVisibleRows = dataProviderUI.length;
            needsScrollbars = false;
        }
        else
        {
            needsScrollbars = true;
        } // end else if
    } // End of the function
    function renderContainers()
    {
    } // End of the function
    function update()
    {
    } // End of the function
    function populateContent()
    {
    } // End of the function
    function navigate(direction)
    {
    } // End of the function
    function SET_HEADER(headerText, X, Y, Col)
    {
        header._x = X;
        header._y = Y;
        headerTextfield.text = headerText;
    } // End of the function
    function TXD_HAS_LOADED()
    {
    } // End of the function
    function SHOW()
    {
        container._visible = true;
    } // End of the function
    function HIDE()
    {
        container._visible = false;
    } // End of the function
    function REMOVE()
    {
        dataProviderUI = [];
        for (var _loc2 in container)
        {
            if (typeof(container[_loc2]) == "movieclip")
            {
                container[_loc2].removeMovieClip();
                continue;
            } // end if
            delete container[_loc2];
        } // end of for...in
        container.removeMovieClip();
    } // End of the function
    function CLEAN_UP_DATA()
    {
        dataProviderUI = [];
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (currentSelection);
    } // End of the function
    var rowSpace = 0;
    var currentSelection = -1;
    var _UIColours = new Array();
    var columnSpace = 0;
    var isLandscape = false;
    var phoneWidth = 256;
    var offSCreenLeftX = -256;
    var offSCreenRightX = 256;
    var onSCreenX = 0;
    var phoneHeight = 344;
} // End of Class
#endinitclip
