// Action script...

// [Initial MovieClip Action of sprite 61]
#initclip 21
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_GALLERY extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, model, maxImgMC, maxILMC, preloadTxds, CLEAR_HIGHLIGHT;
    function PAUSE_MENU_GALLERY()
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
        CONTENT.descMC._visible = false;
        CONTENT.linesMC._visible = false;
        CONTENT.textContainerMC._visible = false;
        CONTENT.frameMC._visible = false;
        CONTENT.mapDimmerMc._visible = true;
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel();
        model.createView(0, {id: 0, rowSpacing: 2, columnSpacing: 2, batchCols: 4, batchRows: 3, batchW: 143, document: this, container: CONTENT, linkage: ["spGalleryItem"], visibleItems: 18, selectstyle: com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
        maxImgMC = CONTENT.maxImgMC;
        maxImgMC._visible = false;
        maxILMC = (com.rockstargames.ui.media.ImageLoaderMC)(maxImgMC.imgMC.attachMovie("GenericImageLoader", "il", maxImgMC.imgMC.getNextHighestDepth()));
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.descMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(maxImgMC.maxDefaultMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(maxImgMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.mapDimmerMc, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.mapBG, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.textContainerMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.frameMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        preloadTxds = true;
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(37))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADLEFT);
        }
        else if (Key.isDown(39))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADRIGHT);
        }
        else if (Key.isDown(38))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
        }
        else if (Key.isDown(40))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
        }
        else if (Key.isDown(32))
        {
            this.SET_DATA_SLOT_EMPTY(0);
        } // end else if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)(model.getCurrentView()).moveVert(-1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)(model.getCurrentView()).moveHorz(1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)(model.getCurrentView()).moveVert(1);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)(model.getCurrentView()).moveHorz(-1);
                break;
            } 
        } // End of switch
    } // End of the function
    function getTxdData()
    {
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)((com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)(model).getCurrentView(0));
        var _loc2 = {};
        _loc2.txd = _loc3.dataList[0][6];
        return (_loc2);
    } // End of the function
    function SET_DESCRIPTION(max, date, location, track, visible)
    {
        CONTENT.descMC._visible = visible;
        CONTENT.linesMC._visible = visible;
        CONTENT.textContainerMC._visible = visible;
        var _loc5 = arguments[0];
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)(model).initMaxGalleryItems(_loc5);
        var _loc3 = CONTENT.textContainerMC;
        if (date != undefined && date != "")
        {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(_loc3.titleHeadingTF, "RP_PLAYER_MADE_TITLE");
            com.rockstargames.ui.utils.UIText.setSizedText(_loc3.titleHeadingTF, _loc3.titleHeadingTF.text, true);
        }
        else
        {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc3.titleHeadingTF, "");
        } // end else if
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.dateTF, date != undefined ? (date) : (""), true);
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.locationTF, location != undefined ? (location) : (""), true);
        com.rockstargames.ui.utils.UIText.setSizedText(_loc3.trackTF, track != undefined ? (track) : (""), true);
    } // End of the function
    function SET_TITLE(txd, txn, state)
    {
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)(model).getCurrentView().viewContainer;
        switch (state)
        {
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_LOADED:
            {
                maxImgMC.spinnerMC.stop();
                maxImgMC.spinnerMC._visible = false;
                CONTENT.frameMC._visible = true;
                this.ADD_TXD_REF(txd, txn);
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_TRANSITION:
            {
                maxImgMC.spinnerMC.gotoAndPlay(maxImgMC.spinnerMC._currentframe != 1 ? (maxImgMC.spinnerMC._currentframe) : (2));
                maxImgMC.spinnerMC._visible = true;
                CONTENT.frameMC._visible = false;
                if (maxILMC.isLoaded)
                {
                    maxILMC.removeTxdRef();
                } // end if
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_LOADING:
            {
                maxImgMC.spinnerMC.gotoAndPlay(maxImgMC.spinnerMC._currentframe != 1 ? (maxImgMC.spinnerMC._currentframe) : (2));
                maxImgMC.spinnerMC._visible = true;
                CONTENT.frameMC._visible = true;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_EMPTY:
            default:
            {
                _loc2._visible = true;
                maxImgMC._visible = false;
                CONTENT.frameMC._visible = false;
                if (maxILMC.isLoaded)
                {
                    maxILMC.removeTxdRef();
                } // end if
                return;
            } 
        } // End of switch
        _loc2._visible = false;
        maxImgMC._visible = true;
    } // End of the function
    function ADD_TXD_REF(txd, txn)
    {
        if (maxILMC.isLoaded)
        {
            maxILMC.removeTxdRef();
        } // end if
        maxILMC.init("PAUSE_MENU_SP_CONTENT", txd, txn, 578, 322);
        var _loc3 = 4;
        var _loc2 = String(maxILMC).split(".");
        var _loc4 = _loc2.slice(_loc2.length - _loc3).join(".");
        maxILMC.addTxdRef(_loc4);
    } // End of the function
    function CLEAR_SLOT()
    {
        var _loc3 = arguments[0];
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)(model).removeTxdFromSlot(_loc3);
    } // End of the function
    function ON_DESTROY()
    {
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)(model.getCurrentView()).clearDescription();
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryModel)(model).onDestroy();
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        this.ON_DESTROY();
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
    } // End of the function
    function SET_HIGHLIGHT(highlightIndex, staticClear)
    {
        this.CLEAR_HIGHLIGHT();
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)(model.getCurrentView());
        _loc3.highlightedItem = highlightIndex;
        super.SET_FOCUS(true);
        _loc3.__set__index(highlightIndex);
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)(_loc3.itemList[_loc3.__get__index()]);
        _loc4.__set__highlighted(true);
        _loc3.setDescription();
    } // End of the function
    function SET_COMPONENT_HIDDEN()
    {
        var _loc3 = arguments[1];
        CONTENT.mapDimmerMC._visible = _loc3;
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        super.SET_FOCUS(isFocused);
        if (isFocused)
        {
            var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView)(model.getCurrentView());
            var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)(_loc3.itemList[_loc3.__get__index()]);
            _loc4.__set__highlighted(true);
            _loc3.setDescription();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
