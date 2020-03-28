// Action script...

// [Initial MovieClip Action of sprite 17]
#initclip 5
class com.rockstargames.gtav.minigames.golf.floatingui.GOLF_FLOATING_UI extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, floatingUIMC, slotContainerMC, bgMC, slotsData, slots, BOUNDING_BOX, _alpha, _visible;
    function GOLF_FLOATING_UI()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        floatingUIMC = CONTENT.floatingUIMC;
        slotContainerMC = floatingUIMC.createEmptyMovieClip("slotContainerMC", floatingUIMC.getNextHighestDepth());
        bgMC = floatingUIMC.bgMC;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        bgMC._height = 0;
        slotsData = [];
        slots = [];
        var _loc3;
        for (var _loc4 = 0; _loc4 < slots.length; ++_loc4)
        {
            _loc3 = slots[_loc4];
            _loc3._visible = false;
            _loc3._alpha = 0;
            _loc3.valueTF.autoSize = "right";
            _loc3.arrowMC._visible = false;
        } // end of for
    } // End of the function
    function SET_SWING_DISTANCE(label, value, arrow)
    {
        arguments.unshift(1);
        UPDATE_SLOT.apply(this, arguments);
    } // End of the function
    function SET_PIN_DISTANCE(label, value, arrow)
    {
        arguments.unshift(2);
        UPDATE_SLOT.apply(this, arguments);
    } // End of the function
    function SET_HEIGHT(label, value, arrow)
    {
        arguments.unshift(3);
        UPDATE_SLOT.apply(this, arguments);
    } // End of the function
    function SET_STRENGTH(label, value, arrow)
    {
        arguments.unshift(0);
        UPDATE_SLOT.apply(this, arguments);
    } // End of the function
    function UPDATE_SLOT(id, label, value, arrow)
    {
        if (label != "" && label != undefined)
        {
            slotsData[id] = {label: label != undefined ? (label) : (""), value: value != undefined ? (value) : (""), arrow: arrow, updated: true};
        }
        else
        {
            slotsData[id] = undefined;
            while (slotsData.length > 0 && slotsData[slotsData.length - 1] == undefined)
            {
                slotsData.pop();
            } // end while
        } // end else if
        var _loc8 = slots.length >= slotsData.length ? (slots.length) : (slotsData.length);
        var _loc2;
        var _loc3;
        for (var _loc3 = 0; _loc3 < _loc8; ++_loc3)
        {
            _loc2 = slots[_loc3];
            if (slotsData[_loc3] != undefined)
            {
                if (_loc2 == undefined)
                {
                    _loc2 = slotContainerMC.attachMovie("slot", "s" + _loc3, slotContainerMC.getNextHighestDepth(), {_x: 5, _y: 2 + slotHeight * _loc3, _alpha: 0});
                    slots[_loc3] = slotContainerMC.attachMovie("slot", "s" + _loc3, slotContainerMC.getNextHighestDepth(), {_x: 5, _y: 2 + slotHeight * _loc3, _alpha: 0});
                    _loc2.valueTF.autoSize = "right";
                    com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2, 0.200000, {delay: 0.100000 * _loc3, _alpha: 100});
                } // end if
                if (slotsData[_loc3].updated)
                {
                    _loc2.labelTF.text = slotsData[_loc3].label;
                    _loc2.valueTF._width = 10;
                    _loc2.valueTF.text = slotsData[_loc3].value;
                    _loc2.valueTF._x = 140 - _loc2.valueTF._width;
                    if (arrow == undefined || arrow == ARROW_OFF)
                    {
                        _loc2.arrowMC._visible = false;
                    }
                    else
                    {
                        if (arrow == ARROW_UP)
                        {
                            _loc2.arrowMC._rotation = 0;
                        } // end if
                        if (arrow == ARROW_DOWN)
                        {
                            _loc2.arrowMC._rotation = 180;
                        } // end if
                        _loc2.arrowMC._x = _loc2.valueTF._x - 8;
                        _loc2.arrowMC._visible = true;
                    } // end else if
                    slotsData[_loc3].updated = false;
                } // end if
                continue;
            } // end if
            if (_loc2 != undefined)
            {
                if (_loc3 == slotsData.length - 1)
                {
                    while (slotsData[slotsData.length - 1] == undefined)
                    {
                        slotsData.pop();
                    } // end while
                }
                else
                {
                    slots[_loc3] = undefined;
                } // end else if
                _loc2.removeMovieClip();
            } // end if
        } // end of for
        if (slotsVisible != slotsData.length)
        {
            slotsVisible = slotsData.length;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(bgMC, 0.200000, {_height: slotsVisible > 0 ? (slotsVisible * slotHeight + 10) : (0), ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
            com.rockstargames.ui.tweenStar.TweenStarLite.to(floatingUIMC, 0.200000, {_y: (BOUNDING_BOX._height - (slotsVisible > 0 ? (slotsVisible * slotHeight + 10) : (0))) / 2, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        } // end if
    } // End of the function
    function TRANSITION_IN(duration)
    {
        if (duration == undefined || duration == 0)
        {
            _alpha = 100;
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(floatingUIMC, duration / 1000, {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        } // end else if
        _visible = true;
    } // End of the function
    function TRANSITION_OUT(duration)
    {
        if (duration == undefined || duration == 0)
        {
            _alpha = 0;
            _visible = false;
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(floatingUIMC, duration / 1000, {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN, onComplete: _handleTransitionOutComplete, onCompleteScope: this});
        } // end else if
    } // End of the function
    function _handleTransitionOutComplete()
    {
        _visible = false;
    } // End of the function
    var ARROW_OFF = 0;
    var ARROW_UP = 1;
    var ARROW_DOWN = 2;
    var slotsVisible = 0;
    var slotHeight = 17;
} // End of Class
#endinitclip
