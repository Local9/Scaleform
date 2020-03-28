// Action script...

// [Initial MovieClip Action of sprite 295]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuGalleryBase extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var galleryLoadManager, model;
    function PauseMenuGalleryBase()
    {
        super();
        galleryLoadManager = new com.rockstargames.ui.media.ImageLoaderManager();
    } // End of the function
    function removeAllTXDs()
    {
        txdList = [];
        batchList = [];
        batchIndex = 0;
        isBatchLoading = false;
    } // End of the function
    function preloadAllTXDs()
    {
    } // End of the function
    function SET_HIGHLIGHT(i)
    {
        var _loc3 = (com.rockstargames.ui.components.GUIView)(model.getCurrentView());
        if (i == -1)
        {
            for (var i = 0; i < _loc3.itemList.length; ++i)
            {
                (com.rockstargames.ui.components.GUIMenuItem)(_loc3.itemList[i]).__set__highlighted(false);
            } // end of for
        }
        else
        {
            i = Math.max(0, Math.min(i, maxGridItems - 1));
            _loc3.__set__index(i);
        } // end else if
    } // End of the function
    var isBatchLoading = false;
    var batchIndex = 0;
    var batchList = new Array();
    var txdList = new Array();
    var maxGridItems = 9;
} // End of Class
#endinitclip
