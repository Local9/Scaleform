// Action script...

// [Initial MovieClip Action of sprite 19]
#initclip 2
class com.rockstargames.gtav.Multiplayer.MP_CAR_STATS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var FILE_NAME, CONTENT, loaderObject, _texture, thisObj;
    function MP_CAR_STATS()
    {
        super();
        FILE_NAME = "MP_CAR_STATS_01";
    } // End of the function
    function INITIALISE(mc, fileName)
    {
        FILE_NAME = fileName;
        super.INITIALISE(mc);
        CONTENT._alpha = 0;
        CONTENT._x = 521;
        CONTENT._y = 557;
        loaderObject = new Object();
    } // End of the function
    function SET_VEHICLE_INFOR_AND_STATS(vehicleInfo, vehicleDetails, logoTXD, logoTexture, statStr1, statStr2, statStr3, statStr4, statVal1, statVal2, statVal3, statVal4)
    {
        _texture = logoTexture;
        if (logoTXD != "")
        {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, FILE_NAME, logoTXD);
        } // end if
        CONTENT.vehicleInfoTF.htmlText = vehicleInfo;
        CONTENT.vehicleDetailsTF.htmlText = vehicleDetails;
        CONTENT.statValMC1._xscale = statVal1;
        CONTENT.statValMC2._xscale = statVal2;
        CONTENT.statValMC3._xscale = statVal3;
        CONTENT.statValMC4._xscale = statVal4;
        CONTENT.statStrTF1.htmlText = statStr1;
        CONTENT.statStrTF2.htmlText = statStr2;
        CONTENT.statStrTF3.htmlText = statStr3;
        CONTENT.statStrTF4.htmlText = statStr4;
        CONTENT._alpha = 100;
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success)
    {
        if (success)
        {
            this.loadTexture(textureDict, _texture);
        } // end if
    } // End of the function
    function loadTexture(txd, texture)
    {
        var thisObj = this;
        loaderObject._depth = 100;
        loaderObject._mc = CONTENT.image_placeholderMC;
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
    function debug()
    {
        this.SET_VEHICLE_INFOR_AND_STATS("Vacca", "Tracked and Registered", "MPCarHUD", "Pegassi", "Top Speed", "Accelrations", "Braking", "Traction", 75, 50, 100, 0);
    } // End of the function
} // End of Class
#endinitclip
