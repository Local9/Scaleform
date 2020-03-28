// Action script...

// [Initial MovieClip Action of sprite 22]
#initclip 2
class com.rockstargames.gtav.Multiplayer.MP_BOUNTY_BOARD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, BOUNTY, _texture, loaderObject, thisObj;
    function MP_BOUNTY_BOARD()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        BOUNTY = CONTENT.BOUNTY;
    } // End of the function
    function SET_BOUNTY(bountysName, bountValue, bountyCharacterTexture, bountyCharacterDictionary)
    {
        BOUNTY.nameTF.text = bountysName;
        BOUNTY.valueTF.text = "$" + bountValue.toString();
        _texture = bountyCharacterTexture;
        com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "MP_BOUNTY_BOARD", bountyCharacterDictionary);
    } // End of the function
    function loadComponent(txd, texture)
    {
        var thisObj = this;
        loaderObject._depth = 100;
        loaderObject._mc = BOUNTY.picMC;
        loaderObject._loader = new MovieClipLoader();
        loaderObject._listener = new Object();
        loaderObject._loader.addListener(loaderObject._listener);
        loaderObject._listener.thisObj = thisObj;
        loaderObject._listener.onLoadInit = function (target_mc)
        {
            var _loc2 = thisObj.loaderObject;
            _loc2._loader.removeListener(_loc2._listener);
            _loc2._loader = null;
        };
        var _loc3 = "img://" + txd + "/" + texture;
        loaderObject._loader.loadClip(_loc3, loaderObject._mc);
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success)
    {
        if (success)
        {
            this.loadComponent(textureDict, _texture);
        } // end if
    } // End of the function
} // End of Class
#endinitclip
