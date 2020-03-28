// Action script...

// [Initial MovieClip Action of sprite 37]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var myMC, CONTENT, titleFreemode, scrollableContent, model, defaultPlaceholderA, menuBlackAlphaColor, imgLdr, dbg;
    function PAUSE_MENU_FREEMODE_DETAILS()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        if (mc != undefined)
        {
            super.INITIALISE(mc);
            isStandalone = true;
        }
        else
        {
            CONTENT = myMC;
        } // end else if
        titleFreemode = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsTitleItem)(CONTENT.attachMovie("freemodeTitleItem", "freemodeTitleItemMC", 1));
        scrollableContent = CONTENT.createEmptyMovieClip("scrollContent", 0);
        scrollableContent._y = 189;
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, container: scrollableContent, visibleItems: 9, linkage: ["freemodeDetailsItem"], viewMaskHeight: 430, selectstyle: com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
        CONTENT.verifiedMC._visible = CONTENT.verifiedbgMC._visible = false;
        CONTENT._visible = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.titleBG, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.descBG, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.verifiedbgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.imgPlaceholderMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        defaultPlaceholderA = CONTENT.imgPlaceholderMC._alpha;
    } // End of the function
    function SET_TITLE(str)
    {
        titleFreemode.highlightTitle(false);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.imgPlaceholderMC);
        CONTENT.imgPlaceholderMC._alpha = defaultPlaceholderA;
        CONTENT.imgPlaceholderMC._visible = true;
        var _loc4 = arguments[1];
        if (_loc4 != "")
        {
            titleFreemode.__set__data([0, 0, 0, 0, 0, 0, _loc4]);
            titleFreemode._visible = true;
            CONTENT._y = 0;
        }
        else
        {
            titleFreemode._visible = false;
            CONTENT._y = -27;
        } // end else if
        var _loc8 = arguments[2];
        var _loc6 = arguments[3];
        var _loc5 = arguments[4];
        var _loc9 = 0;
        if (arguments[5] != undefined)
        {
            _loc9 = arguments[5];
        } // end if
        displayType = arguments[6];
        if (_loc4 == "" || _loc4 == undefined)
        {
            CONTENT.titleTF._visible = false;
            CONTENT.verifiedMC._visible = false;
        }
        else
        {
            CONTENT.titleTF.text = _loc4;
            CONTENT.titleTF._visible = true;
            if (_loc8 == 1)
            {
                CONTENT.verifiedMC._visible = CONTENT.verifiedbgMC._visible = true;
                (com.rockstargames.gtav.Multiplayer.ROCKSTAR_VERIFIED)(CONTENT.verifiedMC).SET_VERIFIED(1);
            }
            else if (_loc8 == 2)
            {
                CONTENT.verifiedMC._visible = CONTENT.verifiedbgMC._visible = true;
                (com.rockstargames.gtav.Multiplayer.ROCKSTAR_VERIFIED)(CONTENT.verifiedMC).SET_VERIFIED(2);
            }
            else
            {
                CONTENT.verifiedMC._visible = CONTENT.verifiedbgMC._visible = false;
            } // end else if
        } // end else if
        var _loc3 = menuBlackAlphaColor;
        if (_loc6 != undefined && _loc5 != undefined)
        {
            if (imgLdr == undefined)
            {
                imgLdr = (com.rockstargames.ui.media.ImageLoaderMC)(CONTENT.imgMC.attachMovie("GenericImageLoader", "imgLdr", CONTENT.imgMC.getNextHighestDepth()));
            } // end if
            var _loc11 = false;
            if (imgLdr.textureDict == _loc6 && imgLdr.textureFilename == _loc5)
            {
                _loc11 = true;
            }
            else if (imgLdr.isLoaded)
            {
                imgLdr.removeTxdRef();
            } // end else if
            var _loc12 = isStandalone ? ("mp_mission_details_card") : ("PAUSE_MENU_SP_CONTENT");
            switch (displayType)
            {
                case DISPLAY_TYPE_STORE:
                {
                    imgLdr.init(_loc12, _loc6, _loc5, 256, 64, 16, 48);
                    if (arguments[7] != undefined && arguments[8] != undefined && arguments[9] != undefined)
                    {
                        _loc3 = new com.rockstargames.ui.utils.HudColour();
                        _loc3.r = arguments[7];
                        _loc3.g = arguments[8];
                        _loc3.b = arguments[9];
                    } // end if
                    break;
                } 
                case DISPLAY_TYPE_MISSION:
                default:
                {
                    imgLdr.init(_loc12, _loc6, _loc5, 288, 160, 0, 0);
                } 
            } // End of switch
            var _loc13 = 4;
            var _loc7 = String(imgLdr).split(".");
            var _loc10 = _loc7.slice(_loc7.length - _loc13).join(".");
            if (_loc9 == 0)
            {
                imgLdr.addTxdRef(_loc10, transitionInBitmap, this);
            }
            else
            {
                imgLdr.requestTxdRef(_loc10, _loc11, transitionInBitmap, this);
            } // end if
        } // end else if
        if (imgLdr != undefined)
        {
            imgLdr._visible = false;
        } // end if
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.imgPlaceholderMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
    } // End of the function
    function transitionInBitmap()
    {
        imgLdr._alpha = 0;
        imgLdr._visible = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(imgLdr);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.imgPlaceholderMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(imgLdr, 0.300000, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.imgPlaceholderMC, 0.300000, {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT, onCompleteScope: this, onComplete: transitionComplete});
    } // End of the function
    function transitionComplete()
    {
        CONTENT.imgPlaceholderMC._alpha = defaultPlaceholderA;
        CONTENT.imgPlaceholderMC._visible = false;
    } // End of the function
    function ON_DESTROY()
    {
        if (imgLdr.isLoaded == true)
        {
            imgLdr.removeTxdRef();
        } // end if
        CONTENT._visible = false;
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
        if (imgLdr.isLoaded == true)
        {
            imgLdr.removeTxdRef();
        } // end if
        this.updateDescBG();
        CONTENT._visible = false;
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        super.DISPLAY_VIEW(viewIndex, itemIndex);
        this.updateDescBG();
        CONTENT._visible = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
    } // End of the function
    function updateDescBG()
    {
        switch (displayType)
        {
            case DISPLAY_TYPE_STORE:
            {
                CONTENT.descBG._height = scrollableContent._height;
                break;
            } 
            case DISPLAY_TYPE_MISSION:
            default:
            {
                var _loc2 = model.getCurrentView().itemList;
                var _loc3 = _loc2[_loc2.length - 1];
                var _loc4 = _loc3.leftlabelMC.titleTF.textHeight;
                var _loc5 = 14;
                CONTENT.descBG._height = scrollableContent._y + _loc3._y + _loc4 + _loc5 - CONTENT.descBG._y;
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_FOCUS(isFocused)
    {
        super.SET_FOCUS(isFocused);
        titleFreemode.highlightTitle(Boolean(isFocused));
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(38))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
        }
        else if (Key.isDown(40))
        {
            this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
        } // end else if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
        {
            model.prevItem();
        } // end if
        if (direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
        {
            model.nextItem();
        } // end if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        this.dbg("TXD_HAS_LOADED textureDict: " + textureDict + " success: " + success + " uniqueID: " + uniqueID);
        if (success == true)
        {
            imgLdr.displayTxdResponse(textureDict, success);
        } // end if
    } // End of the function
    function TXD_ALREADY_LOADED(textureDict, uniqueID)
    {
        this.dbg("TXD_ALREADY_LOADED textureDict: " + textureDict + " uniqueID: " + uniqueID);
        imgLdr.displayTxdResponse(textureDict, true);
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        this.dbg("ADD_TXD_REF_RESPONSE textureDict: " + textureDict + " uniqueID: " + uniqueID + " success: " + success);
        if (success == true)
        {
            imgLdr.displayTxdResponse(textureDict);
        } // end if
    } // End of the function
    var DISPLAY_TYPE_MISSION = 0;
    var DISPLAY_TYPE_STORE = 1;
    var displayType = com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS.prototype.DISPLAY_TYPE_MISSION;
    var isStandalone = false;
} // End of Class
#endinitclip
