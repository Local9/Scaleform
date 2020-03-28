// Action script...

// [Initial MovieClip Action of sprite 143]
#initclip 2
class com.rockstargames.gtav.levelDesign.YOGA_BUTTONS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var BOUNDING_BOX, CONTENT, myColour, container;
    function YOGA_BUTTONS()
    {
        super();
        buttonList = new Array();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        buttonList = [];
        analogList = [];
        var _loc4 = buttonSpacing / 16;
        var _loc9 = buttonWidth / 2;
        var _loc3 = BOUNDING_BOX._height / 2 - 32 + 2;
        var _loc6 = CONTENT.attachMovie("stickL", "stick0MC", CONTENT.getNextHighestDepth(), {_x: BOUNDING_BOX._width / 2 - buttonWidth - _loc4, _y: _loc3});
        var _loc5 = CONTENT.attachMovie("stickR", "stick1MC", CONTENT.getNextHighestDepth(), {_x: BOUNDING_BOX._width / 2 + _loc4, _y: _loc3});
        analogList = [_loc6, _loc5];
        myColour = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YOGA, myColour);
    } // End of the function
    function ADD_BUTTON_TO_LIST(buttonID)
    {
        buttonList.push(buttonID);
    } // End of the function
    function DRAW_BUTTONS()
    {
        if (containerFlag)
        {
            this.REMOVE_BUTTONS();
        } // end if
        container = CONTENT.createEmptyMovieClip("container", CONTENT.getNextHighestDepth());
        containerFlag = true;
        for (var _loc3 = 0; _loc3 < buttonList.length; ++_loc3)
        {
            var _loc4 = "BUTTON_" + buttonList[_loc3];
            var _loc2 = container.attachMovie(_loc4, _loc4, container.getNextHighestDepth(), {_x: buttonSpacing * _loc3});
            _loc2.targetMC.target1._alpha = 0;
            _loc2.targetMC.target2._alpha = 0;
            _loc2.stateMC._xscale = _loc2.stateMC._yscale = scaleMin;
            com.rockstargames.ui.utils.Colour.Colourise(_loc2.stateMC, colGrey[0], colGrey[1], colGrey[2]);
            com.rockstargames.ui.utils.Colour.Colourise(_loc2.instructionMC, colYellow[0], colYellow[1], colYellow[2]);
            buttonList[_loc3] = _loc2;
        } // end of for
        var _loc6 = (buttonList.length - 1) * buttonSpacing + buttonWidth;
        container._x = BOUNDING_BOX._width / 2 - _loc6 / 2;
        container._y = BOUNDING_BOX._height / 2 - 32 + 2;
    } // End of the function
    function REMOVE_BUTTONS(buttonID)
    {
        container.removeMovieClip();
        container = null;
        containerFlag = false;
        buttonList = new Array();
    } // End of the function
    function SET_BUTTON_TARGET(buttonID, targetScale, whichTarget, r, g, b, a)
    {
        var _loc3 = container["BUTTON_" + buttonID];
        var _loc2 = _loc3.targetMC["target" + whichTarget];
        com.rockstargames.ui.utils.Colour.Colourise(_loc2, r, g, b, a);
        _loc2._xscale = targetScale;
        _loc2._yscale = targetScale;
    } // End of the function
    function SET_HOLD_TIMER(timePercent)
    {
        var _loc3 = Math.max(0, Math.min(timePercent, 100));
        if (buttonList.length > 0)
        {
            var _loc4 = 0;
            var _loc2;
            for (var _loc4 in buttonList)
            {
                _loc2 = buttonList[_loc4];
                _loc2.playerInputMC.percentMC._visible = _shouldUseFill;
                _loc2.playerInputMC.percentMC.gotoAndStop(_loc3 + 1);
                _loc2.playerInputMC.percentMCOutline.gotoAndStop(_loc3 + 1);
            } // end of for...in
        } // end if
    } // End of the function
    function SET_PLAYER_INPUT_COLOUR(buttonID, r, g, b, a)
    {
        var _loc2 = container["BUTTON_" + buttonID];
        com.rockstargames.ui.utils.Colour.Colourise(_loc2.playerInputMC, r, g, b, a);
    } // End of the function
    function SET_OUT_RING_TIMER_COLOUR(buttonID, r, g, b, a)
    {
        var _loc2 = container["BUTTON_" + buttonID];
        com.rockstargames.ui.utils.Colour.Colourise(_loc2.timeBar, r, g, b, a);
    } // End of the function
    function SET_OUT_RING_TIMER(buttonID, percent)
    {
        var _loc2 = container["BUTTON_" + buttonID];
        _loc2.timeBar.gotoAndStop(percent);
    } // End of the function
    function SET_INFO_TIMER(timePercent)
    {
    } // End of the function
    function SET_STICK_POINTER_ANGLE(buttonID, arAngle)
    {
        var _loc2 = analogList[buttonID];
        _loc2.arrowMC._rotation = arAngle;
        if (_loc2.arrowMC._alpha == 0)
        {
            _loc2.arrowMC._alpha = 100;
        } // end if
    } // End of the function
    function SET_STICK_POINTER_RGB(buttonID, r, g, b)
    {
        var _loc2 = analogList[buttonID];
        com.rockstargames.ui.utils.Colour.Colourise(_loc2.arrowMC, r, g, b);
    } // End of the function
    function SET_STICK_ANGLE(buttonID, arAngle)
    {
        arAngle = arAngle - 90;
        var _loc3 = analogList[buttonID];
        var _loc2 = 8;
        var _loc6 = Math.cos(arAngle * 3.141593 / 180) * _loc2;
        var _loc5 = Math.sin(arAngle * 3.141593 / 180) * _loc2;
        _loc3.stickMC.innerMC._x = _loc6;
        _loc3.stickMC.innerMC._y = _loc5;
    } // End of the function
    function BUTTON_PRESSED(buttonID, buttonPercent)
    {
        var _loc2 = container["BUTTON_" + buttonID];
        _loc2.playerInputMC.percentMC._visible = _shouldUseFill;
        _loc2.playerInputMC.percentMC.gotoAndStop(1);
        _loc2.playerInputMC.percentMCOutline.gotoAndStop(1);
        _loc2.instructionMC.percentMC._visible = _shouldUseFill;
        _loc2.instructionMC.percentMC.gotoAndStop(1);
        _loc2.instructionMC.percentMCOutline.gotoAndStop(1);
        _loc2.stateMC._xscale = _loc2.stateMC._yscale = scaleMin;
        com.rockstargames.ui.utils.Colour.Colourise(_loc2.stateMC, colGrey[0], colGrey[1], colGrey[2]);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2.stateMC, fadeSpeed, {_xscale: scaleMid, _yscale: scaleMid, _alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.CUBIC_OUT});
        _loc2.buttonMC.gotoAndStop(2);
    } // End of the function
    function BUTTON_DEPRESSED(buttonID)
    {
        var _loc2 = container["BUTTON_" + buttonID];
        _loc2.stateMC._xscale = _loc2.stateMC._yscale = scaleMin;
        _loc2.stateMC._alpha = 0;
        _loc2.buttonMC.gotoAndStop(1);
    } // End of the function
    function BUTTON_STATE(buttonID, buttonState)
    {
        var _loc2 = container["BUTTON_" + buttonID];
        switch (buttonState)
        {
            case 0:
            {
                this.ButtonReset(_loc2);
                com.rockstargames.ui.utils.Colour.Colourise(_loc2.playerInputMC, 255, 255, 255);
                com.rockstargames.ui.utils.Colour.Colourise(_loc2.stateMC, colGrey[0], colGrey[1], colGrey[2]);
                break;
            } 
            case 1:
            {
                this.ButtonReset(_loc2);
                com.rockstargames.ui.utils.Colour.Colourise(_loc2.stateMC, colRed[0], colRed[1], colRed[2]);
                com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2.stateMC, fadeSpeed, {delay: 1, _xscale: scaleMin, _yscale: scaleMin, ease: com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
                break;
            } 
            case 2:
            {
                this.ButtonReset(_loc2);
                com.rockstargames.ui.utils.Colour.Colourise(_loc2.stateMC, colBlue[0], colBlue[1], colBlue[2]);
                com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2.stateMC, fadeSpeed, {delay: 1, _xscale: scaleMax, _yscale: scaleMax, _alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.CUBIC_IN});
                break;
            } 
        } // End of switch
    } // End of the function
    function ButtonReset(button)
    {
        button.stateMC._xscale = button.stateMC._yscale = scaleMid;
        button.playerInputMC._xscale = button.playerInputMC._yscale = scaleMid;
        button.stateMC._alpha = 100;
        button.playerInputMC._alpha = 100;
        button.instructionMC._alpha = 100;
        button.playerInputMC.percentMC._visible = _shouldUseFill;
        button.playerInputMC.percentMC.gotoAndStop(1);
        button.instructionMC.percentMC._visible = _shouldUseFill;
        button.instructionMC.percentMC.gotoAndStop(1);
        button.instructionMC.percentMCOutline.gotoAndStop(1);
    } // End of the function
    function TOGGLE_INPUT_FILL(shouldUseFill)
    {
        _shouldUseFill = shouldUseFill;
    } // End of the function
    function SET_STICK_POINTER_HIGHLIGHT_ANGLE(buttonID, arAngle)
    {
        this.SET_STICK_ANGLE(buttonID, arAngle);
    } // End of the function
    function HIDE_STICK_POINTER(buttonID)
    {
        var _loc2 = analogList[buttonID];
        _loc2.stickMC.innerMC._x = 0;
        _loc2.stickMC.innerMC._y = 0;
    } // End of the function
    var buttonWidth = 64;
    var buttonSpacing = 360;
    var maxButtons = 8;
    var buttonList = new Array();
    var analogList = new Array();
    var containerFlag = false;
    var fadeSpeed = 0.400000;
    var scaleMid = 100;
    var scaleMin = 10;
    var scaleMax = 120;
    var colGrey = [55, 53, 53];
    var colBlue = [88, 169, 199];
    var colRed = [201, 86, 86];
    var colYellow = [247, 228, 137];
    var keyrepeatDelay = 4;
    var percent = 0;
    var percent2 = 0;
    var _shouldUseFill = false;
} // End of Class
#endinitclip
