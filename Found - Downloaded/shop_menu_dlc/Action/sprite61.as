// Action script...

// [Initial MovieClip Action of sprite 61]
#initclip 9
class com.rockstargames.gtav.levelDesign.SHOP_MENU_DLC extends com.rockstargames.ui.components.GUIController
{
    var model, CONTENT, DISPLAY_VIEW, FOCUS_VIEW, scrollBar;
    function SHOP_MENU_DLC()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        model = new com.rockstargames.gtav.levelDesign.ShopModelDLC();
        model.createView(0, {id: 0, x: 0, y: yOffset, rowSpacing: 1, columnSpacing: 0, selectstyle: 3, container: CONTENT.viewContainerMC, visibleItems: 10, linkage: ["shopMenuItem"]});
        CONTENT.contentImageMC._visible = false;
        CONTENT.footerMC._visible = false;
        CONTENT.descriptionMC._visible = false;
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        var _loc2 = model.getCurrentSelection(0);
        return (_loc2);
    } // End of the function
    function SET_DATA_SLOT_EMPTY(clearEverything)
    {
        model.removeDataFromSlot(0);
        if (clearEverything == true)
        {
            this.SET_TITLE();
            this.SET_IMAGE();
            this.SET_DESCRIPTION();
        } // end if
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
    function DRAW_MENU_LIST()
    {
        this.DISPLAY_DATA_SLOT();
    } // End of the function
    function DISPLAY_DATA_SLOT()
    {
        var _loc2 = model.getCurrentView(0).__get__maxitems();
        if (_loc2 > 10)
        {
            _loc2 = 10;
        } // end if
        model.getCurrentView(0).visibleItems = displayableItems = _loc2;
        if (model.getCurrentView(0).__get__maxitems() > model.getCurrentView(0).visibleItems)
        {
            CONTENT.footerMC._visible = true;
        }
        else
        {
            CONTENT.footerMC._visible = false;
        } // end else if
        this.DISPLAY_VIEW(0);
        this.RESIZE_BACKGROUND(0);
        this.FOCUS_VIEW(0);
    } // End of the function
    function SET_TITLE(newHeader)
    {
        if (newHeader == undefined)
        {
            newHeader = "";
        } // end if
        CONTENT.headingMC.headingTF.text = newHeader.toUpperCase();
        CONTENT.headingMC.headingTF.autoSize = "left";
    } // End of the function
    function SET_IMAGE(textureDict, textureFilename)
    {
        if (textureDict != undefined && textureFilename != undefined)
        {
            if (textureFilename == "debug")
            {
                CONTENT.contentImageMC.picMC.titleTF.htmlText = "<img src=\'" + textureDict + "\' vspace=\'0\' hspace=\'0\' width=\'260\' height=\'95\' />";
            }
            else
            {
                CONTENT.contentImageMC.picMC.titleTF.htmlText = "<img src=\'img://" + textureDict + "/" + textureFilename + "\' vspace=\'0\' hspace=\'0\' width=\'260\' height=\'95\'/>";
            } // end else if
            CONTENT.contentImageMC.picMC.blankImage._visible = false;
        }
        else
        {
            CONTENT.contentImageMC.picMC.blankImage._visible = true;
            CONTENT.contentImageMC.picMC.titleTF.htmlText = "";
        } // end else if
        CONTENT.contentImageMC._visible = true;
    } // End of the function
    function SET_DESCRIPTION(description, priceTitle, priceValue)
    {
        if (description == undefined)
        {
            description = "";
        } // end if
        if (priceTitle == undefined)
        {
            priceTitle = "";
        } // end if
        if (priceValue == undefined)
        {
            priceValue = "";
        } // end if
        CONTENT.descriptionMC.descriptionTF.htmlText = description;
        CONTENT.descriptionMC.descriptionTF.autoSize = "left";
        CONTENT.descriptionMC.footerText.itemTextLeft.text = priceTitle;
        CONTENT.descriptionMC.footerText.itemTextRight.text = priceValue;
        CONTENT.descriptionMC._visible = true;
        this.RESIZE_BACKGROUND(0);
    } // End of the function
    function RESIZE_BACKGROUND(_viewIndex)
    {
        if (model.getCurrentView().__get__maxitems() > displayableItems)
        {
            if (scrollBar == undefined)
            {
                scrollBar = (com.rockstargames.ui.components.GUIScroll)(CONTENT.scrollbarsMC.attachMovie("scrollBarMC", "scrollBarMC", CONTENT.scrollbarsMC.getNextHighestDepth()));
            } // end if
            scrollBar.init(255, yOffset, totalHeight);
            scrollBar.setGutterHeight(model.getCurrentView(0).visibleItems, model.getCurrentView().__get__maxitems());
            model.__set__scrollBar(scrollBar);
            scrollBar.__set__scrollpercent(0);
        }
        else if (scrollBar != undefined)
        {
            scrollBar.removeMovieClip();
            scrollBar = undefined;
            model.__set__scrollBar(undefined);
        } // end else if
        totalHeight = displayableItems * 23;
        CONTENT.background._height = totalHeight + 10;
        var _loc2 = yOffset + totalHeight + 7;
        CONTENT.footerMC._y = _loc2;
        if (CONTENT.footerMC._visible == true)
        {
            _loc2 = CONTENT.footerMC._y + CONTENT.footerMC._height + 2;
        }
        else
        {
            _loc2 = CONTENT.footerMC._y;
        } // end else if
        CONTENT.contentImageMC._y = _loc2;
        _loc2 = CONTENT.contentImageMC._y + CONTENT.contentImageMC._height - 2;
        CONTENT.descriptionMC._y = _loc2;
        CONTENT.descriptionMC.footerText._y = CONTENT.descriptionMC.descriptionTF._y + CONTENT.descriptionMC.descriptionTF.textHeight + 5;
        CONTENT.descriptionMC.background._height = CONTENT.descriptionMC.footerText._y + 25;
        this.SHOW_SCROLL_HINTS();
    } // End of the function
    function SHOW_SCROLL_HINTS()
    {
        var _loc2 = model.getCurrentView(0).__get__maxitems();
        var _loc3 = model.getCurrentView(0).visibleItems;
        var _loc6 = model.getCurrentSelection(0);
        var _loc5 = false;
        var _loc4 = false;
        if (_loc2 > _loc3)
        {
            var _loc7 = _loc2 - _loc3 - model.getCurrentView(0).topEdge;
            if (_loc6 > 0)
            {
                _loc5 = true;
            }
            else
            {
                _loc5 = false;
            } // end else if
            if (_loc6 < _loc2 - 1)
            {
                _loc4 = true;
            }
            else
            {
                _loc4 = false;
            } // end if
        } // end else if
        CONTENT.footerMC.scrollArrowUp._visible = _loc5;
        CONTENT.footerMC.scrollArrowDown._visible = _loc4;
        CONTENT.footerMC.numItemsTF.text = _loc3 + "/" + _loc2;
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
        this.SHOW_SCROLL_HINTS();
    } // End of the function
    var timerDelay = 0;
    var yOffset = 42;
    var totalHeight = 200;
    var displayableItems = 10;
} // End of Class
#endinitclip
