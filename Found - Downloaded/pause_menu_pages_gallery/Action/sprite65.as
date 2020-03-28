// Action script...

// [Initial MovieClip Action of sprite 65]
#initclip 25
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var bookmarkMC, spinnerMC, corruptedMC, defaultMC, bgMC, type, imageLoaderMC, ic, __get__data, _alpha, highlightMC, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function PauseMenuGalleryItem()
    {
        super();
        this.resetDisplay();
    } // End of the function
    function setBookmark(_b)
    {
        bookmarkMC._visible = _b;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        spinnerMC.stop();
        spinnerMC._visible = false;
        corruptedMC._visible = false;
        defaultMC._visible = false;
        bgMC._visible = false;
        switch (type)
        {
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_CORRUPTED:
            {
                corruptedMC._visible = true;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_QUEUED:
            {
                defaultMC._visible = true;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_LOADING:
            {
                spinnerMC.gotoAndPlay(spinnerMC._currentframe != 1 ? (spinnerMC._currentframe) : (2));
                spinnerMC._visible = true;
                defaultMC._visible = true;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_LOADED:
            {
                defaultMC._visible = true;
                if (imageLoaderMC == undefined)
                {
                    imageLoaderMC = (com.rockstargames.ui.media.ImageLoaderMC)(ic.attachMovie("GenericImageLoader", "il", ic.getNextHighestDepth(), {_x: 0, _y: 0}));
                } // end if
                this.ADD_TXD_REF(this.__get__data()[2], this.__get__data()[3]);
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem.ITEM_STATE_EMPTY:
            default:
            {
                bgMC._visible = true;
                break;
            } 
        } // End of switch
        bookmarkMC._visible = Boolean(this.__get__data()[5]);
        _alpha = 100;
        //return (this.data());
        null;
    } // End of the function
    function fadeOutComplete()
    {
        defaultMC._visible = false;
    } // End of the function
    function onTXDRefAdded()
    {
        spinnerMC._visible = false;
        spinnerMC.gotoAndStop(1);
        imageLoaderMC._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(defaultMC, com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION, {_alpha: 0, onComplete: fadeOutComplete, onCompleteScope: this});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(imageLoaderMC, com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION, {_alpha: 100});
    } // End of the function
    function ADD_TXD_REF(txd, txn)
    {
        if (imageLoaderMC.isLoaded)
        {
            imageLoaderMC.removeTxdRef();
        } // end if
        imageLoaderMC.init("PAUSE_MENU_SP_CONTENT", txd, txn, 189, 106, -23);
        var _loc3 = 5;
        var _loc2 = String(imageLoaderMC).split(".");
        var _loc4 = _loc2.slice(_loc2.length - _loc3).join(".");
        imageLoaderMC.addTxdRef(_loc4, onTXDRefAdded, this);
    } // End of the function
    function ON_DESTROY()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(defaultMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(imageLoaderMC);
        if (imageLoaderMC.isLoaded)
        {
            imageLoaderMC.removeTxdRef();
        } // end if
        this.resetDisplay();
    } // End of the function
    function resetDisplay()
    {
        bookmarkMC._visible = false;
        highlightMC._visible = false;
        spinnerMC._visible = false;
        corruptedMC._visible = false;
        defaultMC._visible = false;
        bgMC._visible = true;
        _alpha = 100;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(corruptedMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(defaultMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(highlightMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        highlightMC._visible = _highlighted;
        //return (this.highlighted());
        null;
    } // End of the function
    static var ITEM_STATE_EMPTY = 0;
    static var ITEM_STATE_CORRUPTED = 1;
    static var ITEM_STATE_QUEUED = 2;
    static var ITEM_STATE_LOADING = 3;
    static var ITEM_STATE_LOADED = 4;
    static var ITEM_STATE_TRANSITION = 5;
} // End of Class
#endinitclip
