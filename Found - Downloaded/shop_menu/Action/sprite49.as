// Action script...

// [Initial MovieClip Action of sprite 49]
#initclip 9
class com.rockstargames.gtav.levelDesign.SHOP_MENU extends com.rockstargames.ui.components.GUIController
{
    var model, CONTENT, DISPLAY_VIEW, FOCUS_VIEW, scrollBar;
    function SHOP_MENU()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        model = new com.rockstargames.gtav.levelDesign.ShopModel();
        model.createView(0, {id: 0, x: 0, y: yOffset, rowSpacing: 1, columnSpacing: 0, selectstyle: 2, container: CONTENT.viewContainerMC, visibleItems: 5, linkage: ["shopMenuItem"]});
        this.FADE_POPUP_OUT();
        this.SHOW_SCROLL_HINTS(false);
        (com.rockstargames.gtav.levelDesign.ShopModel)(model).__set__arrows([CONTENT.headingMC.arrowMC, CONTENT.popupMC.arrowMC]);
    } // End of the function
    function SET_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        model.addDataToView(0, _slotIndex, _loc3);
    } // End of the function
    function UPDATE_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        model.updateSlot(0, _slotIndex, _loc3);
    } // End of the function
    function DRAW_MENU_LIST(visItems)
    {
        var _loc2 = model.getCurrentView(0).__get__maxitems();
        if (_loc2 > 10)
        {
            _loc2 = 10;
        } // end if
        model.getCurrentView(0).visibleItems = displayableItems = _loc2;
        this.DISPLAY_VIEW(0);
        this.RESIZE_BACKGROUND(0);
        this.FOCUS_VIEW(0);
    } // End of the function
    function SET_LOGO(brandID)
    {
        var _loc2 = com.rockstargames.gtav.constants.ShopBrandLUT.lookUp(brandID);
        CONTENT.logo.gotoAndStop(_loc2[2]);
    } // End of the function
    function SET_HEADER(newHeader)
    {
        CONTENT.headingMC.headingTF.text = newHeader.toUpperCase();
        CONTENT.headingMC.headingTF.autoSize = "left";
    } // End of the function
    function SET_POPUP(dialogStr, delay)
    {
        CONTENT.popupMC.headingTF.text = dialogStr;
        CONTENT.popupMC.headingTF.autoSize = "left";
        CONTENT.popupMC.infoMC._visible = true;
        if (delay == undefined || delay == null)
        {
            delay = 5;
        } // end if
        if (delay < 0)
        {
            delay = 0;
        } // end if
        if (delay > 45)
        {
            delay = 45;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.popupMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.popupMC, delay, {onCompleteScope: this, onComplete: FADE_POPUP_OUT});
    } // End of the function
    function FADE_POPUP_OUT()
    {
        CONTENT.popupMC.headingTF.text = "";
        CONTENT.popupMC.infoMC._visible = false;
    } // End of the function
    function RESIZE_BACKGROUND(_viewIndex)
    {
        totalHeight = displayableItems * 23 + yOffset;
        CONTENT.background._height = totalHeight;
        CONTENT.popupMC._y = totalHeight - 1;
        if (model.getCurrentView().__get__maxitems() > displayableItems)
        {
            if (scrollBar == undefined)
            {
                scrollBar = (com.rockstargames.ui.components.GUIScroll)(CONTENT.scrollbarsMC.attachMovie("scrollBarMC", "scrollBarMC", CONTENT.scrollbarsMC.getNextHighestDepth()));
            } // end if
            scrollBar.init(255, yOffset, totalHeight - yOffset);
            scrollBar.setGutterHeight(model.getCurrentView(0).visibleItems, model.getCurrentView().__get__maxitems());
            model.__set__scrollBar(scrollBar);
            scrollBar.__set__scrollpercent(0);
            this.SHOW_SCROLL_HINTS(true);
        }
        else if (scrollBar != undefined)
        {
            scrollBar.removeMovieClip();
            scrollBar = undefined;
            model.__set__scrollBar(undefined);
            this.SHOW_SCROLL_HINTS(false);
        } // end else if
    } // End of the function
    function SHOW_SCROLL_HINTS(show)
    {
        CONTENT.headingMC.arrowMC._visible = CONTENT.popupMC.arrowMC._visible = show;
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                model.prevItem();
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                model.nextItem();
                break;
            } 
        } // End of switch
    } // End of the function
    var timerDelay = 0;
    var yOffset = 82;
    var totalHeight = 200;
    var displayableItems = 10;
} // End of Class
#endinitclip
