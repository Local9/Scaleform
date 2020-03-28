// Action script...

// [Initial MovieClip Action of sprite 59]
#initclip 19
class com.rockstargames.ui.utils.Debug
{
    function Debug()
    {
    } // End of the function
    static function log(str, scriptType)
    {
        if (scriptType == undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("DEBUG_LOG", com.rockstargames.ui.game.GameInterface.HUD_TYPE, str);
        }
        else
        {
            com.rockstargames.ui.game.GameInterface.call("DEBUG_LOG", scriptType, str);
        } // end else if
        return (str);
    } // End of the function
    static function ObjectTrace(object, recursive)
    {
        var _loc2 = "";
        for (var _loc4 in object)
        {
            _loc2 = _loc2 + ("Name:" + object[_loc4]._name + " [Type]: " + typeof(object[_loc4]) + " [Value]: " + object[_loc4] + "\n");
            if (recursive)
            {
                _loc2 = _loc2 + "RECURSE\n";
                com.rockstargames.ui.utils.Debug.ObjectTrace(object[_loc4]);
            } // end if
        } // end of for...in
        com.rockstargames.ui.utils.Debug.log(_loc2);
    } // End of the function
    static function printStats(movieName)
    {
        com.rockstargames.ui.game.GameInterface.call("DEBUG_PRINT_MEMORY_STATS", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, movieName);
    } // End of the function
} // End of Class
#endinitclip
