// Action script...

// [Initial MovieClip Action of sprite 25]
#initclip 8
class com.rockstargames.gtav.Multiplayer.MP_AWARD_FREEMODE extends com.rockstargames.gtav.Multiplayer.MP_AWARD_BASE
{
    var FILE_NAME, CONTENT, awardMainMC, awardTitleTF, awardDescriptionTF, awardDescription2TF, awardIconMC, TIMELINE, loaderObject, thisObj, _texture, HUD_COLOURS;
    function MP_AWARD_FREEMODE()
    {
        super();
    } // End of the function
    function INITIALISE(mc, fileName)
    {
        FILE_NAME = fileName;
        super.INITIALISE(mc, FILE_NAME);
        awardMainMC = CONTENT.attachMovie("MASTER_AWARDS_DOBULE_LINE", "MASTER_AWARDS_DOBULE_LINE", CONTENT.getNextHighestDepth());
        awardMainMC._visible = false;
        awardTitleTF = awardMainMC.BIG_TEXT;
        awardDescriptionTF = awardMainMC.AWARD_TITLE;
        awardDescription2TF = awardMainMC.AWARD_TEXT;
        awardIconMC = awardMainMC.awardIconMC;
        CONTENT._x = 640;
        CONTENT._y = 0;
    } // End of the function
    function RESET_AWARDS_MOVIE()
    {
        if (typeof(CONTENT) == "movieclip")
        {
            CONTENT.removeMovieClip();
            this.INITIALISE(TIMELINE, FILE_NAME);
        } // end if
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
            _loc2._loader.removeListener(_loc2._listener);
            _loc2._loader = null;
        };
        var _loc3 = "img://" + txd + "/" + texture;
        loaderObject._loader.loadClip(_loc3, loaderObject._mc);
    } // End of the function
    function SHOW_AWARD_AND_MESSAGE(awTitle, awDesc, txd, texture, awDesc2, colEnum, awDesc3)
    {
        if (txd != undefined && texture != undefined)
        {
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
                com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "MP_AWARD_FREEMODE", txd);
            } // end if
        } // end if
        if (awDesc2 == undefined)
        {
            awDesc2 = "";
        } // end if
        if (awDesc3 != "" && awDesc3 != undefined)
        {
            if (awDesc2 == "")
            {
                awDesc2 = awDesc3;
            }
            else
            {
                awDesc2 = awDesc2 + " " + awDesc3;
            } // end if
        } // end else if
        awardTitleTF.htmlText = awTitle;
        awardDescriptionTF.htmlText = awDesc;
        awardDescription2TF.htmlText = awDesc2;
        awardMainMC._visible = true;
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueStr, success)
    {
        if (success)
        {
            this.loadComponent(textureDict, _texture);
        } // end if
    } // End of the function
    function debug()
    {
        this.SHOW_AWARD_AND_MESSAGE("Award", "DESCRIPTION", "", "", "", 1, "line 3");
    } // End of the function
} // End of Class
#endinitclip
