// Action script...

// [Initial MovieClip Action of sprite 29]
#initclip 18
class com.rockstargames.gtav.pauseMenu.pauseComponents.MP_MATCHMAKING_VEHICLE_INFO extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var dbgID, CONTENT, manufLoader, dbg;
    function MP_MATCHMAKING_VEHICLE_INFO()
    {
        super();
        dbgID = "MP_MATCHMAKING_VEHICLE_INFO";
    } // End of the function
    function INITIALISE(mc)
    {
        if (mc != undefined)
        {
            super.INITIALISE(mc);
            isStandaloneGfx = true;
        }
        else
        {
            CONTENT = this;
        } // end else if
        CONTENT.bgMC._visible = CONTENT.innerMC._visible = false;
        CONTENT.innerMC.nameTF.autoSize = "left";
        this.SET_DESCRIPTION("");
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.innerMC.statusMC.labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
    } // End of the function
    function SET_TITLE(nameStr, classStr)
    {
        if (nameStr != undefined)
        {
            CONTENT.innerMC.nameTF.text = nameStr;
        } // end if
        if (classStr != undefined)
        {
            CONTENT.innerMC.classTF.text = classStr;
        } // end if
        var _loc11 = arguments[2];
        var _loc7 = arguments[3];
        var _loc12 = arguments[4];
        var _loc10 = arguments[5];
        var _loc8 = arguments[6];
        var _loc9 = arguments[7];
        if (CONTENT.innerMC.classIconL != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.innerMC.classIconL, _loc11, _loc7, _loc12, 100);
        } // end if
        if (CONTENT.innerMC.classIconR != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.innerMC.classIconR, _loc10, _loc8, _loc9, 100);
        } // end if
        CONTENT.innerMC.colourStrokeMC._alpha = 30;
        var _loc3 = arguments[8];
        var _loc4 = arguments[9];
        if (manufLoader == undefined)
        {
            manufLoader = CONTENT.innerMC.attachMovie("GenericImageLoader", "manuLoader", CONTENT.innerMC.getNextHighestDepth(), {_x: 14, _y: 7});
        } // end if
        var _loc5 = isStandaloneGfx ? ("MP_VEHICLE_INFO") : ("PAUSE_MENU_SP_CONTENT");
        if (manufLoader.textureDict == _loc3)
        {
            manufLoader.init(_loc5, _loc3, _loc4, 54, 54);
            manufLoader.displayTxdResponse(_loc3);
        }
        else
        {
            if (manufLoader.isLoaded)
            {
                manufLoader.removeTxdRef();
            } // end if
            var _loc6 = manufLoader.splitPath(String(manufLoader), 3);
            manufLoader.init(_loc5, _loc3, _loc4, 54, 54);
            manufLoader.requestTxdRef(_loc6, firstload, imageLoaded, this);
        } // end else if
        CONTENT.bgMC._visible = CONTENT.innerMC._visible = true;
        this.resizeBG();
    } // End of the function
    function SET_DESCRIPTION(statusStr)
    {
        if (statusStr && statusStr != "")
        {
            CONTENT.innerMC.statusMC._visible = true;
            CONTENT.innerMC.statusMC.labelMC.itemTF.text = statusStr;
            CONTENT.innerMC.statusMC.bgMC._width = CONTENT.innerMC.statusMC.labelMC.itemTF.textWidth + 10;
            CONTENT.innerMC.statusMC.bgMC._x = 145 - CONTENT.innerMC.statusMC.bgMC._width;
            CONTENT.innerMC.statusMC._x = CONTENT.innerMC.classTF._x + CONTENT.innerMC.classTF.textWidth + 15 - (CONTENT.innerMC.statusMC._width - CONTENT.innerMC.statusMC.bgMC._width);
            this.resizeBG();
        }
        else
        {
            CONTENT.innerMC.statusMC._visible = false;
        } // end else if
    } // End of the function
    function imageLoaded()
    {
        firstload = true;
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        this.dbg("TXD_HAS_LOADED textureDict: " + textureDict + " success: " + success + " uniqueID: " + uniqueID);
        if (success == true)
        {
            if (manufLoader != undefined)
            {
                manufLoader.displayTxdResponse(textureDict, success);
            } // end if
        } // end if
    } // End of the function
    function TXD_ALREADY_LOADED(textureDict, uniqueID)
    {
        this.dbg("TXD_ALREADY_LOADED textureDict: " + textureDict + " uniqueID: " + uniqueID);
        if (manufLoader != undefined)
        {
            manufLoader.displayTxdResponse(textureDict, true);
        } // end if
    } // End of the function
    function resizeBG()
    {
        var _loc3 = CONTENT.innerMC.nameTF._x + CONTENT.innerMC.nameTF.textWidth;
        var _loc2 = CONTENT.innerMC.classTF._x + CONTENT.innerMC.classTF.textWidth + (CONTENT.innerMC.statusMC._visible ? (10 + CONTENT.innerMC.statusMC.bgMC._width) : (0));
        CONTENT.bgMC._width = Math.max(_loc3, _loc2) + 100;
    } // End of the function
    var isStandaloneGfx = false;
    var firstload = false;
} // End of Class
#endinitclip
