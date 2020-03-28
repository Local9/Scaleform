// Action script...

// [Initial MovieClip Action of sprite 57]
#initclip 3
class com.rockstargames.gtav.cellphone.prologue.HomeMenuKeys_Prologue extends com.rockstargames.ui.core.PhoneUIComponent
{
    var offsetY, container, scrollBar, dataProviderUI, needsScrollbars, currentID, menuTitleBar, TextBlackHex, currentKey, currentSelection, previousKey;
    function HomeMenuKeys_Prologue()
    {
        super();
    } // End of the function
    function constructAndPopulateContent()
    {
        var _loc8 = 250;
        var _loc5 = 120;
        scrollBar.construct(container, "scrubber", "gutter", _loc8, offsetY, _loc5);
        scrollBar.scrollBarContainer.scrubber._height = _loc5 / dataProviderUI.length;
        scrollBar.scrollBarContainer.scrubber._y = scrollBar.scrollBarContainer.gutter._y + scrollBar.scrollBarContainer.scrubber._height * Math.floor(dataProviderUI.length / 2);
        this.setScrollBarVisibility(true);
        var _loc6;
        var _loc3;
        var _loc7 = 0;
        needsScrollbars = false;
        if (currentID == undefined)
        {
            currentID = 4;
        } // end if
        menuTitleBar = container.menuTitleBar;
        menuTitleBar.menuTitle.textColor = TextBlackHex;
        var _loc10 = 1;
        var _loc9 = 1;
        var _loc2 = "1_1";
        var _loc4 = "c1_1";
        if (container[_loc4])
        {
            container[_loc4]._name = _loc2;
        } // end if
        _loc6 = dataProviderUI[currentID][0];
        _loc7 = dataProviderUI[currentID][1];
        _loc3 = dataProviderUI[currentID][2];
        container[_loc2]._id = currentID;
        currentKey = container[_loc2];
        this.setState(currentKey, true);
        currentSelection = currentKey._id;
        previousKey = container[_loc2];
        if (_loc3 != undefined)
        {
            container[_loc2].menuIconTitle.text = _loc3;
        } // end if
        if (_loc6 != undefined)
        {
            this.setIcon(container[_loc2], _loc6);
        } // end if
        numberOfRows = 1;
    } // End of the function
    function navigate(direction)
    {
        super.navigate(direction);
        scrollBar.scrollBarContainer.scrubber._y = scrollBar.scrollBarContainer.gutter._y + scrollBar.scrollBarContainer.scrubber._height * currentSelection;
    } // End of the function
    function setIcon(target, menuIconFrameEnum)
    {
        target.homeMenuIcons.gotoAndStop("CALL");
    } // End of the function
    function setScrollBarVisibility(isVisible)
    {
        scrollBar.scrollBarContainer._visible = isVisible;
    } // End of the function
    function setState(item, isActive)
    {
        item._visible = isActive;
    } // End of the function
    var menuTitle = "";
    var numberOfRows = 0;
} // End of Class
#endinitclip
