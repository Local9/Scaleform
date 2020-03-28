// Action script...

// [Initial MovieClip Action of sprite 35]
#initclip 3
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_BAR extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, menuContainer;
    function PAUSE_MENU_BAR()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        if (mc != undefined)
        {
            super.INITIALISE(mc);
        }
        else
        {
            CONTENT = this;
        } // end else if
        menuContainer = CONTENT.createEmptyMovieClip("menuContainerMC", CONTENT.getNextHighestDepth());
    } // End of the function
    function BUILD_MENU(params)
    {
        var _loc5 = params;
        if (menuItemList.length > 0)
        {
            for (var _loc2 = 0; _loc2 < menuItemList.length; ++_loc2)
            {
                menuItemList[_loc2].removeMovieClip();
            } // end of for
        } // end if
        menuItemList = [];
        this.getMenuWidth(_loc5.length);
        for (var _loc2 = 0; _loc2 < _loc5.length; ++_loc2)
        {
            var _loc3 = menuContainer.attachMovie("menuItem", "menuItem" + _loc2 + "MC", _loc2);
            _loc3._x = _loc2 * (menuItemWidth + menuItemSpacing);
            var _loc4 = "";
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)(_loc3).__set__menuenum(_loc5[_loc2]);
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)(_loc3).__set__label(String(_loc4));
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)(_loc3).__set__width(menuItemWidth);
            menuItemList.push(_loc3);
        } // end of for
        this.HIGHLIGHT_MENU(0);
    } // End of the function
    function REMOVE_MENU()
    {
        for (var _loc2 = 0; _loc2 < menuItemList.length; ++_loc2)
        {
            var _loc3 = menuItemList[_loc2];
            _loc3.removeMovieClip();
        } // end of for
        menuIndex = 0;
        startIndex = 0;
        visibleItems = 6;
        menuContainer._x = 0;
        menuItemList = [];
    } // End of the function
    function SET_ALL_HIGHLIGHTS(hOn, loseGap)
    {
        allHighlightsOn = hOn;
        for (var _loc2 = 0; _loc2 < menuItemList.length; ++_loc2)
        {
            var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)(menuItemList[_loc2]);
            if (allHighlightsOn)
            {
                _loc3.__set__highlight(true);
            }
            else
            {
                _loc3.__set__highlight(menuIndex == _loc2);
            } // end else if
            if (loseGap != undefined)
            {
                _loc3.__set__gapless(loseGap);
            } // end if
        } // end of for
    } // End of the function
    function SET_MENU_HEADER_TEXT_BY_INDEX(menuIndex, label)
    {
        var _loc2 = menuItemList[menuIndex];
        _loc2.__set__label(label);
        _loc2.realignText();
    } // End of the function
    function SET_MENU_COLOUR(menuindex, colourEnum)
    {
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(colourEnum, _loc2);
        var _loc4 = [colourEnum, _loc2.r, _loc2.g, _loc2.b, 100];
        if (_loc4 != undefined)
        {
            var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)(menuItemList[menuindex]);
            if (_loc3 != undefined)
            {
                _loc3.__set__mycolour(_loc4);
            } // end if
        } // end if
    } // End of the function
    function LOCK_MENU_ITEM(menuindex, isLocked)
    {
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)(menuItemList[menuindex]);
        if (_loc2 != undefined)
        {
            _loc2.__set__locked(isLocked);
        } // end if
    } // End of the function
    function SCROLL_MENU_IN_DIR(params)
    {
        var _loc3 = params[0];
        var _loc2 = menuIndex + _loc3;
        if (_loc2 < 0)
        {
            _loc2 = menuItemList.length - 1;
        } // end if
        if (_loc2 > menuItemList.length - 1)
        {
            _loc2 = 0;
        } // end if
        this.HIGHLIGHT_MENU(_loc2);
    } // End of the function
    function HIGHLIGHT_MENU(index)
    {
        if (!allHighlightsOn)
        {
            for (var _loc2 = 0; _loc2 < menuItemList.length; ++_loc2)
            {
                var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem)(menuItemList[_loc2]);
                _loc3.__set__highlight(_loc2 == index);
            } // end of for
        } // end if
        var _loc5 = 0;
        if (menuIndex == 0 && index == menuItemList.length - 1)
        {
            startIndex = menuItemList.length - visibleItems;
            _loc5 = -(index * (menuItemWidth + menuItemSpacing) - scrollingMenuWidth);
            this.scrollMenu(_loc5, 0.333000, com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT);
        } // end if
        if (menuIndex == menuItemList.length - 1 && index == 0)
        {
            startIndex = 0;
            _loc5 = -index * (menuItemWidth + menuItemSpacing);
            this.scrollMenu(_loc5, 0.333000, com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT);
        } // end if
        if (index >= startIndex + visibleItems)
        {
            ++startIndex;
            _loc5 = -(index * (menuItemWidth + menuItemSpacing) - scrollingMenuWidth);
            this.scrollMenu(_loc5, 0.200000, com.rockstargames.ui.tweenStar.Ease.CUBIC_OUT);
        } // end if
        if (index < startIndex)
        {
            --startIndex;
            _loc5 = -index * (menuItemWidth + menuItemSpacing);
            this.scrollMenu(_loc5, 0.200000, com.rockstargames.ui.tweenStar.Ease.CUBIC_OUT);
        } // end if
        menuIndex = index;
        var _loc6 = menuIndex == startIndex;
        var _loc7 = menuIndex - startIndex == visibleItems - 1;
        this.SET_HEADER_ARROWS_VISIBLE(_loc6, _loc7);
    } // End of the function
    function getMenuWidth(items)
    {
        if (items != undefined)
        {
            if (items < 6)
            {
                visibleItems = items;
            }
            else
            {
                visibleItems = 6;
            } // end if
        } // end else if
        var _loc2 = 0;
        if (visibleItems > 0)
        {
            _loc2 = visibleItems - 1;
        } // end if
        menuItemWidth = (totalMenuWidth - menuItemSpacing * _loc2) / visibleItems;
        scrollingMenuWidth = _loc2 * (menuItemWidth + menuItemSpacing);
    } // End of the function
    function scrollMenu(x, duration, easetype)
    {
        if (!duration || duration == 0)
        {
            duration = 0.200000;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(menuContainer, duration, {_x: x, ease: easetype});
    } // End of the function
    function SET_HEADER_ARROWS_VISIBLE(isLeftArrowVisible, isRightArrowVisible)
    {
        com.rockstargames.ui.game.GameInterface.call("SET_HEADER_ARROW_VISIBLE", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, menuItemList.length > visibleItems, isLeftArrowVisible, isRightArrowVisible);
    } // End of the function
    var visibleItems = 6;
    var menuIndex = 0;
    var startIndex = 0;
    var totalMenuWidth = 868;
    var scrollingMenuWidth = 725;
    var menuItemWidth = 143;
    var menuItemSpacing = 2;
    var menuItemList = new Array();
    var allHighlightsOn = false;
} // End of Class
#endinitclip
