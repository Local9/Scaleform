// Action script...

// [Initial MovieClip Action of sprite 248]
#initclip 36
class com.rockstargames.gtav.levelDesign.FEED_CREW_RANKUP extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var CONTENT, emblemImg, baseClassStrID;
    function FEED_CREW_RANKUP()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(chTitle, chSubitle, chTXD, chTXN, bIsImportant)
    {
        CONTENT.titleTF.text = chTitle;
        CONTENT.titleTF.textAutoSize = "shrink";
        CONTENT.subtitleTF.text = chSubitle;
        CONTENT.subtitleTF.textAutoSize = "shrink";
        if (emblemImg == undefined)
        {
            emblemImg = (com.rockstargames.ui.media.ImageLoaderMC)(CONTENT.attachMovie("imageLoader", "iMC", CONTENT.getNextHighestDepth(), {_x: 8, _y: 8}));
        } // end if
        emblemImg.init(baseClassStrID, chTXD, chTXN, 25, 25);
        emblemImg.addTxdRefWithPath(String(emblemImg), 2);
        CONTENT.Background._height = Math.max(41, CONTENT.subtitleTF._y + CONTENT.subtitleTF.textHeight + 8);
    } // End of the function
} // End of Class
#endinitclip
