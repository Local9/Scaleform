// Action script...

// [Initial MovieClip Action of sprite 30]
#initclip 2
class com.rockstargames.gtav.web.GENERIC_WEBSITE_SCRIPT extends com.rockstargames.ui.core.BaseWebsite
{
    var IS_SITE_DYNAMIC, PAGE_NAMES, CAN_STORE_PAGE, browser, CONTENT, OnColour, mcScope, dataTextScope, defaultButtonOnColour;
    function GENERIC_WEBSITE_SCRIPT()
    {
        super();
        IS_SITE_DYNAMIC = 0;
        _level0.TIMELINE.DebugTextContent = true;
        PAGE_NAMES = new Array();
        PAGE_NAMES[1] = "PAGE1";
        PAGE_NAMES[2] = "PAGE2";
        PAGE_NAMES[3] = "PAGE3";
        PAGE_NAMES[4] = "PAGE4";
        PAGE_NAMES[5] = "PAGE5";
        PAGE_NAMES[6] = "PAGE6";
        PAGE_NAMES[7] = "PAGE7";
        PAGE_NAMES[8] = "PAGE8";
        PAGE_NAMES[9] = "PAGE9";
        PAGE_NAMES[10] = "PAGE10";
        PAGE_NAMES[11] = "PAGE11";
        PAGE_NAMES[12] = "PAGE12";
        PAGE_NAMES[13] = "PAGE13";
        PAGE_NAMES[14] = "PAGE14";
        PAGE_NAMES[15] = "PAGE15";
        PAGE_NAMES[16] = "PAGE16";
        PAGE_NAMES[17] = "PAGE17";
        PAGE_NAMES[18] = "PAGE18";
        PAGE_NAMES[19] = "PAGE19";
        PAGE_NAMES[20] = "PAGE20";
        CAN_STORE_PAGE = new Array();
        CAN_STORE_PAGE[1] = true;
        CAN_STORE_PAGE[2] = true;
        CAN_STORE_PAGE[3] = true;
        CAN_STORE_PAGE[4] = true;
        CAN_STORE_PAGE[5] = true;
        CAN_STORE_PAGE[6] = true;
        CAN_STORE_PAGE[7] = true;
        CAN_STORE_PAGE[8] = true;
        CAN_STORE_PAGE[9] = true;
        CAN_STORE_PAGE[10] = true;
        CAN_STORE_PAGE[11] = true;
        CAN_STORE_PAGE[12] = true;
        CAN_STORE_PAGE[13] = true;
        CAN_STORE_PAGE[14] = true;
        CAN_STORE_PAGE[15] = true;
        CAN_STORE_PAGE[16] = true;
        CAN_STORE_PAGE[17] = true;
        CAN_STORE_PAGE[18] = true;
        CAN_STORE_PAGE[19] = true;
        CAN_STORE_PAGE[20] = true;
        browser = _level0.TIMELINE;
    } // End of the function
    function READY()
    {
    } // End of the function
    function POPULATE_TEXT(pageName)
    {
        if (CONTENT.globalColourMouseOver != undefined)
        {
            OnColour = CONTENT.globalColourMouseOver.textColor;
        } // end if
        mcScope = CONTENT[pageName];
        if (mcScope.colourMouseOver != undefined)
        {
            OnColour = mcScope.colourMouseOver.textColor;
        } // end if
        dataTextScope = new Array();
        var _loc3 = 0;
        for (var _loc4 in mcScope)
        {
            if (typeof(mcScope[_loc4]) == "movieclip")
            {
                if (mcScope[_loc4].btnTxt != undefined)
                {
                    mcScope[_loc4].offColour = mcScope[_loc4].btnTxt.textColor;
                    var _loc2 = mcScope[_loc4].btnTxt;
                    dataTextScope[_loc3] = _loc2;
                    ++_loc3;
                } // end if
            } // end if
        } // end of for...in
        browser.SET_PAGE_BUTTONS(dataTextScope);
        defaultButtonOnColour = OnColour;
    } // End of the function
} // End of Class
#endinitclip
