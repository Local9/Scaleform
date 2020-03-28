// Action script...

// [Initial MovieClip Action of sprite 226]
#initclip 12
class com.rockstargames.gtav.cellphone.apps.MESSAGE_VIEW extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingView
{
    var gutterHeight, isLandscape, scrollerX, offsetY, offsetX, contentOriginX, contentOriginY, dataProviderUI, scrollBarTimeout, linkageID, CONTENT, gfxFileName, scrollBar, messageBody, content, needsScrollbars, contactTXD, txd_loader, container;
    function MESSAGE_VIEW()
    {
        super();
        gutterHeight = 240;
        isLandscape = false;
        scrollerX = 250;
        offsetY = 64;
        offsetX = 0;
        contentOriginX = 0;
        contentOriginY = 64;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.messageViewDataProviderUI;
        clearInterval(scrollBarTimeout);
        linkageID = "messageViewItem";
        super.construct(CONTENT, linkageID, dataProviderUI);
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, 0, 0, 0, 50);
        } // end if
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.messageViewDataProviderUI;
        var _loc3 = dataProviderUI[0][0];
        messageBody = dataProviderUI[0][1];
        var _loc2 = dataProviderUI[0][2];
        if (_loc2 != "" && _loc2 != undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, _loc2, "MessageViewContact", true);
        }
        else
        {
            this.TXD_HAS_LOADED(_loc2, false, "MessageViewContact");
        } // end else if
        content.fromAddress.text = "";
        content.fromAddressCond.text = "";
        if (_loc3 != undefined)
        {
            if (_loc2.substr(0, 5) != "CHAR_" || _loc2 == "CHAR_HUMANDEFAULT")
            {
                content.fromAddressCond.textAutoSize = "shrink";
                content.fromAddressCond.text = _loc3;
            }
            else
            {
                content.fromAddress.autoSize = "true";
                content.fromAddress.text = _loc3;
                if (gfxFileName != "CELLPHONE_FACADE")
                {
                    if (content.fromAddress._height > 30)
                    {
                        content.fromAddress._y = -2;
                    }
                    else
                    {
                        content.fromAddress._y = 8;
                    } // end else if
                }
                else
                {
                    content.messageBody._y = content.fromAddress._y + content.fromAddress._height;
                } // end if
            } // end else if
        } // end else if
        var _loc5 = messageBody.split("#F0F0F0");
        messageBody = _loc5.join("#000000");
        _loc5 = messageBody.split("#E1E1E1");
        messageBody = _loc5.join("#000000");
        var _loc4 = messageBody.indexOf("<img src=\'img://");
        if (_loc4 != -1)
        {
            var _loc6 = messageBody.substr(_loc4 + 16).indexOf("/");
            TXDStr = messageBody.substr(_loc4 + 16, _loc6);
        } // end if
        if (TXDStr != undefined && TXDStr != "" && prevTXDStr != TXDStr)
        {
            prevTXDStr = TXDStr;
            com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, TXDStr);
        }
        else
        {
            this.setupMessageBody();
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
        if (success == true)
        {
            if (TXDStr == textureDict)
            {
                TXDStrToRemove = TXDStr;
                this.setupMessageBody();
            } // end if
        } // end if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success == true)
        {
            if (uniqueID == "MessageViewContact")
            {
                contactTXD = textureDict;
                this.LOADCLIP(textureDict, content.thumbnail);
            }
            else
            {
                com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict);
            } // end else if
        }
        else
        {
            contactTXD = undefined;
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
        switch (gfxFileName)
        {
            case "CELLPHONE_FACADE":
            {
                target_mc._width = 64;
                target_mc._height = 64;
                break;
            } 
            default:
            {
                target_mc._width = 42;
                target_mc._height = 42;
                break;
            } 
        } // End of switch
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
        if (TXDStrToRemove != "")
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, TXDStrToRemove);
        } // end if
    } // End of the function
    var TXDStr = "";
    var prevTXDStr = "";
    var TXDStrToRemove = "";
} // End of Class
#endinitclip
