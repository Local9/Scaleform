// Action script...

// [Initial MovieClip Action of sprite 61]
#initclip 10
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuHeritageCardItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextRight, isAdjustable, getNextHighestDepth, attachMovie, rankBarMC, frameMC, barlinebgMC, barlineMC, highlightMC, bgMC, type, __get__data, index, leftArrowMC, rightArrowMC, initialIndex, __set__barscale, __set__textIndex, _highlighted, __set__highlighted, storeFunc, storeScope, selectedIndex, selectedValue, __get__barscale, __get__textIndex, isSelectable, __get__highlighted, __set__data;
    function PauseMenuHeritageCardItem()
    {
        super();
        itemTextRight = labelMC.valueTF;
        isAdjustable = true;
        rankBarMC = this.attachMovie("GenericColourBar", "rankBarMC", this.getNextHighestDepth(), {_x: 158, _y: 9});
        rankBarMC._visible = false;
        frameMC._visible = false;
        barlinebgMC.swapDepths(this.getNextHighestDepth());
        barlineMC.swapDepths(this.getNextHighestDepth());
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(highlightMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        bgMC._visible = false;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        switch (type)
        {
            case 0:
            {
                if (this.__get__data()[1] != undefined && this.__get__data()[1] != "")
                {
                    itemTextRight.htmlText = this.__get__data()[1];
                    itemTextRight.autoSize = "right";
                    itemTextRight.multiline = false;
                } // end if
                var _loc3 = index % 2 == 0 ? (2) : (1);
                frameMC.gotoAndStop(_loc3);
                frameMC._visible = true;
                rankBarMC._visible = barlineMC._visible = barlinebgMC._visible = false;
                leftArrowMC._visible = rightArrowMC._visible = true;
                bgMC._height = 187;
                labelMC.rMC._visible = labelMC.lMC._visible = false;
                break;
            } 
            case 1:
            {
                if (this.__get__data()[1] != undefined)
                {
                    rankBarMC.init(this.__get__data()[1], 108, 6);
                    rankBarMC.percent(50);
                } // end if
                labelMC.femaleMC._alpha = labelMC.maleMC._alpha = 100;
                this.__set__barscale(initialIndex);
                rankBarMC._visible = barlineMC._visible = barlinebgMC._visible = true;
                leftArrowMC._visible = rightArrowMC._visible = false;
                bgMC._height = 25;
                labelMC.rMC._visible = labelMC.lMC._visible = false;
                frameMC._visible = false;
                break;
            } 
            case 2:
            {
                multiListItems = this.__get__data().slice(1);
                this.__set__textIndex(initialIndex);
                rankBarMC._visible = barlineMC._visible = barlinebgMC._visible = false;
                leftArrowMC._visible = rightArrowMC._visible = false;
                bgMC._height = 25;
                labelMC.rMC._visible = labelMC.lMC._visible = true;
                frameMC._visible = false;
                break;
            } 
        } // End of switch
        this.__set__highlighted(_highlighted);
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
        rankBarMC.setFillX(54 * (selectedValue / 100));
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
        itemTextRight._x = labelMC.rMC._x - itemTextRight._width - 2;
        labelMC.lMC._x = itemTextRight._x - 2;
        //return (this.textIndex());
        null;
    } // End of the function
    function stepVal(dir)
    {
        switch (type)
        {
            case 1:
            {
                barIndex = barIndex + dir * barStep;
                if (barIndex < 1)
                {
                    barIndex = 1;
                } // end if
                if (barIndex > 100)
                {
                    barIndex = 100;
                } // end if
                this.__set__barscale(barIndex);
                storeFunc.apply(storeScope, [index, barIndex]);
                break;
            } 
            case 2:
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
                break;
            } 
        } // End of switch
    } // End of the function
    function set highlighted(_h)
    {
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        if (_h)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
            if (type == 0)
            {
                leftArrowMC._alpha = rightArrowMC._alpha = 100;
            }
            else if (type == 2)
            {
                labelMC.rMC._visible = labelMC.lMC._visible = true;
            } // end else if
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
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_GREY, _loc2);
            } // end else if
            if (type == 0)
            {
                leftArrowMC._alpha = rightArrowMC._alpha = 0;
            }
            else if (type == 2)
            {
                labelMC.rMC._visible = labelMC.lMC._visible = false;
            } // end else if
        } // end else if
        com.rockstargames.ui.utils.Colour.Colourise(highlightMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var barIndex = 1;
    var barStep = 1;
    var multiListIndex = 0;
    var multiListItems = new Array();
} // End of Class
#endinitclip
