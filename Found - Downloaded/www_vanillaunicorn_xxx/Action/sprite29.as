// Action script...

// [Initial MovieClip Action of sprite 29]
#initclip 1
class com.rockstargames.ui.core.BaseWebsite extends MovieClip
{
    var dataProviderUI, dataTextScope, PAGE_NAMES, CAN_STORE_PAGE, TIMELINE, CONTENT, BOUNDING_BOX;
    function BaseWebsite()
    {
        super();
        dataProviderUI = new Array();
        dataTextScope = new Array();
        PAGE_NAMES = new Array();
        PAGE_NAMES[1] = "PAGE1";
        CAN_STORE_PAGE = new Array();
        CAN_STORE_PAGE[1] = true;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
        this.READY();
    } // End of the function
    function READY()
    {
    } // End of the function
    function SET_PRICES()
    {
    } // End of the function
    function DISABLE_VIDEO()
    {
    } // End of the function
    function SET_MOVIECLIP_VISIBILITY(isVisible, instanceEnum)
    {
    } // End of the function
    function PROXY_FUNCTION()
    {
    } // End of the function
    function showMovieClip(targetMC, xPos)
    {
        targetMC._visible = true;
        targetMC._x = xPos;
    } // End of the function
    function hideMovieClip(targetMC)
    {
        targetMC._visible = false;
        targetMC._x = 1300;
    } // End of the function
    function TXD_HAS_LOADED()
    {
    } // End of the function
    function CLEANUP()
    {
    } // End of the function
    var IS_SITE_DYNAMIC = 0;
    var resetScroll = true;
} // End of Class
#endinitclip
