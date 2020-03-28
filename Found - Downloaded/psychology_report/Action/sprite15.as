// Action script...

// [Initial MovieClip Action of sprite 15]
#initclip 3
class com.rockstargames.gtav.levelDesign.PSYCHOLOGY_REPORT extends com.rockstargames.gtav.levelDesign.LETTER_SCRAPS
{
    var CONTENT;
    function PSYCHOLOGY_REPORT()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        CONTENT.letterTF.fauxBold = false;
        CONTENT.gamertagTF.fauxBold = false;
    } // End of the function
    function SET_PLAYER_NAME(gamerTag, crewtag)
    {
        CONTENT.gamertagTF.htmlText = gamerTag;
    } // End of the function
} // End of Class
#endinitclip
