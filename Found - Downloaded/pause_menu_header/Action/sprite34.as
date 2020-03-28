// Action script...

// [Initial MovieClip Action of sprite 34]
#initclip 2
class com.rockstargames.gtav.pauseMenu.PAUSE_MENU_HEADER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, menubar, detailsMC, charMC, crewMC, crewImgLoaderMC, charImgLoaderMC;
    function PAUSE_MENU_HEADER()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        menubar = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_BAR)(CONTENT.attachMovie("menu", "menuMC", CONTENT.getNextHighestDepth(), {_y: 60}));
        menubar.INITIALISE();
        detailsMC = CONTENT.headerMC.alldetailsMC.detailsMC;
        charMC = CONTENT.headerMC.alldetailsMC.charMC;
        crewMC = CONTENT.headerMC.alldetailsMC.crewMC;
        var _loc5 = 48;
        var _loc7 = {_visible: false, _xscale: _loc5, _yscale: _loc5, _y: 0, _x: -32};
        charMC._visible = false;
        crewMC._visible = false;
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
        if (detailsMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(detailsMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        if (CONTENT.headerMC.titleMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.headerMC.titleMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc4);
        com.rockstargames.ui.utils.Colour.Colourise(crewMC.bgMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        com.rockstargames.ui.utils.Colour.Colourise(charMC.bgMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        CONTENT.headerMC.bgMC._visible = false;
    } // End of the function
    function SHOW_DEBUG(b)
    {
        dbgOn = b;
    } // End of the function
    function dbg(dbgStr)
    {
        if (dbgOn)
        {
            var _loc2 = "  " + dbgStr;
            com.rockstargames.ui.utils.Debug.log(_loc2);
        } // end if
    } // End of the function
    function SET_HEADER_TITLE(title, verified, description)
    {
        var _loc2 = CONTENT.headerMC.titleMC;
        var _loc6 = false;
        if (description == "" || description == undefined)
        {
            _loc6 = true;
        } // end if
        if (_loc6)
        {
            if (title != undefined)
            {
                _loc2.headingTF.autoSize = "left";
                _loc2.headingTF.multiline = false;
                _loc2.headingTF.text = title;
            } // end if
            _loc2._y = 16;
            _loc2.headingSmallTF.text = "";
            _loc2.descSmallTF.text = "";
        }
        else
        {
            if (title != undefined)
            {
                _loc2.headingSmallTF.autoSize = "left";
                _loc2.headingSmallTF.multiline = false;
                _loc2.headingSmallTF.text = title;
            } // end if
            if (description != undefined)
            {
                _loc2.descSmallTF.multiline = true;
                _loc2.descSmallTF.wordWrap = true;
                _loc2.descSmallTF.autoSize = "left";
                var _loc4 = description;
                var _loc8 = 500;
                if (_loc4.length > _loc8)
                {
                    _loc4 = description.substr(0, _loc8);
                } // end if
                _loc2.descSmallTF.text = _loc4;
                this.setDescWidth();
            } // end if
            var _loc9 = 3;
            var _loc7 = 65;
            if (detailsCoronaLayout)
            {
                _loc9 = 8;
                _loc7 = 88;
            } // end if
            _loc2._y = _loc7 / 2 - _loc2._height / 2 - _loc9;
            _loc2.headingTF.text = "";
        } // end else if
        if (title == "" || title == undefined)
        {
            CONTENT.headerMC.bgMC._visible = false;
        }
        else
        {
            CONTENT.headerMC.bgMC._visible = true;
        } // end else if
    } // End of the function
    function SHIFT_CORONA_DESC(shiftDesc, hideTabs)
    {
        detailsCoronaLayout = shiftDesc;
        var _loc4 = 60;
        if (shiftDesc)
        {
            _loc4 = 72;
        } // end if
        menubar._y = _loc4;
        for (var _loc2 = 0; _loc2 < menubar.menuItemList.length; ++_loc2)
        {
            menubar.menuItemList[_loc2].tabMC._visible = hideTabs;
        } // end of for
    } // End of the function
    function setDescWidth()
    {
        var _loc2 = 863;
        if (detailsShown)
        {
            var _loc3 = 8;
            _loc2 = detailsMC._x - detailsMC._width - _loc3;
        } // end if
        CONTENT.headerMC.titleMC.descSmallTF._width = _loc2;
    } // End of the function
    function SET_HEADING_DETAILS(str1, str2, str3, isSingleplayer, crewname)
    {
        var _loc2 = detailsMC;
        _loc2.details1TF.autoSize = _loc2.details1condTF.autoSize = "left";
        _loc2.details1TF.wordWrap = _loc2.details1condTF.wordWrap = false;
        _loc2.details1TF.multiline = _loc2.details1condTF.multiline = false;
        if (isSingleplayer)
        {
            _loc2.details1condTF.text = "";
            _loc2.details1TF.text = str1.toUpperCase();
        }
        else
        {
            _loc2.details1TF.text = "";
            _loc2.details1condTF.text = str1;
            str2 = crewname;
        } // end else if
        _loc2.details1TF._x = -_loc2.details1TF._width;
        _loc2.details1condTF._x = -_loc2.details1condTF._width;
        if (str2 != undefined)
        {
            var _loc7 = str2.split(":").length > 1;
            if (!_loc7)
            {
                _loc2.details2TF.text = str2;
                _loc2.details2TF.autoSize = "left";
                _loc2.details2TF.wordWrap = false;
                _loc2.details2TF.multiline = false;
                _loc2.details2TF._x = -_loc2.details2TF._width;
                _loc2.timeTF.text = "";
            }
            else
            {
                var _loc3 = str2.split(" ");
                var _loc5 = _loc3[_loc3.length - 1];
                _loc3.pop();
                var _loc6 = _loc3.join(" ");
                _loc2.timeTF.text = _loc5;
                _loc2.timeTF.autoSize = "left";
                _loc2.timeTF.wordWrap = false;
                _loc2.timeTF.multiline = false;
                _loc2.timeTF._x = -_loc2.timeTF._width + 1;
                _loc2.details2TF.text = _loc6;
                _loc2.details2TF.autoSize = "left";
                _loc2.details2TF.wordWrap = false;
                _loc2.details2TF.multiline = false;
                _loc2.details2TF._x = _loc2.timeTF._x - _loc2.details2TF._width - 1;
            } // end if
        } // end else if
        if (str3 != undefined)
        {
            _loc2.details3TF.text = str3;
            _loc2.details3TF.autoSize = "left";
            _loc2.details3TF.wordWrap = false;
            _loc2.details3TF.multiline = false;
            _loc2.details3TF._x = -_loc2.details3TF._width;
        } // end if
        if (detailsShown)
        {
            this.setDescWidth();
        } // end if
    } // End of the function
    function SHOW_HEADING_DETAILS(bool)
    {
        CONTENT.headerMC.alldetailsMC._visible = detailsShown = bool;
        if (!detailsShown)
        {
            this.setDescWidth();
        } // end if
    } // End of the function
    function SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank)
    {
        this.dbg("SET_CREW_TAG | arguments: " + arguments);
    } // End of the function
    function SET_CREW_IMG(txd, crewTexturePath, show)
    {
        showCrew = show;
        this.dbg("SET_CREW_IMG | txd: " + txd + " crewTexturePath: " + crewTexturePath + " show: " + show);
        if (showCrew)
        {
            if (txd != "")
            {
                if (crewImgLoaderMC == undefined)
                {
                    crewImgLoaderMC = (com.rockstargames.ui.media.ImageLoaderMC)(crewMC.attachMovie("txdLoader", "crewsImageMC", crewMC.getNextHighestDepth(), {_x: -imgSize}));
                } // end if
                if (crewImgLoaderMC.isLoaded == true)
                {
                    crewImgLoaderMC.removeTxdRef();
                } // end if
                crewImgLoaderMC.init("PAUSE_MENU_HEADER", txd, crewTexturePath, imgSize, imgSize);
                var _loc3 = 3;
                var _loc2 = String(crewImgLoaderMC).split(".");
                var _loc4 = _loc2.slice(_loc2.length - _loc3).join(".");
                crewImgLoaderMC.addTxdRef(_loc4, loadedCrewImg, this);
                crewImgLoaderMC._alpha = 0;
            } // end if
            crewMC._visible = true;
        }
        else
        {
            crewMC._visible = false;
        } // end else if
        this.adjustHeaderPositions();
    } // End of the function
    function loadedCrewImg()
    {
        var _loc2 = 0.200000;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(crewImgLoaderMC, _loc2, {_alpha: 100});
    } // End of the function
    function SET_CHAR_IMG(txd, charTexturePath, show)
    {
        showChar = show;
        this.dbg("SET_CHAR_IMG | txd: " + txd + " charTexturePath: " + charTexturePath + " show: " + show);
        if (showChar)
        {
            if (txd != "")
            {
                if (charImgLoaderMC == undefined)
                {
                    charImgLoaderMC = (com.rockstargames.ui.media.ImageLoaderMC)(charMC.attachMovie("txdLoader", "charImageMC", charMC.getNextHighestDepth(), {_x: -imgSize}));
                } // end if
                if (charImgLoaderMC.isLoaded == true)
                {
                    charImgLoaderMC.removeTxdRef();
                } // end if
                charImgLoaderMC.init("PAUSE_MENU_HEADER", txd, charTexturePath, imgSize, imgSize);
                var _loc3 = 3;
                var _loc2 = String(charImgLoaderMC).split(".");
                var _loc4 = _loc2.slice(_loc2.length - _loc3).join(".");
                charImgLoaderMC.addTxdRef(_loc4, loadedCharImg, this);
                charImgLoaderMC._alpha = 0;
            } // end if
            charMC._visible = true;
        }
        else
        {
            charMC._visible = false;
        } // end else if
        this.adjustHeaderPositions();
    } // End of the function
    function loadedCharImg()
    {
        var _loc2 = 0.200000;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(charImgLoaderMC, _loc2, {_alpha: 100});
    } // End of the function
    function adjustHeaderPositions()
    {
        if (showChar == false && showCrew == false)
        {
            detailsMC._x = detailsXPositions[0];
        }
        else if (showChar == false && showCrew == true)
        {
            crewMC._x = detailsXPositions[0];
            detailsMC._x = detailsXPositions[1];
        }
        else if (showChar == true && showCrew == false)
        {
            charMC._x = detailsXPositions[0];
            detailsMC._x = detailsXPositions[1];
        }
        else if (showChar == true && showCrew == true)
        {
            charMC._x = detailsXPositions[0];
            crewMC._x = detailsXPositions[1];
            detailsMC._x = detailsXPositions[2];
        } // end else if
    } // End of the function
    function BUILD_MENU()
    {
        menubar.BUILD_MENU(arguments);
    } // End of the function
    function REMOVE_MENU(clearForRestart)
    {
        this.dbg("REMOVE_MENU ||||||||||||||||||||||||||||||||||||||||||||||||||||| " + clearForRestart);
        this.CLEAR_TXDS();
        if (clearForRestart)
        {
            menubar.REMOVE_MENU();
            this.SET_ALL_HIGHLIGHTS(false);
            menubar.SET_HEADER_ARROWS_VISIBLE(false, false);
        } // end if
    } // End of the function
    function CLEAR_TXDS()
    {
        this.dbg("try remove char TXD ----- " + charImgLoaderMC.isLoaded);
        if (charImgLoaderMC.isLoaded)
        {
            this.dbg("char removed ");
            charImgLoaderMC.removeTxdRef();
        } // end if
        this.dbg("try remove crew TXD ----- " + crewImgLoaderMC.isLoaded);
        if (crewImgLoaderMC.isLoaded)
        {
            this.dbg("crew removed ");
            crewImgLoaderMC.removeTxdRef();
        } // end if
    } // End of the function
    function SET_MENU_HEADER_TEXT_BY_INDEX(menuIndex, label)
    {
        menubar.SET_MENU_HEADER_TEXT_BY_INDEX(menuIndex, label);
    } // End of the function
    function SET_MENU_ITEM_COLOUR(menuindex, colourEnum)
    {
        menubar.SET_MENU_COLOUR(menuindex, colourEnum);
    } // End of the function
    function LOCK_MENU_ITEM(menuindex, isLocked)
    {
        menubar.LOCK_MENU_ITEM(menuindex, isLocked);
    } // End of the function
    function SCROLL_MENU_IN_DIR(dir)
    {
        menubar.SCROLL_MENU_IN_DIR([dir]);
    } // End of the function
    function HIGHLIGHT_MENU(index)
    {
        menubar.HIGHLIGHT_MENU(index);
    } // End of the function
    function SET_ALL_HIGHLIGHTS(allHighlights, loseGap)
    {
        menubar.SET_ALL_HIGHLIGHTS(allHighlights, loseGap);
    } // End of the function
    function SHOW_MENU(bool)
    {
        menubar._visible = bool;
    } // End of the function
    function ADD_TXD_REF_RESPONSE(txd, strRef, success)
    {
        if (success == true)
        {
            var pMC = this.CONTENT.headerMC;
            var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(pMC + "." + strRef));
            if (pMC != undefined)
            {
                il.displayTxdResponse(txd);
            } // end if
        } // end if
    } // End of the function
    var detailsXPositions = [868, 826, 784];
    var showChar = false;
    var showCrew = false;
    var imgSize = 37;
    var dbgOn = false;
    var detailsShown = true;
    var detailsCoronaLayout = false;
} // End of Class
#endinitclip
