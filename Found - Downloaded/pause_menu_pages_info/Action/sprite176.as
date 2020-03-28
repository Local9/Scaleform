// Action script...

// [Initial MovieClip Action of sprite 176]
#initclip 10
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpView extends com.rockstargames.ui.components.GUIView
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, __get__params, direction, viewMaskHeight, highlightedItem, __set__params;
    function PauseMenuMissionHelpView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc3 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc3, _loc3 + i + "MC", i);
        _loc2._y = itemY;
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuMissionHelpListItem)(_loc2);
        _loc4.__set__data(_dataArray);
        itemList[i] = _loc4;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        if (_p.titleHeight != undefined)
        {
            titleHeight = _p.titleHeight;
        } // end if
        scrollJumpVal = titleHeight;
        //return (this.params());
        null;
    } // End of the function
    function scrollToBottom()
    {
        var _loc2 = 430;
        var _loc3 = viewContainer._height;
        if (_loc3 > _loc2)
        {
            viewContainer._y = -(_loc3 - _loc2);
        } // end if
    } // End of the function
    function destroy()
    {
        super.destroy();
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(viewContainer);
    } // End of the function
    function scrollAllHighlightStyle(targetIndex, tween)
    {
        if (tween == undefined)
        {
            tween = true;
        } // end if
        var _loc4 = this.direction(targetIndex);
        var _loc3 = viewContainer._height;
        if (_loc4 != 0 && _loc3 > viewMaskHeight)
        {
            var _loc2 = viewContainer._y;
            _loc2 = _loc2 - SCROLL_DY * _loc4;
            var _loc5 = -_loc3 + viewMaskHeight;
            if (_loc2 < _loc5)
            {
                _loc2 = _loc5;
            }
            else if (_loc2 > 0)
            {
                _loc2 = 0;
            } // end else if
            highlightedItem = targetIndex;
            if (tween)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(viewContainer, SCROLL_DURATION, {_y: _loc2, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT});
            }
            else
            {
                viewContainer._y = _loc2;
            } // end if
        } // end else if
    } // End of the function
    var SCROLL_DURATION = 0.200000;
    var SCROLL_DY = 27;
    var titleHeight = 25;
    var scrollJumpVal = 25;
    var scrollYPos = 0;
} // End of Class
#endinitclip
