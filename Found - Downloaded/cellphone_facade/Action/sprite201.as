// Action script...

// [Initial MovieClip Action of sprite 201]
#initclip 11
class com.rockstargames.gtav.cellphone.apps.APP_ScrollingView extends MovieClip
{
    var dataProviderUI, CONTENT, linkageID, container, scrollBarTimeout, scrollBar, gutterHeight, offsetY, scrollerX, gfxFileName, whiteRGB, offWhiteRGB, currentStyle, contentOriginX, contentOriginY, content;
    function APP_ScrollingView()
    {
        super();
        dataProviderUI = new Array();
        CONTENT = this;
    } // End of the function
    function construct(parentContainer, linkage, params)
    {
        dataProviderUI = params;
        linkageID = linkage;
        container.removeMovieClip();
        container = parentContainer.createEmptyMovieClip("container", parentContainer.getNextHighestDepth());
        clearInterval(scrollBarTimeout);
        scrollBar = new com.rockstargames.ui.controls.ScrollBar();
        scrollBar.construct(container, "scrubber", "gutter", scrollerX, offsetY, gutterHeight);
        if (gfxFileName == "CELLPHONE_FACADE")
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, whiteRGB[0], whiteRGB[1], whiteRGB[2], 75);
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, offWhiteRGB[0], offWhiteRGB[1], offWhiteRGB[2], 100);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(scrollBar.scrubber, 0, 0, 0, 50);
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.bg, currentStyle[4][0], currentStyle[4][1], currentStyle[4][2], 100);
        } // end else if
        scrollBar.scrollBarContainer._alpha = 0;
        this.renderContainers();
        scrollBar.scrollBarContainer.swapDepths(scrollBar.scrollBarContainer.getDepth() + 20);
    } // End of the function
    function renderContainers()
    {
        if (container.content == undefined)
        {
            content = container.attachMovie(linkageID, "content", container.getNextHighestDepth(), {_x: contentOriginX, _y: contentOriginY});
        } // end if
        this.populateContent();
    } // End of the function
    function populateContent()
    {
    } // End of the function
    function navigate(direction)
    {
        var _loc2 = Math.round(content._y);
        switch (direction)
        {
            case "UP":
            {
                if (_loc2 < contentOriginY)
                {
                    _loc2 = _loc2 + scrollamount;
                } // end if
                if (_loc2 > contentOriginY)
                {
                    _loc2 = contentOriginY;
                } // end if
                break;
            } 
            case "DOWN":
            {
                if (_loc2 + content._height > contentOriginY + gutterHeight)
                {
                    _loc2 = _loc2 - scrollamount;
                } // end if
                if (_loc2 + content._height < contentOriginY + gutterHeight)
                {
                    _loc2 = contentOriginY - (content._height - gutterHeight);
                } // end if
                break;
            } 
        } // End of switch
        if (Math.round(_loc2) != Math.round(content._y))
        {
            scrollBar.scrollBarContainer._visible = true;
            this.setScrollBarVisibility(true);
            content._y = Math.round(_loc2);
            var _loc4;
            var _loc3 = contentOriginY - content._y;
            _loc4 = _loc3 / (content._height - gutterHeight) * 100;
            scrollBar.scrollToPercentage(_loc4);
        } // end if
    } // End of the function
    function setScrollBarVisibility(isVisible)
    {
        if (isVisible)
        {
            scrollBar.SHOW();
            clearInterval(scrollBarTimeout);
            scrollBarTimeout = setInterval(this, "setScrollBarVisibility", 300, false);
        }
        else
        {
            scrollBar.HIDE();
            clearInterval(scrollBarTimeout);
        } // end else if
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (currentSelection);
    } // End of the function
    function SHOW()
    {
        container._visible = true;
    } // End of the function
    function HIDE()
    {
        container._visible = false;
    } // End of the function
    function REMOVE()
    {
        dataProviderUI = [];
        for (var _loc2 in container)
        {
            if (typeof(container[_loc2]) == "movieclip")
            {
                container[_loc2].removeMovieClip();
                continue;
            } // end if
            delete container[_loc2];
        } // end of for...in
        container.removeMovieClip();
    } // End of the function
    function CLEAN_UP_DATA()
    {
        dataProviderUI = [];
    } // End of the function
    function CLOSE_APP()
    {
        clearInterval(scrollBarTimeout);
        container.removeMovieClip();
        this.REMOVE();
    } // End of the function
    var isLandscape = false;
    var scrollamount = 20;
    var needsScrollbars = false;
    var arrayStartPoint = 0;
    var inputDelay = 0;
    var offStateAlpha = 60;
    var currentSelection = -1;
} // End of Class
#endinitclip
