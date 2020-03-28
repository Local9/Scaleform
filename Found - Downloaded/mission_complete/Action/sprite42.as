// Action script...

// [Initial MovieClip Action of sprite 42]
#initclip 9
class com.rockstargames.gtav.levelDesign.MISSION_COMPLETE extends com.rockstargames.ui.components.GUIController
{
    var CONTENT, model, DISPLAY_VIEW, FOCUS_VIEW;
    function MISSION_COMPLETE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        headingHeight = CONTENT.headingMC._height;
        yOffset = CONTENT.headingMC._y;
        model = new com.rockstargames.gtav.levelDesign.MissionCompleteModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 1, columnSpacing: 0, selectstyle: 2, container: CONTENT.viewContainerMC, visibleItems: 5, linkage: ["missionMenuItem"]});
        CONTENT.popupMC.groupMC._alpha = 0;
        displayableItems = 0;
        CONTENT.background._height = CONTENT.popupMC._y = yOffset + headingHeight - 1;
        CONTENT.popupMC._visible = false;
        this.SET_MISSION_TITLE_COLOUR(220, 220, 220);
        CONTENT.logoMC._visible = false;
    } // End of the function
    function SET_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        model.addDataToView(0, _slotIndex, _loc3);
    } // End of the function
    function UPDATE_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        model.updateSlot(0, _slotIndex, _loc3);
    } // End of the function
    function DRAW_MENU_LIST()
    {
        var _loc2 = model.getCurrentView(0).__get__maxitems();
        model.getCurrentView(0).visibleItems = displayableItems = _loc2;
        this.DISPLAY_VIEW(0);
        this.resizeBackground();
        this.FOCUS_VIEW(0);
        this.animateIn();
    } // End of the function
    function HIGHLIGHT_ITEM(i, highlight)
    {
        highlight = highlight == undefined ? (true) : (highlight);
        var _loc3 = model.getCurrentView(0).itemList[i];
        _loc3.__set__highlighted(highlight);
    } // End of the function
    function SET_MISSION_TITLE_COLOUR(r, g, b)
    {
        r != undefined;
        g != undefined;
        if (b != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.logoMC.passedTF, r, g, b);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.logoMC.passedTF, 220, 220, 220);
        } // end else if
    } // End of the function
    function SET_MISSION_SUBTITLE_COLOUR(r, g, b)
    {
        r != undefined;
        g != undefined;
        if (b != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.headingMC.colMC, r, g, b);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.headingMC.colMC, 220, 220, 220);
        } // end else if
    } // End of the function
    function SET_MISSION_BG_COLOUR(r, g, b)
    {
        r != undefined;
        g != undefined;
        if (b != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.headingMC.bgMC, r, g, b);
            CONTENT.headingMC.bgMC._alpha = 100;
        } // end if
    } // End of the function
    function clampText(textF, labelS, maxVal)
    {
        textF.text = labelS;
        textF.wordWrap = false;
        if (textF._width > maxVal)
        {
            textF._xscale = maxVal / textF._width * 100;
        } // end if
    } // End of the function
    function SET_MISSION_TITLE(title, desc)
    {
        CONTENT.logoMC.passedTF.text = title;
        var _loc2 = CONTENT.headingMC.colMC.headingTF;
        _loc2.text = desc.toUpperCase();
        _loc2.wordWrap = true;
        _loc2.multiline = true;
        _loc2.autoSize = "left";
        _loc2._width = 268;
        var _loc3 = 4;
        _loc2._y = _loc3;
        CONTENT.headingMC.bgMC._height = headingHeight;
        model.getCurrentView(0).viewContainerY = model.getCurrentView(0).viewContainer._y = headingHeight + twoPxGap;
    } // End of the function
    function SET_TOTAL(medalID, totalValue, totalLabel)
    {
        var _loc2 = CONTENT.popupMC.groupMC;
        this.SET_MEDAL(medalID);
        _loc2.totalTF.html = true;
        _loc2.totalTF.htmlText = "";
        _loc2.totalTF.autoSize = "left";
        _loc2.totalTF.multiline = false;
        _loc2.totalTF.htmlText = totalLabel;
        if (_loc2.totalTF._width > 252)
        {
            _loc2.totalTF._width = 252;
            _loc2.totalTF.multiline = true;
            _loc2.totalTF.wordWrap = true;
        } // end if
        if (totalValue == -99)
        {
            _loc2.valueTF.text = "";
        }
        else
        {
            _loc2.valueTF.text = totalValue + "%";
        } // end else if
        _loc2.valueTF.autoSize = "right";
    } // End of the function
    function SET_MEDAL(medalID)
    {
        if (medalID == -99)
        {
            CONTENT.background.gotoAndStop(1);
            CONTENT.popupMC._visible = true;
            CONTENT.popupMC.groupMC.medalMC._visible = false;
        }
        else if (medalID == 0)
        {
            CONTENT.background.gotoAndStop(2);
            CONTENT.popupMC._visible = false;
            CONTENT.popupMC.groupMC.medalMC._visible = true;
        }
        else
        {
            CONTENT.background.gotoAndStop(1);
            CONTENT.popupMC._visible = true;
            CONTENT.popupMC.groupMC.medalMC.gotoAndStop(medalID);
            CONTENT.popupMC.groupMC.medalMC._visible = true;
        } // end else if
    } // End of the function
    function animateIn()
    {
        var _loc2 = model.getCurrentView(0).itemList;
        for (var _loc6 in _loc2)
        {
            _loc2[_loc6]._alpha = 0;
        } // end of for...in
        var _loc7 = _loc2.length;
        var _loc4 = 0.150000;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.background, _loc4 * _loc7, {_height: totalHeight, ease: com.rockstargames.ui.tweenStar.Ease.LINEAR, onComplete: animateInComplete, onCompleteScope: this});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.popupMC, _loc4 * _loc7, {_y: CONTENT.background._y + totalHeight, ease: com.rockstargames.ui.tweenStar.Ease.LINEAR});
        for (var _loc6 in _loc2)
        {
            if (typeof(_loc2[_loc6]) == "movieclip")
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2[_loc6], 0.200000, {_alpha: 100, delay: _loc6 * _loc4, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_IN});
            } // end if
        } // end of for...in
    } // End of the function
    function animateInComplete()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.popupMC.groupMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT.popupMC.groupMC, 0.200000, {delay: 0.300000, _alpha: 100});
    } // End of the function
    function resizeBackground()
    {
        var _loc2 = model.getCurrentView(0).itemList;
        totalHeight = _loc2.length * 25;
        CONTENT.background._height = headingHeight;
        CONTENT.popupMC._y = CONTENT.background._y;
        CONTENT.popupMC.groupMC._alpha = 0;
    } // End of the function
    var yOffset = 23;
    var headingHeight = 20;
    var totalHeight = 200;
    var itemsPadding = 10;
    var displayableItems = 0;
    var twoPxGap = 2;
    var showDebug = true;
} // End of Class
#endinitclip
