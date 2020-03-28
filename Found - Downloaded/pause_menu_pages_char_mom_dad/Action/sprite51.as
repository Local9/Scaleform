// Action script...

// [Initial MovieClip Action of sprite 51]
#initclip 8
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuLifestyleStatsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextRight, isAdjustable, barCol, __get__data, barMC, initialIndex, __set__barscale, bgMC, type, itemTextLeft, storeFunc, storeScope, selectedIndex, selectedValue, __get__barscale, __get__textIndex, index, _highlighted, __set__highlighted, isSelectable, __get__highlighted, __set__data, __set__textIndex;
    function PauseMenuLifestyleStatsItem()
    {
        super();
        _global.gfxExtensions = true;
        itemTextRight = labelMC.valueTF;
        isAdjustable = true;
        barCol = new com.rockstargames.ui.utils.HudColour();
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        var _loc3 = this.__get__data()[1];
        if (_loc3 != undefined && _loc3 != "")
        {
            itemTextRight.htmlText = _loc3;
            itemTextRight.autoSize = "right";
            itemTextRight.multiline = false;
        } // end if
        if (this.__get__data()[2] != undefined)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(this.__get__data()[2], barCol);
            com.rockstargames.ui.utils.Colour.Colourise(barMC.innerMC, barCol.r, barCol.g, barCol.b, barCol.a);
        } // end if
        barMin = this.__get__data()[3];
        barMax = this.__get__data()[4];
        this.__set__barscale(initialIndex);
        bgMC._height = 52;
        if (type == 1)
        {
            itemTextLeft.text = this.__get__data()[0];
            itemTextLeft.autoSize = "left";
            itemTextLeft.multiline = false;
            itemTextLeft.wordWrap = false;
            if (itemTextLeft._width > 277)
            {
                itemTextLeft.autoSize = "none";
                itemTextLeft._width = 277;
                itemTextLeft.textAutoSize = "shrink";
                itemTextLeft.text = this.__get__data()[0];
            } // end if
            itemTextLeft._x = 144 - itemTextLeft._width / 2;
        } // end if
        //return (this.data());
        null;
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
        selectedValue = barIndex;
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE, _loc2);
        var _loc9 = initialIndex % 1;
        var _loc8 = 1.500000;
        var _loc7 = 10;
        initialIndex = Math.ceil(initialIndex);
        var _loc6 = initialIndex - 1;
        if (_loc6 < 0)
        {
            _loc6 = 0;
        } // end if
        var _loc5 = _loc6 * _loc8 + initialIndex * _loc7;
        if (_loc9 > 0)
        {
            _loc5 = _loc5 - _loc7 / 2;
        } // end if
        barMC.innerMC._width = _loc5;
        for (var _loc3 = 0; _loc3 < 24; ++_loc3)
        {
            var _loc4 = barMC["p" + _loc3];
            if (_loc3 < barMax)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc4, _loc2.r, _loc2.g, _loc2.b, 50);
                continue;
            } // end if
            com.rockstargames.ui.utils.Colour.Colourise(_loc4, _loc2.r, _loc2.g, _loc2.b, 30);
        } // end of for
        //return (this.barscale());
        null;
    } // End of the function
    function set textIndex(ti)
    {
        multiListIndex = ti;
        selectedIndex = multiListIndex;
        selectedValue = multiListItems[multiListIndex];
        itemTextRight.html = true;
        itemTextRight.htmlText = selectedValue;
        itemTextRight.autoSize = true;
        itemTextRight._x = bgMC._width - itemTextRight._width - 4;
        //return (this.textIndex());
        null;
    } // End of the function
    function stepVal(dir)
    {
        switch (type)
        {
            case 0:
            case 1:
            {
                barIndex = barIndex + dir;
                if (barIndex < barMin)
                {
                    barIndex = barMin;
                } // end if
                if (barIndex > barMax)
                {
                    barIndex = barMax;
                } // end if
                this.__set__barscale(barIndex);
                storeFunc.apply(storeScope, [index, barIndex]);
                break;
            } 
        } // End of switch
        this.__set__highlighted(_highlighted);
    } // End of the function
    function set highlighted(_h)
    {
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        if (_h)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            if (isSelectable == 1)
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc2);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY, _loc2);
            } // end else if
        } // end else if
        com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var barIndex = 0;
    var barMin = 0;
    var barMax = 10;
    var multiListIndex = 0;
    var multiListItems = new Array();
} // End of Class
#endinitclip
