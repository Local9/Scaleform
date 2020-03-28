// Action script...

// [Initial MovieClip Action of sprite 21]
#initclip 1
class com.rockstargames.gtav.cellphone.apps.APP_ScrollingList extends MovieClip
{
    var dataProviderUI, CONTENT, currentID, linkageID, container, row, scrollBarTimeout, scrollBar, gfxFileName, whiteRGB, _name, offWhiteRGB, currentStyle, currentItem, previousItem;
    function APP_ScrollingList()
    {
        super();
        dataProviderUI = new Array();
        CONTENT = this;
        if (currentID == undefined)
        {
            currentID = 0;
        } // end if
        currentSelection = currentID;
    } // End of the function
    function construct(parentContainer, linkage, params)
    {
        dataProviderUI = params;
        linkageID = linkage;
        container.removeMovieClip();
        container = parentContainer.createEmptyMovieClip("container", parentContainer.getNextHighestDepth());
        row = 1;
        arrayStartPoint = 0;
        if (dataProviderUI.length > 0)
        {
            if (numberOfVisibleRows >= dataProviderUI.length)
            {
                numberOfVisibleRows = dataProviderUI.length;
                needsScrollbars = false;
            }
            else
            {
                needsScrollbars = true;
            } // end else if
        }
        else
        {
            numberOfVisibleRows = 0;
            currentSelection = 0;
        } // end else if
        com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG", com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE, 9, currentSelection);
        clearInterval(scrollBarTimeout);
        scrollBar = new com.rockstargames.ui.controls.ScrollBar();
        scrollBar.construct(container, "scrubber", "gutter", scrollerX, offsetY, gutterHeight);
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, whiteRGB[0], whiteRGB[1], whiteRGB[2], 75);
            if (_name == "SETTINGS" || _name == "MISSION_REPEAT_LIST")
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, 0, 0, 0, 100);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
            } // end else if
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, 0, 0, 0, 50);
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, currentStyle[4][0], currentStyle[4][1], currentStyle[4][2], 100);
        } // end else if
        scrollBar.scrollBarContainer._alpha = 0;
        this.renderContainers();
        scrollBar.scrollBarContainer.swapDepths(scrollBar.scrollBarContainer.getDepth() + 100);
    } // End of the function
    function populateContent()
    {
    } // End of the function
    function renderContainers()
    {
        if (currentID == undefined)
        {
            currentID = 0;
        } // end if
        if (currentID >= dataProviderUI.length)
        {
            currentID = dataProviderUI.length - 1;
        } // end if
        var _loc5;
        var _loc6;
        _loc5 = offsetY;
        if (arrayStartPoint == undefined)
        {
            arrayStartPoint = 0;
        } // end if
        var _loc9 = arrayStartPoint;
        var _loc8 = numberOfVisibleRows - 1 + arrayStartPoint;
        if (currentID > _loc8 || currentID < _loc9)
        {
            var _loc7 = currentID - (numberOfVisibleRows - 1);
            if (_loc7 < 0)
            {
                _loc7 = 0;
            } // end if
            arrayStartPoint = _loc7;
        } // end if
        for (var _loc3 = 0; _loc3 < numberOfVisibleRows; ++_loc3)
        {
            var _loc2 = "listItem" + row;
            if (container[_loc2] != undefined)
            {
                container[_loc2].removeMovieClip();
            } // end if
            container[_loc2] = container.attachMovie(linkageID, _loc2, container.getNextHighestDepth());
            container[_loc2]._name = _loc2;
            container[_loc2]._x = container._x + offsetX;
            container[_loc2]._y = _loc5;
            _loc5 = _loc5 + (defaultRowHeight + rowSpace);
            var _loc4 = _loc3 + arrayStartPoint;
            if (_loc4 == currentID)
            {
                currentItem = container[_loc2];
                this.setState(currentItem, true);
                currentSelection = currentID;
                _loc6 = container[_loc2];
            }
            else
            {
                this.setState(container[_loc2], false);
            } // end else if
            _loc6 = container[_loc2];
            ++row;
        } // end of for
        this.populateContent();
    } // End of the function
    function navigate(direction)
    {
        this.setState(currentItem, false);
        previousItem = currentItem;
        var _loc3 = currentItem._name.split("listItem");
        var _loc2 = Number(_loc3[1]);
        var _loc4 = _loc2;
        switch (direction)
        {
            case "UP":
            {
                _loc2 = _loc4 - 1;
                this.setScrollBarVisibility(true);
                if (_loc2 < 1)
                {
                    if (arrayStartPoint < 1)
                    {
                        _loc2 = numberOfVisibleRows;
                        arrayStartPoint = dataProviderUI.length - numberOfVisibleRows;
                        this.populateContent();
                    }
                    else
                    {
                        --arrayStartPoint;
                        ++_loc2;
                        this.populateContent();
                    } // end if
                } // end else if
                break;
            } 
            case "DOWN":
            {
                _loc2 = _loc4 + 1;
                this.setScrollBarVisibility(true);
                if (_loc2 > numberOfVisibleRows)
                {
                    if (arrayStartPoint >= dataProviderUI.length - numberOfVisibleRows)
                    {
                        _loc2 = 1;
                        arrayStartPoint = 0;
                        this.populateContent();
                    }
                    else
                    {
                        ++arrayStartPoint;
                        --_loc2;
                        this.populateContent();
                    } // end if
                } // end else if
                break;
            } 
        } // End of switch
        currentItem = container["listItem" + _loc2];
        _loc3 = currentItem._name.split("listItem");
        var _loc6 = Number(_loc3[1]) + arrayStartPoint;
        currentSelection = _loc6 - 1;
        var _loc5 = this.getRowAsPercentage(currentSelection);
        scrollBar.scrollToPercentage(_loc5);
        this.setState(currentItem, true);
        com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG", com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE, 9, currentSelection);
    } // End of the function
    function getRowAsPercentage(rowNumber)
    {
        var _loc2;
        _loc2 = rowNumber / (dataProviderUI.length - 1) * 100;
        return (_loc2);
    } // End of the function
    function setState(item, isActive)
    {
    } // End of the function
    function setScrollBarVisibility(isVisible)
    {
        if (needsScrollbars == true)
        {
            if (isVisible)
            {
                scrollBar.SHOW();
                clearInterval(scrollBarTimeout);
                scrollBarTimeout = setInterval(this, "setScrollBarVisibility", 300, false);
            }
            else
            {
                scrollBar.HIDE();
                clearInterval(scrollBarTimeout);
            } // end if
        } // end else if
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (currentSelection);
    } // End of the function
    function CLEAN_UP_DATA()
    {
        dataProviderUI = [];
    } // End of the function
    function CLOSE_APP()
    {
        clearInterval(scrollBarTimeout);
        container.removeMovieClip();
    } // End of the function
    var defaultRowHeight = 48;
    var numberOfVisibleRows = 5;
    var rowSpace = 0;
    var offsetY = 64;
    var offsetX = 0;
    var gutterHeight = 240;
    var scrollerX = 250;
    var scrollamount = 20;
    var needsScrollbars = false;
    var arrayStartPoint = 0;
    var currentSelection = 0;
} // End of Class
#endinitclip
