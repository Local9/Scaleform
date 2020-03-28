// Action script...

// [Initial MovieClip Action of sprite 217]
#initclip 21
class com.rockstargames.gtav.store.STORE_CONTENTIMAGE_LIST extends com.rockstargames.gtav.store.EcommerceStoreBaseClass
{
    var data, COLUMN, menuBgCol, blackCol, whiteCol, scrollIndicator, scrollIndicatorbgMC, offset, imageHeight, currentColumn;
    function STORE_CONTENTIMAGE_LIST()
    {
        super();
        data = new Array();
    } // End of the function
    function SETUP_COLUMN(mc, _menuBgCol, _blackCol, _whiteCol)
    {
        COLUMN = mc;
        menuBgCol = _menuBgCol;
        blackCol = _blackCol;
        whiteCol = _whiteCol;
        scrollIndicator = COLUMN.scrollIndicatorMC;
        scrollIndicator._visible = false;
        scrollIndicatorbgMC = scrollIndicator.bgMC;
        if (scrollIndicatorbgMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollIndicatorbgMC, menuBgCol[0], menuBgCol[1], menuBgCol[2], menuBgCol[3]);
        } // end if
    } // End of the function
    function SET_DATA(_slot, _data)
    {
        data[_slot] = _data;
        maxitems = data.length;
        if (maxitems <= maxVisItems)
        {
            visItems = maxitems;
            canScroll = false;
        }
        else
        {
            visItems = maxVisItems;
            canScroll = true;
        } // end else if
        this.setImageHeight();
    } // End of the function
    function SET_DATA_EMPTY(_slot)
    {
        if (_slot == undefined)
        {
            this.removeAllSlots();
            data = new Array();
            maxitems = 0;
            visItems = 0;
            arrayStartPoint = -1;
            startIndex = -1;
            endIndex = -1;
            currentSelection = -1;
            currentIndex = 0;
            canScroll = false;
        }
        else
        {
            var _loc2 = "listItem" + _slot;
            if (typeof(COLUMN[_loc2].picMC) == "movieclip")
            {
                COLUMN[_loc2].REMOVE_PIC();
                COLUMN[_loc2].removeMovieClip();
                data[_slot] = new Array();
                maxitems = data.length;
            } // end if
        } // end else if
        if (maxitems <= maxVisItems)
        {
            visItems = maxitems;
            canScroll = false;
        }
        else
        {
            visItems = maxVisItems;
            canScroll = true;
        } // end else if
        this.REDRAW();
    } // End of the function
    function setImageHeight()
    {
        switch (maxVisItems)
        {
            case 4:
            {
                offset = 108;
                imageHeight = 106;
                break;
            } 
            case 2:
            {
                offset = 216;
                imageHeight = 214;
                break;
            } 
            case 1:
            {
                offset = 432;
                imageHeight = 430;
                break;
            } 
        } // End of switch
    } // End of the function
    function UPDATE_CONTENTIMAGE_SIZE(_maxVisItems)
    {
        var _loc2 = maxVisItems;
        if (_maxVisItems != undefined)
        {
            maxVisItems = _maxVisItems;
        } // end if
        this.removeAllSlots();
        this.setImageHeight();
    } // End of the function
    function removeAllSlots()
    {
        for (var _loc3 = 0; _loc3 < data.length; ++_loc3)
        {
            var _loc2 = "listItem" + _loc3;
            if (typeof(COLUMN[_loc2].picMC) == "movieclip")
            {
                COLUMN[_loc2].REMOVE_PIC();
                COLUMN[_loc2].removeMovieClip();
            } // end if
        } // end of for
    } // End of the function
    function highlightItem(_slot)
    {
        if (_slot == undefined)
        {
            _slot = currentSelection;
        } // end if
        if (_slot >= maxitems)
        {
            _slot = maxitems - 1;
        }
        else if (_slot < 0)
        {
            _slot = 0;
        } // end else if
        if (_slot < arrayStartPoint)
        {
            arrayStartPoint = _slot;
        } // end if
        if (_slot > endIndex)
        {
            arrayStartPoint = _slot - endIndex;
            if (arrayStartPoint < 0)
            {
                arrayStartPoint = 0;
            } // end if
        } // end if
        currentSelection = _slot;
        if (_slot == 0)
        {
            currentIndex = 0;
        } // end if
        this.REDRAW();
    } // End of the function
    function REDRAW()
    {
        if (arrayStartPoint == -1 && data.length > 0)
        {
            arrayStartPoint = 0;
        } // end if
        var _loc3;
        _loc3 = arrayStartPoint;
        if (_loc3 == -1)
        {
            _loc3 = 0;
        } // end if
        if (currentSelection == -1 && data.length > 0)
        {
            currentSelection = 0;
        } // end if
        var _loc14 = _loc3;
        var _loc4 = 0;
        for (var _loc7 = 0; _loc7 < data.length; ++_loc7)
        {
            var _loc2 = "listItem" + _loc3;
            if (_loc4 < visItems)
            {
                if (data[_loc3] != undefined)
                {
                    if (COLUMN[_loc2].picMC == undefined)
                    {
                        var _loc5 = data[_loc3][0];
                        if (_loc5 == "")
                        {
                            _loc5 = undefined;
                        } // end if
                        var _loc8 = _loc3;
                        COLUMN[_loc2] = COLUMN.attachMovie("contentImageListItem" + maxVisItems, _loc2, _loc8, {_name: _loc2, _x: 0, _y: _loc4 * offset, txd: _loc5, slot: _loc3});
                        COLUMN[_loc2].itemHilite._visible = false;
                        COLUMN[_loc2].newItemIndicator._visible = false;
                        COLUMN[_loc2].textBgMC._visible = false;
                        if (COLUMN[_loc2].textBgMC != undefined)
                        {
                            com.rockstargames.ui.utils.Colour.Colourise(COLUMN[_loc2].textBgMC, menuBgCol[0], menuBgCol[1], menuBgCol[2], menuBgCol[3]);
                        } // end if
                    }
                    else
                    {
                        COLUMN[_loc2]._y = _loc4 * offset;
                    } // end else if
                    if (data[_loc3][0] != "")
                    {
                        if (COLUMN[_loc2].txd == undefined)
                        {
                            COLUMN[_loc2].txd = data[_loc3][0];
                            com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, data[_loc3][0], _loc3.toString());
                        } // end if
                    } // end if
                    COLUMN[_loc2].newItemIndicator._visible = Boolean(data[_loc3][1]);
                    if (data[_loc3][2] == undefined)
                    {
                        COLUMN[_loc2].labelMC.titleTF.text = "";
                        COLUMN[_loc2].labelMC._visible = false;
                        COLUMN[_loc2].textBgMC._visible = false;
                    }
                    else
                    {
                        COLUMN[_loc2].labelMC.titleTF.htmlText = data[_loc3][2];
                        COLUMN[_loc2].labelMC._visible = true;
                        COLUMN[_loc2].textBgMC._visible = true;
                    } // end else if
                    var _loc6 = false;
                    if (_loc4 == currentIndex && currentColumn == 1)
                    {
                        _loc6 = true;
                        currentSelection = _loc3;
                    } // end if
                    this.highlight(_loc3, _loc6);
                } // end if
            }
            else if (typeof(COLUMN[_loc2].picMC) == "movieclip")
            {
                COLUMN[_loc2].REMOVE_PIC();
                COLUMN[_loc2].removeMovieClip();
            } // end else if
            ++_loc4;
            if (data.length > 0)
            {
                if (canScroll)
                {
                    ++_loc3;
                    if (_loc3 >= data.length)
                    {
                        _loc3 = 0;
                    } // end if
                    continue;
                } // end if
                if (_loc3 <= data.length)
                {
                    ++_loc3;
                } // end if
            } // end if
        } // end of for
        if (data.length > 0)
        {
            startIndex = arrayStartPoint;
            endIndex = _loc3 - 1;
            if (endIndex == -1)
            {
                endIndex = data.length - 1;
            } // end if
        } // end if
        this.updateScrollIndicator();
        if (maxitems == 0)
        {
            COLUMN._visible = false;
            _level0.TIMELINE.HIDE_COLUMN2(false);
        }
        else
        {
            COLUMN._visible = true;
            _level0.TIMELINE.HIDE_COLUMN2(true);
        } // end else if
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        var _loc3 = parseInt(uniqueID);
        var _loc2 = COLUMN["listItem" + _loc3];
        if (_loc2 != undefined)
        {
            _loc2.ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success, imageHeight);
        }
        else
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict);
        } // end else if
    } // End of the function
    function updateScrollIndicator()
    {
        if (maxitems <= visItems)
        {
            scrollIndicator._visible = false;
        }
        else
        {
            scrollIndicator._visible = true;
        } // end else if
        if (maxitems == 0)
        {
            scrollIndicator.textTF.text = "";
        }
        else
        {
            scrollIndicator.textTF.text = currentSelection + 1 + " / " + maxitems;
        } // end else if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc2 = true;
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                --currentIndex;
                if (currentIndex < 0)
                {
                    currentIndex = 0;
                    _loc2 = false;
                    if (canScroll)
                    {
                        _loc2 = true;
                        if (arrayStartPoint < 1)
                        {
                            arrayStartPoint = data.length - 1;
                        }
                        else
                        {
                            --arrayStartPoint;
                        } // end if
                    } // end if
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                ++currentIndex;
                if (currentIndex >= visItems)
                {
                    currentIndex = visItems - 1;
                    _loc2 = false;
                    if (canScroll)
                    {
                        _loc2 = true;
                        if (arrayStartPoint >= data.length - 1)
                        {
                            arrayStartPoint = 0;
                        }
                        else
                        {
                            ++arrayStartPoint;
                        } // end if
                    } // end if
                } // end else if
                break;
            } 
        } // End of switch
        if (_loc2 == true)
        {
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET");
        } // end if
        this.updateScrollIndicator();
        this.REDRAW();
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (currentSelection);
    } // End of the function
    function highlight(_slot, _h)
    {
        var _loc2 = "listItem" + _slot;
        if (COLUMN[_loc2] != undefined)
        {
            if (_h)
            {
                if (hasFocus == true)
                {
                    COLUMN[_loc2].itemHilite._visible = true;
                    com.rockstargames.ui.utils.Colour.Colourise(COLUMN[_loc2].picMC, 255, 255, 255, 100);
                } // end if
            }
            else
            {
                COLUMN[_loc2].itemHilite._visible = false;
                com.rockstargames.ui.utils.Colour.Colourise(COLUMN[_loc2].picMC, 220, 220, 220, 100);
            } // end else if
            this.updateScrollIndicator();
        } // end if
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        hasFocus = isFocused;
        var _loc2;
        if (isFocused)
        {
            this.highlight(currentSelection, true);
            _loc2 = 1;
        }
        else
        {
            this.highlight(currentSelection, false);
            _loc2 = 0.300000;
        } // end else if
        if (COLUMN.bgMC != undefined)
        {
            var _loc3 = new flash.geom.Transform(COLUMN.bgMC);
            var _loc4 = new flash.geom.ColorTransform(_loc2, _loc2, _loc2, 1, 1, 1, 1, 0);
            _loc3.colorTransform = _loc4;
        } // end if
        if (COLUMN.scrollIndicatorMC != undefined)
        {
            _loc3 = new flash.geom.Transform(COLUMN.scrollIndicatorMC);
            _loc4 = new flash.geom.ColorTransform(_loc2, _loc2, _loc2, 1, 1, 1, 1, 0);
            _loc3.colorTransform = _loc4;
        } // end if
        this.REDRAW();
    } // End of the function
    function CURRENT_COLUMN(_column)
    {
        currentColumn = _column;
    } // End of the function
    var scrollPos = 0;
    var currentIndex = 0;
    var maxitems = 0;
    var maxVisItems = 4;
    var visItems = 4;
    var hasFocus = false;
    var arrayStartPoint = 0;
    var currentSelection = 0;
    var startIndex = 0;
    var endIndex = 0;
    var canScroll = false;
    var gfxFileName = "PAUSE_MENU_STORE_CONTENT";
    var inputDelay = 0;
} // End of Class
#endinitclip
