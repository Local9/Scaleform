// Action script...

// [Initial MovieClip Action of sprite 229]
#initclip 15
class com.rockstargames.gtav.cellphone.apps.HOMEMENU_BADGER extends MovieClip
{
    var CONTENT, container, dataProviderUI, currentID, currentKey, previousKey, currentStyle;
    function HOMEMENU_BADGER()
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
        _level0.TIMELINE.infoBar.infobarBackground.gotoAndStop("NOTIFICATIONS");
        var _loc5;
        var _loc10;
        var _loc6 = 0;
        var _loc7;
        var _loc4 = 1;
        var _loc9 = 1;
        for (var _loc3 = 0; _loc3 < 9; ++_loc3)
        {
            var _loc2 = _loc4 + "_" + _loc9;
            var _loc8 = "c" + _loc4 + "_" + _loc9;
            if (container[_loc8])
            {
                container[_loc8]._name = _loc2;
            } // end if
            _loc5 = dataProviderUI[_loc3][0];
            _loc6 = dataProviderUI[_loc3][1];
            _loc10 = dataProviderUI[_loc3][2];
            _loc7 = dataProviderUI[_loc3][3];
            if (_loc7 == undefined)
            {
                _loc7 = 100;
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
            if (_loc5 != undefined && typeof(_loc5) == "number")
            {
                this.setIcon(container[_loc2], _loc5, _loc7);
                if (_loc6 > 0)
                {
                    container[_loc2].homeMenuIcons.iconIndicator.gotoAndStop(2);
                }
                else
                {
                    container[_loc2].homeMenuIcons.iconIndicator.gotoAndStop(1);
                } // end else if
                switch (_loc5)
                {
                    case com.rockstargames.gtav.cellphone.IconLabels.EMAIL[0]:
                    {
                        _level0.TIMELINE.infoBar.infobarBackground.notificationBar.NotificationEmailText.text = String(_loc6);
                        break;
                    } 
                    case com.rockstargames.gtav.cellphone.IconLabels.TEXT_MESSAGE[0]:
                    {
                        _level0.TIMELINE.infoBar.infobarBackground.notificationBar.NotificationSMSText.text = String(_loc6);
                        break;
                    } 
                } // End of switch
                container[_loc2]._visible = true;
            }
            else
            {
                container[_loc2]._visible = false;
            } // end else if
            ++_loc4;
            if (_loc4 > numberOfColumns)
            {
                ++_loc9;
                _loc4 = 1;
            } // end if
        } // end of for
        numberOfRows = _loc9 - 1;
        if (currentKey.menuIconTitle)
        {
            _level0.TIMELINE.infoBar.infobarBackground.menuTitle.text = currentKey.menuIconTitle;
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
        _level0.TIMELINE.infoBar.infobarBackground.menuTitle.text = currentKey.menuIconTitle;
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
                if (item.background != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 75);
                } // end if
            }
            else
            {
                item.background._alpha = 0;
            } // end if
        } // end else if
    } // End of the function
    var numberOfRows = 3;
    var numberOfColumns = 3;
    var currentSelection = -1;
    var showNotificationIcons = false;
    var NotificationEmailString = "0";
    var NotificationSMSString = "0";
    var NotificationTaskString = "0";
} // End of Class
#endinitclip
