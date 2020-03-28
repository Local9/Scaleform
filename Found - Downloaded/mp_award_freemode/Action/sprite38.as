// Action script...

// [Initial MovieClip Action of sprite 38]
#initclip 5
class com.rockstargames.gtav.Multiplayer.MP_AWARD_BASE extends com.rockstargames.ui.core.BaseScreenLayout
{
    var HUD_COLOURS, loaderObject, safeTop, FILE_NAME, CONTENT, awardMainMC, awardTitleTF, awardDescriptionTF, awardDescription2TF, awardIconMC, thisObj, whichGang, _texture, screenHeightPixels;
    function MP_AWARD_BASE()
    {
        super();
        var _loc4 = [180, 130, 97];
        var _loc6 = [160, 160, 160];
        var _loc3 = [245, 183, 81];
        var _loc5 = [166, 221, 190];
        HUD_COLOURS = [_loc4, _loc6, _loc3, _loc5];
        loaderObject = new Object();
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
    {
        super.SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef);
        MESSAGE_POSITION_TOP_Y = safeTop;
    } // End of the function
    function INITIALISE(mc, fileName)
    {
        FILE_NAME = fileName;
        super.INITIALISE(mc);
        awardMainMC = CONTENT.awardMainMC;
        awardMainMC.stop();
        awardMainMC.awardIconMC.stop();
        awardTitleTF = awardMainMC.awardTitleMC.awardTitleTF;
        awardDescriptionTF = awardMainMC.awardDescriptionMC.awardDescriptionTF;
        awardDescription2TF = awardMainMC.awardDescriptionMC.awardDescription2TF;
        awardIconMC = awardMainMC.awardIconMC;
        CONTENT._x = 640;
        CONTENT._y = MESSAGE_POSITION_TOP_Y;
    } // End of the function
    function loadComponent(txd, texture)
    {
        var thisObj = this;
        loaderObject._depth = 100;
        loaderObject._mc = awardIconMC.AwardIconInnerMC;
        loaderObject._loader = new MovieClipLoader();
        loaderObject._listener = new Object();
        loaderObject._loader.addListener(loaderObject._listener);
        loaderObject._listener.thisObj = thisObj;
        loaderObject._listener.onLoadInit = function (target_mc)
        {
            var _loc2 = thisObj.loaderObject;
            thisObj.awardMainMC.gotoAndPlay(1);
            thisObj.awardMainMC.awardIconMC.gotoAndPlay(1);
            _loc2._loader.removeListener(_loc2._listener);
            _loc2._loader = null;
        };
        var _loc3 = "img://" + txd + "/" + texture;
        loaderObject._loader.loadClip(_loc3, loaderObject._mc);
    } // End of the function
    function SHOW_AWARD_AND_MESSAGE(awTitle, awDesc, txd, texture, awDesc2, colEnum)
    {
        trace (whichGang);
        if (txd != "" && texture != "")
        {
            _texture = texture;
            switch (colEnum)
            {
                case 107:
                {
                    com.rockstargames.ui.utils.Colour.Colourise(awardIconMC, HUD_COLOURS[0][0], HUD_COLOURS[0][1], HUD_COLOURS[0][2], 100);
                    break;
                } 
                case 108:
                {
                    com.rockstargames.ui.utils.Colour.Colourise(awardIconMC, HUD_COLOURS[1][0], HUD_COLOURS[1][1], HUD_COLOURS[1][2], 100);
                    break;
                } 
                case 109:
                {
                    com.rockstargames.ui.utils.Colour.Colourise(awardIconMC, HUD_COLOURS[2][0], HUD_COLOURS[2][1], HUD_COLOURS[2][2], 100);
                    break;
                } 
                case 110:
                {
                    com.rockstargames.ui.utils.Colour.Colourise(awardIconMC, HUD_COLOURS[3][0], HUD_COLOURS[3][1], HUD_COLOURS[3][2], 100);
                    break;
                } 
            } // End of switch
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, FILE_NAME, txd);
        } // end if
        awardTitleTF.htmlText = awTitle;
        awardDescriptionTF.htmlText = awDesc;
        if (awDesc2 != undefined)
        {
            awardDescription2TF.htmlText = awDesc2;
        } // end if
    } // End of the function
    function SHOW_UNLOCK_AND_MESSAGE(awTitle, awDesc, txd, texture, awDesc2, colEnum)
    {
        trace (whichGang);
        if (txd != "" && texture != "")
        {
            _texture = texture;
            switch (colEnum)
            {
                case 107:
                {
                    com.rockstargames.ui.utils.Colour.Colourise(awardIconMC, HUD_COLOURS[0][0], HUD_COLOURS[0][1], HUD_COLOURS[0][2], 100);
                    break;
                } 
                case 108:
                {
                    com.rockstargames.ui.utils.Colour.Colourise(awardIconMC, HUD_COLOURS[1][0], HUD_COLOURS[1][1], HUD_COLOURS[1][2], 100);
                    break;
                } 
                case 109:
                {
                    com.rockstargames.ui.utils.Colour.Colourise(awardIconMC, HUD_COLOURS[2][0], HUD_COLOURS[2][1], HUD_COLOURS[2][2], 100);
                    break;
                } 
                case 110:
                {
                    com.rockstargames.ui.utils.Colour.Colourise(awardIconMC, HUD_COLOURS[3][0], HUD_COLOURS[3][1], HUD_COLOURS[3][2], 100);
                    break;
                } 
            } // End of switch
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, FILE_NAME, txd);
        } // end if
        awardTitleTF.htmlText = awTitle;
        if (awDesc2 != undefined)
        {
            awardDescription2TF.htmlText = awDesc2;
        } // end if
        awardDescriptionTF.htmlText = awDesc;
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, success)
    {
        if (success)
        {
            this.loadComponent(textureDict, _texture);
        } // end if
    } // End of the function
    function OVERRIDE_Y_POSITION(newYPosition)
    {
        CONTENT._y = newYPosition * screenHeightPixels;
    } // End of the function
    function debug()
    {
        this.SHOW_AWARD_AND_MESSAGE("Award", "DESCRIPTION", "", "");
        awardMainMC.play();
    } // End of the function
    var MESSAGE_POSITION_TOP_Y = 90;
} // End of Class
#endinitclip
