// Action script...

// [Initial MovieClip Action of sprite 194]
#initclip 28
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuDialogueView extends com.rockstargames.ui.components.GUIView
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, __get__params, direction, viewMaskHeight, __get__index, highlightedItem, __set__params;
    function PauseMenuDialogueView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc3 = viewLinkageList[0];
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem)(viewContainer.attachMovie(_loc3, "dialogueItem" + i + "MC", i));
        _loc2._y = itemY;
        _loc2.__set__data(_dataArray);
        itemList[i] = _loc2;
        itemY = itemY + (_loc2.getHeight() + rowSpacing);
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        //return (this.params());
        null;
    } // End of the function
    function scrollToBottom()
    {
        if (itemList.length > com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuDialogueView.MAX_ITEMS_ON_SCREEN)
        {
            this.scrollAllHighlightStyle(itemList.length, false);
        } // end if
    } // End of the function
    function scrollAllHighlightStyle(targetIndex, tween)
    {
        if (tween == undefined)
        {
            tween = true;
        } // end if
        var _loc6 = this.direction(targetIndex);
        var _loc5 = _loc6 < 0 ? (-1) : (1);
        var _loc7 = this.getHeightOfAllItems();
        if (_loc6 != 0 && _loc7 > viewMaskHeight)
        {
            var _loc4 = viewContainer._y;
            for (var _loc2 = this.__get__index(); _loc2 != this.__get__index() + _loc6; _loc2 = _loc2 + _loc5)
            {
                var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem)(itemList[_loc2]).getHeight();
                _loc4 = _loc4 - (_loc3 + rowSpacing) * _loc5;
            } // end of for
            var _loc8 = -_loc7 + viewMaskHeight;
            if (_loc4 < _loc8)
            {
                _loc4 = _loc8;
            }
            else if (_loc4 > 0)
            {
                _loc4 = 0;
            } // end else if
            highlightedItem = targetIndex;
            if (tween)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(viewContainer, 0.200000, {_y: _loc4, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT});
            }
            else
            {
                viewContainer._y = _loc4;
            } // end if
        } // end else if
    } // End of the function
    function getHeightOfAllItems()
    {
        var _loc3 = 0;
        var _loc4 = itemList.length;
        for (var _loc2 = 0; _loc2 < _loc4; ++_loc2)
        {
            _loc3 = _loc3 + (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuDialogueItem)(itemList[_loc2]).getHeight();
            if (_loc2 < _loc4 - 1)
            {
                _loc3 = _loc3 + rowSpacing;
            } // end if
        } // end of for
        return (_loc3);
    } // End of the function
    static var MAX_ITEMS_ON_SCREEN = 8;
} // End of Class
#endinitclip
