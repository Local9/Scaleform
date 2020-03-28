// Action script...

// [Initial MovieClip Action of sprite 21]
#initclip 8
class com.rockstargames.gtav.cellphone.apps.APP_TODO_VIEW extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingView
{
    var scrollBar, gutterHeight, isLandscape, scrollerX, contentOriginX, TIMELINE, CONTENT, dataProviderUI, scrollBarTimeout, gfxFileName, currentStyle, linkageID, content, greyRGB, needsScrollbars, container;
    function APP_TODO_VIEW()
    {
        super();
        scrollBar = new com.rockstargames.ui.controls.ScrollBar();
        gutterHeight = 240;
        isLandscape = false;
        scrollerX = 250;
        contentOriginX = 0;
        contentOriginY = 64;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE;
    } // End of the function
    function construct()
    {
        dataProviderUI = _level0.TIMELINE.contactsDataProviderUI;
        clearInterval(scrollBarTimeout);
        var _loc3 = TIMELINE.bg;
        switch (gfxFileName)
        {
            case "CELLPHONE_FACADE":
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, 210, 210, 210, 100);
                break;
            } 
            case "CELLPHONE_IFRUIT":
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, 238, 233, 176, 100);
                com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground, 136, 118, 104, 100);
                break;
            } 
            default:
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc3, currentStyle[4][0], currentStyle[4][1], currentStyle[4][2], 100);
                break;
            } 
        } // End of switch
        linkageID = "toDoViewMC";
        super.construct(CONTENT, linkageID, dataProviderUI);
    } // End of the function
    function populateContent()
    {
        dataProviderUI = _level0.TIMELINE.contactsDataProviderUI;
        switch (gfxFileName)
        {
            case "CELLPHONE_IFRUIT":
            {
                com.rockstargames.ui.utils.Colour.Colourise(content.icon, 94, 80, 73, 100);
                break;
            } 
            default:
            {
                com.rockstargames.ui.utils.Colour.Colourise(content.icon, greyRGB[0], greyRGB[1], greyRGB[1], 100);
                break;
            } 
        } // End of switch
        var _loc4 = dataProviderUI[0][0];
        var _loc7 = dataProviderUI[0][1];
        var _loc6 = dataProviderUI[0][2];
        var _loc5 = dataProviderUI[0][3];
        content.missionNameTF.text = com.rockstargames.ui.utils.FitToTextfield.capText(content.missionNameTF, _loc4);
        content.descriptionTF.wordWrap = true;
        content.descriptionTF.multiline = true;
        content.descriptionTF.autoSize = "left";
        content.descriptionTF.text = _loc7;
        content.info1TF.text = com.rockstargames.ui.utils.FitToTextfield.capText(content.info1TF, _loc6);
        content.info2TF.text = com.rockstargames.ui.utils.FitToTextfield.capText(content.info2TF, _loc5);
        if (content.descriptionTF._y + content.descriptionTF._height > gutterHeight)
        {
            content.background._height = content.descriptionTF._y + content.descriptionTF._height;
            needsScrollbars = true;
        } // end if
        var _loc2 = content._height;
        var _loc8 = _loc2 - gutterHeight;
        var _loc3 = _loc8 / _loc2;
        scrollBar.scrollBarContainer.scrubber._height = Math.round((1 - _loc3) * gutterHeight);
    } // End of the function
    function CLEAN_UP_DATA()
    {
        dataProviderUI = [];
        container.removeMovieClip();
    } // End of the function
    var offsetY = 64;
    var offsetX = 0;
    var contentOriginY = 64;
} // End of Class
#endinitclip
