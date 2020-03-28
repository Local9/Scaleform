// Action script...

// [Initial MovieClip Action of sprite 298]
#initclip 7
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_WEAPONS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuGalleryBase
{
    var CONTENT, txdList, batchList, maxGridItems, model, scrollBase;
    function PAUSE_MENU_WEAPONS()
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
        txdList = [];
        batchList = [];
        maxGridItems = 9;
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsModel();
        model.createView(0, {id: 0, rowSpacing: 2, columnSpacing: 2, batchCols: 3, batchRows: 3, batchW: 288, container: CONTENT, linkage: ["mpWeaponsItem"], visibleItems: maxGridItems, selectstyle: com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
        var _loc5 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc5);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bgMC, _loc5.r, _loc5.g, _loc5.b, _loc5.a);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.descMC, _loc5.r, _loc5.g, _loc5.b, _loc5.a);
        var _loc3 = CONTENT.textStatsMC;
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3.killsTF, "PM_KILLS_WITH");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.killsTF, _loc3.killsTF.text);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3.deathsTF, "PM_DEATHS_BY");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.deathsTF, _loc3.deathsTF.text);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3.headshotsTF, "PM_HEADSHOTS");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.headshotsTF, _loc3.headshotsTF.text);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3.kdRatioTF, "PM_KD_RATIO");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.kdRatioTF, _loc3.kdRatioTF.text);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3.accuracyTF, "PM_MY_ACCURACY");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.accuracyTF, _loc3.accuracyTF.text);
        var _loc4 = CONTENT.progStatsMC;
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4.damageTF, "PM_DAMAGE");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc4.damageTF, _loc4.damageTF.text);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4.fireRateTF, "PM_FIRERATE");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc4.fireRateTF, _loc4.fireRateTF.text);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4.accuracyTF, "PM_ACCURACY");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc4.accuracyTF, _loc4.accuracyTF.text);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4.rangeTF, "PM_RANGE");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc4.rangeTF, _loc4.rangeTF.text);
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc4.clipSizeTF, "PM_CLIPSIZE");
        com.rockstargames.ui.utils.UIText.setSizedText(_loc4.clipSizeTF, _loc4.clipSizeTF.text);
    } // End of the function
    function SET_TITLE(str, id)
    {
        var _loc5 = CONTENT.textStatsMC;
        var _loc6 = CONTENT.progStatsMC;
        var _loc4 = ["damageTF", "fireRateTF", "accuracyTF", "rangeTF", "clipSizeTF", "killsTF", "deathsTF", "headshotsTF", "kdRatioTF", "accuracyTF"];
        var _loc2 = _loc4[id];
        if (_loc2 != undefined)
        {
            var _loc3 = _loc6[_loc2];
            if (id > 4)
            {
                _loc3 = _loc5[_loc2];
            } // end if
            com.rockstargames.ui.utils.UIText.setSizedText(_loc3, str);
        } // end if
    } // End of the function
    function SET_DESCRIPTION()
    {
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsView)(model.getCurrentView()).setDescription(arguments);
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        super.SET_HIGHLIGHT(i);
        if (scrollBase != undefined)
        {
            scrollBase.updateScroll();
        } // end if
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW(viewIndex, itemIndex);
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsView)((com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsModel)(model).getCurrentView());
        _loc3.setDescription();
    } // End of the function
    function UPDATE_DATA_SLOT(_viewIndex, _slotIndex)
    {
        var _loc3 = arguments;
        model.updateSlot(0, _viewIndex, _loc3);
    } // End of the function
} // End of Class
#endinitclip
