// Action script...

// [Initial MovieClip Action of sprite 47]
#initclip 11
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MISSION_REPLAY_CARD extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, headingHeight, yOffset, model;
    function PAUSE_MENU_MISSION_REPLAY_CARD()
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
            CONTENT = CONTENT.myMC;
        } // end else if
        headingHeight = CONTENT.headingMC._height;
        yOffset = CONTENT.headingMC._y;
        model = new com.rockstargames.gtav.levelDesign.MissionCompleteModel();
        model.createView(0, {id: 0, x: 0, y: yOffset + spacing, rowSpacing: spacing, columnSpacing: 0, selectstyle: 2, container: CONTENT.viewContainerMC, visibleItems: 5, linkage: ["missionReplayCardItem"]});
        CONTENT.background._height = CONTENT.popupMC._y = yOffset + headingHeight - 1;
        CONTENT._visible = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.headingMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.background, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.popupMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.headingMC.colMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(CONTENT.popupMC.groupMC.valueTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
    } // End of the function
    function SET_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.splice(1);
        model.addDataToView(0, _slotIndex, _loc3);
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        CONTENT._visible = false;
    } // End of the function
    function UPDATE_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.splice(1);
        model.updateSlot(0, _slotIndex, _loc3);
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        var _loc3 = model.getCurrentView(0).__get__maxitems();
        model.getCurrentView(0).visibleItems = _loc3;
        if (itemIndex == undefined)
        {
            itemIndex = 0;
        } // end if
        model.displayView(viewIndex, itemIndex);
        this.resizeBackground();
        CONTENT._visible = true;
    } // End of the function
    function clampText(textF, labelS, maxVal)
    {
        textF.text = labelS;
        textF.wordWrap = false;
        if (textF._width > maxVal)
        {
            textF._xscale = maxVal / textF._width * 100;
        } // end if
    } // End of the function
    function SET_TITLE(title, desc)
    {
        var _loc2 = CONTENT.headingMC.colMC.headingTF;
        _loc2.text = desc;
        _loc2.textAutoSize = "shrink";
        _loc2._width = 275;
        CONTENT.headingMC.bgMC._height = headingHeight;
        model.getCurrentView(0).viewContainerY = model.getCurrentView(0).viewContainer._y = headingHeight + spacing;
    } // End of the function
    function SET_DESCRIPTION(medalColourEnum, totalValue, totalLabel)
    {
        var _loc2 = CONTENT.popupMC.groupMC;
        this.SET_MEDAL(medalColourEnum);
        com.rockstargames.ui.utils.UIText.setSizedText(_loc2.totalTF, totalLabel, true);
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc2.totalTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        var _loc3 = "";
        if (totalLabel != -99)
        {
            _loc3 = totalValue + "%";
        } // end if
        com.rockstargames.ui.utils.UIText.setSizedText(_loc2.valueTF, _loc3, false, false, 0, 13);
    } // End of the function
    function SET_MEDAL(medalColourEnum)
    {
        if (medalColourEnum == -99)
        {
            CONTENT.popupMC._visible = true;
            CONTENT.popupMC.groupMC.medalMC._visible = false;
        }
        else if (medalColourEnum == 0)
        {
            CONTENT.popupMC._visible = false;
            CONTENT.popupMC.groupMC.medalMC._visible = true;
        }
        else
        {
            CONTENT.popupMC._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.popupMC.groupMC.medalMC, medalColourEnum);
            CONTENT.popupMC.groupMC.medalMC._visible = true;
        } // end else if
    } // End of the function
    function resizeBackground()
    {
        var _loc3 = model.getCurrentView(0).itemList;
        var _loc4 = 0;
        for (var _loc2 = 0; _loc2 < _loc3.length; ++_loc2)
        {
            _loc4 = _loc4 + (_loc3[_loc2].bgMC._height + spacing);
        } // end of for
        CONTENT.background._height = _loc4;
        CONTENT.popupMC._y = CONTENT.background._y + CONTENT.background._height;
    } // End of the function
    var spacing = 2;
} // End of Class
#endinitclip
