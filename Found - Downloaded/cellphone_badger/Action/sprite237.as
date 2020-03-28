// Action script...

// [Initial MovieClip Action of sprite 237]
#initclip 23
class com.rockstargames.gtav.cellphone.apps.CALLSCREEN extends MovieClip
{
    var CONTENT, dataProviderUI, callscreen, contactMC, gfxFileName, currentStyle, currentID, _callState, contactTXD, __get__callState, txd_loader, __set__callState;
    function CALLSCREEN()
    {
        super();
        _global.gfxExtensions = true;
        CONTENT = this;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.callscreenDataProviderUI;
        _level0.TIMELINE.SET_HEADER();
        callscreen = this;
        this.renderContainers();
    } // End of the function
    function renderContainers()
    {
        if (contactMC == undefined)
        {
            contactMC = callscreen.thumbnail.createEmptyMovieClip("contact", callscreen.thumbnail.getNextHighestDepth());
        } // end if
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(callscreen.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
        } // end if
        this.populateContent();
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.callscreenDataProviderUI;
        _callState = currentID;
        var _loc3 = dataProviderUI[0][1];
        var _loc2 = dataProviderUI[0][2];
        var _loc4 = dataProviderUI[0][3];
        if (contactTXD != previousContactTXD)
        {
            if (_loc2 != "" && _loc2 != undefined)
            {
                if (contactTXD != _loc2)
                {
                    if (TxdhasBeenRequested == false)
                    {
                        if (_loc2.substr(0, 5) == "CHAR_")
                        {
                            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, _loc2, "callscreen_thumbnail", true);
                        }
                        else
                        {
                            com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, _loc2, "callscreen_thumbnail");
                        } // end else if
                        TxdhasBeenRequested = true;
                        previousContactTXD = contactTXD;
                    } // end if
                } // end if
            } // end if
        } // end if
        callscreen.fromAddress.text = "";
        if (_loc3)
        {
            if (_loc2.substr(0, 5) != "CHAR_" || _loc2 == "CHAR_HUMANDEFAULT")
            {
                callscreen.fromAddressCond.textAutoSize = "shrink";
                callscreen.fromAddressCond.text = _loc3;
                callscreen.fromAddress.text = "";
            }
            else
            {
                callscreen.fromAddress.textAutoSize = "shrink";
                callscreen.fromAddress.text = _loc3;
                callscreen.fromAddressCond.text = "";
            } // end if
        } // end else if
        callscreen.jobTitle.text = "";
        if (_loc4)
        {
            callscreen.jobTitle.text = _loc4;
            callscreen.jobTitle.textAutoSize = "shrink";
        } // end if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success == true)
        {
            if (uniqueID == "callscreen_thumbnail")
            {
                contactTXD = textureDict;
                this.LOADCLIP(contactTXD, contactMC);
            }
            else
            {
                com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict);
            } // end else if
        }
        else
        {
            contactTXD = undefined;
        } // end else if
        TxdhasBeenRequested = false;
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        if (success == true)
        {
            contactTXD = textureDict;
            this.LOADCLIP(contactTXD, contactMC);
        }
        else
        {
            contactTXD = undefined;
        } // end else if
        TxdhasBeenRequested = false;
    } // End of the function
    function get callState()
    {
        return (_callState);
    } // End of the function
    function set callState(newCallState)
    {
        _callState = newCallState;
        //return (this.callState());
        null;
    } // End of the function
    function LOADCLIP(textureDict, targetMC)
    {
        txd_loader = new MovieClipLoader();
        txd_loader.addListener(this);
        var _loc2 = "img://" + textureDict + "/" + textureDict;
        txd_loader.loadClip(_loc2, targetMC);
    } // End of the function
    function onLoadInit(target_mc)
    {
        target_mc._width = 64;
        target_mc._height = 64;
        delete this.txd_loader;
    } // End of the function
    function CLOSE_APP()
    {
        dataProviderUI = [];
        contactMC.removeMovieClip();
        if (contactTXD != undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, contactTXD);
            contactTXD = undefined;
        } // end if
    } // End of the function
    var currentSelection = -1;
    var isEngaged = false;
    var offStateAlpha = 60;
    var previousContactTXD = "blank";
    var TxdhasBeenRequested = false;
} // End of Class
#endinitclip
