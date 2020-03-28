// Action script...

// [Initial MovieClip Action of sprite 224]
#initclip 10
class com.rockstargames.gtav.cellphone.apps.MISSION_REPEAT_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
    var dataProviderUI, linkageID, numberOfVisibleRows, CONTENT, row, arrayStartPoint, container, gfxFileName, currentStyle, TextWhiteHex, offWhiteRGB, TextBlackHex;
    function MISSION_REPEAT_LIST()
    {
        super();
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.missionRepeatDataProviderUI;
        linkageID = "simplesListItemMC";
        numberOfVisibleRows = 5;
        super.construct(CONTENT, linkageID, dataProviderUI);
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.missionRepeatDataProviderUI;
        CONTENT.messageTF.autoSize = "center";
        CONTENT.messageTF.text = "";
        row = 1;
        if (numberOfVisibleRows > 0)
        {
            for (var _loc3 = 0; _loc3 < numberOfVisibleRows; ++_loc3)
            {
                var _loc2 = "listItem" + row;
                var _loc5 = _loc3 + arrayStartPoint;
                var _loc4 = dataProviderUI[_loc5][1];
                container[_loc2].icon._visible = false;
                container[_loc2].iconBackground._visible = false;
                container[_loc2].simpleLabelTF._x = 4;
                container[_loc2].simpleLabelTF._width = 246;
                if (_loc4 != undefined)
                {
                    container[_loc2].simpleLabelTF.multiline = true;
                    container[_loc2].simpleLabelTF.autoSize = "left";
                    container[_loc2].simpleLabelTF._height = 28.250000;
                    container[_loc2].simpleLabelTF.text = _loc4;
                    if (container[_loc2].simpleLabelTF._height > 29)
                    {
                        container[_loc2].simpleLabelTF._y = -1;
                    }
                    else
                    {
                        container[_loc2].simpleLabelTF._y = 9.500000;
                    } // end if
                } // end else if
                ++row;
            } // end of for
        }
        else
        {
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "CELL_230", CONTENT.messageTF);
        } // end else if
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
                    item.simpleLabelTF.textColor = TextWhiteHex;
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, 0, 0, 0, 100);
                    item.simpleLabelTF.textColor = TextWhiteHex;
                } // end else if
            }
            else if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                item.simpleLabelTF.textColor = TextWhiteHex;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                item.simpleLabelTF.textColor = TextBlackHex;
            } // end else if
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
