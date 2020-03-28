// Action script...

// [Initial MovieClip Action of sprite 216]
#initclip 26
class com.rockstargames.gtav.cellphone.apps.HOMEMENU_IFRUIT extends MovieClip
{
    var CONTENT, container, currentID, currentKey, previousKey, currentStyle;
    function HOMEMENU_IFRUIT()
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
        if (currentID == undefined)
        {
            currentID = 4;
        } // end if
        var _loc7;
        var _loc10;
        var _loc9 = 0;
        var _loc6;
        var _loc4 = 1;
        var _loc5 = 1;
        for (var _loc3 = 0; _loc3 < 9; ++_loc3)
        {
            var _loc2 = _loc4 + "_" + _loc5;
            var _loc8 = "c" + _loc4 + "_" + _loc5;
            if (container[_loc8])
            {
                container[_loc8]._name = _loc2;
            } // end if
            _loc7 = dataProviderUI[_loc3][0];
            _loc9 = dataProviderUI[_loc3][1];
            _loc10 = dataProviderUI[_loc3][2];
            _loc6 = dataProviderUI[_loc3][3];
            if (_loc6 == undefined)
            {
                _loc6 = 100;
            } // end if
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
            if (_loc10 != undefined)
            {
                container[_loc2].menuIconTitle = _loc10;
            } // end if
            container[_loc2].homeMenuIcons.iconIndicator.gotoAndStop(1);
            if (_loc7 != undefined)
            {
                this.setIcon(container[_loc2], _loc7, _loc6);
                if (_loc5 == 3)
                {
                    this.setIcon(container.reflectionBar["refIcon" + _loc4], _loc7, _loc6);
                    container.reflectionBar["refIcon" + _loc4]._visible = true;
                } // end if
                if (_loc9 > 0)
                {
                    container[_loc2].homeMenuIcons.iconIndicator.gotoAndStop(2);
                    container[_loc2].homeMenuIcons.menuIconInfo.text = String(_loc9);
                }
                else
                {
                    container[_loc2].homeMenuIcons.iconIndicator.gotoAndStop(1);
                    container[_loc2].homeMenuIcons.menuIconInfo.text = "";
                } // end else if
                container[_loc2]._visible = true;
            }
            else
            {
                container[_loc2]._visible = false;
                if (_loc5 == 3)
                {
                    container.reflectionBar["refIcon" + _loc4]._visible = false;
                } // end if
            } // end else if
            ++_loc4;
            if (_loc4 > numberOfColumns)
            {
                ++_loc5;
                _loc4 = 1;
            } // end if
        } // end of for
        numberOfRows = _loc5 - 1;
        if (currentKey.menuIconTitle)
        {
            _level0.TIMELINE.SET_HEADER(currentKey.menuIconTitle);
        } // end if
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
            var _loc2 = com.rockstargames.gtav.cellphone.IconLabels.lookUp(menuIconFrameEnum);
            target.homeMenuIcons.gotoAndStop(_loc2[1]);
            target.homeMenuIcons._alpha = iconAlpha;
        } // end if
    } // End of the function
    function setState(item, isActive)
    {
        if (item != undefined)
        {
            if (isActive)
            {
                com.rockstargames.ui.utils.Colour.Colourise(item.background.bgColourMC, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
                item.background._visible = true;
                item.homeMenuIcons._xscale = 110;
                item.homeMenuIcons._yscale = 110;
            }
            else
            {
                item.background._visible = false;
                item.homeMenuIcons._xscale = 100;
                item.homeMenuIcons._yscale = 100;
            } // end if
        } // end else if
    } // End of the function
    var numberOfRows = 3;
    var numberOfColumns = 3;
    var dataProviderUI = new Array();
    var currentSelection = -1;
} // End of Class
#endinitclip
