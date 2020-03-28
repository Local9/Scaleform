// Action script...

// [Initial MovieClip Action of sprite 33]
#initclip 3
class com.rockstargames.gtav.minimap.minimap_txd_loader extends MovieClip
{
    var getNextHighestDepth, createEmptyMovieClip, TXDmc, txd_loader;
    function minimap_txd_loader()
    {
        super();
    } // End of the function
    function SET_BITMAP_MAP_ON(txd, xpos, ypos)
    {
        TXDmc = this.createEmptyMovieClip(txd, this.getNextHighestDepth(), {_x: 0, y: 0});
        this.LOADCLIP(txd, TXDmc);
    } // End of the function
    function LOADCLIP(textureDict, targetMC)
    {
        txd_loader = new MovieClipLoader();
        txd_loader.addListener(this);
        var _loc2 = "img://" + textureDict + "/" + textureDict;
        txd_loader.loadClip(_loc2, targetMC);
    } // End of the function
    function onLoadInit(targetMC)
    {
        targetMC._width = 3834;
        targetMC._height = 3834;
        txd_loader.removeListener(this);
        txd_loader = null;
    } // End of the function
} // End of Class
#endinitclip
