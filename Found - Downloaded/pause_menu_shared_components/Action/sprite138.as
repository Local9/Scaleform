// Action script...

// [Initial MovieClip Action of sprite 138]
#initclip 20
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextView extends com.rockstargames.ui.components.GUIView
{
    var viewLinkageList, viewContainer, itemY, itemList, rowSpacing, __get__params, direction, viewMaskHeight, highlightedItem, __set__params;
    function PauseMenuTextView()
    {
        super();
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc3 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc3, _loc3 + i + "MC", i);
        _loc2._y = itemY;
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuTextListItem)(_loc2);
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
    function scrollAllHighlightStyle(targetIndex)
    {
        var _loc3 = this.direction(targetIndex);
        var _loc2 = 0;
        if (viewContainer._height > viewMaskHeight)
        {
            if (_loc3 != 0)
            {
                if (_loc3 > 0)
                {
                    scrollYPos = scrollYPos - scrollJumpVal;
                    _loc2 = -(viewContainer._height - viewMaskHeight - 7);
                    if (scrollYPos < _loc2)
                    {
                        scrollYPos = _loc2;
                    } // end if
                    viewContainer._y = scrollYPos;
                }
                else
                {
                    scrollYPos = scrollYPos + scrollJumpVal;
                    if (scrollYPos > _loc2)
                    {
                        scrollYPos = _loc2;
                    } // end if
                    viewContainer._y = scrollYPos;
                } // end else if
                highlightedItem = targetIndex;
            } // end if
        } // end if
    } // End of the function
    var titleHeight = 25;
    var scrollJumpVal = 25;
    var scrollYPos = 0;
} // End of Class
#endinitclip
