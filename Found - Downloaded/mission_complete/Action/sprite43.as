// Action script...

// [Initial MovieClip Action of sprite 43]
#initclip 10
class com.rockstargames.gtav.levelDesign.MissionCompleteModel extends com.rockstargames.ui.components.GUIModel
{
    var viewList, viewIndex, getCurrentView;
    function MissionCompleteModel()
    {
        super();
    } // End of the function
    function createView(_viewIndex, _params)
    {
        var _loc2 = viewList[_viewIndex];
        if (_loc2 == undefined)
        {
            _loc2 = new com.rockstargames.gtav.levelDesign.MissionCompleteView();
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
        var _loc2 = (com.rockstargames.gtav.levelDesign.MissionCompleteView)(this.getCurrentView());
        _loc2.__set__index(0);
    } // End of the function
} // End of Class
#endinitclip
