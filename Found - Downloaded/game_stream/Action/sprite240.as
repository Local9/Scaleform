// Action script...

// [Initial MovieClip Action of sprite 240]
#initclip 28
class com.rockstargames.gtav.levelDesign.FEED_AWARD extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var CONTENT, imgMC, baseClassStrID;
    function FEED_AWARD()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(awardName, txd, txn, xp, colourEnum, titleStr)
    {
        CONTENT.nameTF.textAutoSize = "shrink";
        CONTENT.nameTF.text = awardName.split("<br/>").join("");
        CONTENT.titleTF.textAutoSize = "shrink";
        CONTENT.titleTF.text = titleStr;
        if (xp == "0" || xp == 0)
        {
            CONTENT.xpTF._visible = false;
            CONTENT.xpIconMC._visible = false;
        }
        else
        {
            CONTENT.xpTF.text = xp;
        } // end else if
        if (imgMC == undefined)
        {
            imgMC = (com.rockstargames.ui.media.ImageLoaderMC)(CONTENT.attachMovie("imageLoader", "iMC", CONTENT.getNextHighestDepth(), {_x: 8, _y: 8}));
        } // end if
        com.rockstargames.ui.utils.Colour.ApplyHudColour(imgMC, colourEnum);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.nameTF, colourEnum);
        imgMC.init(baseClassStrID, txd, txn, 25, 25);
        imgMC.addTxdRefWithPath(String(imgMC), 2);
    } // End of the function
    function onImgLoaded()
    {
    } // End of the function
    function CLEAR_TXD()
    {
        if (imgMC.isLoaded)
        {
            imgMC.removeTxdRef();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
