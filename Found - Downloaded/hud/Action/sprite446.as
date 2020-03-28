// Action script...

// [Initial MovieClip Action of sprite 446]
#initclip 34
class com.rockstargames.gtav.hud.hudComponents.HUD_HELP_TEXT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var TICKET_NUMBER, defaultWidth, leftPadding, rightPadding, sidePadding, topPadding, bottomPadding, isAnimating, isClearing, OVERRIDE_DURATION, ON_SCREEN_DURATION_ONE_FRAME, ON_SCREEN_DURATION_PER_WORD, trimForOneLineText, currentStyle, defaultHelpTextStyle, helpTextType, CONTENT, txtFormat, TIMELINE, BOUNDING_BOX, blipLayer, background, helpTextBackgroundOffscreen, arrowMCOffscreen, offScreenIndicator, arrow, arrowHeight, arrowWidth, helpTextfield, ON_SCREEN_DURATION, ON_SCREEN_DURATION_TOTAL, _fadeType, _HUD, arrowPosition, logo, _enumID;
    function HUD_HELP_TEXT()
    {
        super();
        TICKET_NUMBER = -98;
        defaultWidth = 288;
        leftPadding = 7;
        rightPadding = 5;
        sidePadding = leftPadding + rightPadding;
        topPadding = 4;
        bottomPadding = 12;
        isAnimating = false;
        isClearing = false;
        OVERRIDE_DURATION = 0;
        ON_SCREEN_DURATION_ONE_FRAME = 66;
        ON_SCREEN_DURATION_PER_WORD = 333;
        trimForOneLineText = 3;
        currentStyle = -1;
        defaultHelpTextStyle = new Array(0, 0, 0, 0, 0, 77);
        helpTextType = 0;
        txtFormat = CONTENT.helpText.getTextFormat();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
        this.clearBlipLayer();
    } // End of the function
    function clearBlipLayer()
    {
        if (blipLayer != undefined)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = CONTENT.createEmptyMovieClip("blipLayer", 1000);
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BOUNDING_BOX);
        background = CONTENT.helpTextBackground;
        helpTextBackgroundOffscreen = CONTENT.helpTextBackgroundOffscreen;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(background, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(helpTextBackgroundOffscreen, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        arrowMCOffscreen = CONTENT.arrowMCOffscreen;
        offScreenIndicator = CONTENT.offScreenIndicator;
        arrowMCOffscreen._visible = false;
        helpTextBackgroundOffscreen._visible = false;
        offScreenIndicator._visible = false;
        arrow = CONTENT.arrowMC;
        arrow._visible = false;
        arrowHeight = arrow._height;
        arrowWidth = arrow._width;
        helpTextfield = CONTENT.helpText;
        helpTextfield.wordWrap = true;
        CONTENT._alpha = 0;
        helpTextfield.autoSize = true;
        helpTextfield._x = background._x + leftPadding;
        helpTextfield._y = background._y + topPadding;
    } // End of the function
    function SET_HELP_TEXT(params)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BOUNDING_BOX);
        this.clearBlipLayer();
        isClearing = false;
        if (currentStyle == -1)
        {
            this.SET_HELP_TEXT_STYLE(defaultHelpTextStyle);
        } // end if
        ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION;
        var _loc2 = params[0];
        var _loc3 = params[1];
        TICKET_NUMBER = params[2];
        if (_loc3 != undefined)
        {
            _fadeType = _loc3;
        }
        else
        {
            _fadeType = -1;
        } // end else if
        var _loc5 = _loc2.split(" ");
        if (OVERRIDE_DURATION <= 0)
        {
            ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION_TOTAL + _loc5.length * ON_SCREEN_DURATION_PER_WORD;
            var _loc4 = ON_SCREEN_DURATION_TOTAL / 100 * 30;
            ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION_TOTAL + _loc4;
        }
        else
        {
            ON_SCREEN_DURATION_TOTAL = OVERRIDE_DURATION;
        } // end else if
        helpTextfield.htmlText = _loc2;
        this.SET_BACKGROUND_SIZE();
        this.FADE_IN();
    } // End of the function
    function SET_HELP_TEXT_RAW(params)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BOUNDING_BOX);
        this.clearBlipLayer();
        isClearing = false;
        if (currentStyle == -1)
        {
            this.SET_HELP_TEXT_STYLE(defaultHelpTextStyle);
        } // end if
        ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION;
        var _loc2 = params[0];
        var _loc3 = params[1];
        TICKET_NUMBER = params[2];
        if (_loc3 != undefined)
        {
            _fadeType = _loc3;
        }
        else
        {
            _fadeType = -1;
        } // end else if
        var _loc6 = _loc2.split(" ");
        if (OVERRIDE_DURATION <= 0)
        {
            ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION_TOTAL + _loc6.length * ON_SCREEN_DURATION_PER_WORD;
            var _loc5 = ON_SCREEN_DURATION_TOTAL / 100 * 30;
            ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION_TOTAL + _loc5;
        }
        else
        {
            ON_SCREEN_DURATION_TOTAL = OVERRIDE_DURATION;
        } // end else if
        var _loc8 = new com.rockstargames.ui.utils.Text();
        var _loc4 = 14.400000;
        if (_HUD.NEEDS_BIGGER_HELP_AND_SUBTITLES)
        {
            _loc4 = 20;
        } // end if
        _loc8.setTextWithIcons(_loc2, blipLayer, CONTENT.helpText, 0, _loc4, 2.650000, false);
        this.SET_BACKGROUND_SIZE();
        this.FADE_IN();
    } // End of the function
    function SET_HELP_TEXT_POSITION(params)
    {
    } // End of the function
    function SET_OVERRIDE_DURATION(params)
    {
        OVERRIDE_DURATION = params[0];
    } // End of the function
    function SET_HELP_TEXT_OFFSCREEN(params)
    {
    } // End of the function
    function toggleOffScreen(isHelpTextVisible)
    {
        if (isHelpTextVisible)
        {
            background._visible = true;
            helpTextfield._visible = true;
            helpTextBackgroundOffscreen._visible = false;
            offScreenIndicator._visible = false;
            arrowMCOffscreen._visible = false;
            if (currentStyle == 0)
            {
                arrowPosition = 0;
            } // end if
            if (arrowPosition > 0)
            {
                arrow._visible = true;
            }
            else
            {
                arrow._visible = false;
            } // end else if
        }
        else
        {
            background._visible = false;
            helpTextfield._visible = false;
            arrow._visible = false;
            helpTextBackgroundOffscreen._visible = true;
            offScreenIndicator._visible = true;
            arrowMCOffscreen._visible = true;
        } // end else if
    } // End of the function
    function SET_HELP_TEXT_STYLE(params)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BOUNDING_BOX);
        if (params[0] == 2)
        {
            currentStyle = 2;
            if (logo == undefined)
            {
                logo = CONTENT.attachMovie("ammunation_logo", "ammunation_logo", CONTENT.getNextHighestDepth());
            } // end if
            background.gotoAndStop(2);
        }
        else if (logo != undefined)
        {
            logo.removeMovieClip();
            logo = undefined;
            background.gotoAndStop(1);
        } // end else if
    } // End of the function
    function SET_BACKGROUND_SIZE()
    {
        background._height = helpTextfield.textHeight + topPadding + bottomPadding;
        background._height = background._height - trimForOneLineText;
        if (logo != undefined)
        {
            background._width = logo._width;
        }
        else
        {
            background._width = helpTextfield.textWidth + sidePadding * 2;
        } // end else if
        var _loc2 = 0;
        if (logo != undefined)
        {
            _loc2 = 0 + logo._height;
        } // end if
        switch (arrowPosition)
        {
            case 0:
            {
                background._x = 0;
                background._y = _loc2;
                break;
            } 
            case 1:
            {
                background._x = -background._width / 2;
                background._y = _loc2 + arrow._height;
                arrow._x = background._x + background._width / 2;
                arrow._y = _loc2 + arrow._height;
                arrow._rotation = 180;
                break;
            } 
            case 2:
            {
                background._x = 0 + arrowHeight;
                background._y = _loc2 - background._height / 2;
                arrow._x = 0 + arrowHeight;
                arrow._y = _loc2;
                arrow._rotation = 90;
                break;
            } 
            case 3:
            {
                background._x = -background._width / 2;
                background._y = _loc2 - background._height - arrow._height;
                arrow._x = background._x + background._width / 2;
                arrow._y = background._y + background._height;
                arrow._rotation = 0;
                break;
            } 
            case 4:
            {
                background._x = -(background._width + arrowHeight);
                background._y = _loc2 - background._height / 2;
                arrow._rotation = -90;
                arrow._x = -arrowHeight;
                arrow._y = _loc2;
                break;
            } 
            default:
            {
                background._x = 0;
                background._y = _loc2;
            } 
        } // End of switch
        var _loc3;
        if (logo != undefined)
        {
            _loc3 = (logo._height + background._height) / 720;
            BOUNDING_BOX._height = background._height + logo._height;
        }
        else
        {
            _loc3 = background._height / 720;
            BOUNDING_BOX._height = background._height;
        } // end else if
        helpTextfield._x = background._x + leftPadding;
        helpTextfield._y = background._y + topPadding;
        var _loc6 = CONTENT._x / 1280;
        var _loc5 = CONTENT._y / 720;
        var _loc4 = background._width / 1280;
        com.rockstargames.ui.game.GameInterface.call("SET_REVISED_COMPONENT_VALUES", com.rockstargames.ui.game.GameInterface.HUD_TYPE, _enumID, _loc6, _loc5, _loc4, _loc3);
        BOUNDING_BOX._width = background._width;
        BOUNDING_BOX._x = background._x;
        BOUNDING_BOX._y = background._y;
    } // End of the function
    function FADE_IN()
    {
        CONTENT._alpha = 100;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        if (_fadeType != 0)
        {
            this.STAY_ON_SCREEN();
        } // end if
    } // End of the function
    function STAY_ON_SCREEN()
    {
        isAnimating = false;
        if (_fadeType == 1)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, ON_SCREEN_DURATION_ONE_FRAME / 1000, {_alpha: 100, onCompleteScope: this, onComplete: REMOVE});
        }
        else if (_fadeType == -1)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, ON_SCREEN_DURATION_TOTAL / 1000, {_alpha: 100, onCompleteScope: this, onComplete: REMOVE});
        } // end else if
    } // End of the function
    function CLEAR_HELP_TEXT(params)
    {
        TICKET_NUMBER = params[0];
        CONTENT._alpha = 0;
        this.REMOVE();
    } // End of the function
    function CLEAR_HELP_TEXT_NOW(params)
    {
        TICKET_NUMBER = params[0];
        CONTENT._alpha = 0;
        this.REMOVE();
    } // End of the function
    function REMOVE()
    {
        CONTENT._alpha = 0;
        if (logo != undefined)
        {
            logo.removeMovieClip();
            logo = undefined;
        } // end if
        CONTENT._alpha = 0;
        isAnimating = false;
        isClearing = false;
        arrowPosition = 0;
        _fadeType = null;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BOUNDING_BOX);
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(BOUNDING_BOX, 0.060000, {onCompleteScope: this, onComplete: UNLOAD_MOVIE});
    } // End of the function
    function UNLOAD_MOVIE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BOUNDING_BOX);
        com.rockstargames.ui.game.GameInterface.call("CLEAR_HELP_TEXT", com.rockstargames.ui.game.GameInterface.HUD_TYPE, helpTextType, TICKET_NUMBER);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    function DEBUG_LOG(str)
    {
        com.rockstargames.ui.game.GameInterface.call("DEBUG_LOG", com.rockstargames.ui.game.GameInterface.HUD_TYPE, str);
    } // End of the function
    function COORDS_TO_SCREEN(posX, posY)
    {
        return (new flash.geom.Point(posX * screenWidth, posY * screenHeight));
    } // End of the function
    var screenWidth = 1280;
    var screenHeight = 720;
} // End of Class
#endinitclip
