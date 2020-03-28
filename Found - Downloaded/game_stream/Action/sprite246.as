// Action script...

// [Initial MovieClip Action of sprite 246]
#initclip 34
class com.rockstargames.gtav.levelDesign.FEED_FRIENDS extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var important, CONTENT, parseForTitleFonts, parseForFonts, contactImage, baseClassStrID, returnPathLvl, returnPath1;
    function FEED_FRIENDS()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(usertitleTF, bodyStr, txd, imgStr, isImportant)
    {
        var _loc3 = txd.indexOf("img://");
        if (_loc3 != -1)
        {
            var _loc5 = txd.substr(_loc3 + 6).split("/");
            txd = _loc5[0];
            imgStr = _loc5[1];
        } // end if
        important = isImportant;
        if (usertitleTF != undefined)
        {
            CONTENT.titleTF.autoSize = true;
            CONTENT.titleTF.htmlText = this.parseForTitleFonts(usertitleTF);
            if (CONTENT.titleTF._height > 23)
            {
                CONTENT.titleTF._y = 4;
            }
            else
            {
                CONTENT.titleTF._y = 10;
            } // end if
        } // end else if
        CONTENT.bodyTF.htmlText = this.parseForFonts(bodyStr);
        CONTENT.bodyTF.autoSize = "left";
        CONTENT.bodyTF.multiline = true;
        CONTENT.bodyTF.wordWrap = true;
        CONTENT.Background._height = CONTENT.bodyTF._y + CONTENT.bodyTF._height + 5;
        CONTENT.BackgroundFlash._height = CONTENT.Background._height;
        if (contactImage == undefined)
        {
            contactImage = CONTENT.imageMC.attachMovie("imageLoader", "iMC", CONTENT.imageMC.getNextHighestDepth());
        } // end if
        contactImage.init(baseClassStrID, txd, imgStr, 25, 25);
        var _loc2 = String(contactImage).split(".");
        returnPath1 = _loc2.slice(_loc2.length - returnPathLvl).join(".");
        contactImage.addTxdRef(returnPath1);
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
