// Action script...

// [Initial MovieClip Action of sprite 237]
#initclip 25
class com.rockstargames.gtav.levelDesign.FEED_UNLOCK extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var CONTENT;
    function FEED_UNLOCK()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(chTitle, chSubtitle, iIconType)
    {
        CONTENT.titleTF.text = chTitle;
        CONTENT.titleTF.textAutoSize = "shrink";
        CONTENT.bodyTF.htmlText = chSubtitle;
        CONTENT.bodyTF.autoSize = true;
        CONTENT.iconMC.gotoAndStop(iIconType + 1);
        CONTENT.Background._height = Math.max(41, CONTENT.bodyTF._y + CONTENT.bodyTF.textHeight + 8);
    } // End of the function
} // End of Class
#endinitclip
