// Action script...

// [Initial MovieClip Action of sprite 147]
#initclip 6
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuMapItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var selectedValue, labelMC, valueIndicatorMC, valueTF, lMC, rMC, __get__data, valuesLength, initialIndex, itemTextLeft, _highlighted, iconID, iconMC, getNextHighestDepth, attachMovie, _data, bgMC, _x, storeFunc, storeScope, index, uniqueID, __get__highlighted, __get__showBlips, __set__data, __set__highlighted, __set__showBlips;
    function PauseMenuMapItem()
    {
        super();
        selectedValue = 0;
        valueIndicatorMC = labelMC.valueIndicatorMC;
        valueIndicatorMC._visible = false;
        valueTF = valueIndicatorMC.valueTF;
        lMC = valueIndicatorMC.lMC;
        rMC = valueIndicatorMC.rMC;
        valueTF.autoSize = "left";
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        valuesLength = this.__get__data()[5] > 1 ? (this.__get__data()[5]) : (1);
        _showBlips = this.__get__data()[6] != false ? (true) : (false);
        selectedValue = initialIndex;
        this.updateDisplay();
        //return (this.data());
        null;
    } // End of the function
    function updateDisplay()
    {
        com.rockstargames.ui.utils.UIText.setSizedText(itemTextLeft, this.__get__data()[0], false, true);
        if (valuesLength > 1 && _highlighted && _showBlips)
        {
            valueIndicatorMC._visible = true;
            com.rockstargames.ui.utils.UIText.setSizedText(valueTF, selectedValue + 1 + "/" + valuesLength, false, true);
            rMC._x = Math.round(valueTF._x + valueTF._width) + 2;
            valueIndicatorMC._x = Math.round(itemTextLeft._x + itemTextLeft._width + 4);
        }
        else
        {
            valueIndicatorMC._visible = false;
        } // end else if
        iconID = this.__get__data()[4];
        if (iconID != undefined)
        {
            if (_showBlips == true && iconMC._name != iconID)
            {
                iconMC.removeMovieClip();
                iconMC = this.attachMovie(iconID, iconID, this.getNextHighestDepth());
            }
            else if (!_showBlips && iconMC != "crossMC")
            {
                iconMC.removeMovieClip();
                iconMC = this.attachMovie("MapLegendItemCross", "crossMC", this.getNextHighestDepth());
            } // end else if
            iconMC._y = 12.500000;
            if (valuesLength > 1 && _highlighted && _showBlips)
            {
                iconMC._x = Math.round(valueIndicatorMC._x + valueIndicatorMC._width + 21);
            }
            else
            {
                iconMC._x = Math.round(itemTextLeft._x + itemTextLeft._width + 18);
            } // end else if
            if (_showBlips)
            {
                com.rockstargames.ui.utils.Colour.Colourise(iconMC, _data[1], _data[2], _data[3]);
            }
            else
            {
                var _loc4 = new com.rockstargames.ui.utils.HudColour();
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_GREY, _loc4);
                com.rockstargames.ui.utils.Colour.Colourise(iconMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
            } // end else if
        }
        else if (iconMC != undefined)
        {
            iconMC.removeMovieClip();
        } // end else if
        if (valuesLength > 1 && _highlighted && _showBlips)
        {
            bgMC._width = Math.round(valueIndicatorMC._x + valueIndicatorMC._width + 33);
        }
        else
        {
            bgMC._width = Math.round(itemTextLeft._x + itemTextLeft._width + 30);
        } // end else if
        _x = -bgMC._width;
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        if (_highlighted)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
            _showBlips ? (com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2)) : (com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_GREY, _loc2));
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
            _showBlips ? (com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc2)) : (com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_GREY, _loc2));
        } // end else if
        com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
        com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
    } // End of the function
    function initStoreMethod(func, scope)
    {
        storeFunc = func;
        storeScope = scope;
    } // End of the function
    function stepVal(dir)
    {
        var _loc2 = selectedValue + dir;
        selectedValue = _loc2 >= valuesLength ? (_loc2 - valuesLength) : (selectedValue + dir < 0 ? (_loc2 + valuesLength) : (_loc2));
        if (valuesLength > 1)
        {
            storeFunc.apply(storeScope, [index, initalValueIndex, selectedValue]);
            com.rockstargames.ui.game.GameInterface.call("SET_MAP_LOCATION", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, uniqueID, selectedValue);
        } // end if
        this.updateDisplay();
    } // End of the function
    function set highlighted(value)
    {
        if (_highlighted != value)
        {
            _highlighted = value;
            this.updateDisplay();
        } // end if
        //return (this.highlighted());
        null;
    } // End of the function
    function get highlighted()
    {
        return (_highlighted);
    } // End of the function
    function set showBlips(value)
    {
        if (iconID == "radar_centre" || iconID == "radar_waypoint")
        {
            return;
        } // end if
        var _loc2 = value != _showBlips ? (true) : (false);
        _showBlips = value;
        if (_loc2)
        {
            storeFunc.apply(storeScope, [index, showBlipIndex, _showBlips]);
            com.rockstargames.ui.game.GameInterface.call("SET_MAP_SHOW_BLIPS", com.rockstargames.ui.game.GameInterface.PAUSE_TYPE, uniqueID, _showBlips);
        } // end if
        this.updateDisplay();
        //return (this.showBlips());
        null;
    } // End of the function
    function get showBlips()
    {
        return (_showBlips);
    } // End of the function
    var _showBlips = true;
    var showBlipIndex = 12;
    var initalValueIndex = 4;
} // End of Class
#endinitclip
