// Action script...

// [Initial MovieClip Action of sprite 215]
#initclip 25
class com.rockstargames.gtav.cellphone.apps.JOB_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
    var dataProviderUI, linkageID, CONTENT, gfxFileName, currentStyle, row, arrayStartPoint, container, TextWhiteHex, offWhiteRGB, TextBlackHex;
    function JOB_LIST()
    {
        super();
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
        linkageID = "jobList";
        numberOfVisibleRows = 5;
        super.construct(CONTENT, linkageID, dataProviderUI);
        switch (gfxFileName)
        {
            case "CELLPHONE_FACADE":
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, 0, 0, 0, 100);
                break;
            } 
            case "CELLPHONE_IFRUIT":
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, 228, 223, 169, 100);
                com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground, 136, 118, 104, 100);
                break;
            } 
            default:
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, currentStyle[4][0], currentStyle[4][1], currentStyle[4][2], 100);
                break;
            } 
        } // End of switch
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
    var gutterHeight = 240;
    var scrollerX = 250;
} // End of Class
#endinitclip
