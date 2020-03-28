// Action script...

// [Initial MovieClip Action of sprite 221]
#initclip 31
class com.rockstargames.gtav.cellphone.apps.contactListItem extends MovieClip
{
    var txd, thisName, thumbnail, getDepth, createEmptyMovieClip, gfxFileName, txd_loader;
    function contactListItem()
    {
        super();
        txd = undefined;
    } // End of the function
    function DISPLAY_CONTACT(textureDict, slotName)
    {
        thisName = slotName;
        if (textureDict != txd)
        {
            if (textureDict != "" && textureDict != undefined)
            {
                if (thumbnail == undefined)
                {
                    thumbnail = this.createEmptyMovieClip("thumbnail", this.getDepth() + 1, {_alpha: 0, _x: 3, _y: 7});
                } // end if
                if (textureDict.substr(0, 5) == "CHAR_")
                {
                    com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict, thisName, true);
                }
                else
                {
                    com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict, thisName);
                } // end if
            } // end if
        } // end else if
    } // End of the function
    function REMOVE_CONTACT()
    {
        delete this.thumbnail;
        thumbnail.removeMovieClip();
        if (txd != undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, txd);
            txd = undefined;
        } // end if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success)
        {
            txd = textureDict;
            this.LOADCLIP(textureDict, thumbnail);
        }
        else
        {
            txd = undefined;
        } // end else if
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        if (success)
        {
            txd = textureDict;
            this.LOADCLIP(textureDict, thumbnail);
        }
        else
        {
            txd = undefined;
        } // end else if
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
        txd_loader.removeListener(this);
        txd_loader = null;
        target_mc._x = 3;
        target_mc._y = 7;
        target_mc._width = 34;
        target_mc._height = 34;
    } // End of the function
} // End of Class
#endinitclip
