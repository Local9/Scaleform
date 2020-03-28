// Action script...

// [Initial MovieClip Action of sprite 218]
#initclip 22
class com.rockstargames.gtav.store.STORE_VERTICAL_LIST extends com.rockstargames.gtav.store.EcommerceStoreBaseClass
{
    var data, COLUMN, menuBgCol, blackCol, whiteCol, scrollIndicator, scrollIndicatorbgMC, currentColumn;
    function STORE_VERTICAL_LIST()
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
    function REDRAW()
    {
        var _loc4;
        for (var _loc3 = 0; _loc3 < maxVisItems; ++_loc3)
        {
            _loc4 = _loc3 + arrayStartPoint;
            var _loc2 = "listItem" + _loc3;
            if (data[_loc4][0] != undefined)
            {
                if (COLUMN[_loc2] == undefined)
                {
                    COLUMN[_loc2] = COLUMN.attachMovie("verticalMenuListItem", _loc2, COLUMN.getNextHighestDepth(), {_name: _loc2, _x: 0, _y: _loc3 * itemOffset});
                } // end if
                COLUMN[_loc2].labelMC.labelTF.text = data[_loc4][0];
                COLUMN[_loc2].newItemIndicator._visible = Boolean(data[_loc4][1]);
                var _loc5 = false;
                if (_loc3 == currentIndex)
                {
                    _loc5 = true;
                } // end if
                this.highlight(_loc3, _loc5);
                continue;
            } // end if
            if (COLUMN[_loc2] != undefined)
            {
                COLUMN[_loc2].removeMovieClip();
            } // end if
        } // end of for
        this.updateScrollIndicator();
        if (data.length == 0)
        {
            COLUMN._visible = false;
        }
        else
        {
            COLUMN._visible = true;
        } // end else if
    } // End of the function
    function SET_DATA(_slot, _data)
    {
        data[_slot] = _data;
        var _loc3 = 0;
        for (var _loc2 = 0; _loc2 < data.length; ++_loc2)
        {
            if (data[_loc2] != undefined)
            {
                ++_loc3;
            } // end if
        } // end of for
        maxitems = _loc3;
        visItems = maxVisItems;
        if (maxitems < maxVisItems)
        {
            visItems = maxitems;
        } // end if
    } // End of the function
    function SET_DATA_EMPTY(_slot)
    {
        if (_slot == undefined)
        {
            data = new Array();
        }
        else
        {
            data[_slot] = undefined;
        } // end else if
        var _loc3 = 0;
        for (var _loc2 = 0; _loc2 < data.length; ++_loc2)
        {
            if (data[_loc2] != undefined)
            {
                ++_loc3;
            } // end if
        } // end of for
        maxitems = _loc3;
        this.REDRAW();
    } // End of the function
    function highlightItem(_slot)
    {
        if (_slot == undefined)
        {
            _slot = currentSelection;
        } // end if
        if (_slot > maxitems)
        {
            _slot = maxitems - 1;
        }
        else if (_slot < 0)
        {
            _slot = 0;
        } // end else if
        arrayStartPoint = 0;
        currentSelection = _slot;
        currentIndex = _slot;
        if (currentIndex >= visItems)
        {
            currentIndex = visItems - 1;
            arrayStartPoint = currentIndex + (maxitems - visItems);
        } // end if
        if (arrayStartPoint > maxitems - visItems)
        {
            arrayStartPoint = maxitems - visItems;
        } // end if
        this.REDRAW();
    } // End of the function
    function updateScrollIndicator()
    {
        if (maxitems <= visItems)
        {
            scrollIndicator._visible = false;
        }
        else
        {
            if (arrayStartPoint >= maxitems - visItems)
            {
                scrollIndicator.scrollArrowDown._alpha = 50;
            }
            else
            {
                scrollIndicator.scrollArrowDown._alpha = 100;
            } // end else if
            if (arrayStartPoint > 0)
            {
                scrollIndicator.scrollArrowUp._alpha = 100;
            }
            else
            {
                scrollIndicator.scrollArrowUp._alpha = 50;
            } // end else if
            scrollIndicator._visible = true;
        } // end else if
        currentSelection = currentIndex + arrayStartPoint;
        scrollIndicator.textTF.text = currentSelection + 1 + " / " + maxitems;
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                --currentIndex;
                com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET");
                if (currentIndex < 0)
                {
                    if (arrayStartPoint < 1)
                    {
                        currentIndex = visItems - 1;
                        arrayStartPoint = maxitems - visItems;
                    }
                    else
                    {
                        currentIndex = 0;
                        --arrayStartPoint;
                    } // end if
                } // end else if
                this.REDRAW();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                ++currentIndex;
                com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET");
                if (currentIndex >= visItems)
                {
                    if (arrayStartPoint >= maxitems - visItems)
                    {
                        currentIndex = 0;
                        arrayStartPoint = 0;
                    }
                    else
                    {
                        currentIndex = visItems - 1;
                        ++arrayStartPoint;
                    } // end if
                } // end else if
                this.REDRAW();
                break;
            } 
        } // End of switch
        currentSelection = currentIndex + arrayStartPoint;
        this.updateScrollIndicator();
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (currentSelection);
    } // End of the function
    function highlight(_slot, _h)
    {
        var _loc4 = "listItem" + _slot;
        var _loc3 = COLUMN[_loc4].bgMC;
        var _loc2 = COLUMN[_loc4].labelMC;
        if (_h == true)
        {
            if (_loc3 != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, whiteCol[0], whiteCol[1], whiteCol[2], 100);
            } // end if
            if (_loc2 != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc2, blackCol[0], blackCol[1], blackCol[2], 100);
            } // end if
            this.updateScrollIndicator();
        }
        else
        {
            if (_loc3 != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, menuBgCol[0], menuBgCol[1], menuBgCol[2], menuBgCol[3]);
            } // end if
            if (_loc2 != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc2, whiteCol[0], whiteCol[1], whiteCol[2], 100);
            } // end if
            scrollIndicator._visible = false;
        } // end else if
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        if (isFocused)
        {
            this.highlight(currentIndex, true);
        }
        else
        {
            this.highlight(currentIndex, false);
        } // end else if
        this.updateScrollIndicator();
    } // End of the function
    function CURRENT_COLUMN(_column)
    {
        currentColumn = _column;
    } // End of the function
    var scrollPos = 0;
    var currentIndex = 0;
    var maxitems = 0;
    var maxVisItems = 16;
    var visItems = 16;
    var arrayStartPoint = 0;
    var currentSelection = 0;
    var itemOffset = 26.875000;
} // End of Class
#endinitclip
