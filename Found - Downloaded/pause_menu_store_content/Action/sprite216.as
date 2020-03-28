// Action script...

// [Initial MovieClip Action of sprite 216]
#initclip 20
class com.rockstargames.gtav.store.StoreContentImageItem extends MovieClip
{
    var picMC, txd, imageHeight, target, txd_loader;
    function StoreContentImageItem()
    {
        super();
        picMC = picMC;
        txd = undefined;
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success, _imageHeight)
    {
        imageHeight = _imageHeight;
        if (success == true)
        {
            if (textureDict == txd)
            {
                this.LOADCLIP(textureDict);
            }
            else
            {
                com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, textureDict);
            } // end if
        } // end else if
    } // End of the function
    function LOADCLIP(textureDict)
    {
        target = picMC[textureDict];
        if (target == undefined)
        {
            target = picMC.createEmptyMovieClip(textureDict, picMC.getNextHighestDepth());
            txd_loader = new MovieClipLoader();
            txd_loader.addListener(this);
            var _loc3 = "img://" + textureDict + "/" + textureDict;
            txd_loader.loadClip(_loc3, target);
        } // end if
    } // End of the function
    function onLoadInit(target_mc)
    {
        target_mc._width = 288;
        target_mc._height = imageHeight;
        target_mc._visible = true;
        txd_loader.removeListener(this);
        txd_loader = null;
    } // End of the function
    function REMOVE_PIC()
    {
        if (txd != undefined)
        {
            picMC[txd].removeMovieClip();
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, gfxFileName, txd);
            txd = undefined;
        } // end if
    } // End of the function
    var gfxFileName = "PAUSE_MENU_STORE_CONTENT";
} // End of Class
#endinitclip
