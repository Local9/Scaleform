// Action script...

// [Initial MovieClip Action of sprite 155]
#initclip 3
class com.rockstargames.ui.utils.MultiLoader
{
    var _scope, _gfxName, _clips, _loaders, _falseTotal, _id, dispatchEvent;
    function MultiLoader(scope, gfxName)
    {
        gfx.events.EventDispatcher.initialize(this);
        _scope = scope;
        _gfxName = gfxName;
        _clips = new Array();
        _loaders = new Array();
        _falseTotal = true;
    } // End of the function
    function addClip(url, target, handlers)
    {
        _clips.push(new Object());
        var _loc2 = _clips.length - 1;
        _clips[_loc2].url = url;
        _clips[_loc2].target = target;
        _clips[_loc2].handlers = handlers;
    } // End of the function
    function loadClips()
    {
        var _loc2 = 0;
        var _loc3 = "";
        for (var _loc2 = 0; _loc2 < _clips.length; ++_loc2)
        {
            var _loc4 = new Object();
            _loaders[_loc2] = new MovieClipLoader();
            for (var _loc3 in _clips[_loc2].handlers)
            {
                _loc4[_loc3] = _clips[_loc2].handlers[_loc3];
            } // end of for...in
            _loaders[_loc2]._scope = _scope;
            _loaders[_loc2]._listener = _loc4;
            _loaders[_loc2].addListener(_loc4);
            _loaders[_loc2].loadClip(_clips[_loc2].url, _clips[_loc2].target);
        } // end of for
        _id = setInterval(this, "getGroupProgress", 1000);
    } // End of the function
    function getGroupProgress()
    {
        var _loc4 = 0;
        var _loc3 = 0;
        var _loc2 = 0;
        var _loc5 = _clips.length;
        for (var _loc2 = 0; _loc2 < _clips.length; ++_loc2)
        {
            _loc4 = _loc4 + _loaders[_loc2].getProgress(_clips[_loc2].target).bytesLoaded;
            _loc3 = _loc3 + _loaders[_loc2].getProgress(_clips[_loc2].target).bytesTotal;
        } // end of for
        if (_falseTotal)
        {
            if (_loc4 <= _loc3)
            {
                _falseTotal = false;
            } // end if
        }
        else
        {
            this.dispatchEvent({type: "onGroupProgress", target: this, groupBytesLoaded: _loc4, groupBytesTotal: _loc3});
            if (_loc4 >= _loc3)
            {
                clearInterval(_id);
                this.dispatchEvent({type: "onGroupLoadInit", target: this, groupBytesLoaded: _loc4, groupBytesTotal: _loc3, scope: _scope});
                this.cleanUp();
            } // end if
        } // end else if
    } // End of the function
    function cleanUp(forceGarbageCollection)
    {
        for (var _loc2 = 0; _loc2 < _loaders.length; ++_loc2)
        {
            _loaders[_loc2].removeListener(_loaders[_loc2]._listener);
            _loaders[_loc2] = null;
        } // end of for
        _loaders = [];
        if (forceGarbageCollection)
        {
            flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION", 0, _gfxName);
        } // end if
    } // End of the function
} // End of Class
#endinitclip
