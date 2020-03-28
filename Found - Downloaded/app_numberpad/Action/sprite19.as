// Action script...

// [Initial MovieClip Action of sprite 19]
#initclip 1
class com.rockstargames.gtav.cellphone.apps.APP_NUMBERPAD extends MovieClip
{
    var TIMELINE, CONTENT, dataProviderUI, container, col, row, gfxFileName, linkageID, numberOfRows, currentKey, previousKey, currentStyle, whiteRGB, TextWhiteHex, darkGreyRGB, greyRGB, TextGreyHex;
    function APP_NUMBERPAD()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE;
    } // End of the function
    function construct(_dataProviderUI)
    {
        if (_dataProviderUI != undefined || _dataProviderUI.length > 0)
        {
            dataProviderUI = _dataProviderUI;
        } // end if
        var _loc2 = TIMELINE.bg;
        com.rockstargames.ui.utils.Colour.Colourise(_loc2, 0, 0, 0, 100);
        container.removeMovieClip();
        container = CONTENT.createEmptyMovieClip("container", CONTENT.getNextHighestDepth());
        col = 1;
        row = 1;
        linkageID = "numberPad-" + gfxFileName.substr(10);
        this.renderContainers();
        com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG", com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE, 9, currentSelection);
    } // End of the function
    function renderContainers()
    {
        for (var _loc3 = 0; _loc3 < 12; ++_loc3)
        {
            var _loc2 = col + "_" + row;
            if (container[_loc2] != undefined)
            {
                container[_loc2].removeMovieClip();
            } // end if
            container[_loc2] = container.attachMovie(linkageID, _loc2, container.getNextHighestDepth());
            container[_loc2]._name = _loc2;
            container[_loc2]._id = _loc3;
            container[_loc2].asterisk._visible = false;
            this.setState(container[_loc2], false);
            var _loc4 = (container[_loc2]._width + columnSpace) * (col - 1) + offsetX;
            container[_loc2]._x = _loc4;
            var _loc5 = (container[_loc2]._height + rowSpace) * (row - 1) + offsetY;
            container[_loc2]._y = _loc5;
            ++col;
            if (col > numberOfColumns)
            {
                ++row;
                col = 1;
            } // end if
        } // end of for
        numberOfRows = row - 1;
        currentKey = container["1_1"];
        this.setState(currentKey, true);
        currentSelection = currentKey._id;
        previousKey = container["1_1"];
        this.populateContent();
    } // End of the function
    function populateContent(_dataProviderUI)
    {
        var _loc6 = new Array("", "ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ", "", "", "");
        col = 1;
        row = 1;
        for (var _loc2 = 0; _loc2 < 12; ++_loc2)
        {
            var _loc4 = col + "_" + row;
            var _loc5 = dataProviderUI[_loc2];
            if (_loc5 == "*")
            {
                container[_loc4].asterisk._visible = true;
            }
            else
            {
                container[_loc4].char.text = _loc5;
            } // end else if
            var _loc3 = dataProviderUI[_loc2 + 12];
            if (_loc3 == undefined)
            {
                _loc3 = _loc6[_loc2];
            } // end if
            container[_loc4].letters.text = _loc3;
            ++col;
            if (col > numberOfColumns)
            {
                ++row;
                col = 1;
            } // end if
        } // end of for
    } // End of the function
    function navigate(direction)
    {
        this.setState(currentKey, false);
        previousKey = currentKey;
        var _loc4 = currentKey._name.split("_");
        var _loc3 = Number(_loc4[0]);
        var _loc2 = Number(_loc4[1]);
        var _loc6 = _loc3;
        var _loc5 = _loc2;
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
        currentSelection = currentKey._id;
        com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG", com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE, 9, currentSelection);
        this.setState(currentKey, true);
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        return (currentSelection);
    } // End of the function
    function setState(item, isActive)
    {
        if (isActive)
        {
            com.rockstargames.ui.utils.Colour.Colourise(item.background, currentStyle[1][0], currentStyle[1][1], currentStyle[1][2], 100);
            com.rockstargames.ui.utils.Colour.Colourise(item.asterisk, whiteRGB[0], whiteRGB[1], whiteRGB[2], 100);
            item.char.textColor = TextWhiteHex;
            item.letters.textColor = TextWhiteHex;
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(item.background, darkGreyRGB[0], darkGreyRGB[1], darkGreyRGB[2], 100);
            com.rockstargames.ui.utils.Colour.Colourise(item.asterisk, greyRGB[0], greyRGB[1], greyRGB[2], 100);
            item.char.textColor = TextGreyHex;
            item.letters.textColor = TextGreyHex;
        } // end else if
    } // End of the function
    var numberOfColumns = 3;
    var columnSpace = 1;
    var rowSpace = 1;
    var offsetX = 0;
    var offsetY = 64;
    var currentSelection = 0;
} // End of Class
#endinitclip
