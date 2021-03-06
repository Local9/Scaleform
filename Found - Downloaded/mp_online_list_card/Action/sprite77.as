﻿// Action script...

// [Initial MovieClip Action of sprite 77]
#initclip 21
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, viewIndex, getCurrentView, setItem;
    function PauseMenuFreemodeModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function removeDataFromSlot(_viewIndex, _slotIndex)
    {
        var _loc2 = viewList[_viewIndex];
        _loc2.destroy();
        viewIndex = 0;
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)(this.getCurrentView());
    } // End of the function
    function nextItem()
    {
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)(this.getCurrentView());
        var _loc7 = 0;
        var _loc8 = false;
        for (var _loc4 = 0; _loc4 < _loc3.dataList.length; ++_loc4)
        {
            var _loc2 = _loc3.__get__index() + 1 + _loc4;
            if (_loc2 > _loc3.dataList.length - 1)
            {
                _loc2 = _loc2 - _loc3.dataList.length;
            } // end if
            var _loc6 = _loc3.dataList[_loc2];
            var _loc5 = _loc6[menuItemStateIndex];
            if (_loc5 >= 1)
            {
                _loc7 = _loc2;
                _loc8 = true;
                break;
            } // end if
        } // end of for
        if (_loc8)
        {
            this.setItem(_loc3, _loc7);
        } // end if
    } // End of the function
    function prevItem()
    {
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)(this.getCurrentView());
        var _loc7 = 0;
        var _loc8 = false;
        for (var _loc3 = 0; _loc3 < _loc4.dataList.length; ++_loc3)
        {
            var _loc2 = _loc4.__get__index() - 1 - _loc3;
            if (_loc2 < 0)
            {
                _loc2 = _loc4.dataList.length + _loc2;
            } // end if
            var _loc6 = _loc4.dataList[_loc2];
            var _loc5 = _loc6[menuItemStateIndex];
            if (_loc5 >= 1)
            {
                _loc7 = _loc2;
                _loc8 = true;
                break;
            } // end if
        } // end of for
        if (_loc8)
        {
            this.setItem(_loc4, _loc7);
        } // end if
    } // End of the function
    function highlightNext()
    {
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)(this.getCurrentView());
        var _loc7 = 0;
        var _loc8 = false;
        for (var _loc4 = 0; _loc4 < _loc3.dataList.length; ++_loc4)
        {
            var _loc2 = _loc3.__get__index() + _loc4;
            if (_loc2 > _loc3.dataList.length - 1)
            {
                _loc2 = _loc2 - _loc3.dataList.length;
            } // end if
            var _loc6 = _loc3.dataList[_loc2];
            var _loc5 = _loc6[menuItemStateIndex];
            if (_loc5 >= 1)
            {
                _loc7 = _loc2;
                _loc8 = true;
                break;
            } // end if
        } // end of for
        if (_loc8)
        {
            this.setItem(_loc3, _loc7);
        } // end if
    } // End of the function
    function clearHighlight()
    {
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)(this.getCurrentView());
        for (var _loc2 = 0; _loc2 < _loc3.itemList.length; ++_loc2)
        {
            _loc3.itemList[_loc2].highlighted = false;
        } // end of for
    } // End of the function
    var menuItemStateIndex = 5;
} // End of Class
#endinitclip
