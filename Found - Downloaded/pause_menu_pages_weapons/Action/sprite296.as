// Action script...

// [Initial MovieClip Action of sprite 296]
#initclip 5
class com.rockstargames.ui.media.ImageLoaderManager
{
    function ImageLoaderManager()
    {
        this.clearLists();
    } // End of the function
    function addLoader(_gfxName, _texDict, _texFilename, _texHolder, _setMethod)
    {
        var _loc2 = new com.rockstargames.ui.media.ImageLoader();
        _loc2.init(_gfxName, _texDict, _texFilename, _texHolder, _setMethod);
        loaderList.push(_loc2);
    } // End of the function
    function filterBatch()
    {
        for (var _loc7 = 0; _loc7 < loaderList.length; ++_loc7)
        {
            var _loc9 = loaderList[_loc7];
            var _loc2 = _loc9.textureDict;
            if (_loc2 != "" && _loc2 != undefined)
            {
                var _loc8 = false;
                var _loc6;
                for (var _loc4 = 0; _loc4 < txdList.length; ++_loc4)
                {
                    _loc6 = txdList[_loc4];
                    if (_loc2 == _loc6)
                    {
                        _loc8 = true;
                        break;
                    } // end if
                } // end of for
                if (!_loc8)
                {
                    txdList.push(_loc2);
                } // end if
                for (var _loc3 = 0; _loc3 < loaderList.length; ++_loc3)
                {
                    var _loc5 = loaderList[_loc3];
                    if (_loc2 == _loc5.textureDict)
                    {
                        if (batchList[_loc2] == undefined)
                        {
                            batchList[_loc2] = [];
                        } // end if
                        batchList[_loc2].push(_loc5);
                        break;
                    } // end if
                } // end of for
            } // end if
        } // end of for
        batchIndex = txdList.length;
    } // End of the function
    function startBatchLoadAll()
    {
        if (loaderList.length > 0)
        {
            this.processBatch(loaderList);
        } // end if
    } // End of the function
    function startBatchLoadOn(i)
    {
        var _loc2 = this.getBatch(i);
        if (_loc2 != undefined)
        {
            this.processBatch(_loc2);
        } // end if
    } // End of the function
    function processBatch(list)
    {
        for (var _loc2 = 0; _loc2 < list.length; ++_loc2)
        {
            var _loc1 = list[_loc2];
            switch (_loc1.textureMethod)
            {
                case com.rockstargames.ui.media.ImageLoaderManager.GET_TXD:
                {
                    com.rockstargames.ui.utils.Debug.log("get " + _loc1.textureDict);
                    _loc1.getImage();
                    break;
                } 
                case com.rockstargames.ui.media.ImageLoaderManager.LOAD_TXD:
                {
                    _loc1.loadImage();
                    break;
                } 
                case com.rockstargames.ui.media.ImageLoaderManager.DYNAMIC_TXD:
                {
                    _loc1.setImageInMemory();
                    break;
                } 
            } // End of switch
        } // end of for
    } // End of the function
    function getBatch(i)
    {
        var _loc2 = txdList[i];
        return (batchList[_loc2]);
    } // End of the function
    function flushBatch()
    {
        for (var _loc2 = 0; _loc2 < txdList.length; ++_loc2)
        {
            this.flushBatchOn(_loc2);
        } // end of for
    } // End of the function
    function flushBatchOn(i)
    {
        var _loc2 = this.getBatch(i);
        if (_loc2.length > 0)
        {
            var _loc3 = _loc2[0];
            com.rockstargames.ui.utils.Debug.log("remove " + _loc3.textureDict);
            _loc3.deleteImage();
        } // end if
    } // End of the function
    function clearLists()
    {
        loaderList = [];
        batchList = [];
        txdList = [];
    } // End of the function
    var isBatchLoading = false;
    var batchIndex = 0;
    var batchList = new Array();
    var txdList = new Array();
    var loaderList = new Array();
    static var GET_TXD = 0;
    static var LOAD_TXD = 1;
    static var DYNAMIC_TXD = 2;
} // End of Class
#endinitclip
