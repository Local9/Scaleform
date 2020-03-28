// Action script...

// [Initial MovieClip Action of sprite 141]
#initclip 23
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, dataList, topEdge, visibleItems, highlightedItem;
    function PauseMPMenuFriendsListView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc2._y = itemY;
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem)(_loc2);
        _loc3.setView(this);
        _loc3.__set__data(_dataArray);
        itemList[i] = _loc3;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function startKick(begin)
    {
        if (!animatingKick && begin == true)
        {
            this.animateKickIn();
            animatingKick = true;
        } // end if
        var _loc2 = 0;
        var _loc4 = true;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem)(itemList[_loc2]);
            if (_loc3.kick >= 1)
            {
                _loc4 = false;
                break;
            } // end if
        } // end of for
        if (_loc4)
        {
            this.animateKickOut();
            animatingKick = false;
        } // end if
    } // End of the function
    function animateKickIn()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(viewContainer, 1, {onCompleteScope: this, onComplete: kickflip});
    } // End of the function
    function animateKickOut()
    {
        kickAnim = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(viewContainer);
    } // End of the function
    function kickflip()
    {
        kickAnim >= 1 ? (kickAnim = 0) : (kickAnim++);
        var _loc2 = 0;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem)(itemList[_loc2]);
            if (_loc3.kick >= 1)
            {
                _loc3.kickflip(kickAnim);
            } // end if
        } // end of for
        this.animateKickIn();
    } // End of the function
    function scrollHighlightStyle(targetIndex)
    {
        targetIndex = Math.max(0, Math.min(targetIndex, dataList.length - 1));
        var _loc2 = 0;
        var _loc6 = 0;
        if (targetIndex > topEdge + visibleItems - 1)
        {
            _loc6 = _loc6 + (targetIndex - (visibleItems - 1));
            topEdge = _loc6;
            targetIndex = visibleItems - 1;
        }
        else if (targetIndex < topEdge)
        {
            _loc6 = targetIndex;
            topEdge = _loc6;
            targetIndex = 0;
        }
        else
        {
            _loc6 = topEdge;
            targetIndex = targetIndex - topEdge;
        } // end else if
        var _loc3;
        var _loc4;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            _loc3 = itemList[_loc2];
            _loc3.__set__data(dataList[_loc6 + _loc2]);
            _loc4 = targetIndex == _loc2;
            if (_loc3.__get__highlighted() != _loc4)
            {
                _loc3.__set__highlighted(_loc4);
            } // end if
        } // end of for
        highlightedItem = targetIndex;
    } // End of the function
    var titleHeight = 25;
    var scrollJumpVal = 25;
    var scrollYPos = 0;
    var animatingKick = false;
    var kickAnim = 0;
} // End of Class
#endinitclip
