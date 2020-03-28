// Action script...

// [Initial MovieClip Action of sprite 50]
#initclip 10
class com.rockstargames.gtav.levelDesign.ShopModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, viewIndex, getCurrentView, __get__scrollBar, _arrows, __get__arrows, __set__arrows;
    function ShopModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.levelDesign.ShopView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function removeDataFromSlot(_viewIndex, _slotIndex)
    {
        var _loc3 = viewList[_viewIndex];
        _loc3.destroy();
        viewIndex = 0;
        var _loc2 = (com.rockstargames.gtav.levelDesign.ShopView)(this.getCurrentView());
        _loc2.__set__index(0);
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
    function set arrows(a)
    {
        _arrows = a;
        //return (this.arrows());
        null;
    } // End of the function
    function get arrows()
    {
        return (_arrows);
    } // End of the function
} // End of Class
#endinitclip
