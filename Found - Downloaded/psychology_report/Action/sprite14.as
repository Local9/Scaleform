// Action script...

// [Initial MovieClip Action of sprite 14]
#initclip 2
class com.rockstargames.gtav.levelDesign.LETTER_SCRAPS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var displayText, CONTENT;
    function LETTER_SCRAPS()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        displayText = "";
        CONTENT.letterTF.fauxBold = true;
    } // End of the function
    function SET_LETTER_TEXT(str)
    {
        displayText = "";
        for (var _loc3 = 0; _loc3 < arguments.length; ++_loc3)
        {
            displayText = displayText.concat(arguments[_loc3]);
        } // end of for
        CONTENT.letterTF.htmlText = displayText;
    } // End of the function
    function ADD_TO_LETTER_TEXT(str)
    {
        var _loc3 = [displayText];
        SET_LETTER_TEXT.apply(this, _loc3.concat(arguments));
    } // End of the function
    function SET_BG_VISIBILITY(value)
    {
        CONTENT.bgMC._visible = value;
    } // End of the function
} // End of Class
#endinitclip
