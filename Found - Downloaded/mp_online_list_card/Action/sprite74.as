// Action script...

// [Initial MovieClip Action of sprite 74]
#initclip 18
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREE_MODE extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, TextWithBlips, model, titleMC, blipLayer, scrollBase;
    function PAUSE_MENU_FREE_MODE()
    {
        super();
        dbgID = "PAUSE_MENU_FREE_MODE";
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
        TextWithBlips = new com.rockstargames.ui.utils.Text();
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, container: CONTENT, linkage: ["freemodeListItem"], visibleItems: 16, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.helpMC.bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        CONTENT.helpMC.helpTF.wordWrap = true;
        CONTENT.helpMC.helpTF.autoSize = true;
        CONTENT.helpMC._visible = false;
        titleMC = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem)(CONTENT.attachMovie("freemodeListItem", "tMC", CONTENT.getNextHighestDepth()));
        titleMC._visible = hasTitle = false;
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)(model.getCurrentView());
        _loc2.__set__index(i);
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        titleMC._visible = hasTitle = false;
        model.getCurrentView().visibleItems = 16;
        model.getCurrentView().viewContainer._y = 0;
    } // End of the function
    function SET_TITLE(titleStr)
    {
        titleMC.__set__data([0, 999, 999, 0, 0, 1, titleStr]);
        titleMC.setTitle();
        titleMC._visible = hasTitle = true;
        model.getCurrentView().visibleItems = 15;
        model.getCurrentView().viewContainer._y = rowOffset;
    } // End of the function
    function SET_DESCRIPTION(helpStr)
    {
        if (blipLayer)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = CONTENT.helpMC.createEmptyMovieClip("blipLayer", 1000);
        TextWithBlips.setTextWithIcons(helpStr, blipLayer, CONTENT.helpMC.helpTF, 0, 13, 2, false);
        CONTENT.helpMC._visible = helpStr != "";
        var _loc2 = 0;
        if (hasTitle)
        {
            _loc2 = rowOffset;
        } // end if
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeView)(model.getCurrentView());
        CONTENT.helpMC._y = _loc2 + _loc3.dataList.length * rowOffset;
        CONTENT.helpMC.bgMC._height = CONTENT.helpMC.helpTF.textHeight + 12;
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        if (isFocused)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel)(model).highlightNext();
        }
        else
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeModel)(model).clearHighlight();
        } // end else if
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
            scrollBase._visible = isFocused && scrollBase.displayEnabled();
        } // end if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc2 = 0;
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
        {
            model.prevItem();
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
        {
            model.nextItem();
        } // end if
    } // End of the function
    var hasTitle = false;
    var rowOffset = 27;
} // End of Class
#endinitclip
