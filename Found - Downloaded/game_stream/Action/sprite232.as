// Action script...

// [Initial MovieClip Action of sprite 232]
#initclip 20
class com.rockstargames.gtav.levelDesign.FEED_TOOLTIPS extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var defaultAlpha, CONTENT, blipLayer, important, bIsAsianLanguage, bIsWideScreen;
    function FEED_TOOLTIPS()
    {
        super();
    } // End of the function
    function INITIALISE(bgR, bgG, bgB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage)
    {
        super.INITIALISE(bgR, bgG, bgB, _flashAlpha, _flashRate, _bIsWideScreen, _bIsAsianLanguage);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.BackgroundFill, 0, 0, 0, defaultAlpha);
    } // End of the function
    function SET_FEED_COMPONENT(bodyStr, isImportant)
    {
        if (blipLayer != undefined)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = CONTENT.createEmptyMovieClip("blipLayer", 1000);
        important = isImportant;
        CONTENT.bodyTF.autoSize = true;
        var _loc2 = bIsAsianLanguage ? (16) : (DEFAULT_PT_SIZE);
        if (!bIsWideScreen)
        {
            _loc2 = _loc2 + 1;
        } // end if
        var _loc4 = new com.rockstargames.ui.utils.Text();
        _loc4.setTextWithIcons(bodyStr, blipLayer, CONTENT.bodyTF, 0, _loc2, 1, false);
        var _loc3 = CONTENT.bodyTF.getTextFormat();
        _loc3.size = _loc2;
        CONTENT.bodyTF.setTextFormat(_loc3);
        CONTENT.Background._alpha = 85;
        CONTENT.Background._height = CONTENT.bodyTF._y + CONTENT.bodyTF._height + 5;
        CONTENT.BackgroundFill._height = CONTENT.Background._height - 6;
        CONTENT.BackgroundFlash._height = CONTENT.Background._height;
    } // End of the function
    function CLEAR_TXD()
    {
        blipLayer.removeMovieClip();
    } // End of the function
    var DEFAULT_PT_SIZE = 13;
} // End of Class
#endinitclip
