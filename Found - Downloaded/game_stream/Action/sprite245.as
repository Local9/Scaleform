// Action script...

// [Initial MovieClip Action of sprite 245]
#initclip 33
class com.rockstargames.gtav.levelDesign.FEED_MESSAGE_PICTURE extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var contactTXD, contactTEXTURE, photoTXD, photoTEXTURE, important, CONTENT, parseForTitleFonts, checkNameAndSubstitute, parseForFonts, contactImage, photoImage, baseClassStrID, returnPathLvl, returnPath1, returnPath2;
    function FEED_MESSAGE_PICTURE()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(messageStr, textMessageTxd, textMessageImg, contactTxd, contactImg, isImportant, msgIcon, nameStr)
    {
        contactTXD = contactTxd;
        contactTEXTURE = contactImg;
        photoTXD = textMessageTxd;
        photoTEXTURE = textMessageImg;
        important = isImportant;
        var _loc5 = ["BLANK", "MESSAGE", "EMAIL", "NEW_CONTACT", "DRIVER", "HACKER", "SHOOTER"];
        if (msgIcon == undefined || msgIcon > 6)
        {
            msgIcon = 0;
        } // end if
        var _loc6 = _loc5[msgIcon];
        CONTENT.messageIcon.gotoAndStop(_loc6);
        if (nameStr != undefined)
        {
            CONTENT.nameTF.autoSize = true;
            CONTENT.nameTF.htmlText = this.parseForTitleFonts(nameStr);
            if (CONTENT.nameTF._height > 22)
            {
                CONTENT.nameTF._y = 4;
            }
            else
            {
                CONTENT.nameTF._y = 10;
            } // end else if
        }
        else
        {
            this.checkNameAndSubstitute(contactTxd, CONTENT.nameTF);
        } // end else if
        CONTENT.bodyTF.htmlText = this.parseForFonts(messageStr);
        CONTENT.bodyTF.autoSize = "left";
        CONTENT.bodyTF.multiline = true;
        CONTENT.bodyTF.wordWrap = true;
        var _loc3 = CONTENT.bodyTF._y + CONTENT.bodyTF._height + 5;
        if (_loc3 > 151)
        {
            CONTENT.Background._height = _loc3;
            CONTENT.BackgroundFlash._height = _loc3;
        } // end if
        if (contactImage == undefined)
        {
            contactImage = CONTENT.contactMC.attachMovie("imageLoader", "iMC", CONTENT.contactMC.getNextHighestDepth());
        } // end if
        if (photoImage == undefined)
        {
            photoImage = CONTENT.imageMC.attachMovie("imageLoader", "iMC", CONTENT.imageMC.getNextHighestDepth());
        } // end if
        contactImage.init(baseClassStrID, contactTXD, contactTEXTURE, 25, 25);
        photoImage.init(baseClassStrID, photoTXD, photoTEXTURE, 163, 91);
        var _loc2 = String(contactImage).split(".");
        returnPath1 = _loc2.slice(_loc2.length - returnPathLvl).join(".");
        _loc2 = String(photoImage).split(".");
        returnPath2 = _loc2.slice(_loc2.length - returnPathLvl).join(".");
        if (contactTXD.substr(0, 5) == "CHAR_" || contactTXD.substr(0, 5) == "HC_N_")
        {
            contactImage.requestTxdRef(returnPath1, true);
        }
        else
        {
            contactImage.addTxdRef(returnPath1);
        } // end else if
        photoImage.requestTxdRef(returnPath2, true);
    } // End of the function
    function CLEAR_TXD()
    {
        if (contactImage.isLoaded == true)
        {
            contactImage.removeTxdRef();
        } // end if
        if (photoImage.isLoaded == true)
        {
            photoImage.removeTxdRef();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
