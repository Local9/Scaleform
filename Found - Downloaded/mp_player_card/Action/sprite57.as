// Action script...

// [Initial MovieClip Action of sprite 57]
#initclip 4
class com.rockstargames.ui.components.GUIModel
{
    var _scrollBar, __get__scrollBar, __set__scrollBar;
    function GUIModel()
    {
        dataList = [];
        viewList = [];
    } // End of the function
    function getCurrentView(forceTarget)
    {
        var _loc2 = forceTarget != undefined ? (viewList[forceTarget]) : (viewList[viewIndex]);
        return (_loc2);
    } // End of the function
    function getCurrentSelection(forceTarget)
    {
        var _loc2 = this.getCurrentView(forceTarget);
        //return (_loc2.index());
    } // End of the function
    function set scrollBar(s)
    {
        _scrollBar = s;
        //return (this.scrollBar());
        null;
    } // End of the function
    function get scrollBar()
    {
        return (_scrollBar);
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.ui.components.GUIView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function addDataToView(_viewIndex, _itemIndex, _dataArray)
    {
        var _loc2 = viewList[_viewIndex];
        _loc2.addItem(_itemIndex, _dataArray);
    } // End of the function
    function updateSlot(_viewIndex, _itemIndex, _dataArray)
    {
        this.addDataToView(_viewIndex, _itemIndex, _dataArray);
        var _loc2 = this.getCurrentView(_viewIndex);
        var _loc3 = _itemIndex - _loc2.__get__index() + _loc2.highlightedItem;
        _loc2.itemList[_loc3].data = _dataArray;
    } // End of the function
    function addSlot(_viewIndex, _itemIndex, _dataArray)
    {
        this.addDataToView(_viewIndex, _itemIndex, _dataArray);
        var _loc2 = this.getCurrentView(_viewIndex);
        _loc2.addDisplayItemOnce(_itemIndex, _dataArray);
    } // End of the function
    function removeDataFromSlot(_viewIndex, _slotIndex)
    {
        var _loc2 = viewList[_viewIndex];
        _loc2.destroy();
        viewIndex = 0;
        this.getCurrentView(_viewIndex).__set__index(0);
    } // End of the function
    function displayView(_viewIndex, _itemIndex)
    {
        var _loc2 = viewList[_viewIndex];
        _loc2.viewIndex = _viewIndex;
        _loc2.displayView();
    } // End of the function
    function focusView(_viewIndex, clearOtherViews)
    {
        if (clearOtherViews)
        {
            for (var _loc2 = 0; _loc2 < viewList.length; ++_loc2)
            {
                var _loc3 = viewList[_loc2];
                _loc3.__set__highlighted(_loc2 == _viewIndex);
            } // end of for
        }
        else
        {
            viewList[_viewIndex].highlighted = true;
        } // end else if
        viewIndex = _viewIndex;
    } // End of the function
    function nextView()
    {
        var _loc2 = viewIndex + 1;
        if (_loc2 > viewList.length - 1)
        {
            _loc2 = 0;
        } // end if
        this.setView(_loc2);
    } // End of the function
    function prevView()
    {
        var _loc2 = viewIndex - 1;
        if (_loc2 < 0)
        {
            _loc2 = viewList.length - 1;
        } // end if
        this.setView(_loc2);
    } // End of the function
    function setView(_viewIndex)
    {
        viewIndex = _viewIndex;
        this.focusView(viewIndex, 1);
    } // End of the function
    function nextItem()
    {
        var _loc2 = this.getCurrentView();
        var _loc3 = _loc2.__get__index() + 1;
        if (_loc3 > _loc2.__get__maxitems() - 1)
        {
            _loc3 = 0;
        } // end if
        this.setItem(_loc2, _loc3);
    } // End of the function
    function prevItem()
    {
        var _loc2 = this.getCurrentView();
        var _loc3 = _loc2.__get__index() - 1;
        if (_loc3 < 0)
        {
            _loc3 = _loc2.__get__maxitems() - 1;
        } // end if
        this.setItem(_loc2, _loc3);
    } // End of the function
    function setItem(_currentView, _itemIndex)
    {
        _currentView.__set__index(_itemIndex);
        if (this.__get__scrollBar() != undefined)
        {
            if (_itemIndex < _currentView.__get__maxitems() - _currentView.visibleItems + 1)
            {
                this.__get__scrollBar().__set__scrollpercent(100 * (_itemIndex / _currentView.__get__maxitems()));
            }
            else
            {
                this.__get__scrollBar().__set__scrollpercent(100 * ((_currentView.__get__maxitems() - _currentView.visibleItems) / _currentView.__get__maxitems()));
            } // end if
        } // end else if
    } // End of the function
    var dataList = new Array();
    var viewList = new Array();
    var viewIndex = 0;
} // End of Class
#endinitclip
