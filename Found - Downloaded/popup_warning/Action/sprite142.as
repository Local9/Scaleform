// Action script...

// [Initial MovieClip Action of sprite 142]
#initclip 8
class com.rockstargames.gtav.levelDesign.POPUP_WARNING extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
    var CONTENT, _componentsForLoadingImages, loaderObject, thisObj, componentID;
    function POPUP_WARNING()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        CONTENT.warningMC.innerMC.main_image._visible = false;
        CONTENT._alpha = 0;
    } // End of the function
    function SHOW_POPUP_WARNING(msecs, titleMsg, warningMsg, promptMsg, showBg, alertType)
    {
        CONTENT.warningMC.innerMC._visible = false;
        CONTENT.calibrationMC._visible = false;
        var _loc6 = 0;
        var _loc7 = 1;
        if (alertType == _loc6 || alertType == undefined)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.warningMC.innerMC.strapBGMC.topLineMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.warningMC.innerMC.strapBGMC.centralBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.warningMC.innerMC.strapBGMC.bottomLineMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            if (titleMsg == undefined || titleMsg == "")
            {
                titleMsg = "alert!";
                com.rockstargames.ui.utils.Localisation.setTextWithTranslation(CONTENT.warningMC.innerMC.titleTF, "GLOBAL_ALERT_DEFAULT");
            }
            else
            {
                CONTENT.warningMC.innerMC.titleTF.textAutoSize = "shrink";
                CONTENT.warningMC.innerMC.titleTF.htmlText = titleMsg;
            } // end else if
            CONTENT.warningMC.innerMC._visible = true;
            CONTENT.warningMC.innerMC.main_image._y = 0;
            CONTENT.warningMC.innerMC.titleTF._y = 150;
            CONTENT.warningMC.innerMC.titleTF.autoSize = true;
            if (warningMsg != undefined)
            {
                CONTENT.warningMC.innerMC.labelTF._y = CONTENT.warningMC.innerMC.titleTF._y + CONTENT.warningMC.innerMC.titleTF.textHeight + 4;
                CONTENT.warningMC.innerMC.labelTF.htmlText = warningMsg;
                CONTENT.warningMC.innerMC.labelTF.autoSize = "center";
                CONTENT.warningMC.innerMC.labelTF.multiline = true;
                if (titleMsg == undefined || titleMsg == "")
                {
                    CONTENT.warningMC.innerMC.labelTF._y = CONTENT.warningMC.innerMC.titleTF + CONTENT.warningMC.innerMC.titleTF.textHeight;
                } // end if
                
            } // end if
            if (promptMsg != undefined)
            {
                CONTENT.warningMC.innerMC.labelTF.htmlText = CONTENT.warningMC.innerMC.labelTF.htmlText + promptMsg;
            } // end if
            CONTENT.warningMC.innerMC._y = 0;
            var _loc4 = 21;
            var _loc8 = 100;
            CONTENT.warningMC.innerMC.strapBGMC._width = CONTENT.warningMC.innerMC.labelTF.textWidth + _loc8;
            CONTENT.warningMC.innerMC.strapBGMC._height = CONTENT.warningMC.innerMC.labelTF.textHeight + _loc4;
            CONTENT.warningMC.innerMC.strapBGMC._y = CONTENT.warningMC.innerMC.labelTF._y - 7;
            var _loc10 = 12;
            var _loc5 = CONTENT.warningMC.innerMC._height + CONTENT.warningMC.innerMC.titleTF._y + _loc10;
            CONTENT.warningMC.innerMC._y = (720 - _loc5) * 0.500000;
        } // end if
        if (alertType == _loc7)
        {
            CONTENT.calibrationMC._visible = true;
            if (titleMsg != undefined && titleMsg != "")
            {
                CONTENT.calibrationMC.titleTF.htmlText = titleMsg;
                CONTENT.calibrationMC.labelTF.autoSize = "center";
                CONTENT.calibrationMC.labelTF.multiline = true;
            } // end if
            if (warningMsg != undefined && warningMsg != "")
            {
                CONTENT.calibrationMC.calibrationTF.htmlText = warningMsg;
                CONTENT.calibrationMC.calibrationTF.autoSize = "center";
                CONTENT.calibrationMC.calibrationTF.multiline = true;
            } // end if
        } // end if
        CONTENT.bgMC._visible = showBg;
        CONTENT._alpha = 100;
    } // End of the function
    function HIDE_POPUP_WARNING(msecs)
    {
        CONTENT.bgMC._visible = true;
        CONTENT._alpha = 0;
    } // End of the function
    function SET_ALERT_IMAGE(txd, texture)
    {
        CONTENT.warningMC.innerMC.main_image.highlight._visible = false;
        if (_componentsForLoadingImages != undefined)
        {
            _componentsForLoadingImages = [];
        } // end if
        this.loadTextureIntoMovieClip(txd, texture, CONTENT.warningMC.innerMC.main_image.placeholder);
    } // End of the function
    function SET_ALERT_IMAGE_WITH_GANG_HIGHLIGHT(txd, texture, gangEnum, r, g, b)
    {
        CONTENT.warningMC.innerMC.main_image.highlight._visible = true;
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.warningMC.innerMC.main_image.highlight, r, g, b, 100);
        if (_componentsForLoadingImages != undefined)
        {
            _componentsForLoadingImages = [];
        } // end if
        this.loadTextureIntoMovieClip(txd, texture, CONTENT.warningMC.innerMC.main_image.placeholder);
    } // End of the function
    function loadTextureIntoMovieClip(txd, texture, targetLoadedInto)
    {
        CONTENT.warningMC.innerMC.main_image._visible = true;
        if (txd != "" && texture != "")
        {
            var thisObj = this;
            var _loc3 = _componentsForLoadingImages.length + 1;
            var _loc2 = new com.rockstargames.ui.core.BaseComponentInfo(_loc3);
            _componentsForLoadingImages[_loc3] = _loc3;
            _loc2._depth = _loc3 + 10;
            _loc2._mc = targetLoadedInto;
            _loc2._loader = new MovieClipLoader();
            _loc2._listener = new Object();
            _loc2._loader.addListener(loaderObject._listener);
            _loc2._listener.thisObj = thisObj;
            _loc2._listener.componentID = _loc3;
            _loc2._listener.onLoadInit = function (target_mc)
            {
                var _loc2 = thisObj._componentsForLoadingImages[componentID];
                _loc2._loader.removeListener(_loc2._listener);
                _loc2._loader = null;
            };
            var _loc5 = "img://" + txd + "/" + texture;
            _loc2._loader.loadClip(_loc5, _loc2._mc);
        } // end if
    } // End of the function
    var fadeSpeed = 300;
} // End of Class
#endinitclip
