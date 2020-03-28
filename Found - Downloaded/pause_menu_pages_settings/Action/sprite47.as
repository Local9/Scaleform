// Action script...

// [Initial MovieClip Action of sprite 47]
#initclip 6
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuSettingsTextItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextRight, isAdjustable, defaultLabelColourEnum, _data, itemTextLeft, fbMC, menuID, menuPrefOffset, type, barMC, __get__data, initialIndex, __set__textIndex, bar, __set__barscale, getNextHighestDepth, attachMovie, bgMC, highlightMC, __get__isLastItem, _highlighted, __set__highlighted, storeFunc, storeScope, selectedIndex, selectedValue, __get__barscale, __get__textIndex, index, setPref, isSelectable, __get__highlighted, __set__data, __set__isLastItem;
    function PauseMenuSettingsTextItem()
    {
        super();
        itemTextRight = labelMC.valueTF;
        labelMC.rMC._visible = labelMC.lMC._visible = false;
        isAdjustable = true;
        defaultLabelColourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
        _global.gfxExtensions = true;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        if (_data[0] != undefined)
        {
            itemTextLeft.autoSize = "none";
            itemTextLeft._width = 390;
            com.rockstargames.ui.utils.UIText.setSizedText(itemTextLeft, _data[0]);
        } // end if
        if (fbMC != undefined)
        {
            fbMC.removeMovieClip();
        } // end if
        itemTextLeft._x = 5;
        var _loc8 = -1155176764;
        if (menuID == _loc8 + menuPrefOffset)
        {
            type = 3;
        } // end if
        switch (type)
        {
            case 0:
            {
                barMC._visible = false;
                if (this.__get__data()[1] != undefined && this.__get__data()[1] != "")
                {
                    com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, this.__get__data()[1]);
                }
                else
                {
                    com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, "");
                } // end else if
                labelMC.rMC._visible = labelMC.lMC._visible = false;
                break;
            } 
            case 1:
            {
                multiListItems = this.__get__data().slice(1);
                barMC._visible = false;
                labelMC.rMC._visible = labelMC.lMC._visible = false;
                this.__set__textIndex(initialIndex);
                break;
            } 
            case 2:
            {
                var _loc4 = this.__get__data()[1];
                if (_loc4 == "" || _loc4 == undefined)
                {
                    _loc4 = 1;
                } // end if
                barValsList = [];
                for (var _loc3 = 0; _loc3 < _loc4 + 1; ++_loc3)
                {
                    barValsList.push(100 / _loc4 * _loc3);
                } // end of for
                var _loc7 = this.__get__data()[2];
                if (_loc7 == undefined)
                {
                    _loc7 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN;
                } // end if
                bar = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(barMC);
                bar.init(_loc7);
                barMC._visible = true;
                labelMC.rMC._visible = labelMC.lMC._visible = false;
                com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, "");
                this.__set__barscale(initialIndex);
                break;
            } 
            case 3:
            {
                fbMC = this.attachMovie("itemfblogo", "fblogoMC", this.getNextHighestDepth(), {_x: 7, _y: 4});
                itemTextLeft._x = fbMC._x + fbMC._width + 4;
            } 
            default:
            {
                barMC._visible = false;
                com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, "");
                break;
            } 
        } // End of switch
        var _loc6 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc6);
        com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc6.r, _loc6.g, _loc6.b, _loc6.a);
        var _loc5 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc5);
        com.rockstargames.ui.utils.Colour.Colourise(highlightMC, _loc5.r, _loc5.g, _loc5.b, _loc5.a);
        if (this.__get__isLastItem())
        {
            highlightMC._height = bgMC._height = 25;
        }
        else
        {
            bgMC._height = 27;
            highlightMC._height = bgMC._height - 2;
        } // end else if
        bgMC._visible = false;
        this.__set__highlighted(_highlighted);
        //return (this.data());
        null;
    } // End of the function
    function set isLastItem(l)
    {
        _lastInList = l;
        //return (this.isLastItem());
        null;
    } // End of the function
    function get isLastItem()
    {
        return (_lastInList);
    } // End of the function
    function initStoreMethod(func, scope)
    {
        storeFunc = func;
        storeScope = scope;
    } // End of the function
    function set barscale(bi)
    {
        barIndex = bi;
        selectedIndex = barIndex;
        selectedValue = barValsList[barIndex];
        bar.percent(selectedValue);
        //return (this.barscale());
        null;
    } // End of the function
    function set textIndex(ti)
    {
        multiListIndex = ti;
        selectedIndex = multiListIndex;
        selectedValue = multiListItems[multiListIndex];
        com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, selectedValue);
        itemTextRight.autoSize = true;
        itemTextRight._x = labelMC.rMC._x - itemTextRight._width - 2;
        labelMC.lMC._x = itemTextRight._x - 2;
        labelMC.rMC._visible = labelMC.lMC._visible = true;
        //return (this.textIndex());
        null;
    } // End of the function
    function stepVal(dir)
    {
        switch (type)
        {
            case 1:
            {
                multiListIndex = multiListIndex + dir;
                if (multiListIndex < 0)
                {
                    multiListIndex = multiListItems.length - 1;
                } // end if
                if (multiListIndex > multiListItems.length - 1)
                {
                    multiListIndex = 0;
                } // end if
                this.__set__textIndex(multiListIndex);
                storeFunc.apply(storeScope, [index, multiListIndex]);
                this.setPref(multiListIndex);
                break;
            } 
            case 2:
            {
                barIndex = barIndex + dir;
                if (barIndex < 0)
                {
                    barIndex = 0;
                } // end if
                if (barIndex > barValsList.length - 1)
                {
                    barIndex = barValsList.length - 1;
                } // end if
                this.__set__barscale(barIndex);
                storeFunc.apply(storeScope, [index, barIndex]);
                this.setPref(barIndex);
                break;
            } 
        } // End of switch
        this.__set__highlighted(_highlighted);
    } // End of the function
    function set highlighted(_h)
    {
        highlightMC._visible = _h;
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        var _loc4 = 100;
        var _loc5 = false;
        if (isSelectable <= 0 || isSelectable == 2)
        {
            _loc5 = true;
            _loc4 = _h ? (60) : (30);
        } // end if
        if (_h)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
            if (type == 1 && _loc5 == false)
            {
                labelMC.rMC._visible = labelMC.lMC._visible = true;
                itemTextRight._x = labelMC.rMC._x - itemTextRight._width - 2;
                labelMC.lMC._x = itemTextRight._x - 2;
            } // end if
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
            com.rockstargames.ui.utils.Colour.setHudColour(defaultLabelColourEnum, _loc2);
            if (type == 1)
            {
                labelMC.rMC._visible = labelMC.lMC._visible = false;
            } // end if
            itemTextRight._x = highlightMC._width - itemTextRight._width - 6;
        } // end else if
        if (labelMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2.r, _loc2.g, _loc2.b, _loc4);
        } // end if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var multiListIndex = 0;
    var multiListItems = new Array();
    var barIndex = 0;
    var barValsList = new Array();
    var _lastInList = false;
} // End of Class
#endinitclip
