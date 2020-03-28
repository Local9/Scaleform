// Action script...

// [Initial MovieClip Action of sprite 55]
#initclip 1
class com.rockstargames.gtav.cellphone.prologue.CELLPHONE_PROLOGUE extends MovieClip
{
    var TIMELINE, CONTENT, currentInterface, previousInterface, layerOne, layerTwo, layerThree, layerFour, keyboardlayer, cellphoneButtons, viewMethod, componentArray, homeMenuKeys, contactsList, callScreen;
    function CELLPHONE_PROLOGUE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.CONTENT;
        currentInterface.levelDepth = -1;
        previousInterface = new com.rockstargames.ui.core.PhoneUIComponent();
        layerOne = CONTENT.layerOne;
        layerTwo = CONTENT.layerTwo;
        layerThree = CONTENT.layerThree;
        layerFour = CONTENT.layerFour;
        keyboardlayer = CONTENT.keyboardlayer;
        cellphoneButtons = CONTENT.cellphoneButtons;
        viewMethod = {};
        viewMethod[0] = ["SHUTDOWN_MOVIE"];
        viewMethod[1] = ["HOME_MENU"];
        viewMethod[2] = ["CONTACT_LIST"];
        viewMethod[4] = ["CALL_SCREEN"];
        var _loc2 = new flash.geom.Transform(CONTENT);
        var _loc3 = new flash.geom.ColorTransform(1, 1, 1, 1, -45, -45, -45, 0);
        _loc2.colorTransform = _loc3;
        componentArray = ["", "homeMenuKeys", "contactsList", "", "callScreen"];
        currentStyle = com.rockstargames.gtav.cellphone.CellphoneStyles.Prologue;
    } // End of the function
    function GET_CURRENT_SELECTION()
    {
        if (isNaN(currentInterface.GET_CURRENT_SELECTION()))
        {
            return (-1);
        }
        else
        {
            return (currentInterface.GET_CURRENT_SELECTION());
        } // end else if
    } // End of the function
    function SET_TITLEBAR_TIME(newHour, newMinute, newDay)
    {
    } // End of the function
    function SET_SLEEP_MODE(isSleepModeActive)
    {
    } // End of the function
    function SET_HEADER(newHeader)
    {
        var _loc2;
        currentInterface.header.headerText.text = newHeader;
        _loc2 = 114 - currentInterface.header.headerText.textWidth / 2;
        currentInterface.header.headerLineLeft._width = _loc2;
        currentInterface.header.headerLineLeftShadow._width = _loc2;
        currentInterface.header.headerLineRight._width = _loc2 - 10;
        currentInterface.header.headerLineRightShadow._width = _loc2 - 10;
        currentInterface.header.depthText.text = currentInterface.levelDepth;
    } // End of the function
    function SET_SOFT_KEYS_COLOUR(buttonID, ired, igreen, iblue, ialpha)
    {
        var _loc2;
        switch (buttonID)
        {
            case 1:
            {
                _loc2 = cellphoneButtons.textLabelPositiveMC;
                break;
            } 
            case 2:
            {
                _loc2 = cellphoneButtons.textLabelOtherMC;
                break;
            } 
            case 3:
            {
                _loc2 = cellphoneButtons.textLabelNegativeMC;
                break;
            } 
        } // End of switch
        com.rockstargames.ui.utils.Colour.Colourise(_loc2, ired, igreen, iblue, ialpha);
    } // End of the function
    function SET_SOFT_KEYS(buttonID, isVisible, iconEnum, textLabel)
    {
        var _loc3;
        if (textLabel == undefined)
        {
            textLabel = "";
        } // end if
        switch (buttonID)
        {
            case 1:
            {
                _loc3 = cellphoneButtons.textLabelPositiveMC;
                cellphoneButtons.textLabelPositiveMC.textLabelPositive.text = textLabel;
                break;
            } 
            case 2:
            {
                _loc3 = cellphoneButtons.textLabelOtherMC;
                cellphoneButtons.textLabelOtherMC.textLabelOther.text = textLabel;
                break;
            } 
            case 3:
            {
                _loc3 = cellphoneButtons.textLabelNegativeMC;
                cellphoneButtons.textLabelNegativeMC.textLabelNegative.text = textLabel;
                break;
            } 
        } // End of switch
        _loc3._visible = isVisible;
    } // End of the function
    function updateSoftKeys(currentClip)
    {
    } // End of the function
    function updateInfoBar(currentClip)
    {
    } // End of the function
    function SET_UI_COLOUR(id, r, g, b)
    {
    } // End of the function
    function COLOUR_INFOBAR()
    {
    } // End of the function
    function SET_BACKGROUND_IMAGE(image_enum)
    {
    } // End of the function
    function SET_PROVIDER_ICON(icon_enum)
    {
    } // End of the function
    function SET_THEME(themeID)
    {
    } // End of the function
    function checkClassExists(viewID)
    {
        switch (viewID)
        {
            case 1:
            {
                homeMenuKeys = new com.rockstargames.gtav.cellphone.prologue.HomeMenuKeys_Prologue();
                break;
            } 
            case 2:
            {
                contactsList = new com.rockstargames.gtav.cellphone.prologue.ContactList_Prologue();
                break;
            } 
            case 4:
            {
                callScreen = new com.rockstargames.gtav.cellphone.prologue.CallScreen_Prologue();
                break;
            } 
        } // End of switch
    } // End of the function
    function SET_DATA_SLOT_EMPTY(viewID)
    {
        if (this[componentArray[viewID]] == undefined)
        {
            this.checkClassExists(viewID);
        } // end if
        this[componentArray[viewID]].dataProviderUI = new Array();
    } // End of the function
    function SET_DATA_SLOT(viewID, slotID)
    {
        var _loc4 = arguments.slice(2);
        if (this[componentArray[viewID]] == undefined)
        {
            this.checkClassExists(viewID);
        } // end if
        this[componentArray[viewID]].dataProviderUI[slotID] = _loc4;
    } // End of the function
    function GET_DATA(viewID)
    {
        var _loc3 = "";
        var _loc2;
        _loc2 = this[componentArray[viewID]].dataProviderUI;
        for (var _loc4 in _loc2)
        {
            _loc3 = _loc3 + _loc2[_loc4];
        } // end of for...in
        return (_loc3);
    } // End of the function
    function DISPLAY_VIEW(viewID, currentID)
    {
        this[viewMethod[viewID]](currentID);
    } // End of the function
    function HOME_MENU(_currentID)
    {
        homeMenuKeys._name = "HOME_MENU";
        homeMenuKeys.numberOfColumns = 1;
        homeMenuKeys.numberOfVisibleRows = 1;
        homeMenuKeys.levelDepth = 1;
        homeMenuKeys.currentStyle = currentStyle;
        homeMenuKeys.TextWhiteHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextWhiteHex;
        homeMenuKeys.TextBlackHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextBlackHex;
        homeMenuKeys.currentID = _currentID;
        homeMenuKeys.container = layerOne;
        homeMenuKeys.constructAndPopulateContent();
        this.createPrologueTransition(currentInterface, homeMenuKeys);
        currentInterface = homeMenuKeys;
        this.toggleCellphoneButtonsVisible(true);
    } // End of the function
    function CONTACT_LIST(_currentID)
    {
        contactsList._name = "CONTACT_LIST";
        contactsList.numberOfVisibleRows = 3;
        contactsList.levelDepth = 2;
        contactsList.rowSpace = 0;
        contactsList.offsetX = 0;
        contactsList.offsetY = 40;
        contactsList.currentID = _currentID;
        contactsList.currentStyle = currentStyle;
        contactsList.TextWhiteHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextWhiteHex;
        contactsList.TextBlackHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextBlackHex;
        contactsList.construct(layerTwo, "listItemMC");
        if (currentInterface != contactsList)
        {
            this.createPrologueTransition(currentInterface, contactsList);
            currentInterface = contactsList;
            return (true);
        } // end if
    } // End of the function
    function CALL_SCREEN(state)
    {
        callScreen._name = "CALL_SCREEN";
        callScreen.__set__callState(state);
        callScreen.levelDepth = 3;
        callScreen.offsetX = 0;
        callScreen.offsetY = 0;
        callScreen.currentStyle = currentStyle;
        callScreen.TextBlackHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextBlackHex;
        callScreen.construct(layerFour, "currentContact");
        if (currentInterface != callScreen)
        {
            this.createPrologueTransition(currentInterface, callScreen);
            currentInterface = callScreen;
            return (true);
        } // end if
    } // End of the function
    function SHUTDOWN_MOVIE()
    {
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        switch (direction)
        {
            case 1:
            {
                currentInterface.navigate("UP");
                break;
            } 
            case 2:
            {
                currentInterface.navigate("RIGHT");
                break;
            } 
            case 3:
            {
                currentInterface.navigate("DOWN");
                break;
            } 
            case 4:
            {
                currentInterface.navigate("LEFT");
                break;
            } 
        } // End of switch
    } // End of the function
    function createPrologueTransition(previousClip, currentClip)
    {
        this.updateSoftKeys(currentClip);
        currentClip.container._x = 0;
        currentClip.container._y = 0;
        currentClip.SHOW();
        if (previousClip.container != undefined)
        {
            previousClip.HIDE();
        } // end if
    } // End of the function
    function toggleCellphoneButtonsVisible(isVisible)
    {
        CONTENT.cellphoneButtons._visible = isVisible;
    } // End of the function
    var phoneWidth = 256;
    var phoneHeight = 344;
    var offSCreenLeftX = -256;
    var offSCreenRightX = 256;
    var onSCreenX = 0;
    var currentDay = "";
    var currentStyle = new Array();
    var prologueTransitionTime = 0;
} // End of Class
#endinitclip
