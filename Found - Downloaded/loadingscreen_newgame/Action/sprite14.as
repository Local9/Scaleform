// Action script...

// [Initial MovieClip Action of sprite 14]
#initclip 2
class com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_NEWGAME extends com.rockstargames.ui.core.BaseScriptUI
{
    var PROGRESS_INFO, CONTENT, GTAV_LOGO, object;
    function LOADINGSCREEN_NEWGAME()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.initProgressBar();
        this.initLogo();
    } // End of the function
    function SET_PROGRESS_BAR(percentage)
    {
        if (PROGRESS_INFO._visible == false)
        {
            PROGRESS_INFO._visible = true;
        } // end if
        PROGRESS_INFO.progress_bar._xscale = percentage;
    } // End of the function
    function SET_PROGRESS_TEXT(progressText)
    {
        if (PROGRESS_INFO._visible == false)
        {
            PROGRESS_INFO._visible = true;
        } // end if
        PROGRESS_INFO.progressText.text = progressText;
    } // End of the function
    function initProgressBar()
    {
        PROGRESS_INFO = CONTENT.attachMovie("PROGRESS_INFO", "PROGRESS_INFO", CONTENT.getNextHighestDepth());
        PROGRESS_INFO._x = 96;
        PROGRESS_INFO._y = 636;
        this.SET_PROGRESS_BAR(0);
        PROGRESS_INFO._visible = false;
    } // End of the function
    function initLogo()
    {
        GTAV_LOGO = CONTENT.attachMovie("GTAV_LOGO", "GTAV_LOGO", CONTENT.getNextHighestDepth());
        GTAV_LOGO._x = 68;
        GTAV_LOGO._y = 522;
    } // End of the function
    function debug()
    {
        CONTENT.object = this;
        CONTENT.onEnterFrame = function ()
        {
            object.getKeys();
        };
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(38))
        {
        }
        else if (Key.isDown(40))
        {
        }
        else if (Key.isDown(32))
        {
        } // end else if
    } // End of the function
} // End of Class
#endinitclip
