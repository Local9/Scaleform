// Action script...

// [Initial MovieClip Action of sprite 55]
#initclip 16
class com.rockstargames.ui.utils.Text
{
    function Text()
    {
    } // End of the function
    function setTextWithIcons(textLabel, movieClipToAttachBlips, txtField, fontStyle, pointSize, leading, centerAligned)
    {
        com.rockstargames.ui.game.GameInterface.call("SET_FORMATTED_TEXT_WITH_ICONS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, textLabel, movieClipToAttachBlips, txtField, fontStyle, pointSize, leading, centerAligned);
    } // End of the function
} // End of Class
#endinitclip
