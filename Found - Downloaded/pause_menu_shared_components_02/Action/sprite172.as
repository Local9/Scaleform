// Action script...

// [Initial MovieClip Action of sprite 172]
#initclip 12
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, menuContainer, model, customMC, imgLdr;
    function PAUSE_MENU_SETTINGS()
    {
        super();
        dbgID = "PAUSE_MENU_SETTINGS";
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
        menuContainer = CONTENT.createEmptyMovieClip("menuMC", CONTENT.getNextHighestDepth());
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 0, columnSpacing: 0, container: menuContainer, visibleItems: 16, linkage: ["settingsListItem"], viewMaskHeight: 430, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        var _loc3 = arguments;
        model.addDataToView(0, _viewIndex, _loc3);
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        if (state == 0)
        {
            this.resetVisibleItems();
        } // end if
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW(viewIndex, itemIndex);
        if (state == com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_AUDIO)
        {
            var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView)(model.getCurrentView()).itemList.length;
            var _loc5 = 27;
            var _loc3 = 0;
            customMC._y = _loc4 * (_loc5 + _loc3);
            customMC._visible = true;
        } // end if
    } // End of the function
    function SET_CONTROL_LABELS()
    {
        if (customMC != undefined)
        {
            this.setControlsText(customMC.controllerText.l2TF, arguments[0]);
            this.setControlsText(customMC.controllerText.l1TF, arguments[1]);
            this.setControlsText(customMC.controllerText.selectTF, arguments[2]);
            this.setControlsText(customMC.controllerText.upTF, arguments[3]);
            this.setControlsText(customMC.controllerText.leftTF, arguments[4]);
            this.setControlsText(customMC.controllerText.downTF, arguments[5]);
            this.setControlsText(customMC.controllerText.rightTF, arguments[6]);
            this.setControlsText(customMC.controllerText.l3TF, arguments[7]);
            this.setControlsText(customMC.controllerText.lAnalogueTF, arguments[8]);
            this.setControlsText(customMC.controllerText.r2TF, arguments[9]);
            this.setControlsText(customMC.controllerText.r1TF, arguments[10]);
            this.setControlsText(customMC.controllerText.startTF, arguments[11]);
            this.setControlsText(customMC.controllerText.triangleTF, arguments[12]);
            this.setControlsText(customMC.controllerText.circleTF, arguments[13]);
            this.setControlsText(customMC.controllerText.squareTF, arguments[14]);
            this.setControlsText(customMC.controllerText.crossTF, arguments[15]);
            this.setControlsText(customMC.controllerText.rAnalogueTF, arguments[16]);
            this.setControlsText(customMC.controllerText.r3TF, arguments[17]);
            this.setControlsText(customMC.controllerText.controlTypeTF, arguments[18]);
        } // end if
    } // End of the function
    function setControlsText(tf, str)
    {
        if (str != undefined)
        {
            com.rockstargames.ui.utils.UIText.setSizedText(tf, str.toUpperCase(), true, false, -2);
        } // end if
    } // End of the function
    function SET_TITLE(title)
    {
        if (state == com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_AUDIO)
        {
            var _loc16 = arguments[1];
            var _loc13 = arguments[2];
            var _loc12 = arguments[3];
            var _loc11 = arguments[4];
            var _loc10 = arguments[5];
            var _loc9 = ["fw", "fm", "fn"];
            var _loc14 = ["rb", "rm", "rs"];
            var _loc8 = 30;
            for (var _loc3 = 0; _loc3 < _loc9.length; ++_loc3)
            {
                var _loc6 = 100;
                var _loc7 = 100;
                var _loc4 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
                var _loc5 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
                if (_loc3 == _loc13 - 1)
                {
                    if (_loc11 != undefined)
                    {
                        _loc4 = _loc11;
                    } // end if
                }
                else
                {
                    _loc6 = _loc8;
                } // end else if
                if (_loc3 == _loc12 - 1)
                {
                    if (_loc10 != undefined)
                    {
                        _loc5 = _loc10;
                    } // end if
                }
                else
                {
                    _loc7 = _loc8;
                } // end else if
                this.setSpeaker(_loc9[_loc3], _loc4, _loc6);
                this.setSpeaker(_loc14[_loc3], _loc5, _loc7);
            } // end of for
            if (_loc16)
            {
                customMC._alpha = 100;
                var _loc15 = 9;
                model.getCurrentView().visibleItems = _loc15;
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView)(model.getCurrentView()).maxVisibleItems = _loc15;
            }
            else
            {
                customMC._alpha = 0;
            } // end if
        } // end else if
    } // End of the function
    function setSpeaker(strID, col, a)
    {
        var _loc3 = customMC.surroundMC;
        if (_loc3 != undefined)
        {
            var _loc7 = _loc3["LineR" + strID];
            var _loc9 = _loc3["LineL" + strID];
            var _loc6 = _loc3["R" + strID];
            var _loc8 = _loc3["L" + strID];
            if (a == undefined)
            {
                a = 100;
            } // end if
            if (col == undefined)
            {
                col = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
            } // end if
            var _loc2 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(col, _loc2);
            com.rockstargames.ui.utils.Colour.Colourise(_loc7, _loc2.r, _loc2.g, _loc2.b, a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc9, _loc2.r, _loc2.g, _loc2.b, a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc6, _loc2.r, _loc2.g, _loc2.b, a);
            com.rockstargames.ui.utils.Colour.Colourise(_loc8, _loc2.r, _loc2.g, _loc2.b, a);
        } // end if
    } // End of the function
    function SET_DESCRIPTION(description, txD, txN, txX, txY, txW, txH)
    {
        switch (state)
        {
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL:
            {
                if (customMC != undefined)
                {
                    var _loc2 = customMC.descriptionTF;
                    _loc2.autoSize = true;
                    _loc2.multiline = true;
                    _loc2.html = true;
                    _loc2.htmlText = description;
                    customMC.headerBGMC._visible = customMC.bgMC._visible = true;
                    if (imgLdr == undefined)
                    {
                        imgLdr = (com.rockstargames.ui.media.ImageLoaderMC)(customMC.attachMovie("GenericImageLoader", "imgLdr", customMC.getNextHighestDepth(), {_x: txX, _y: txY}));
                    } // end if
                    if (!imgLdr.isLoaded && imgLdr.textureDict != txD && imgLdr.textureFilename != txN)
                    {
                        if (imgLdr.isLoaded)
                        {
                            imgLdr.removeTxdRef();
                        } // end if
                        imgLdr.init("PAUSE_MENU_SP_CONTENT", txD, txN, txW ? (txW) : (256), txH ? (txH) : (64));
                        var _loc4 = 3;
                        var _loc3 = String(imgLdr).split(".");
                        var _loc5 = _loc3.slice(_loc3.length - _loc4).join(".");
                        imgLdr.requestTxdRef(_loc5);
                    } // end if
                } // end if
                break;
            } 
            default:
            {
                break;
            } 
        } // End of switch
    } // End of the function
    function ON_DESTROY()
    {
        if (imgLdr.isLoaded == true)
        {
            imgLdr.removeTxdRef();
        } // end if
    } // End of the function
    function resetVisibleItems()
    {
        if (imgLdr != undefined && imgLdr.isLoaded == true)
        {
            imgLdr.removeTxdRef();
        } // end if
        if (customMC != undefined)
        {
            customMC.removeMovieClip();
            imgLdr = undefined;
        } // end if
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView)(model.getCurrentView()).bgMC._visible = false;
        model.getCurrentView().viewContainer._y = 0;
        model.getCurrentView().visibleItems = 16;
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView)(model.getCurrentView()).maxVisibleItems = 16;
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView)(model.getCurrentView()).__set__index(0);
    } // End of the function
    function SET_STATE(i)
    {
        state = i;
        this.resetVisibleItems();
        if (state != 0)
        {
            var _loc6 = customLinkageList[i - 1];
            var _loc7 = customLinkageRows[i - 1];
            customMC = CONTENT.attachMovie(_loc6, _loc6 + "MC", CONTENT.getNextHighestDepth());
            var _loc3 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            com.rockstargames.ui.utils.Colour.Colourise(customMC.bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
            var _loc8 = state == com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL ? (0) : (2);
            var _loc5 = Math.round(customMC._y + customMC.bgMC._height) + _loc8;
            switch (state)
            {
                case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_AUDIO:
                {
                    customMC._y = 0;
                    customMC._visible = false;
                    customMC._alpha = 0;
                    _loc5 = 0;
                    break;
                } 
                case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_CONTROLS:
                {
                    var _loc4 = new com.rockstargames.ui.utils.HudColour();
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc4);
                    com.rockstargames.ui.utils.Colour.Colourise(customMC.controllerText, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
                    break;
                } 
                case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_SETTINGS.CUSTOM_ITEM_SOCIAL:
                {
                    var _loc2 = new com.rockstargames.ui.utils.HudColour();
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FACEBOOK_BLUE, _loc2);
                    com.rockstargames.ui.utils.Colour.Colourise(customMC.headerBGMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
                    com.rockstargames.ui.utils.Colour.Colourise(customMC.footerBGMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
                    customMC.headerBGMC._visible = customMC.bgMC._visible = false;
                    break;
                } 
                default:
                {
                    break;
                } 
            } // End of switch
            model.getCurrentView().viewContainer._y = _loc5;
            model.getCurrentView().visibleItems = _loc7;
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView)(model.getCurrentView()).maxVisibleItems = _loc7;
        }
        else
        {
            if (customMC != undefined)
            {
                customMC.removeMovieClip();
            } // end if
            model.getCurrentView().viewContainer._y = 0;
            model.getCurrentView().visibleItems = 16;
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsView)(model.getCurrentView()).maxVisibleItems = 16;
        } // end else if
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        if (isFocused)
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsModel)(model).highlightNext();
        }
        else
        {
            (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsModel)(model).clearHighlight();
        } // end else if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc2 = 0;
        var _loc3;
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
        {
            model.prevItem();
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
        {
            model.nextItem();
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADRIGHT)
        {
            _loc2 = model.getCurrentView().highlightedItem;
            _loc3 = model.getCurrentView().itemList;
            _loc3[_loc2].stepVal(1);
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADLEFT)
        {
            _loc2 = model.getCurrentView().highlightedItem;
            _loc3 = model.getCurrentView().itemList;
            _loc3[_loc2].stepVal(-1);
        } // end if
    } // End of the function
    static var CUSTOM_ITEM_CONTROLS = 1;
    static var CUSTOM_ITEM_AUDIO = 2;
    static var CUSTOM_ITEM_SOCIAL = 3;
    var customLinkageList = ["settingsControlsGraphic", "settingsAudioGraphic", "settingsSocialGraphic"];
    var customLinkageRows = [8, 16, 1];
    var state = 0;
} // End of Class
#endinitclip
