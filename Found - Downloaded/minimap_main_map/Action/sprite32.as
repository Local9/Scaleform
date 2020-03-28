// Action script...

// [Initial MovieClip Action of sprite 32]
#initclip 2
class com.rockstargames.gtav.minimap.minimap_fogOfWar_txd_loader extends MovieClip
{
    var getNextHighestDepth, createEmptyMovieClip, TXDmc, x_size, y_size, txd_loader;
    function minimap_fogOfWar_txd_loader()
    {
        super();
    } // End of the function
    function SET_BITMAP_FOG_ON(txd, xpos, ypos, xsize, ysize)
    {
        TXDmc = this.createEmptyMovieClip(txd, this.getNextHighestDepth(), {_x: 0, y: 0});
        x_size = xsize;
        y_size = ysize;
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
        targetMC._width = x_size;
        targetMC._height = y_size;
        txd_loader.removeListener(this);
        txd_loader = null;
    } // End of the function
} // End of Class
#endinitclip
