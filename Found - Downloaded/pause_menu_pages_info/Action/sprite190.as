// Action script...

// [Initial MovieClip Action of sprite 190]
#initclip 24
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFeedView extends com.rockstargames.ui.components.GUIView
{
    var viewHeight, viewLinkageList, viewContainer, itemY, itemList, rowSpacing, viewMaskHeight, direction, highlightedItem;
    function PauseMenuFeedView()
    {
        super();
    } // End of the function
    function displayView()
    {
        viewHeight = 0;
        super.displayView();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc3 = viewLinkageList[0];
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem)(viewContainer.attachMovie(_loc3, "feedItem" + i + "MC", i));
        _loc2._y = itemY;
        _loc2.__set__data(_dataArray);
        itemList[i] = _loc2;
        itemY = itemY + (_loc2.getHeight() + rowSpacing);
        viewHeight = itemY;
    } // End of the function
    function scrollToBottom()
    {
        if (viewHeight > viewMaskHeight)
        {
            viewContainer._y = -(viewHeight - viewMaskHeight);
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
        var _loc3 = this.direction(targetIndex);
        if (_loc3 != 0 && viewHeight > viewMaskHeight)
        {
            var _loc2 = viewContainer._y;
            _loc2 = _loc2 - SCROLL_DY * _loc3;
            var _loc4 = viewMaskHeight - viewHeight;
            if (_loc2 < _loc4)
            {
                _loc2 = _loc4;
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
} // End of Class
#endinitclip
