﻿// Action script...

// [Initial MovieClip Action of sprite 36]
#initclip 5
class com.rockstargames.ui.game.GameInterface
{
    function GameInterface()
    {
    } // End of the function
    static function call()
    {
        flash.external.ExternalInterface.call.apply(null, arguments);
    } // End of the function
    static var GENERIC_TYPE = 0;
    static var SCRIPT_TYPE = 1;
    static var HUD_TYPE = 2;
    static var MINIMAP_TYPE = 3;
    static var WEB_TYPE = 4;
    static var CUTSCENE_TYPE = 5;
    static var PAUSE_TYPE = 6;
    static var STORE = 7;
    static var GENERIC_INSTANT = 8;
    static var GENERIC_BUFFERED = 9;
} // End of Class
#endinitclip