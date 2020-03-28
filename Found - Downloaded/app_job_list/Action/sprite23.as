// Action script...

// [Initial MovieClip Action of sprite 23]
#initclip 8
class com.rockstargames.gtav.cellphone.apps.APP_JOB_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
    var scrollBar, TIMELINE, CONTENT, dataProviderUI, scrollBarTimeout, gfxFileName, currentStyle, linkageID, row, arrayStartPoint, container, TextWhiteHex, offWhiteRGB, TextBlackHex;
    function APP_JOB_LIST()
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
        dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
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
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, 228, 223, 169, 100);
                com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground, 136, 118, 104, 100);
                break;
            } 
            default:
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, currentStyle[4][0], currentStyle[4][1], currentStyle[4][2], 100);
                break;
            } 
        } // End of switch
        linkageID = "jobList-" + gfxFileName.substr(10);
        numberOfVisibleRows = 5;
        super.construct(CONTENT, linkageID, dataProviderUI);
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
        row = 1;
        if (numberOfVisibleRows > 0)
        {
            for (var _loc3 = 0; _loc3 < numberOfVisibleRows; ++_loc3)
            {
                var _loc2 = "listItem" + row;
                var _loc4 = _loc3 + arrayStartPoint;
                container[_loc2].jobLabel.text = com.rockstargames.ui.utils.FitToTextfield.capText(container[_loc2].jobLabel, dataProviderUI[_loc4][0]);
                container[_loc2].jobDescription.text = dataProviderUI[_loc4][1];
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
                    item.jobLabel.textColor = TextWhiteHex;
                    item.jobDescription.textColor = TextWhiteHex;
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, 238, 233, 176, 100);
                    item.jobLabel.textColor = 5457729;
                    item.jobDescription.textColor = 5457729;
                } // end else if
            }
            else if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                item.jobLabel.textColor = TextWhiteHex;
                item.jobDescription.textColor = TextWhiteHex;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                item.jobLabel.textColor = TextBlackHex;
                item.jobDescription.textColor = TextBlackHex;
            } // end else if
        } // end else if
    } // End of the function
    var defaultRowHeight = 80;
    var numberOfVisibleRows = 3;
} // End of Class
#endinitclip
