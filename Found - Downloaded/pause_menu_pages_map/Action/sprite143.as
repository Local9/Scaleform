// Action script...

// [Initial MovieClip Action of sprite 143]
#initclip 2
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, details, zoom, location, model, scrollBase;
    function PAUSE_MENU_MAP()
    {
        super();
        dbgID = "PAUSE_MENU_MAP";
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
        details = CONTENT.mapDetailsMC;
        zoom = details.zoomMC;
        location = details.locationMC;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(zoom, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(location.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(location.labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapModel();
        model.createView(0, {id: 0, x: 868, y: 0, rowSpacing: 2, columnSpacing: 0, container: CONTENT, linkage: ["mapLegendItem"], visibleItems: viewableItems, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
        this.SET_TITLE();
        this.updateScroll();
    } // End of the function
    function SET_TITLE(str)
    {
        if (str != undefined && str != "")
        {
            com.rockstargames.ui.utils.UIText.setSizedText(location.labelMC.locationTF, str.toUpperCase(), false, true);
            location.bgMC._width = Math.round(location.labelMC._x + location.labelMC._width + 10);
            location._visible = true;
            zoom._visible = true;
        }
        else
        {
            location._visible = false;
            zoom._visible = false;
        } // end else if
        this.updateScroll();
    } // End of the function
    function SET_DESCRIPTION()
    {
        zoom.startTF.autoSize = "left";
        zoom.startTF.text = arguments[0];
        zoom.endTF.autoSize = "right";
        zoom.endTF.text = arguments[1];
        this.updateScroll();
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapView)(model.getCurrentView());
        _loc2.__set__index(i);
        this.updateScroll();
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        if (itemIndex == undefined)
        {
            itemIndex = 0;
        } // end if
        model.displayView(viewIndex, itemIndex);
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapView)(model.getCurrentView());
        var _loc3 = _loc4.highlightedItem;
        if (_loc3 >= _loc4.itemList.length)
        {
            for (var _loc2 = _loc4.itemList.length - 1; _loc2 >= 0; --_loc2)
            {
                if (_loc2 < _loc3)
                {
                    _loc3 = _loc2;
                    break;
                } // end if
            } // end of for
        } // end if
        _loc4.jumpTo(_loc3);
        _loc4.highlightedItem = _loc3;
        this.updateScroll();
    } // End of the function
    function SET_INPUT_EVENT(input)
    {
        var _loc2 = model.getCurrentView().itemList[model.getCurrentView().highlightedItem];
        switch (input)
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
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                _loc2.stepVal(1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                _loc2.stepVal(-1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.FRONTEND_CONTEXT_BUTTON:
            {
                _loc2.__set__showBlips(!_loc2.__get__showBlips());
                break;
            } 
            default:
            {
                break;
            } 
        } // End of switch
        this.updateScroll();
    } // End of the function
    function SET_DATA_SLOT(sup)
    {
        super.SET_DATA_SLOT.apply(super, arguments);
        this.updateScroll();
    } // End of the function
    function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, xColOffset)
    {
        super.INIT_SCROLL_BAR.apply(super, arguments);
        this.updateScroll();
    } // End of the function
    function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption)
    {
        super.SET_SCROLL_BAR.apply(super, arguments);
        this.updateScroll();
    } // End of the function
    function updateScroll()
    {
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapView)(model.getCurrentView());
        var _loc2 = _loc3.viewContainer;
        if (_loc3.dataList.length > viewableItems && _loc2._visible == true)
        {
            scrollBase._visible = scrollBase.forceInvisible = false;
            scrollBase.scrollPosMC._x = 5;
            scrollBase.scrollPosTXT._width = 10;
            scrollBase.scrollPosTXT.autoSize = true;
            scrollBase.scrollPosTXT.multiline = false;
            var _loc4 = scrollBase.scrollPosTXT.getTextFormat();
            _loc4.font = "$FixedWidthNumbers";
            scrollBase.scrollPosTXT.setNewTextFormat(_loc4);
            scrollBase.updateScroll();
            scrollBase.arrowsMC._x = scrollBase.scrollPosMC._x + Math.ceil(scrollBase.scrollPosTXT._width) + 14;
            scrollBase.bgMC._width = Math.round(scrollBase.arrowsMC._x + 12);
            scrollBase._x = Math.round(_loc2._x - scrollBase.bgMC._width);
            scrollBase._y = _loc2._y + viewableItems * 27;
        }
        else
        {
            scrollBase.forceInvisible = true;
            scrollBase._visible = false;
        } // end else if
    } // End of the function
    var viewableItems = 19;
} // End of Class
#endinitclip
