// Action script...

// [Initial MovieClip Action of sprite 144]
#initclip 28
class com.rockstargames.ui.game.GameCom
{
    function GameCom()
    {
    } // End of the function
    static function REQUEST_RESTART_MOVIE(movieName)
    {
        com.rockstargames.ui.game.GameInterface.call("FORCE_RESTART_MOVIE", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, movieName);
    } // End of the function
} // End of Class
#endinitclip
