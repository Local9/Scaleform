// Action script...

// [Initial MovieClip Action of sprite 180]
#initclip 20
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase
{
    var isFadingOut, itemTextA, itemBGA, itemTabA, isTweening, viewLinkageList, viewContainer, itemY, itemMC, itemList, rowSpacing, dataList, topEdge, visibleItems, highlightedItem;
    function PauseMenuFreemodeView()
    {
        super();
        isFadingOut = true;
        itemTextA = 100;
        itemBGA = 50;
        itemTabA = 0;
        isTweening = false;
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        _loc2._y = itemY;
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem)(_loc2);
        _loc3.__set__data(_dataArray);
        if (_dataArray[12])
        {
            if (!isTweening)
            {
                isTweening = true;
                itemMC = _loc3;
                itemMC.leftTabMC._visible = true;
                itemMC.leftTabMC._alpha = TAB_FADE_MIN_A;
                this.beginLeftTextFade();
            } // end if
        }
        else if (itemMC)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(itemMC.itemTextLeft);
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(itemMC.bgMC);
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(itemMC.leftTabMC);
            itemMC.itemTextLeft._alpha = itemTextA = 100;
            itemMC.bgMC._alpha = 50;
            itemMC.leftTabMC._alpha = 0;
            itemMC.leftTabMC._visible = false;
            isFadingOut = false;
        } // end else if
        itemList[i] = _loc3;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function displayView()
    {
        super.displayView();
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem)(itemList[itemList.length - 1]);
        _loc3.dummybgMC._height = 25;
    } // End of the function
    function scrollHighlightStyle(targetIndex)
    {
        targetIndex = Math.max(0, Math.min(targetIndex, dataList.length - 1));
        var _loc2 = 0;
        var _loc6 = 0;
        var _loc7 = true;
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
            _loc7 = false;
        } // end else if
        var _loc3;
        var _loc4;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            _loc3 = itemList[_loc2];
            if (_loc7)
            {
                _loc3.__set__data(dataList[_loc6 + _loc2]);
            } // end if
            _loc4 = targetIndex == _loc2;
            if (_loc3.__get__highlighted() != _loc4)
            {
                _loc3.__set__highlighted(_loc4);
            } // end if
        } // end of for
        highlightedItem = targetIndex;
    } // End of the function
    function fadeLeftText()
    {
        isFadingOut = !isFadingOut;
        var _loc4 = isFadingOut ? (TEXT_FADE_MIN_A) : (TEXT_FADE_MAX_A);
        var _loc3 = isFadingOut ? (BG_FADE_MIN_A) : (BG_FADE_MAX_A);
        var _loc2 = isFadingOut ? (TAB_FADE_MAX_A) : (TAB_FADE_MIN_A);
        var _loc7 = com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(itemMC.bgMC, TEXT_FADE_DURATION, {_alpha: _loc3, onCompleteScope: this, onComplete: fadeLeftText, ease: _loc7});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(itemMC.leftTabMC, TEXT_FADE_DURATION, {_alpha: _loc2, ease: _loc7});
    } // End of the function
    function beginLeftTextFade()
    {
        itemMC.itemTextLeft._alpha = itemTextA;
        itemMC.bgMC._alpha = itemBGA;
        itemMC.leftTabMC._alpha = itemTabA;
        var _loc4 = isFadingOut ? (TEXT_FADE_MIN_A) : (TEXT_FADE_MAX_A);
        var _loc6 = isFadingOut ? (BG_FADE_MIN_A) : (BG_FADE_MAX_A);
        var _loc3 = isFadingOut ? (TAB_FADE_MAX_A) : (TAB_FADE_MIN_A);
        var _loc5 = Math.abs(_loc4 - itemTextA);
        var _loc2 = TEXT_FADE_DURATION * (_loc5 / TEXT_FADE_A_RANGE);
        var _loc9 = com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(itemMC.bgMC, _loc2, {_alpha: _loc6, ease: _loc9, onCompleteScope: this, onComplete: fadeLeftText, ease: _loc9});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(itemMC.leftTabMC, _loc2, {_alpha: _loc3, ease: _loc9});
    } // End of the function
    function destroy()
    {
        if (isTweening)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(itemMC.itemTextLeft);
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(itemMC.bgMC);
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(itemMC.leftTabMC);
            itemTextA = itemMC.itemTextLeft._alpha;
            itemBGA = itemMC.bgMC._alpha;
            itemTabA = itemMC.leftTabMC._alpha;
            itemMC.itemTextLeft._alpha = 100;
            itemMC.bgMC._alpha = 50;
            itemMC.leftTabMC._visible = false;
            itemMC = null;
            isTweening = false;
        } // end if
        super.destroy();
    } // End of the function
    var TEXT_FADE_DURATION = 0.750000;
    var TEXT_FADE_MIN_A = 60;
    var TEXT_FADE_MAX_A = 100;
    var TEXT_FADE_A_RANGE = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView.prototype.TEXT_FADE_MAX_A - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView.prototype.TEXT_FADE_MIN_A;
    var BG_FADE_MIN_A = 40;
    var BG_FADE_MAX_A = 75;
    var TAB_FADE_MIN_A = 5;
    var TAB_FADE_MAX_A = 35;
} // End of Class
#endinitclip
