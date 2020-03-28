// Action script...

// [Initial MovieClip Action of sprite 247]
#initclip 35
class com.rockstargames.gtav.levelDesign.FEED_DLC extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var important, CONTENT, parseForFonts, dlcImage, baseClassStrID, returnPathLvl, returnPath1;
    function FEED_DLC()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(dlcStr, txd, imgStr, isImportant, titleStr)
    {
        var _loc5 = txd.indexOf("img://");
        if (_loc5 != -1)
        {
            var _loc7 = txd.substr(_loc5 + 6).split("/");
            txd = _loc7[0];
            imgStr = _loc7[1];
        } // end if
        important = isImportant;
        var _loc2;
        if (titleStr == undefined)
        {
            titleStr = "";
            _loc2 = dlcStr;
        }
        else
        {
            _loc2 = titleStr + "<BR>" + dlcStr;
        } // end else if
        CONTENT.dlcTF.htmlText = this.parseForFonts(_loc2);
        CONTENT.dlcTF.autoSize = "left";
        CONTENT.dlcTF.multiline = true;
        CONTENT.dlcTF.wordWrap = true;
        var _loc3 = CONTENT.dlcTF._y + CONTENT.dlcTF._height + 5;
        CONTENT.Background._height = _loc3;
        CONTENT.BackgroundFlash._height = _loc3;
        if (dlcImage == undefined)
        {
            dlcImage = CONTENT.imageMC.attachMovie("imageLoader", "iMC", CONTENT.imageMC.getNextHighestDepth());
        } // end if
        dlcImage.init(baseClassStrID, txd, imgStr, 163, 64);
        var _loc4 = String(dlcImage).split(".");
        returnPath1 = _loc4.slice(_loc4.length - returnPathLvl).join(".");
        dlcImage.addTxdRef(returnPath1);
    } // End of the function
    function CLEAR_TXD()
    {
        if (dlcImage.isLoaded == true)
        {
            dlcImage.removeTxdRef();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
