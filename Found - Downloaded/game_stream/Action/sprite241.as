// Action script...

// [Initial MovieClip Action of sprite 241]
#initclip 29
class com.rockstargames.gtav.levelDesign.FEED_TICKER extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var important, CONTENT, parseForFonts;
    function FEED_TICKER()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(bodyStr)
    {
        if (typeof(arguments[1]) == "boolean")
        {
            important = arguments[1];
        }
        else if (typeof(arguments[1]) == "string")
        {
            bodyStr = bodyStr + "</BR>" + arguments[1];
            important = arguments[2];
        } // end else if
        CONTENT.bodyTF.htmlText = this.parseForFonts(bodyStr);
        CONTENT.bodyTF.autoSize = true;
        CONTENT.Background._height = CONTENT.bodyTF._y + CONTENT.bodyTF._height + 5;
        CONTENT.BackgroundFlash._height = CONTENT.Background._height;
    } // End of the function
} // End of Class
#endinitclip
