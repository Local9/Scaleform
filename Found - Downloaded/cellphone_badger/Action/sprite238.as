// Action script...

// [Initial MovieClip Action of sprite 238]
#initclip 24
class com.rockstargames.gtav.cellphone.apps.SETTINGS extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
    var dataProviderUI, gfxFileName, iconOFF, currentStyle, linkageID, numberOfVisibleRows, CONTENT, row, arrayStartPoint, container, whiteRGB, TextWhiteHex, offWhiteRGB, TextBlackHex;
    function SETTINGS()
    {
        super();
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.settingsDataProviderUI;
        if (gfxFileName == "CELLPHONE_IFRUIT")
        {
            iconOFF = [0, 0, 0];
        }
        else
        {
            iconOFF = [currentStyle[1][0], currentStyle[1][1], currentStyle[1][2]];
        } // end else if
        linkageID = "simplesListItemMC";
        numberOfVisibleRows = 5;
        super.construct(CONTENT, linkageID, dataProviderUI);
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.settingsDataProviderUI;
        row = 1;
        if (numberOfVisibleRows > 0)
        {
            for (var _loc4 = 0; _loc4 < numberOfVisibleRows; ++_loc4)
            {
                var _loc2 = "listItem" + row;
                var _loc3 = _loc4 + arrayStartPoint;
                if (dataProviderUI[_loc3][0] != undefined && dataProviderUI[_loc3][0] != 0)
                {
                    this.setIcon(container[_loc2], dataProviderUI[_loc3][0]);
                    container[_loc2].simpleLabelTF._x = 46;
                    container[_loc2].simpleLabelTF._width = 216;
                    container[_loc2].icon._visible = true;
                }
                else
                {
                    container[_loc2].simpleLabelTF._x = 4;
                    container[_loc2].simpleLabelTF._width = 252;
                    container[_loc2].icon._visible = false;
                } // end else if
                if (dataProviderUI[_loc3][1] != undefined)
                {
                    container[_loc2].simpleLabelTF.text = dataProviderUI[_loc3][1];
                } // end if
                ++row;
            } // end of for
        } // end if
    } // End of the function
    function setIcon(target, menuIconFrameEnum)
    {
        var _loc1 = com.rockstargames.gtav.cellphone.IconLabels.lookUp(menuIconFrameEnum);
        target.icon.gotoAndStop(_loc1[1]);
    } // End of the function
    function setState(item, isActive)
    {
        if (numberOfVisibleRows > 0)
        {
            if (gfxFileName == "CELLPHONE_FACADE")
            {
                if (isActive)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                    com.rockstargames.ui.utils.Colour.Colourise(item.icon, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                    com.rockstargames.ui.utils.Colour.Colourise(item.iconBackground, whiteRGB[0], whiteRGB[1], whiteRGB[2], 100);
                    item.simpleLabelMC.textColor = TextWhiteHex;
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, 0, 0, 0, 100);
                    com.rockstargames.ui.utils.Colour.Colourise(item.icon, whiteRGB[0], whiteRGB[1], whiteRGB[2], 100);
                    com.rockstargames.ui.utils.Colour.Colourise(item.iconBackground, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                    item.simpleLabelMC.textColor = TextWhiteHex;
                } // end else if
            }
            else if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                com.rockstargames.ui.utils.Colour.Colourise(item.icon, currentStyle[2][0], currentStyle[2][1], currentStyle[2][2], 100);
                item.simpleLabelTF.textColor = TextWhiteHex;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                com.rockstargames.ui.utils.Colour.Colourise(item.icon, iconOFF[0], iconOFF[1], iconOFF[2], 100);
                item.simpleLabelTF.textColor = TextBlackHex;
            } // end else if
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
