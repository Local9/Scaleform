// Action script...

// [Initial MovieClip Action of sprite 233]
#initclip 19
class com.rockstargames.gtav.cellphone.apps.EMAIL_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
    var unreadIcon, readIcon, replyIcon, additionalIcon, CONTENT, dataProviderUI, numberOfVisibleRows, linkageID, isLandscape, defaultRowHeight, gutterHeight, offsetX, offsetY, scrollerX, gfxFileName, scrollBar, container, row, arrayStartPoint, getRowAsPercentage, currentSelection, currentStyle, whiteRGB, TextWhiteHex, offWhiteRGB, TextBlackHex;
    function EMAIL_LIST()
    {
        super();
        unreadIcon = com.rockstargames.gtav.cellphone.IconLabels.UNREAD_EMAIL[1];
        readIcon = com.rockstargames.gtav.cellphone.IconLabels.READ_EMAIL[1];
        replyIcon = com.rockstargames.gtav.cellphone.IconLabels.REPLY_EMAIL[1];
        additionalIcon = com.rockstargames.gtav.cellphone.IconLabels.ATTACHMENT[1];
        CONTENT = this;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.emailListDataProviderUI;
        numberOfVisibleRows = 3;
        linkageID = "inboxListItem";
        numberOfVisibleRows = 3;
        isLandscape = true;
        defaultRowHeight = 50;
        gutterHeight = 150;
        offsetX = -256;
        offsetY = -192;
        scrollerX = 82;
        super.construct(CONTENT, linkageID, dataProviderUI);
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, 0, 0, 0, 50);
        } // end if
        container._rotation = 90;
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.emailListDataProviderUI;
        container._y = 256;
        CONTENT.messageTF.autoSize = "center";
        CONTENT.messageTF.text = "";
        row = 1;
        var _loc4 = 0;
        var _loc9 = 0;
        var _loc11 = "";
        if (numberOfVisibleRows > 0)
        {
            for (var _loc5 = 0; _loc5 < numberOfVisibleRows; ++_loc5)
            {
                var _loc2 = "listItem" + row;
                if (_loc5 + arrayStartPoint >= dataProviderUI.length)
                {
                    _loc4 = _loc9;
                    ++_loc9;
                }
                else
                {
                    _loc4 = _loc5 + arrayStartPoint;
                } // end else if
                var _loc7 = dataProviderUI[_loc4][0];
                var _loc6 = dataProviderUI[_loc4][1];
                var _loc8 = dataProviderUI[_loc4][2];
                var _loc3 = dataProviderUI[_loc4][3];
                if (_loc6 == true)
                {
                    container[_loc2].attachmentIcon._visible = true;
                }
                else
                {
                    container[_loc2].attachmentIcon._visible = false;
                } // end else if
                container[_loc2].icon.gotoAndStop(_loc7 + 1);
                _loc3.split("<BR>").join(" ");
                _loc3.split("</BR>").join(" ");
                _loc3.split("<BR/>").join(" ");
                _loc3.split("<br>").join(" ");
                _loc3.split("</br>").join(" ");
                _loc3.split("<br/>").join(" ");
                container[_loc2].fromAddress.text = com.rockstargames.ui.utils.FitToTextfield.capText(container[_loc2].fromAddress, _loc8);
                container[_loc2].subjectTitle.text = com.rockstargames.ui.utils.FitToTextfield.capText(container[_loc2].subjectTitle, _loc3);
                ++row;
            } // end of for
            var _loc10 = this.getRowAsPercentage(arrayStartPoint + 1);
            currentSelection = arrayStartPoint;
            scrollBar.scrollToPercentage(_loc10);
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
            if (gfxFileName == "CELLPHONE_BADGER")
            {
                if (isActive)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                    com.rockstargames.ui.utils.Colour.Colourise(item.icon, whiteRGB[0], whiteRGB[1], whiteRGB[2]);
                    com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon, whiteRGB[0], whiteRGB[1], whiteRGB[2]);
                    item.fromAddress.textColor = TextWhiteHex;
                    item.subjectTitle.textColor = TextWhiteHex;
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2]);
                    com.rockstargames.ui.utils.Colour.Colourise(item.icon, whiteRGB[0], whiteRGB[1], whiteRGB[2]);
                    com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon, whiteRGB[0], whiteRGB[1], whiteRGB[2]);
                    item.fromAddress.textColor = TextBlackHex;
                    item.subjectTitle.textColor = 6316128;
                } // end else if
            }
            else if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                com.rockstargames.ui.utils.Colour.Colourise(item.icon, whiteRGB[0], whiteRGB[1], whiteRGB[2]);
                com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon, whiteRGB[0], whiteRGB[1], whiteRGB[2]);
                item.fromAddress.textColor = TextWhiteHex;
                item.subjectTitle.textColor = TextWhiteHex;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2]);
                com.rockstargames.ui.utils.Colour.Colourise(item.icon, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                com.rockstargames.ui.utils.Colour.Colourise(item.attachmentIcon, whiteRGB[0], whiteRGB[1], whiteRGB[2]);
                item.fromAddress.textColor = TextBlackHex;
                item.subjectTitle.textColor = 6316128;
            } // end else if
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
