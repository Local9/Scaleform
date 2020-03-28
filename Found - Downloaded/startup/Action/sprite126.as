// Action script...

// [Initial MovieClip Action of sprite 126]
#initclip 13
class com.rockstargames.ui.loadingScreens.LoadScreenModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, getCurrentView, __get__scrollBar;
    function LoadScreenModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.ui.loadingScreens.LoadScreenView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function nextItem()
    {
        var _loc3 = (com.rockstargames.ui.loadingScreens.LoadScreenView)(this.getCurrentView());
        var _loc7 = 0;
        for (var _loc4 = 0; _loc4 < _loc3.dataList.length; ++_loc4)
        {
            var _loc2 = _loc3.__get__index() + 1 + _loc4;
            if (_loc2 > _loc3.dataList.length - 1)
            {
                _loc2 = _loc2 - _loc3.dataList.length;
            } // end if
            var _loc6 = _loc3.dataList[_loc2];
            var _loc5 = _loc6[menuItemStateIndex];
            if (_loc5 > 0)
            {
                _loc7 = _loc2;
                break;
            } // end if
        } // end of for
        this.setItem(_loc3, _loc7);
    } // End of the function
    function prevItem()
    {
        var _loc4 = (com.rockstargames.ui.loadingScreens.LoadScreenView)(this.getCurrentView());
        var _loc7 = 0;
        for (var _loc3 = 0; _loc3 < _loc4.dataList.length; ++_loc3)
        {
            var _loc2 = _loc4.__get__index() - 1 - _loc3;
            if (_loc2 < 0)
            {
                _loc2 = _loc4.dataList.length + _loc2;
            } // end if
            var _loc6 = _loc4.dataList[_loc2];
            var _loc5 = _loc6[menuItemStateIndex];
            if (_loc5 > 0)
            {
                _loc7 = _loc2;
                break;
            } // end if
        } // end of for
        this.setItem(_loc4, _loc7);
    } // End of the function
    function highlightNext()
    {
        var _loc3 = (com.rockstargames.ui.loadingScreens.LoadScreenView)(this.getCurrentView());
        var _loc7 = 0;
        for (var _loc4 = 0; _loc4 < _loc3.dataList.length; ++_loc4)
        {
            var _loc2 = _loc3.__get__index() + _loc4;
            if (_loc2 > _loc3.dataList.length - 1)
            {
                _loc2 = _loc2 - _loc3.dataList.length;
            } // end if
            var _loc6 = _loc3.dataList[_loc2];
            var _loc5 = _loc6[menuItemStateIndex];
            if (_loc5 > 0)
            {
                _loc7 = _loc2;
                break;
            } // end if
        } // end of for
        this.setItem(_loc3, _loc7);
    } // End of the function
    function setItem(_currentView, _itemIndex)
    {
        _currentView.__set__index(_itemIndex);
        if (this.__get__scrollBar() != undefined)
        {
            this.__get__scrollBar().__set__scrollpercent(100 * (_currentView.topEdge / _currentView.__get__maxitems()));
        } // end if
    } // End of the function
    var menuItemStateIndex = 0;
} // End of Class
#endinitclip
