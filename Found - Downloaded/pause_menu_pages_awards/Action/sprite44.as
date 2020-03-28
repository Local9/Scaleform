// Action script...

// [Initial MovieClip Action of sprite 44]
#initclip 14
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_AWARDS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, model;
    function PAUSE_MENU_AWARDS()
    {
        super();
        dbgID = "PAUSE_MENU_AWARDS";
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
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsModel();
        model.createView(0, {id: 0, rowSpacing: 2, columnSpacing: 2, batchCols: 4, batchRows: 3, batchW: 143, container: CONTENT, linkage: ["mpAwardsItem"], visibleItems: 9, selectstyle: com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.descMC.descbgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.descMC.gridMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        CONTENT.descMC._visible = false;
    } // End of the function
    function SET_DESCRIPTION()
    {
        var _loc3 = arguments[0];
        var _loc4 = arguments[1];
        com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.descMC.titleTF, _loc3);
        com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.descMC.descTF, _loc4);
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)(model.getCurrentView()).moveVert(-1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)(model.getCurrentView()).moveHorz(1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)(model.getCurrentView()).moveVert(1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)(model.getCurrentView()).moveHorz(-1);
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        var _loc3 = model.getCurrentView();
        if (i == -1)
        {
            for (var i = 0; i < _loc3.itemList.length; ++i)
            {
                _loc3.itemList[i].highlighted = false;
            } // end of for
        }
        else
        {
            i = Math.max(0, Math.min(i, maxGridItems - 1));
            _loc3.index = i;
        } // end else if
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW(viewIndex, itemIndex);
        CONTENT.descMC._visible = true;
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)(model.getCurrentView()).setDescription();
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        this.ON_DESTROY();
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView)(model.getCurrentView()).setDescription(-1);
    } // End of the function
    function ON_DESTROY()
    {
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsModel)(model).onDestroy();
    } // End of the function
    var maxGridItems = 12;
} // End of Class
#endinitclip
