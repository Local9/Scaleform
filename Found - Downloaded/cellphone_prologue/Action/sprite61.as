// Action script...

// [Initial MovieClip Action of sprite 61]
#initclip 7
class com.rockstargames.ui.controls.ScrollingList extends com.rockstargames.ui.core.PhoneUIComponent
{
    var listItem, row, isLandscape, dataProviderUI, numberOfVisibleRows, currentSelection, offsetY, container, scrollBar, currentID, offsetX, currentItem, rowSpace, populateContent, previousItem, scrollBarTimeout;
    function ScrollingList()
    {
        super();
    } // End of the function
    function construct(parentContainer, linkageID, params)
    {
        listItem = linkageID;
        this.setScrollBarVisibility(false);
        row = 1;
        if (params.isLandscape)
        {
            isLandscape = params.isLandscape;
        } // end if
        if (dataProviderUI.length > 0)
        {
            if (numberOfVisibleRows > dataProviderUI.length)
            {
                numberOfVisibleRows = dataProviderUI.length;
            } // end if
            currentSelection = 0;
        }
        else
        {
            numberOfVisibleRows = 0;
            currentSelection = -1;
        } // end else if
        super.construct(parentContainer, linkageID, params);
        scrollBar.construct(container, "scrubber", "gutter", scrollerX, offsetY, gutterHeight);
        scrollBar.scrollBarContainer._alpha = 0;
        scrollBar.scrollBarContainer._visible = true;
        scrollBar.scrollBarContainer.swapDepths(scrollBar.scrollBarContainer.getDepth() + 20);
        container._x = 0;
        this.renderContainers();
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
            container[_loc2] = container.attachMovie(listItem, _loc2, container.getNextHighestDepth());
            container[_loc2]._name = _loc2;
            container[_loc2]._x = container._x + offsetX;
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
            container[_loc2]._y = _loc5;
            _loc5 = _loc5 + (defaultRowHeight + rowSpace);
            _loc6 = container[_loc2];
            ++row;
        } // end of for
        this.populateContent();
    } // End of the function
    function navigate(direction)
    {
        if (inputDelay == 0)
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
            var _loc5 = Number(_loc3[1]) + arrayStartPoint;
            currentSelection = _loc5 - 1;
            var _loc6 = this.getRowAsPercentage(_loc5);
            scrollBar.scrollToPercentage(_loc6);
            this.setState(currentItem, true);
            inputDelay = 1;
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(container, 0.100000, {onComplete: inputDelayReset, onCompleteScope: this});
        } // end if
    } // End of the function
    function inputDelayReset()
    {
        inputDelay = 0;
    } // End of the function
    function getRowAsPercentage(rowNumber)
    {
        var _loc2;
        if (rowNumber > 1)
        {
            _loc2 = rowNumber / dataProviderUI.length * 100;
        }
        else
        {
            _loc2 = 0;
        } // end else if
        return (_loc2);
    } // End of the function
    function setState(item, isActive)
    {
        if (isActive)
        {
            com.rockstargames.ui.utils.Colour.Colourise(item.background, 0, 153, 255);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(item.background, 0, 0, 0);
        } // end else if
    } // End of the function
    function removeList()
    {
        container.removeMovieClip();
    } // End of the function
    function setScrollBarVisibility(isVisible)
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
        } // end else if
    } // End of the function
    var _numberOfVisibleRows = 0;
    var defaultRowHeight = 45;
    var offScreenX = 480;
    var arrayStartPoint = 0;
    var offStateAlpha = 60;
    var gutterHeight = 240;
    var scrollerX = 250;
    var scrollamount = 20;
    var inputDelay = 0;
} // End of Class
#endinitclip
