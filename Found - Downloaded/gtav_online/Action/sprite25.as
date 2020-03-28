// Action script...

// [Initial MovieClip Action of sprite 25]
#initclip 5
class com.rockstargames.gtav.Multiplayer.GTAV_ONLINE extends com.rockstargames.ui.core.BaseScreenLayout
{
    var DispConf, getDisplayConfig, TIMELINE, showingLogo, isWideScreen, FILE_WIDTH, FOUR_THREE_PADDING, CONTENT, BIGFEED_HOLDER, BIGFEED_ITEM, imgLdr;
    function GTAV_ONLINE()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        com.rockstargames.ui.utils.Debug.log("INITIALISE: " + arguments);
        super.INITIALISE(mc);
        mc.logoBig._visible = false;
        DispConf = new com.rockstargames.ui.utils.DisplayConfig();
        DispConf = this.getDisplayConfig(true);
        TIMELINE = mc;
        showingLogo = true;
    } // End of the function
    function initScreenLayout()
    {
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept)
    {
        com.rockstargames.ui.utils.Debug.log("SET_DISPLAY_CONFIG: " + arguments);
        DispConf.isCircleAccept = _isCircleAccept;
        DispConf.isWideScreen = _isWideScreen;
        DispConf.safeBottom = _safeBottomPercent;
        DispConf.safeLeft = _safeLeftPercent;
        DispConf.safeRight = _safeRightPercent;
        DispConf.safeTop = _safeTopPercent;
        DispConf.screenHeight = _screenHeightPixels;
        DispConf.screenWidth = _screenWidthPixels;
        if (!isWideScreen)
        {
            Stage.scaleMode = "noBorder";
        } // end if
        var _loc3 = DispConf.safeLeft * DispConf.screenWidth;
        if (!DispConf.isWideScreen)
        {
            Stage.scaleMode = "noBorder";
            DispConf.screenWidth = 960;
            FOUR_THREE_PADDING = (FILE_WIDTH - DispConf.screenWidth) / 2;
            _loc3 = _loc3 + FOUR_THREE_PADDING;
        } // end if
        var _loc4 = DispConf.safeBottom * DispConf.screenHeight;
        CONTENT.logo._x = _loc3;
        CONTENT.logo._y = _loc4 - CONTENT.logo._height;
    } // End of the function
    function SET_BIG_LOGO_VISIBLE(isBig)
    {
        com.rockstargames.ui.utils.Debug.log("SET_BIG_LOGO_VISIBLE: " + arguments);
        if (isBig)
        {
            TIMELINE.logoBig._visible = true;
            CONTENT._visible = false;
        }
        else
        {
            TIMELINE.logoBig._visible = false;
            CONTENT._visible = true;
        } // end else if
    } // End of the function
    function HIDE_ONLINE_LOGO()
    {
        CONTENT.logo._visible = false;
    } // End of the function
    function OVERRIDE_SIZE(scaleX, scaleY)
    {
        TIMELINE.logoBig._width = scaleX * 1280;
        TIMELINE.logoBig._height = scaleY * 720;
    } // End of the function
    function OVERRIDE_POSITION(posX, posY)
    {
        TIMELINE.logoBig._x = posX * 1280;
        TIMELINE.logoBig._y = posY * 720;
    } // End of the function
    function SETUP_BIGFEED()
    {
        if (!BIGFEED_HOLDER)
        {
            BIGFEED_HOLDER = TIMELINE.createEmptyMovieClip("bigFeedHolder", TIMELINE.getNextHighestDepth());
            BIGFEED_ITEM = BIGFEED_HOLDER.attachMovie("errorMessage", "currentTab", BIGFEED_HOLDER.getNextHighestDepth());
            BIGFEED_ITEM.titleTF.textAutoSize = "shrink";
            com.rockstargames.ui.utils.Colour.ApplyHudColour(BIGFEED_ITEM.tileBGMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(BIGFEED_ITEM.titleTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(BIGFEED_ITEM.bodyTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            BIGFEED_HOLDER._x = (TIMELINE._width - BIGFEED_ITEM._width) * 0.500000;
            BIGFEED_HOLDER._y = (TIMELINE._height - BIGFEED_ITEM._height) * 0.500000 - 20;
        } // end if
    } // End of the function
    function SETUP_TABS(count)
    {
        this.SETUP_BIGFEED();
        BIGFEED_HOLDER._alpha = 0;
        if (TABS.length < 1)
        {
            var _loc7 = 8;
            for (var _loc3 = 0; _loc3 < count; ++_loc3)
            {
                var _loc5 = "tab_" + _loc3;
                var _loc2 = BIGFEED_HOLDER.attachMovie("page_indicator", _loc5, BIGFEED_HOLDER.getNextHighestDepth());
                var _loc6 = FEED_ITEM_WIDTH * 0.500000 - (_loc2._width * count - _loc7 * (count - 1) * 0.500000);
                _loc2._y = FEED_ITEM_HEIGHT + 16;
                _loc2._x = _loc3 * 16 + _loc6;
                _loc2._alpha = 30;
                TABS.push(_loc2);
            } // end of for
        } // end if
    } // End of the function
    function SET_BIGFEED_INFO(title, body, whichTab, txd, txn)
    {
        com.rockstargames.ui.utils.Debug.log("SET_BIGFEED_INFO: " + arguments);
        BIGFEED_ITEM.titleTF.text = title;
        BIGFEED_ITEM.titleTF.textAutoSize = "shrink";
        BIGFEED_ITEM.bodyTF.htmlText = body;
        var _loc4 = TABS.length;
        if (_loc4 < 1)
        {
            return;
        } // end if
        for (var _loc3 = 0; _loc3 < _loc4; ++_loc3)
        {
            (MovieClip)(TABS[_loc3])._alpha = 30;
        } // end of for
        (MovieClip)(TABS[whichTab])._alpha = 100;
        this.SET_BIGFEED_IMAGE(txd, txn);
    } // End of the function
    function END_BIGFEED()
    {
        if (BIGFEED_HOLDER)
        {
            imgLdr.removeTxdRef();
            com.rockstargames.ui.tweenStar.TweenStarLite.to(BIGFEED_HOLDER, 0.500000, {_alpha: 0});
        } // end if
    } // End of the function
    function SET_BIGFEED_IMAGE(txd, image)
    {
        com.rockstargames.ui.utils.Debug.log("SET_BIGFEED_IMAGE: " + arguments);
        if (imgLdr == undefined)
        {
            imgLdr = (com.rockstargames.ui.media.ImageLoaderMC)(BIGFEED_ITEM.attachMovie("GenericImageLoader", "GenericImageLoader", BIGFEED_ITEM.getNextHighestDepth()));
            imgLdr._x = 576;
        } // end if
        imgLdr._visible = true;
        if (imgLdr.textureDict == txd)
        {
            if (imgLdr.isLoaded)
            {
                imgLdr.init("GTAV_ONLINE", txd, image, FEED_IMAGE_WIDTH, FEED_ITEM_HEIGHT);
                imgLdr.displayTxdResponse(txd);
                this.fadeImgIn();
            } // end if
        }
        else
        {
            if (imgLdr.isLoaded)
            {
                imgLdr.removeTxdRef();
            } // end if
            if (txd != undefined && image != undefined && txd != "" && image != "")
            {
                imgLdr.init("GTAV_ONLINE", txd, image, FEED_IMAGE_WIDTH, FEED_ITEM_HEIGHT);
                imgLdr.addTxdRef("GTAV_ONLINE", fadeImgIn, this);
            }
            else
            {
                imgLdr._visible = false;
            } // end else if
        } // end else if
        if (showingLogo)
        {
            this.hideLogo();
            com.rockstargames.ui.tweenStar.TweenStarLite.to(BIGFEED_HOLDER, 0.500000, {_alpha: 100});
        } // end if
    } // End of the function
    function ADD_TXD_REF_RESPONSE(txd)
    {
        imgLdr.displayTxdResponse();
    } // End of the function
    function hideLogo()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.logo, 0.500000, {_alpha: 0, _y: CONTENT.logo + 20, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT});
        showingLogo = false;
    } // End of the function
    function fadeImgIn()
    {
        imgLdr._alpha = 0;
        imgLdr._visible = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(imgLdr, 0.500000, {_alpha: 100});
    } // End of the function
    var logoBigFromScript = false;
    var TABS = new Array();
    var FEED_IMAGE_WIDTH = 288;
    var FEED_ITEM_HEIGHT = 430;
    var FEED_ITEM_WIDTH = 864;
} // End of Class
#endinitclip
