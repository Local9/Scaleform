// Action script...

// [Initial MovieClip Action of sprite 141]
#initclip 13
class com.rockstargames.gtav.levelDesign.heists.HeistModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, addDataToView, getCurrentView, viewIndex, dataList, setItem;
    function HeistModel()
    {
        super();
    } // End of the function
    function setLabel(_weaponname, _jobcut, _accuracy)
    {
        for (var _loc3 = 0; _loc3 < viewList.length; ++_loc3)
        {
            var _loc4 = viewList[_loc3];
            _loc4.__get__params().labels = arguments;
        } // end of for
    } // End of the function
    function swapViewDepths(hv)
    {
        hv.viewContainer.swapDepths(viewList.length + 1);
    } // End of the function
    function updateSlot(_viewIndex, _itemIndex, _dataArray)
    {
        this.addDataToView(_viewIndex, _itemIndex, _dataArray);
        var _loc2 = this.getCurrentView(_viewIndex);
        var _loc5 = _itemIndex - _loc2.__get__index() + _loc2.highlightedItem;
        var _loc3 = [];
        switch (_loc2.viewID)
        {
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            {
                _loc3 = com.rockstargames.gtav.constants.HeistGameplayLUT.lookUp(_dataArray[0]);
                break;
            } 
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
            default:
            {
                _loc3 = _dataArray;
                break;
            } 
        } // End of switch
        _loc2.itemList[_loc5].data = _loc3;
    } // End of the function
    function focusView(_viewIndex, clearOtherViews)
    {
        var _loc3;
        if (clearOtherViews == -1)
        {
            for (var _loc2 = 0; _loc2 < viewList.length; ++_loc2)
            {
                _loc3 = viewList[_loc2];
                _loc3.clearHighlights(true);
            } // end of for
        }
        else if (clearOtherViews)
        {
            for (var _loc2 = 0; _loc2 < viewList.length; ++_loc2)
            {
                _loc3 = viewList[_loc2];
                if (_viewIndex == 99)
                {
                    _loc3.clearHighlights();
                    continue;
                } // end if
                _loc3.__set__highlighted(_loc2 == _viewIndex);
            } // end of for
            if (_viewIndex != 99)
            {
                this.swapViewDepths(viewList[_viewIndex]);
            } // end if
        }
        else
        {
            viewList[_viewIndex].highlighted = true;
        } // end else if
        viewIndex = _viewIndex;
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.levelDesign.heists.HeistView();
        } // end if
        _loc2.viewIndex = _viewIndex;
        _loc2.__set__params(_params);
        viewList[_viewIndex] = _loc2;
    } // End of the function
    function removeDataFromSlot(_viewIndex, _slotIndex)
    {
        var _loc2 = viewList[_viewIndex];
        _loc2.destroy();
        dataList[_viewIndex] = null;
        viewList[_viewIndex] = null;
    } // End of the function
    function nextItem()
    {
        var _loc2 = this.getCurrentView();
        var _loc3 = _loc2.__get__index() + 1;
        if (_loc2.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay)
        {
            if (_loc3 > _loc2.__get__maxitems() - 1)
            {
                _loc3 = _loc2.__get__maxitems() - 1;
            } // end if
        }
        else if (_loc3 > _loc2.__get__maxitems() - 1)
        {
            _loc3 = 0;
        } // end else if
        this.setItem(_loc2, _loc3);
    } // End of the function
    function prevItem()
    {
        var _loc3 = this.getCurrentView();
        var _loc2 = _loc3.__get__index() - 1;
        if (_loc3.viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay)
        {
            if (_loc2 < 0)
            {
                _loc2 = 0;
            } // end if
        }
        else if (_loc2 < 0)
        {
            _loc2 = _loc3.__get__maxitems() - 1;
        } // end else if
        this.setItem(_loc3, _loc2);
    } // End of the function
    static var viewCrewMember = 0;
    static var viewGameplay = 1;
    static var viewTodo = 2;
} // End of Class
#endinitclip
