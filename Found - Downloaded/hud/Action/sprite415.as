﻿// Action script...

// [Initial MovieClip Action of sprite 415]
#initclip 3
class com.rockstargames.ui.core.BaseComponentInfo
{
    var _enumId, _status, _listener, _functionCache, _intendedVisibleState, _displayList, _displayListPriority, _mc, _hasGfx, _position, _size, _colour;
    function BaseComponentInfo(newID)
    {
        _enumId = newID;
        _status = 0;
        _listener = {};
        _functionCache = [];
        _intendedVisibleState = true;
        _displayList = -1;
        _displayListPriority = -1;
        _mc = new MovieClip();
        _hasGfx = true;
    } // End of the function
    function sanitise()
    {
        _mc = new MovieClip();
        _status = 0;
        _listener = {};
        _displayList = -1;
        _displayListPriority = -1;
        _position = [];
        _size = [];
        _colour = [];
        _functionCache = [];
        _hasGfx = true;
    } // End of the function
} // End of Class
#endinitclip
