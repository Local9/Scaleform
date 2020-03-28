// Action script...

// [Initial MovieClip Action of sprite 243]
#initclip 31
class com.rockstargames.gtav.levelDesign.FEED_SOCIALCLUB extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var important, scImage, CONTENT, baseClassStrID, returnPathLvl, returnPath1, parseForTitleFonts, parseForFonts;
    function FEED_SOCIALCLUB()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(titlStr, bodyStr, txd, imgStr, isImportant)
    {
        var _loc3 = txd.indexOf("img://");
        if (_loc3 != -1)
        {
            var _loc6 = txd.substr(_loc3 + 6).split("/");
            txd = _loc6[0];
            imgStr = _loc6[1];
        } // end if
        important = isImportant;
        var _loc8 = 23;
        if (imgStr != undefined && imgStr != "")
        {
            if (scImage == undefined)
            {
                scImage = CONTENT.imageMC.attachMovie("imageLoader", "iMC", CONTENT.imageMC.getNextHighestDepth());
            } // end if
            scImage.init(baseClassStrID, txd, imgStr, 25, 25);
            var _loc2 = String(scImage).split(".");
            returnPath1 = _loc2.slice(_loc2.length - returnPathLvl).join(".");
            scImage.addTxdRef(returnPath1);
        }
        else
        {
            CONTENT.titleTF._x = 6;
            CONTENT.titleTF._width = 167;
        } // end else if
        if (titlStr != undefined)
        {
            CONTENT.titleTF.autoSize = true;
            CONTENT.titleTF.htmlText = this.parseForTitleFonts(titlStr);
            if (CONTENT.titleTF._height > 23)
            {
                CONTENT.titleTF._y = 2.500000;
            }
            else
            {
                CONTENT.titleTF._y = 10;
            } // end if
        } // end else if
        if (CONTENT.titleTF._y + CONTENT.titleTF._height > CONTENT.bodyTF._y)
        {
            CONTENT.bodyTF._y = CONTENT.titleTF._y + CONTENT.titleTF._height;
        } // end if
        CONTENT.bodyTF.htmlText = this.parseForFonts(bodyStr);
        CONTENT.bodyTF.autoSize = "left";
        CONTENT.bodyTF.multiline = true;
        CONTENT.bodyTF.wordWrap = true;
        CONTENT.Background._height = CONTENT.bodyTF._y + CONTENT.bodyTF._height + 5;
        CONTENT.BackgroundFlash._height = CONTENT.Background._height;
    } // End of the function
    function CLEAR_TXD()
    {
        scImage.removeTxdRef();
    } // End of the function
} // End of Class
#endinitclip
