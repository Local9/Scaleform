// Action script...

// [Initial MovieClip Action of sprite 244]
#initclip 32
class com.rockstargames.gtav.levelDesign.FEED_MESSAGE_TEXT extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var contactTXD, contactTEXTURE, important, CONTENT, parseForGamerTagTitleFonts, checkNameAndSubstitute, parseForFonts, contactImage, baseClassStrID, returnPathLvl, returnPath1, flashAlpha, bgColour;
    function FEED_MESSAGE_TEXT()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(bodyStr, txd, imgStr, isImportant, msgIcon, nameStr, subtitleStr)
    {
        contactTXD = txd;
        contactTEXTURE = imgStr;
        important = isImportant;
        var _loc7 = ["BLANK", "MESSAGE", "EMAIL", "NEW_CONTACT", "DRIVER", "HACKER", "SHOOTER", "INVITE"];
        if (msgIcon == undefined || msgIcon > _loc7.length - 1)
        {
            msgIcon = 0;
        } // end if
        var _loc10 = _loc7[msgIcon];
        CONTENT.messageIcon.gotoAndStop(_loc10);
        if (msgIcon == 0)
        {
            CONTENT.nameTF._width = 138;
        }
        else
        {
            CONTENT.nameTF._width = 120;
        } // end else if
        if (nameStr != undefined)
        {
            CONTENT.nameTF.textAutoSize = "shrink";
            CONTENT.subtitleTF.textAutoSize = "shrink";
            CONTENT.nameTF.htmlText = this.parseForGamerTagTitleFonts(CONTENT.nameTF, nameStr, 14);
            if (subtitleStr != undefined && subtitleStr != "" && typeof(subtitleStr) == "string")
            {
                CONTENT.subtitleTF.htmlText = this.parseForGamerTagTitleFonts(CONTENT.subtitleTF, subtitleStr, 13);
            } // end if
        }
        else
        {
            this.checkNameAndSubstitute(txd, CONTENT.nameTF);
            var _loc5 = CONTENT.nameTF.text;
            var _loc8 = _loc5.length;
            if (bodyStr.slice(0, _loc8) == _loc5)
            {
                bodyStr = bodyStr.slice(_loc8);
                if (bodyStr.slice(0, 4) == "<BR>")
                {
                    bodyStr = bodyStr.slice(4);
                } // end if
            } // end if
        } // end else if
        CONTENT.bodyTF.htmlText = this.parseForFonts(bodyStr);
        CONTENT.bodyTF.autoSize = "left";
        CONTENT.bodyTF.multiline = true;
        CONTENT.bodyTF.wordWrap = true;
        var _loc3 = 41;
        if (bodyStr != undefined && bodyStr != "")
        {
            _loc3 = CONTENT.bodyTF._y + CONTENT.bodyTF._height + 4;
        }
        else
        {
            _loc3 = CONTENT.nameTF._y + CONTENT.nameTF._height + 4;
        } // end else if
        if (_loc3 > 41)
        {
            CONTENT.Background._height = _loc3;
            CONTENT.BackgroundHighlight._height = _loc3;
        } // end if
        if (contactImage == undefined)
        {
            contactImage = CONTENT.imageMC.attachMovie("imageLoader", "iMC", CONTENT.imageMC.getNextHighestDepth());
        } // end if
        contactImage.init(baseClassStrID, contactTXD, contactTEXTURE, 25, 25);
        var _loc6 = String(contactImage).split(".");
        returnPath1 = _loc6.slice(_loc6.length - returnPathLvl).join(".");
        if (contactTXD.substr(0, 5) == "CHAR_" || contactTXD.substr(0, 5) == "HC_N_")
        {
            contactImage.requestTxdRef(returnPath1, true);
        }
        else
        {
            contactImage.addTxdRef(returnPath1);
        } // end else if
    } // End of the function
    function flashOn()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.BackgroundHighlight);
        CONTENT.BackgroundHighlight._visible = true;
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.BackgroundHighlight, bgColour[0], bgColour[1], bgColour[2], flashAlpha);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.BackgroundHighlight, 2, {_alpha: 0});
    } // End of the function
    function flashOff()
    {
    } // End of the function
    function CLEAR_TXD()
    {
        if (contactImage.isLoaded == true)
        {
            contactImage.removeTxdRef();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
