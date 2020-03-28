// Action script...

// [Initial MovieClip Action of sprite 164]
#initclip 11
class com.rockstargames.ui.utils.Localisation
{
    function Localisation()
    {
    } // End of the function
    static function setTextWithTranslation(txtField, textLabel, scriptType, isHTML)
    {
        if (isHTML == undefined)
        {
            isHTML = false;
        } // end if
        if (scriptType == undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, textLabel, txtField, isHTML);
        }
        else
        {
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", scriptType, textLabel, txtField, isHTML);
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
