// Action script...

// [Initial MovieClip Action of sprite 36]
#initclip 10
class com.rockstargames.ui.media.ImageLoaderMC extends MovieClip
{
    var txdListener, w, h, callbackFunc, callbackScope, txdDummy, txdLoader, thisScope, getNextHighestDepth, createEmptyMovieClip, _width, _height;
    function ImageLoaderMC()
    {
        super();
        txdListener = null;
    } // End of the function
    function init(_gfxName, _texDict, _texFilename, __w, __h, __x, __y)
    {
        gfxFileName = _gfxName;
        textureDict = _texDict;
        textureFilename = _texFilename;
        if (__w != undefined)
        {
            w = __w;
        } // end if
        if (__h != undefined)
        {
            h = __h;
        } // end if
        if (__x != undefined)
        {
            x = __x;
        } // end if
        if (__y != undefined)
        {
            y = __y;
        } // end if
    } // End of the function
    function onResponse(_callbackFunc, _callbackScope)
    {
        callbackFunc = _callbackFunc;
        callbackScope = _callbackScope;
    } // End of the function
    function addTxdRefWithPath(mcPath, depth, _callbackFunc, _callbackScope)
    {
        var _loc2 = this.splitPath(mcPath, depth);
        this.addTxdRef(_loc2, _callbackFunc, _callbackScope);
    } // End of the function
    function addTxdRef(callbackStrID, _callbackFunc, _callbackScope)
    {
        if (gfxFileName != "" && textureDict != "")
        {
            this.onResponse(_callbackFunc, _callbackScope);
            com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict, callbackStrID);
        } // end if
    } // End of the function
    function splitPath(mcPath, depth)
    {
        var _loc1 = mcPath.split(".");
        var _loc2 = _loc1.slice(_loc1.length - depth).join(".");
        return (_loc2);
    } // End of the function
    function requestTxdRefWithPath(mcPath, depth, _callbackFunc, _callbackScope)
    {
        var _loc2 = this.splitPath(mcPath, depth);
        this.requestTxdRef(_loc2, false, _callbackFunc, _callbackScope);
    } // End of the function
    function requestTxdRef(callbackStrID, _txdAlreadyLoaded, _callbackFunc, _callbackScope)
    {
        if (gfxFileName != "" && textureDict != "")
        {
            this.onResponse(_callbackFunc, _callbackScope);
            var _loc2 = false;
            if (_txdAlreadyLoaded != undefined)
            {
                _loc2 = _txdAlreadyLoaded;
            } // end if
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict, callbackStrID, _loc2);
        } // end if
    } // End of the function
    function removeTxdRef()
    {
        if (gfxFileName != "" && textureDict != "")
        {
            this.clearTxd();
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict);
        } // end if
    } // End of the function
    function clearTxd()
    {
        isLoaded = false;
        txdDummy.removeMovieClip();
        txdLoader.removeListener(this);
        txdLoader = null;
        txdDummy = null;
    } // End of the function
    function displayTxdResponse(txd)
    {
        this.clearTxd();
        txdLoader = new MovieClipLoader();
        if (txdListener == undefined || txdListener == null)
        {
            txdListener = new Object();
        } // end if
        txdListener.thisScope = this;
        txdListener.onLoadInit = function (target_mc)
        {
            thisScope.onLoadInit();
        };
        txdListener.onLoadError = function (target_mc)
        {
            thisScope.onLoadError();
        };
        txdLoader.addListener(txdListener);
        var _loc2 = "img://" + textureDict + "/" + textureFilename;
        if (txdDummy == undefined || txdDummy == null)
        {
            txdDummy = this.createEmptyMovieClip("txdDummyMC", this.getNextHighestDepth(), {_visible: false});
        } // end if
        txdLoader.loadClip(_loc2, txdDummy);
    } // End of the function
    function loadWithValidation(_gfxName, _texDict, txn, depth, __w, __h, __x, __y)
    {
        if (_texDict == undefined || txn == undefined || _texDict == "" || txn == "")
        {
            this.removeTxdRef();
        }
        else if (textureDict == _texDict)
        {
            if (isLoaded)
            {
                this.init(_gfxName, _texDict, txn, __w, __h, __x, __y);
                this.displayTxdResponse(_texDict);
            } // end if
        }
        else
        {
            if (isLoaded)
            {
                this.removeTxdRef();
            } // end if
            this.init(_gfxName, _texDict, txn, __w, __h, __x, __y);
            this.addTxdRefWithPath(String(this), depth);
        } // end else if
    } // End of the function
    function onLoadInit(targetMC)
    {
        _width = w;
        _height = h;
        txdDummy._x = x;
        txdDummy._y = y;
        txdDummy._visible = true;
        if (callbackFunc != undefined)
        {
            callbackFunc.apply(callbackScope);
        } // end if
        callbackFunc = null;
        callbackScope = null;
        isLoaded = true;
        txdLoader.removeListener(txdListener);
        txdLoader = null;
        txdListener = null;
    } // End of the function
    function onLoadError(targetMC)
    {
        txdLoader.removeListener(txdListener);
        txdLoader = null;
        txdListener = null;
    } // End of the function
    var gfxFileName = "";
    var textureDict = "";
    var textureFilename = "";
    var isLoaded = false;
    var x = 0;
    var y = 0;
} // End of Class
#endinitclip
