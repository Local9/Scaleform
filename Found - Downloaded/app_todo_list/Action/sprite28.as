// Action script...

// [Initial MovieClip Action of sprite 28]
#initclip 8
class com.rockstargames.gtav.cellphone.apps.APP_TODO_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
    var scrollBar, TIMELINE, CONTENT, dataProviderUI, scrollBarTimeout, gfxFileName, currentStyle, linkageID, row, arrayStartPoint, container, offWhiteRGB, TextWhiteHex, TextBlackHex;
    function APP_TODO_LIST()
    {
        super();
        scrollBar = new com.rockstargames.ui.controls.ScrollBar();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.toDoListDataProviderUI;
        clearInterval(scrollBarTimeout);
        var _loc3 = TIMELINE.bg;
        switch (gfxFileName)
        {
            case "CELLPHONE_FACADE":
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, 0, 0, 0, 100);
                break;
            } 
            case "CELLPHONE_IFRUIT":
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, 238, 233, 176, 100);
                com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground, 136, 118, 104, 100);
                break;
            } 
            default:
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, currentStyle[4][0], currentStyle[4][1], currentStyle[4][2], 100);
                break;
            } 
        } // End of switch
        linkageID = "toDoList-" + gfxFileName.substr(10);
        numberOfVisibleRows = 5;
        super.construct(CONTENT, linkageID, dataProviderUI);
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.toDoListDataProviderUI;
        row = 1;
        if (numberOfVisibleRows > 0)
        {
            for (var _loc4 = 0; _loc4 < numberOfVisibleRows; ++_loc4)
            {
                var _loc2 = "listItem" + row;
                var _loc3 = _loc4 + arrayStartPoint;
                container[_loc2].todoLabel.text = com.rockstargames.ui.utils.FitToTextfield.capText(container[_loc2].todoLabel, dataProviderUI[_loc3][1]);
                container[_loc2].todoDescription.text = com.rockstargames.ui.utils.FitToTextfield.capText(container[_loc2].todoDescription, dataProviderUI[_loc3][2]);
                if (dataProviderUI[_loc3][0])
                {
                    container[_loc2].todoPercent.text = dataProviderUI[_loc3][0] + "%";
                } // end if
                ++row;
            } // end of for
        } // end if
    } // End of the function
    function setState(item, isActive)
    {
        if (numberOfVisibleRows > 0)
        {
            if (gfxFileName == "CELLPHONE_IFRUIT")
            {
                if (isActive)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, 136, 118, 104, 100);
                    com.rockstargames.ui.utils.Colour.Colourise(item.icon, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                    item.todoLabel.textColor = TextWhiteHex;
                    item.todoDescription.textColor = TextWhiteHex;
                    item.todoPercent.textColor = TextWhiteHex;
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, 238, 233, 176, 100);
                    com.rockstargames.ui.utils.Colour.Colourise(item.icon, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2]);
                    item.todoLabel.textColor = 5457729;
                    item.todoDescription.textColor = 5457729;
                    item.todoPercent.textColor = 5457729;
                } // end else if
            }
            else if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                com.rockstargames.ui.utils.Colour.Colourise(item.icon, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                item.todoLabel.textColor = TextWhiteHex;
                item.todoDescription.textColor = TextWhiteHex;
                item.todoPercent.textColor = TextWhiteHex;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[3][0], currentStyle[3][1], currentStyle[3][2]);
                com.rockstargames.ui.utils.Colour.Colourise(item.icon, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2]);
                item.todoLabel.textColor = TextBlackHex;
                item.todoDescription.textColor = TextBlackHex;
                item.todoPercent.textColor = TextBlackHex;
            } // end else if
        } // end else if
    } // End of the function
    var defaultRowHeight = 48;
    var numberOfVisibleRows = 5;
} // End of Class
#endinitclip
