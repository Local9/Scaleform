// Action script...

// [Initial MovieClip Action of sprite 231]
#initclip 17
class com.rockstargames.gtav.cellphone.apps.EMAIL_VIEW extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingView
{
    var isLandscape, gutterHeight, offsetX, offsetY, scrollerX, contentOriginX, contentOriginY, dataProviderUI, scrollBarTimeout, linkageID, CONTENT, gfxFileName, scrollBar, container, TextBlackHex, content, messageBody, advertTop, needsScrollbars, advertTXD, txd_loader, contactTXD;
    function EMAIL_VIEW()
    {
        super();
        isLandscape = true;
        gutterHeight = 190;
        offsetX = -256;
        offsetY = -230;
        scrollerX = 82;
        contentOriginX = -256;
        contentOriginY = -230;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.emailViewDataProviderUI;
        clearInterval(scrollBarTimeout);
        linkageID = "emailViewItem";
        super.construct(CONTENT, linkageID, dataProviderUI);
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, 0, 0, 0, 50);
        } // end if
        container._rotation = 90;
        _level0.TIMELINE.SET_HEADER();
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.emailViewDataProviderUI;
        var _loc15 = "";
        var _loc3 = "<font color=\'" + TextBlackHex.toString() + "\'>";
        var _loc9 = "<font color=\'#2f5c73\'>";
        var _loc10 = "<br/><img src=\'divider_line\' height=\'8\' width=\'330\'/>";
        var _loc7 = "";
        var _loc8;
        var _loc4;
        var _loc5;
        var _loc6;
        content.fromAddress._y = fromY;
        content.subjectTitle._y = subjectY;
        content.messageBody._y = bodyY;
        _loc4 = dataProviderUI[0][1];
        _loc5 = dataProviderUI[0][2];
        if (_loc4 != undefined)
        {
            content.fromAddress.htmlText = com.rockstargames.ui.utils.FitToTextfield.capText(content.fromAddress, _loc4);
        } // end if
        if (_loc5 != undefined)
        {
            content.subjectTitle.autoSize = "left";
            content.subjectTitle.htmlText = _loc5;
            content.messageBody._y = content.subjectTitle._y + content.subjectTitle._height + 6;
            bodyY = content.messageBody._y;
        } // end if
        if (dataProviderUI.length > 0)
        {
            if (dataProviderUI[0][7] == true)
            {
                messageBody = dataProviderUI[0][3];
                _loc6 = dataProviderUI[0][4];
                _loc3 = messageBody + "<br/>";
                for (var _loc2 = 1; _loc2 < dataProviderUI.length; ++_loc2)
                {
                    _loc3 = _loc3 + (dataProviderUI[_loc2][0] + "<br/>");
                } // end of for
                _loc3 = _loc3 + ("<br/>" + _loc6 + "<br/>");
            }
            else
            {
                for (var _loc2 = 0; _loc2 < dataProviderUI.length; ++_loc2)
                {
                    _loc8 = dataProviderUI[_loc2][0];
                    _loc4 = dataProviderUI[_loc2][1];
                    _loc5 = dataProviderUI[_loc2][2];
                    messageBody = dataProviderUI[_loc2][3];
                    _loc6 = dataProviderUI[_loc2][4];
                    if (_loc2 > 0)
                    {
                        _loc3 = _loc3 + (_loc7 + "<br/><br/>" + _loc9 + _loc8 + "<br/>" + _loc4 + "<br/>" + _loc5 + "<br/>");
                    } // end if
                    _loc3 = _loc3 + (messageBody + "<br/>");
                    _loc3 = _loc3 + "<br/>";
                    _loc3 = _loc3 + (_loc6 + "<br/>");
                    _loc7 = _loc7 + _loc10;
                } // end of for
            } // end if
        } // end else if
        _loc3 = _loc3 + "</font>";
        messageBody = _loc3;
        var _loc13 = messageBody.split("#F0F0F0");
        messageBody = _loc13.join("#000000");
        _loc13 = messageBody.split("#E1E1E1");
        messageBody = _loc13.join("#000000");
        var _loc12 = messageBody.indexOf("<img src=\'img://");
        if (_loc12 != -1)
        {
            var _loc14 = messageBody.substr(_loc12 + 16).indexOf("/");
            TXDStr = messageBody.substr(_loc12 + 16, _loc14);
            if (TXDStr != "" && prevTXDStr != TXDStr)
            {
                prevTXDStr = TXDStr;
                com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, TXDStr);
            } // end if
        }
        else
        {
            this.setupMessageBody();
        } // end else if
        var _loc11 = dataProviderUI[0][5];
        advertTop = dataProviderUI[0][6];
        if (_loc11 != "" && _loc11 != undefined)
        {
            if (advertTop == true || advertTop == undefined)
            {
                content.fromAddress._y = fromY + 86;
                content.subjectTitle._y = subjectY + 86;
                content.messageBody._y = bodyY + 86;
                content.background._height = content.messageBody._y + content.messageBody._height;
            } // end if
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, _loc11, "EmailView", true);
        }
        else
        {
            this.TXD_HAS_LOADED(_loc11, false, "EmailView");
        } // end else if
    } // End of the function
    function setupMessageBody()
    {
        content.messageBody.autoSize = "left";
        content.messageBody.html = true;
        content.messageBody.htmlText = messageBody;
        if (content.messageBody._y + content.messageBody._height > gutterHeight)
        {
            content.background._height = content.messageBody._y + content.messageBody._height;
            needsScrollbars = true;
        } // end if
        var _loc2 = content._height;
        var _loc4 = _loc2 - gutterHeight;
        var _loc3 = _loc4 / _loc2;
        scrollBar.scrollBarContainer.scrubber._height = Math.round((1 - _loc3) * gutterHeight);
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        if (success == true || success == undefined)
        {
            if (TXDStr == textureDict)
            {
                TXDStrToRemove = TXDStr;
                this.setupMessageBody();
                if (content.messageBody._y + content.messageBody._height > gutterHeight)
                {
                    content.background._height = content.messageBody._y + content.messageBody._height;
                } // end if
                var _loc2 = content._height;
                var _loc4 = _loc2 - gutterHeight;
                var _loc3 = _loc4 / _loc2;
                scrollBar.scrollBarContainer.scrubber._height = Math.round((1 - _loc3) * gutterHeight);
            } // end if
        } // end if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success == true)
        {
            advertTXD = textureDict;
            this.LOADCLIP(textureDict, content.emailAdvert);
        }
        else
        {
            advertTXD = undefined;
        } // end else if
    } // End of the function
    function LOADCLIP(textureDict, targetMC)
    {
        txd_loader = new MovieClipLoader();
        txd_loader.addListener(this);
        var _loc2 = "img://" + textureDict + "/" + textureDict;
        txd_loader.loadClip(_loc2, targetMC);
    } // End of the function
    function onLoadInit(target_mc)
    {
        target_mc._width = 344;
        target_mc._height = 86;
        if (advertTop == true || advertTop == undefined)
        {
            target_mc._y = 0;
        }
        else
        {
            target_mc._y = content.messageBody._y + content.messageBody._height;
        } // end else if
        delete this.txd_loader;
    } // End of the function
    function CLEAN_UP_DATA()
    {
        dataProviderUI = [];
        content.thumbnail.thumbnailTF.htmlText = "";
        content.messageBody.htmlText = "";
        container.removeMovieClip();
        if (contactTXD != undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, contactTXD);
        } // end if
        if (advertTXD != undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, advertTXD);
        } // end if
    } // End of the function
    var TXDStr = "";
    var prevTXDStr = "";
    var TXDStrToRemove = "";
    var fromY = 1;
    var subjectY = 25;
    var bodyY = 60;
} // End of Class
#endinitclip
