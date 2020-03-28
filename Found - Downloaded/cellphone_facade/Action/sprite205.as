// Action script...

// [Initial MovieClip Action of sprite 205]
#initclip 15
class com.rockstargames.gtav.cellphone.apps.HOMEMENU_FACADE extends MovieClip
{
    var CONTENT, container, dataProviderUI, currentStyle, whiteRGB, currentID, currentKey, previousKey, cameraItem;
    function HOMEMENU_FACADE()
    {
        super();
        CONTENT = this;
    } // End of the function
    function construct()
    {
        this.populateContent();
    } // End of the function
    function populateContent()
    {
        container = this;
        dataProviderUI = _level0.TIMELINE.homemenuDataProviderUI;
        _level0.TIMELINE.infoBar.timeBar._visible = true;
        _level0.TIMELINE.toggleCellphoneButtonsVisible(true);
        currentStyle = _level0.TIMELINE.currentStyle;
        whiteRGB = _level0.TIMELINE.whiteRGB;
        if (currentID == undefined)
        {
            currentID = 4;
        } // end if
        var _loc6;
        var _loc10;
        var _loc9 = 0;
        var _loc5;
        var _loc4 = 1;
        var _loc8 = 1;
        for (var _loc3 = 0; _loc3 < 9; ++_loc3)
        {
            var _loc2 = _loc4 + "_" + _loc8;
            var _loc7 = "c" + _loc4 + "_" + _loc8;
            if (container[_loc7])
            {
                container[_loc7]._name = _loc2;
            } // end if
            _loc6 = dataProviderUI[_loc3][0];
            _loc9 = dataProviderUI[_loc3][1];
            _loc10 = dataProviderUI[_loc3][2];
            _loc5 = dataProviderUI[_loc3][3];
            if (_loc5 == undefined)
            {
                _loc5 = 100;
            } // end if
            if (_loc10 != undefined)
            {
                container[_loc2].menuIconTitle = _loc10;
            } // end if
            if (_loc6 != undefined && typeof(_loc6) == "number")
            {
                this.setIcon(container[_loc2], _loc6, _loc5);
                if (_loc9 > 0)
                {
                    container[_loc2].homeMenuIcons.menuIconInfo.text = String(_loc9);
                    container[_loc2].homeMenuIcons._x = 28;
                    container[_loc2].homeMenuIcons._y = 39;
                }
                else
                {
                    container[_loc2].homeMenuIcons.menuIconInfo.text = "";
                    container[_loc2].homeMenuIcons._x = 32;
                    container[_loc2].homeMenuIcons._y = 32;
                } // end else if
                container[_loc2]._visible = true;
            }
            else
            {
                container[_loc2]._visible = false;
            } // end else if
            container[_loc2]._id = _loc3;
            if (_loc3 != currentID)
            {
                this.setState(container[_loc2], false);
            }
            else
            {
                currentKey = container[_loc2];
                this.setState(currentKey, true);
                currentSelection = currentKey._id;
                com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG", com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE, 9, currentSelection);
                previousKey = container[_loc2];
            } // end else if
            ++_loc4;
            if (_loc4 > numberOfColumns)
            {
                ++_loc8;
                _loc4 = 1;
            } // end if
        } // end of for
        numberOfRows = _loc8 - 1;
        _level0.TIMELINE.SET_HEADER(currentKey.menuIconTitle);
    } // End of the function
    function navigate(direction)
    {
        this.setState(currentKey, false);
        previousKey = currentKey;
        var _loc4 = currentKey._name.split("_");
        var _loc3 = Number(_loc4[0]);
        var _loc2 = Number(_loc4[1]);
        switch (direction)
        {
            case "LEFT":
            {
                currentKey = container[_loc3 - 1 + "_" + _loc2];
                if (!currentKey)
                {
                    currentKey = container[numberOfColumns + "_" + _loc2];
                } // end if
                break;
            } 
            case "RIGHT":
            {
                currentKey = container[_loc3 + 1 + "_" + _loc2];
                if (!currentKey)
                {
                    currentKey = container["1_" + _loc2];
                } // end if
                break;
            } 
            case "UP":
            {
                currentKey = container[_loc3 + "_" + (_loc2 - 1)];
                if (!currentKey)
                {
                    currentKey = container[_loc3 + "_" + numberOfRows];
                } // end if
                break;
            } 
            case "DOWN":
            {
                currentKey = container[_loc3 + "_" + (_loc2 + 1)];
                if (!currentKey)
                {
                    currentKey = container[_loc3 + "_1"];
                } // end if
                break;
            } 
        } // End of switch
        if (currentKey._visible == false)
        {
            currentKey = previousKey;
        } // end if
        currentSelection = currentKey._id;
        com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG", com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE, 9, currentSelection);
        this.setState(currentKey, true);
        _level0.TIMELINE.SET_HEADER(currentKey.menuIconTitle);
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (currentSelection);
    } // End of the function
    function setIcon(target, menuIconFrameEnum, iconAlpha)
    {
        if (target != undefined)
        {
            if (iconAlpha == undefined)
            {
                iconAlpha = 100;
            } // end if
            var _loc4 = com.rockstargames.gtav.cellphone.IconLabels.lookUp(menuIconFrameEnum);
            target.homeMenuIcons.gotoAndStop(_loc4[1]);
            target.homeMenuIcons._alpha = iconAlpha;
            if (menuIconFrameEnum == 1)
            {
                cameraItem = target;
            } // end if
        } // end if
    } // End of the function
    function setState(item, isActive)
    {
        if (item != undefined)
        {
            var _loc3 = item.homeMenuIcons._alpha;
            if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, whiteRGB[0], whiteRGB[1], whiteRGB[1], 100);
                if (item != cameraItem)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.homeMenuIcons, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], _loc3);
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.homeMenuIcons, whiteRGB[0], whiteRGB[1], whiteRGB[1], _loc3);
                } // end else if
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                com.rockstargames.ui.utils.Colour.Colourise(item.homeMenuIcons, whiteRGB[0], whiteRGB[1], whiteRGB[1], _loc3);
            } // end if
        } // end else if
    } // End of the function
    var numberOfRows = 3;
    var numberOfColumns = 3;
    var currentSelection = -1;
} // End of Class
#endinitclip
