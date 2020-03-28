// Action script...

// [Initial MovieClip Action of sprite 222]
#initclip 32
class com.rockstargames.gtav.cellphone.apps.CONTACTLIST extends MovieClip
{
    var scrollBar, numberOfVisibleRows, CONTENT, dataProviderUI, scrollBarTimeout, linkageID, container, getNextHighestDepth, createEmptyMovieClip, gfxFileName, whiteRGB, currentStyle, currentID, currentItem, TextWhiteHex, blackRGB, offWhiteRGB, TextBlackHex;
    function CONTACTLIST()
    {
        super();
        _global.gfxExtensions = true;
        scrollBar = new com.rockstargames.ui.controls.ScrollBar();
        numberOfVisibleRows = 5;
        CONTENT = this;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.contactsDataProviderUI;
        clearInterval(scrollBarTimeout);
        linkageID = "listItemMC";
        numberOfVisibleRows = 5;
        this.removeAllContacts();
        if (container != undefined)
        {
            container.removeMovieClip();
        } // end if
        container = this.createEmptyMovieClip("container", this.getNextHighestDepth());
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
            currentSelection = 0;
        }
        else
        {
            numberOfVisibleRows = 0;
            currentSelection = -1;
        } // end else if
        scrollBar.construct(this, "scrubber", "gutter", scrollerX, offsetY, gutterHeight);
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, whiteRGB[0], whiteRGB[1], whiteRGB[2], 75);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, 0, 0, 0, 50);
        } // end else if
        scrollBar.scrollBarContainer._alpha = 0;
        this.renderContainers();
        scrollBar.scrollBarContainer.swapDepths(scrollBar.scrollBarContainer.getDepth() + 100);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, currentStyle[4][0], currentStyle[4][1], currentStyle[4][2], 100);
        this.populateContent();
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
        var _loc4 = arrayStartPoint;
        var _loc3 = arrayStartPoint + (numberOfVisibleRows - 1);
        if (currentID > _loc3 || currentID < _loc4)
        {
            var _loc2 = currentID - (numberOfVisibleRows - 1);
            if (_loc2 < 0)
            {
                _loc2 = 0;
            } // end if
            arrayStartPoint = _loc2;
        } // end if
        currentSelection = currentID;
        currentItem = container["listItem" + currentID];
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.contactsDataProviderUI;
        CONTENT.messageTF.autoSize = "center";
        CONTENT.messageTF.text = "";
        if (numberOfVisibleRows > 0)
        {
            if (arrayStartPoint - 1 >= 0)
            {
                this.createContact(arrayStartPoint - 1);
            } // end if
            for (var _loc3 = 0; _loc3 < numberOfVisibleRows; ++_loc3)
            {
                var _loc2 = _loc3 + arrayStartPoint;
                var _loc4 = "listItem" + _loc2;
                if (container[_loc4] == undefined)
                {
                    this.createContact(_loc2);
                } // end if
                var _loc6 = Boolean(dataProviderUI[_loc2][0]);
                container[_loc4].missed_call_icon._visible = _loc6;
                if (dataProviderUI[_loc2][1] != undefined)
                {
                    var _loc5 = dataProviderUI[_loc2][1].split("<FONT COLOR=\'#F0F0F0\'>").join("");
                    container[_loc4].contactNameMC.multiline = true;
                    container[_loc4].contactNameMC.autoSize = "left";
                    container[_loc4].contactNameMC._height = 27;
                    if (dataProviderUI[_loc2][3].substr(0, 5) != "CHAR_" || dataProviderUI[_loc2][3] == "CHAR_HUMANDEFAULT")
                    {
                        container[_loc4].contactNameMCcond.textAutoSize = "shrink";
                        container[_loc4].contactNameMCcond.text = _loc5;
                    }
                    else
                    {
                        container[_loc4].contactNameMC.text = _loc5;
                        if (container[_loc4].contactNameMC._height > 27)
                        {
                            container[_loc4].contactNameMC._y = 1;
                        }
                        else
                        {
                            container[_loc4].contactNameMC._y = 10;
                        } // end if
                    } // end else if
                } // end else if
                if (_loc2 == currentSelection)
                {
                    currentItem = container[_loc4];
                    this.setState(currentItem, true);
                    continue;
                } // end if
                this.setState(container[_loc4], false);
            } // end of for
            if (_loc2 + 1 < dataProviderUI.length)
            {
                this.createContact(_loc2 + 1);
            } // end if
            for (var _loc3 = 0; _loc3 < dataProviderUI.length; ++_loc3)
            {
                if (_loc3 < arrayStartPoint - 1 || _loc3 > _loc2 + 1)
                {
                    _loc4 = "listItem" + _loc3;
                    if (container[_loc4].txd != undefined)
                    {
                        container[_loc4].REMOVE_CONTACT();
                        delete container[_loc4];
                        container[_loc4].removeMovieClip();
                    } // end if
                } // end if
            } // end of for
        }
        else
        {
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "CELL_232", CONTENT.messageTF);
        } // end else if
    } // End of the function
    function createContact(index)
    {
        var _loc2 = "listItem" + index;
        if (container[_loc2].txd == undefined)
        {
            container[_loc2] = container.attachMovie(linkageID, _loc2, index + 1);
            container[_loc2].missed_call_icon._visible = false;
            container[_loc2].gfxFileName = gfxFileName;
            container[_loc2]._y = offsetY + index * (defaultRowHeight + rowSpace);
            var _loc3 = dataProviderUI[index][3];
            if (_loc3 != "" && _loc3 != undefined)
            {
                container[_loc2].DISPLAY_CONTACT(_loc3, _loc2);
            } // end if
        } // end if
    } // End of the function
    function removeAllContacts()
    {
        for (var _loc3 = 0; _loc3 < dataProviderUI.length; ++_loc3)
        {
            var _loc2 = "listItem" + _loc3;
            if (container[_loc2] != undefined)
            {
                container[_loc2].REMOVE_CONTACT();
                delete container[_loc2];
                container[_loc2].removeMovieClip();
            } // end if
        } // end of for
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success)
        {
            container[uniqueID].gfxFileName = gfxFileName;
            container[uniqueID].TXD_HAS_LOADED(textureDict, success, uniqueID);
        } // end if
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        if (success)
        {
            container[uniqueID].gfxFileName = gfxFileName;
            container[uniqueID].ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success);
        } // end if
    } // End of the function
    function setState(item, isActive)
    {
        if (item.background != undefined)
        {
            if (numberOfVisibleRows > 0)
            {
                if (gfxFileName == "CELLPHONE_FACADE")
                {
                    if (isActive)
                    {
                        com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                        item.contactNameMC.textColor = TextWhiteHex;
                        item.contactNameMCcond.textColor = TextWhiteHex;
                    }
                    else
                    {
                        com.rockstargames.ui.utils.Colour.Colourise(item.background, blackRGB[0], blackRGB[1], blackRGB[2], 100);
                        item.contactNameMC.textColor = TextWhiteHex;
                        item.contactNameMCcond.textColor = TextWhiteHex;
                    } // end else if
                }
                else if (isActive)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                    item.contactNameMC.textColor = TextWhiteHex;
                    item.contactNameMCcond.textColor = TextWhiteHex;
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                    item.contactNameMC.textColor = TextBlackHex;
                    item.contactNameMCcond.textColor = TextBlackHex;
                } // end if
            } // end else if
        } // end else if
    } // End of the function
    function navigate(direction)
    {
        this.setState(currentItem, false);
        var _loc5 = currentItem._name.split("listItem");
        var _loc2 = Number(_loc5[1]);
        var _loc3 = _loc2;
        switch (direction)
        {
            case "UP":
            {
                _loc2 = _loc3 - 1;
                this.setScrollBarVisibility(true);
                if (_loc2 < arrayStartPoint)
                {
                    if (arrayStartPoint <= 0)
                    {
                        arrayStartPoint = dataProviderUI.length - numberOfVisibleRows;
                        _loc2 = arrayStartPoint + (numberOfVisibleRows - 1);
                        container._y = -arrayStartPoint * (defaultRowHeight + rowSpace);
                        if (numberOfVisibleRows > 7)
                        {
                            this.removeAllContacts();
                        } // end if
                    }
                    else
                    {
                        --arrayStartPoint;
                        container._y = container._y + (defaultRowHeight + rowSpace);
                    } // end else if
                    currentSelection = _loc2;
                    this.populateContent();
                } // end if
                break;
            } 
            case "DOWN":
            {
                _loc2 = _loc3 + 1;
                this.setScrollBarVisibility(true);
                if (_loc2 > arrayStartPoint + (numberOfVisibleRows - 1))
                {
                    if (arrayStartPoint >= dataProviderUI.length - numberOfVisibleRows)
                    {
                        _loc2 = 0;
                        arrayStartPoint = 0;
                        container._y = 0;
                        if (numberOfVisibleRows > 7)
                        {
                            this.removeAllContacts();
                        } // end if
                    }
                    else
                    {
                        ++arrayStartPoint;
                        container._y = container._y - (defaultRowHeight + rowSpace);
                    } // end else if
                    currentSelection = _loc2;
                    this.populateContent();
                } // end if
                break;
            } 
        } // End of switch
        currentItem = container["listItem" + _loc2];
        currentSelection = _loc2;
        currentID = currentSelection;
        var _loc4 = this.getRowAsPercentage(currentSelection);
        scrollBar.scrollToPercentage(_loc4);
        this.setState(currentItem, true);
        com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG", com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE, 9, currentSelection);
        flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION", 0, gfxFileName);
    } // End of the function
    function getRowAsPercentage(rowNumber)
    {
        var _loc2;
        _loc2 = rowNumber / (dataProviderUI.length - 1) * 100;
        return (_loc2);
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
        this.removeAllContacts();
        container.removeMovieClip();
    } // End of the function
    function CLOSE_APP()
    {
        clearInterval(scrollBarTimeout);
        container.removeMovieClip();
        this.REMOVE();
    } // End of the function
    var defaultRowHeight = 48;
    var rowSpace = 0;
    var columnSpace = 0;
    var isLandscape = false;
    var offsetY = 64;
    var offsetX = 0;
    var gutterHeight = 240;
    var scrollerX = 250;
    var scrollamount = 20;
    var needsScrollbars = false;
    var arrayStartPoint = 0;
    var offStateAlpha = 60;
    var currentSelection = -1;
} // End of Class
#endinitclip
