// Action script...

// [Initial MovieClip Action of sprite 160]
#initclip 12
class com.rockstargames.gtav.levelDesign.heists.HeistView extends com.rockstargames.ui.components.GUIView
{
    var itemList, viewContainer, viewID, paperMC, viewIndex, __get__params, dataList, viewLinkageList, __get__maxitems, columnSpacing, rowSpacing, highlightedItem, _highlighted, __get__highlighted, __set__index, __set__highlighted, __set__params;
    function HeistView()
    {
        super();
    } // End of the function
    function displayView()
    {
        for (var _loc3 = 0; _loc3 < itemList.length; ++_loc3)
        {
            itemList[_loc3].removeMovieClip();
        } // end of for
        itemList = [];
        super.displayView();
    } // End of the function
    function show(_show)
    {
        viewContainer._visible = _show;
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        if (viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo)
        {
            paperMC = viewContainer.attachMovie("paper", "paper", 0);
        } // end if
        if (viewIndex == 1)
        {
            viewContainer._rotation = 1;
        } // end if
        //return (this.params());
        null;
    } // End of the function
    function addItem(i, _dataArray)
    {
        switch (viewID)
        {
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            {
                dataList[i] = com.rockstargames.gtav.constants.HeistGameplayLUT.lookUp(_dataArray[0]);
                break;
            } 
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
            default:
            {
                dataList[i] = _dataArray;
                break;
            } 
        } // End of switch
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc7 = viewLinkageList[i] != undefined ? (viewLinkageList[i]) : (viewLinkageList[0]);
        var _loc3 = viewContainer.attachMovie(_loc7, _loc7 + i + "MC", this.__get__maxitems() - i);
        var _loc6 = columnSpacing * i;
        var _loc5 = rowSpacing * i;
        switch (viewID)
        {
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            {
                break;
            } 
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
            {
                _loc6 = -8;
                _loc5 = -36 + 18 * i;
                break;
            } 
        } // End of switch
        _loc3._x = _loc6;
        _loc3._y = _loc5;
        var _loc4 = (com.rockstargames.ui.components.GUIMenuItem)(_loc3);
        _loc4.__set__data(_dataArray);
        if (this.__get__params().labels != undefined)
        {
            switch (viewID)
            {
                case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
                case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
                {
                    _loc4.__set__labels(this.__get__params().labels);
                    break;
                } 
            } // End of switch
        } // end if
        itemList[i] = _loc4;
    } // End of the function
    function focusHighlightStyle(targetIndex)
    {
        var _loc3;
        var _loc2 = 0;
        var _loc5 = itemList.length - 1;
        var _loc4 = _loc5 - 1;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            _loc3 = itemList[_loc2];
            if (_loc2 == targetIndex)
            {
                _loc3.swapDepths(_loc5);
                _loc3.__set__highlighted(true);
                continue;
            } // end if
            _loc3.__set__highlighted(false);
            _loc3.swapDepths(_loc4);
            --_loc4;
        } // end of for
        highlightedItem = targetIndex;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        if (viewID != com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay)
        {
            for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
            {
                var _loc3 = false;
                if (_loc2 == highlightedItem)
                {
                    if (_h)
                    {
                        _loc3 = true;
                    } // end if
                } // end if
                itemList[_loc2].highlighted = _loc3;
            } // end of for
        } // end if
        if (viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember)
        {
            for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
            {
                var _loc4 = itemList[_loc2];
                if (_h)
                {
                    com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4, 0.100000, {_x: columnSpacing * _loc2, _y: rowSpacing * _loc2, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
                    continue;
                } // end if
                com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4, 0.100000, {_x: 0, _y: 0, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
            } // end of for
        } // end if
        //return (this.highlighted());
        null;
    } // End of the function
    function clearHighlights(forceCrewReset)
    {
        if (forceCrewReset == undefined)
        {
            forceCrewReset = false;
        } // end if
        for (var _loc3 = 0; _loc3 < itemList.length; ++_loc3)
        {
            var _loc2 = itemList[_loc3];
            switch (viewID)
            {
                case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
                {
                    var _loc4 = _loc2.__get__highlighted();
                    _loc2.__set__highlighted(_loc4);
                    break;
                } 
                case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
                {
                    _loc2.__set__highlighted(true);
                    break;
                } 
                case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
                {
                    if (forceCrewReset)
                    {
                        _loc2.__set__highlighted(true);
                    } // end if
                } 
                default:
                {
                    break;
                } 
            } // End of switch
        } // end of for
        if (viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember)
        {
            for (var _loc3 = 0; _loc3 < itemList.length; ++_loc3)
            {
                var _loc5 = itemList[_loc3];
                com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5, 0.100000, {_x: 0, _y: 0, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
            } // end of for
        } // end if
    } // End of the function
    function destroy()
    {
        if (viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember || viewID == com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay)
        {
            for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
            {
                var _loc3 = itemList[_loc2];
                com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3);
            } // end of for
        } // end if
        itemList = [];
        dataList = [];
        this.__set__index(0);
        removeMovieClip (viewContainer);
        viewContainer = null;
    } // End of the function
} // End of Class
#endinitclip
