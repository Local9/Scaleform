// Action script...

// [Initial MovieClip Action of sprite 139]
#initclip 21
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MP_MENU_PLAYER_MODEL extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT, model, crewImage;
    function PAUSE_MP_MENU_PLAYER_MODEL()
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
        model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 2, columnSpacing: 0, container: CONTENT, linkage: ["verticalMenuListItem"], visibleItems: 15, selectstyle: com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
        CONTENT.bountyMC._alpha = 0;
    } // End of the function
    function DISPLAY_VIEW(viewIndex, itemIndex)
    {
        if (itemIndex == undefined)
        {
            itemIndex = 0;
        } // end if
        model.displayView(viewIndex, itemIndex);
        var _loc4 = model.getCurrentView().viewContainer;
        var _loc3 = 2;
        if (_loc4._height == 0)
        {
            _loc3 = 0;
        } // end if
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
    {
        super.SET_DATA_SLOT_EMPTY(viewIndex, itemIndex);
    } // End of the function
    function SET_TITLE(str)
    {
        var _loc3 = arguments[1];
        var _loc4 = false;
        if (typeof(_loc3) == "number")
        {
            if (_loc3 >= 1 && _loc3 <= 2)
            {
                _loc4 = true;
                CONTENT.hintsMC.iconMC.gotoAndStop(_loc3 + 1);
            }
            else if (_loc3 == 0)
            {
                _loc4 = false;
                CONTENT.hintsMC.iconMC.gotoAndStop(1);
            } // end if
        } // end else if
        var _loc5 = false;
        var _loc9 = arguments[2];
        if (str != "" && str != undefined)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.hintsMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
            com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.hintsMC.titleTF, str);
            _loc5 = true;
        } // end if
        CONTENT.hintsMC.iconMC._visible = _loc4;
        CONTENT.hintsMC.titleTF._x = _loc4 ? (24) : (5);
        CONTENT.hintsMC._alpha = _loc5 ? (100) : (0);
        CONTENT.bountyMC._alpha = _loc9 ? (100) : (0);
        var _loc7 = arguments[3];
        var _loc6 = arguments[4];
        if (_loc7 != undefined && _loc6 != undefined)
        {
            this.ADD_TXD_REF(_loc7, _loc6);
        }
        else if (crewImage.isLoaded == true)
        {
            crewImage.removeTxdRef();
        } // end else if
    } // End of the function
    function ADD_TXD_REF(txd, txn)
    {
        if (crewImage == undefined)
        {
            crewImage = (com.rockstargames.ui.media.ImageLoaderMC)(CONTENT.attachMovie("GenericImageLoader", "crewEmblemImageMC", CONTENT.getNextHighestDepth(), {_x: 214, _y: 10}));
        } // end if
        if (crewImage.isLoaded == true)
        {
            crewImage.removeTxdRef();
        } // end if
        crewImage.init("PAUSE_MENU_SP_CONTENT", txd, txn, 64, 64);
        var _loc3 = 2;
        var _loc2 = String(crewImage).split(".");
        var _loc4 = _loc2.slice(_loc2.length - _loc3).join(".");
        crewImage.addTxdRef(_loc4);
    } // End of the function
    function ON_DESTROY()
    {
        if (crewImage.isLoaded == true)
        {
            crewImage.removeTxdRef();
        } // end if
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
} // End of Class
#endinitclip
