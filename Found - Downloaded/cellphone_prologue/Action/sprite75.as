// Action script...

// [Initial MovieClip Action of sprite 75]
#initclip 21
class com.rockstargames.gtav.cellphone.prologue.ContactList_Prologue extends com.rockstargames.ui.controls.ScrollingList
{
    var scrollBar, scrollBarTimeout, row, offsetY, container, dataProviderUI, numberOfVisibleRows, arrayStartPoint, TextWhiteHex, TextBlackHex;
    function ContactList_Prologue()
    {
        super();
        _global.gfxExtensions = true;
        scrollBar = new com.rockstargames.ui.controls.ScrollBar();
    } // End of the function
    function construct(parentContainer, linkageID, params)
    {
        clearInterval(scrollBarTimeout);
        row = 1;
        super.construct(parentContainer, linkageID, params);
        var _loc4 = 250;
        var _loc3 = 120;
        scrollBar.construct(container, "scrubber", "gutter", _loc4, offsetY, _loc3);
        scrollBar.scrollBarContainer.scrubber._height = _loc3 / dataProviderUI.length;
        this.setScrollBarVisibility(true);
    } // End of the function
    function populateContent()
    {
        row = 1;
        if (numberOfVisibleRows > 0)
        {
            for (var _loc2 = 0; _loc2 < numberOfVisibleRows; ++_loc2)
            {
                var _loc3 = "listItem" + row;
                var _loc4 = _loc2 + arrayStartPoint;
                container[_loc3].contactNameMC.textAutoSize = "shrink";
                container[_loc3].contactNameMC.text = dataProviderUI[_loc4][1];
                ++row;
            } // end of for
        } // end if
    } // End of the function
    function setScrollBarVisibility(isVisible)
    {
        if (isVisible)
        {
            scrollBar.scrollBarContainer._alpha = 100;
        }
        else
        {
            scrollBar.scrollBarContainer._alpha = 0;
        } // end else if
        scrollBar.scrollBarContainer._visible = isVisible;
    } // End of the function
    function setState(item, isActive)
    {
        if (isActive)
        {
            item.background._alpha = 100;
            item.contactNameMC.textColor = TextWhiteHex;
            item.jobTitle.textColor = TextWhiteHex;
        }
        else
        {
            item.background._alpha = 0;
            item.contactNameMC.textColor = TextBlackHex;
            item.jobTitle.textColor = TextBlackHex;
        } // end else if
    } // End of the function
    var defaultRowHeight = 40;
} // End of Class
#endinitclip
