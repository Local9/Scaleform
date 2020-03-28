// Action script...

// [Initial MovieClip Action of sprite 232]
#initclip 18
class com.rockstargames.gtav.cellphone.apps.EMAIL_RESPONSE extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
    var numberOfVisibleRows, isLandscape, defaultRowHeight, gutterHeight, offsetX, offsetY, scrollerX, scrollerY, dataProviderUI, linkageID, CONTENT, gfxFileName, scrollBar, container, row, arrayStartPoint, getRowAsPercentage, currentSelection, currentStyle, TextWhiteHex, offWhiteRGB, TextBlackHex;
    function EMAIL_RESPONSE()
    {
        super();
        numberOfVisibleRows = 3;
        isLandscape = true;
        defaultRowHeight = 50;
        gutterHeight = 150;
        offsetX = -256;
        offsetY = -192;
        scrollerX = 337;
        scrollerY = -207;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.emailResponseDataProviderUI;
        numberOfVisibleRows = 3;
        linkageID = "inboxListItem";
        super.construct(CONTENT, linkageID, dataProviderUI);
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, 0, 0, 0, 50);
        } // end if
        container._rotation = 90;
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.emailResponseDataProviderUI;
        container._y = 256;
        row = 1;
        var _loc5 = 0;
        var _loc6 = 0;
        if (numberOfVisibleRows > 0)
        {
            for (var _loc3 = 0; _loc3 < numberOfVisibleRows; ++_loc3)
            {
                var _loc2 = "listItem" + row;
                if (_loc3 + arrayStartPoint >= dataProviderUI.length)
                {
                    _loc5 = _loc6;
                    ++_loc6;
                }
                else
                {
                    _loc5 = _loc3 + arrayStartPoint;
                } // end else if
                container[_loc2].attachmentIcon._visible = false;
                container[_loc2].icon._visible = false;
                var _loc4 = dataProviderUI[_loc5][0];
                if (_loc4 != undefined)
                {
                    container[_loc2].responseText.multiline = true;
                    container[_loc2].responseText.autoSize = "left";
                    container[_loc2].responseText._height = 27;
                    container[_loc2].responseText.text = _loc4;
                    if (container[_loc2].responseText._height > 27)
                    {
                        container[_loc2].responseText._y = 2;
                    }
                    else
                    {
                        container[_loc2].responseText._y = 11;
                    } // end else if
                    container[_loc2].responseText.text = _loc4;
                } // end if
                ++row;
            } // end of for
            var _loc7 = this.getRowAsPercentage(arrayStartPoint + 1);
            currentSelection = arrayStartPoint;
            scrollBar.scrollToPercentage(_loc7);
        } // end if
    } // End of the function
    function setState(item, isActive)
    {
        if (numberOfVisibleRows > 0)
        {
            if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                item.responseText.textColor = TextWhiteHex;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                item.responseText.textColor = TextBlackHex;
            } // end if
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
