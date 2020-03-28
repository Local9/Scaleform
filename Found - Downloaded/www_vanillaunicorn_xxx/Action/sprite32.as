// Action script...

// [Initial MovieClip Action of sprite 32]
#initclip 4
class com.rockstargames.gtav.web.buttons.WebButtonWWW extends com.rockstargames.gtav.web.buttons.WebButton
{
    var buttonType, browser;
    function WebButtonWWW()
    {
        super();
        buttonType = com.rockstargames.gtav.constants.WebBrowserButtonLUT.WEB_BUTTON;
    } // End of the function
    function buttonEvent()
    {
        browser.GO_TO_WEBPAGE(browser._currentSelectedButton);
    } // End of the function
} // End of Class
#endinitclip
