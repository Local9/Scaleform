// Action script...

// [Initial MovieClip Action of sprite 203]
#initclip 13
class com.rockstargames.gtav.cellphone.apps.MESSAGE_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
    var dataProviderUI, linkageID, numberOfVisibleRows, CONTENT, gfxFileName, scrollBar, row, arrayStartPoint, container, currentStyle, whiteRGB, TextWhiteHex, offWhiteRGB, darkGreyRGB, TextBlackHex;
    function MESSAGE_LIST()
    {
        super();
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.messageListDataProviderUI;
        linkageID = "messageListItem";
        numberOfVisibleRows = 5;
        super.construct(CONTENT, linkageID, dataProviderUI);
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, 0, 0, 0, 50);
        } // end if
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.messageListDataProviderUI;
        CONTENT.messageTF.autoSize = "center";
        CONTENT.messageTF.text = "";
        row = 1;
        var _loc4 = 0;
        var _loc14 = 0;
        if (numberOfVisibleRows > 0)
        {
            for (var _loc7 = 0; _loc7 < numberOfVisibleRows; ++_loc7)
            {
                var _loc3 = "listItem" + row;
                if (_loc7 + arrayStartPoint >= dataProviderUI.length)
                {
                    _loc4 = _loc14;
                    ++_loc14;
                }
                else
                {
                    _loc4 = _loc7 + arrayStartPoint;
                } // end else if
                var _loc8 = String(dataProviderUI[_loc4][0]);
                var _loc6 = String(dataProviderUI[_loc4][1]);
                var _loc13;
                var _loc11;
                var _loc2;
                var _loc12 = false;
                if (typeof(dataProviderUI[_loc4][2]) == "number")
                {
                    _loc13 = dataProviderUI[_loc4][2];
                    _loc11 = dataProviderUI[_loc4][3];
                    _loc2 = dataProviderUI[_loc4][4];
                }
                else
                {
                    _loc13 = 0;
                    _loc11 = dataProviderUI[_loc4][2];
                    _loc2 = dataProviderUI[_loc4][3];
                } // end else if
                if (_loc8.length == 1)
                {
                    _loc8 = "0" + _loc8;
                } // end if
                if (_loc6.length == 1)
                {
                    _loc6 = "0" + _loc6;
                } // end if
                switch (_loc13)
                {
                    case 33:
                    {
                        container[_loc3].icon._visible = false;
                        break;
                    } 
                    case 34:
                    {
                        container[_loc3].icon.gotoAndStop("UNREAD_SMS");
                        break;
                    } 
                    default:
                    {
                        container[_loc3].icon.gotoAndStop("READ_SMS");
                        break;
                    } 
                } // End of switch
                var _loc5;
                var _loc10;
                var _loc9;
                _loc5 = _loc2.indexOf("<FONT COLOR=");
                if (_loc5 != -1)
                {
                    _loc10 = _loc2.indexOf(">");
                    _loc9 = _loc2.substr(0, _loc5) + _loc2.substr(_loc10 + 1);
                    _loc2 = _loc9;
                } // end if
                _loc5 = _loc2.indexOf("<img src=\'");
                if (_loc5 != -1)
                {
                    _loc10 = _loc2.indexOf(">");
                    _loc9 = _loc2.substr(0, _loc5) + _loc2.substr(_loc10 + 1);
                    _loc2 = _loc9;
                    _loc12 = true;
                } // end if
                _loc2.split("<BR>").join(" ");
                _loc2.split("</BR>").join(" ");
                _loc2.split("<BR/>").join(" ");
                _loc2.split("<br>").join(" ");
                _loc2.split("</br>").join(" ");
                _loc2.split("<br/>").join(" ");
                container[_loc3].fromAddress.text = com.rockstargames.ui.utils.FitToTextfield.capText(container[_loc3].fromAddress, _loc11);
                container[_loc3].subjectTitle.text = com.rockstargames.ui.utils.FitToTextfield.capText(container[_loc3].subjectTitle, _loc2);
                container[_loc3].timeDisplay.text = _loc8 + ":" + _loc6;
                container[_loc3].attachmentIcon._visible = _loc12;
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
            if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                com.rockstargames.ui.utils.Colour.Colourise(item.icon, whiteRGB[0], whiteRGB[1], whiteRGB[2], 100);
                com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon, whiteRGB[0], whiteRGB[1], whiteRGB[2], 100);
                item.subjectTitle.textColor = TextWhiteHex;
                item.fromAddress.textColor = TextWhiteHex;
                item.timeDisplay.textColor = TextWhiteHex;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
                if (gfxFileName == "CELLPHONE_BADGER" || gfxFileName == "CELLPHONE_POLICE")
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.icon, whiteRGB[0], whiteRGB[1], whiteRGB[2], 100);
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.icon, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                } // end else if
                if (gfxFileName == "CELLPHONE_FACADE")
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                } // end if
                item.subjectTitle.textColor = darkGreyRGB;
                item.fromAddress.textColor = TextBlackHex;
                item.timeDisplay.textColor = darkGreyRGB;
            } // end if
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
