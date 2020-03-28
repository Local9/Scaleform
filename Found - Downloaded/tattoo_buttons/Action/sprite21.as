// Action script...

// [Initial MovieClip Action of sprite 21]
#initclip 2
class com.rockstargames.gtav.levelDesign.TATTOO_BUTTONS extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var canAddButton, ONSCREEN_BUTTONS, POSITIONAL_ALPHA_VALUES, CONTENT;
    function TATTOO_BUTTONS()
    {
        super();
        canAddButton = true;
        ONSCREEN_BUTTONS = [];
        POSITIONAL_ALPHA_VALUES = [0, 100, 50, 20, 0];
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        currentButtonID = -1;
    } // End of the function
    function debug()
    {
        this.ADD_BUTTON();
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(40))
        {
            this.SET_STICK_POINTER_ANGLE(percent = percent + 8);
        }
        else if (Key.isDown(37))
        {
            this.ADD_BUTTON();
        } // end else if
    } // End of the function
    function ADD_BUTTON(whichButton)
    {
        if (whichButton == undefined)
        {
            if (tick > 15)
            {
                tick = 0;
            }
            else
            {
                ++tick;
            } // end else if
            whichButton = tick;
        } // end if
        if (canAddButton)
        {
            if (currentButtonID == -1)
            {
                currentButtonID = CONTENT.getNextHighestDepth();
            } // end if
            var _loc2;
            var _loc5 = ONSCREEN_BUTTONS.length * 100 + offset;
            var _loc4;
            if (whichButton < 8)
            {
                _loc4 = "LEFT_STICK";
            }
            else if (whichButton >= 8 && whichButton < 16)
            {
                _loc4 = "RIGHT_STICK";
            }
            else
            {
                _loc4 = "SPACER";
            } // end else if
            _loc2 = CONTENT.attachMovie(_loc4, "button" + CONTENT.getNextHighestDepth(), CONTENT.getNextHighestDepth(), {_x: _loc5, _y: offset});
            _loc2.targetArrowMC._rotation = whichButton % 8 * 45;
            _loc2.arrowMC._alpha = 0;
            _loc2.spacerMC._alpha = 0;
            _loc2._alpha = 0;
            ONSCREEN_BUTTONS.push(_loc2);
            if (ONSCREEN_BUTTONS.length > 4)
            {
                this.FADE_OUT_OLD_BUTTON();
                _loc2._alpha = 0;
            }
            else
            {
                ONSCREEN_BUTTONS[0]._alpha = POSITIONAL_ALPHA_VALUES[0];
                ONSCREEN_BUTTONS[1]._alpha = POSITIONAL_ALPHA_VALUES[1];
                ONSCREEN_BUTTONS[2]._alpha = POSITIONAL_ALPHA_VALUES[2];
                ONSCREEN_BUTTONS[3]._alpha = POSITIONAL_ALPHA_VALUES[3];
                ONSCREEN_BUTTONS[4]._alpha = POSITIONAL_ALPHA_VALUES[4];
            } // end if
        } // end else if
        return (canAddButton);
    } // End of the function
    function FADE_OUT_OLD_BUTTON()
    {
        canAddButton = false;
        ONSCREEN_BUTTONS[0]._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(ONSCREEN_BUTTONS[1], DURATION, {_alpha: POSITIONAL_ALPHA_VALUES[0], _x: ONSCREEN_BUTTONS[1]._x - offset * 2});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(ONSCREEN_BUTTONS[2], DURATION, {_alpha: POSITIONAL_ALPHA_VALUES[1], _x: ONSCREEN_BUTTONS[2]._x - offset * 2});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(ONSCREEN_BUTTONS[3], DURATION, {_alpha: POSITIONAL_ALPHA_VALUES[2], _x: ONSCREEN_BUTTONS[3]._x - offset * 2});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(ONSCREEN_BUTTONS[4], DURATION, {_alpha: POSITIONAL_ALPHA_VALUES[3], _x: ONSCREEN_BUTTONS[4]._x - offset * 2});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(ONSCREEN_BUTTONS[5], DURATION, {_alpha: POSITIONAL_ALPHA_VALUES[4], _x: ONSCREEN_BUTTONS[5]._x - offset * 2});
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, DURATION + 0.001000, {onComplete: REORDER_BUTTONS_ARRAY, onCompleteScope: this});
    } // End of the function
    function REORDER_BUTTONS_ARRAY()
    {
        canAddButton = true;
        var _loc2 = ONSCREEN_BUTTONS[0];
        _loc2.removeMovieClip();
        ONSCREEN_BUTTONS = ONSCREEN_BUTTONS.slice(1, ONSCREEN_BUTTONS.length);
        ++currentButtonID;
    } // End of the function
    function SET_STICK_POINTER_ANGLE(arAngle, color)
    {
        var _loc2 = ONSCREEN_BUTTONS[1];
        var _loc6 = 0;
        var _loc5 = 0;
        if (arAngle != undefined && arAngle >= 0)
        {
            arAngle = arAngle - 90;
            var _loc4 = 5;
            _loc6 = Math.cos(arAngle * 3.141593 / 180) * _loc4;
            _loc5 = Math.sin(arAngle * 3.141593 / 180) * _loc4;
        } // end if
        _loc2.stickMC._x = _loc6;
        _loc2.stickMC._y = _loc5;
        if (color)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.targetArrowMC, color);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.targetArrowMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        } // end else if
    } // End of the function
    function HIDE_STICK_POINTER()
    {
        var _loc2 = ONSCREEN_BUTTONS[1];
        _loc2.stickMC._x = _loc2.stickMC._y = 0;
    } // End of the function
    var offset = 50;
    var DURATION = 0.300000;
    var tick = 0;
    var currentButtonID = 0;
    var keyrepeatDelay = 4;
    var percent = 0;
    var hasColour = false;
} // End of Class
#endinitclip
