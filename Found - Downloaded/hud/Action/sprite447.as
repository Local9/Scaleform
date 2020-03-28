// Action script...

// [Initial MovieClip Action of sprite 447]
#initclip 35
class com.rockstargames.gtav.hud.hudComponents.HUD_FLOATING_HELP_TEXT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var defaultWidth, leftPadding, rightPadding, sidePadding, topPadding, bottomPadding, isAnimating, isClearing, ON_SCREEN_DURATION_ONE_FRAME, ON_SCREEN_DURATION_PER_WORD, trimForOneLineText, currentStyle, defaultHelpTextStyle, hudCompEnum, helpTextType, CONTENT, txtFormat, TIMELINE, BOUNDING_BOX, background, helpTextBackgroundOffscreen, arrowMCOffscreen, offScreenIndicator, arrow, arrowHeight, arrowWidth, helpTextfield, blipLayer, isOnscreen, IS_OFFSCREEN, arrowPosition, boxOffset, ON_SCREEN_DURATION, ON_SCREEN_DURATION_TOTAL, TICKET_NUMBER, _fadeType, _enumID, _HUD;
    function HUD_FLOATING_HELP_TEXT()
    {
        super();
        defaultWidth = 280;
        leftPadding = 7;
        rightPadding = 5;
        sidePadding = leftPadding + rightPadding;
        topPadding = 5;
        bottomPadding = 12;
        isAnimating = false;
        isClearing = false;
        ON_SCREEN_DURATION_ONE_FRAME = 66;
        ON_SCREEN_DURATION_PER_WORD = 333;
        trimForOneLineText = 3;
        currentStyle = -1;
        defaultHelpTextStyle = new Array(0, 0, 0, 0, 0, 77);
        hudCompEnum = com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1;
        helpTextType = 1;
        txtFormat = CONTENT.helpText.getTextFormat();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
    } // End of the function
    function READY(id)
    {
        super.READY(id);
        background = CONTENT.helpTextBackground;
        helpTextBackgroundOffscreen = CONTENT.helpTextBackgroundOffscreen;
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
        helpTextfield.autoSize = true;
        CONTENT._alpha = 0;
        this.clearBlipLayer();
        helpTextfield._x = background._x + leftPadding;
        helpTextfield._y = background._y + topPadding;
    } // End of the function
    function clearBlipLayer()
    {
        if (blipLayer != undefined)
        {
            blipLayer.removeMovieClip();
        } // end if
        blipLayer = CONTENT.createEmptyMovieClip("blipLayer", 1000);
    } // End of the function
    function SET_HELP_TEXT_POSITION(params)
    {
        var _loc4 = params[0];
        var _loc3 = params[1];
        var _loc2 = this.COORDS_TO_SCREEN(_loc4, _loc3);
        CONTENT._x = Math.floor(_loc2.x);
        CONTENT._y = Math.floor(_loc2.y);
    } // End of the function
    function SET_HELP_TEXT_OFFSCREEN(params)
    {
        var _loc2 = params[0];
        isOnscreen = false;
        switch (_loc2)
        {
            case 0:
            {
                isOnscreen = true;
                break;
            } 
            case 1:
            {
                helpTextBackgroundOffscreen._x = Math.floor(-helpTextBackgroundOffscreen._width / 2);
                helpTextBackgroundOffscreen._y = Math.floor(0 + arrowMCOffscreen._height);
                arrowMCOffscreen._x = Math.floor(helpTextBackgroundOffscreen._x + helpTextBackgroundOffscreen._width / 2);
                arrowMCOffscreen._y = Math.floor(0 + arrowMCOffscreen._height);
                arrowMCOffscreen._rotation = 180;
                break;
            } 
            case 4:
            {
                helpTextBackgroundOffscreen._x = Math.floor(0 + arrowHeight);
                helpTextBackgroundOffscreen._y = Math.floor(-helpTextBackgroundOffscreen._height / 2);
                arrowMCOffscreen._x = Math.floor(0 + arrowHeight);
                arrowMCOffscreen._y = 0;
                arrowMCOffscreen._rotation = 90;
                break;
            } 
            case 3:
            {
                helpTextBackgroundOffscreen._x = Math.floor(-helpTextBackgroundOffscreen._width / 2);
                helpTextBackgroundOffscreen._y = Math.floor(-helpTextBackgroundOffscreen._height - helpTextBackgroundOffscreen._height);
                arrowMCOffscreen._x = Math.floor(helpTextBackgroundOffscreen._x + helpTextBackgroundOffscreen._width / 2);
                arrowMCOffscreen._y = Math.floor(helpTextBackgroundOffscreen._y + helpTextBackgroundOffscreen._height);
                arrowMCOffscreen._rotation = 0;
                break;
            } 
            case 2:
            {
                helpTextBackgroundOffscreen._x = Math.floor(-(helpTextBackgroundOffscreen._width + arrowHeight));
                helpTextBackgroundOffscreen._y = Math.floor(-helpTextBackgroundOffscreen._height / 2);
                arrowMCOffscreen._rotation = -90;
                arrowMCOffscreen._x = Math.floor(-arrowHeight);
                arrowMCOffscreen._y = 0;
                break;
            } 
        } // End of switch
        this.toggleOffScreen(isOnscreen);
        offScreenIndicator._x = helpTextBackgroundOffscreen._x + 12;
        offScreenIndicator._y = helpTextBackgroundOffscreen._y + 12;
    } // End of the function
    function toggleOffScreen(isHelpTextVisible)
    {
        if (isHelpTextVisible)
        {
            background._visible = true;
            helpTextfield._visible = true;
            IS_OFFSCREEN = false;
            helpTextBackgroundOffscreen._visible = false;
            offScreenIndicator._visible = false;
            arrowMCOffscreen._visible = IS_OFFSCREEN;
            if (currentStyle == 0)
            {
                arrowPosition = 0;
                boxOffset = 0;
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
            IS_OFFSCREEN = true;
            background._visible = false;
            helpTextfield._visible = false;
            arrow._visible = false;
            helpTextBackgroundOffscreen._visible = true;
            offScreenIndicator._visible = true;
            arrowMCOffscreen._visible = IS_OFFSCREEN;
        } // end else if
    } // End of the function
    function SET_HELP_TEXT_STYLE(params)
    {
        arrow._visible = false;
        var _loc7 = params[0];
        var _loc3;
        var _loc6;
        var _loc2;
        var _loc4;
        arrowPosition = params[1];
        if (arrowPosition == undefined)
        {
            arrowPosition = 0;
        } // end if
        boxOffset = params[2];
        if (boxOffset == undefined)
        {
            boxOffset = 0;
        } // end if
        if (params.length > 2)
        {
            _loc3 = params[3];
            _loc6 = params[4];
            _loc2 = params[5];
            _loc4 = defaultHelpTextStyle[5];
        }
        else
        {
            _loc3 = defaultHelpTextStyle[2];
            _loc6 = defaultHelpTextStyle[3];
            _loc2 = defaultHelpTextStyle[4];
            _loc4 = defaultHelpTextStyle[5];
        } // end else if
        if (_loc7 == 0)
        {
            arrowPosition = 0;
            boxOffset = 0;
        } // end if
        if (!IS_OFFSCREEN)
        {
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
            arrow._visible = false;
        } // end else if
        if (background != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(background, _loc3, _loc6, _loc2, _loc4);
        } // end if
        if (arrow != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(arrow, _loc3, _loc6, _loc2, _loc4);
        } // end if
        if (helpTextBackgroundOffscreen != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(helpTextBackgroundOffscreen, _loc3, _loc6, _loc2, _loc4);
        } // end if
        if (arrowMCOffscreen != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(arrowMCOffscreen, _loc3, _loc6, _loc2, _loc4);
        } // end if
        currentStyle = _loc7;
        this.SET_BACKGROUND_SIZE();
    } // End of the function
    function SET_HELP_TEXT(params)
    {
        if (currentStyle == -1)
        {
            this.SET_HELP_TEXT_STYLE(defaultHelpTextStyle);
        } // end if
        ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION;
        var _loc2 = params[0];
        TICKET_NUMBER = params[2];
        var _loc3 = params[1];
        if (_loc3 != undefined)
        {
            _fadeType = _loc3;
        }
        else
        {
            _fadeType = -1;
        } // end else if
        var _loc5 = _loc2.split(" ");
        ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION_TOTAL + _loc5.length * ON_SCREEN_DURATION_PER_WORD;
        var _loc4 = ON_SCREEN_DURATION_TOTAL / 100 * 30;
        ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION_TOTAL + _loc4;
        helpTextfield.htmlText = _loc2;
        helpTextfield.autoSize = true;
        this.SET_BACKGROUND_SIZE();
        this.FADE_IN();
    } // End of the function
    function SET_HELP_TEXT_RAW(params)
    {
        this.clearBlipLayer();
        if (currentStyle == -1)
        {
            this.SET_HELP_TEXT_STYLE(defaultHelpTextStyle);
        } // end if
        ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION;
        var _loc2 = params[0];
        TICKET_NUMBER = params[2];
        var _loc3 = params[1];
        if (_loc3 != undefined)
        {
            _fadeType = _loc3;
        }
        else
        {
            _fadeType = -1;
        } // end else if
        var _loc4 = _loc2.split(" ");
        ON_SCREEN_DURATION_TOTAL = ON_SCREEN_DURATION_TOTAL + _loc4.length * ON_SCREEN_DURATION_PER_WORD;
        var _loc6 = new com.rockstargames.ui.utils.Text();
        _loc6.setTextWithIcons(_loc2, blipLayer, CONTENT.helpText, 0, 14.400000, 2.650000, false);
        this.SET_BACKGROUND_SIZE();
        this.FADE_IN();
    } // End of the function
    function SET_BACKGROUND_SIZE()
    {
        background._height = helpTextfield.textHeight + topPadding + bottomPadding;
        var _loc6 = background._width / 2;
        if (helpTextfield.maxscroll == 1)
        {
            background._height = background._height - trimForOneLineText;
            background._width = helpTextfield.textWidth + sidePadding * 2;
        }
        else
        {
            background._width = defaultWidth;
        } // end else if
        var _loc7;
        switch (arrowPosition)
        {
            case 0:
            {
                background._x = 0;
                background._y = 0;
                break;
            } 
            case 1:
            {
                background._x = Math.floor(-background._width / 2 + boxOffset);
                background._y = Math.floor(0 + arrowHeight);
                arrow._x = Math.floor(-background._width / 2 + background._width / 2);
                arrow._y = Math.floor(0 + arrow._height);
                arrow._rotation = 180;
                break;
            } 
            case 2:
            {
                background._x = Math.floor(0 + arrowHeight);
                background._y = Math.floor(-background._height / 2 + boxOffset);
                arrow._x = Math.floor(0 + arrowHeight);
                arrow._y = 0;
                arrow._rotation = 90;
                break;
            } 
            case 3:
            {
                background._x = Math.floor(-background._width / 2 - boxOffset);
                background._y = Math.floor(-background._height - arrow._height);
                arrow._x = Math.floor(-background._width / 2 + background._width / 2);
                arrow._y = Math.floor(background._y + background._height);
                arrow._rotation = 0;
                break;
            } 
            case 4:
            {
                background._x = Math.floor(-(background._width + arrowHeight));
                background._y = Math.floor(-background._height / 2 - boxOffset);
                arrow._rotation = -90;
                arrow._x = Math.floor(-arrowHeight);
                arrow._y = 0;
                break;
            } 
        } // End of switch
        helpTextfield._x = Math.floor(background._x + leftPadding);
        helpTextfield._y = Math.floor(background._y + topPadding);
        var _loc5 = CONTENT._x / 1280;
        var _loc4 = CONTENT._y / 720;
        var _loc2 = background._width / 1280;
        var _loc3 = background._height / 720;
        com.rockstargames.ui.game.GameInterface.call("SET_REVISED_COMPONENT_VALUES", com.rockstargames.ui.game.GameInterface.HUD_TYPE, hudCompEnum, _loc5, _loc4, _loc2, _loc3);
    } // End of the function
    function FADE_IN()
    {
        if (!isAnimating)
        {
            isAnimating = true;
            if (_fadeType == 0)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, 0, {_alpha: 100, onCompleteScope: this});
            }
            else
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, 0, {_alpha: 100, onCompleteScope: this, onComplete: STAY_ON_SCREEN});
            } // end if
        } // end else if
    } // End of the function
    function STAY_ON_SCREEN()
    {
        isAnimating = false;
        if (_fadeType == 1)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, ON_SCREEN_DURATION_ONE_FRAME / 1000, {_alpha: 100, onCompleteScope: this, onComplete: FADE_OUT});
        }
        else if (_fadeType == -1)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, ON_SCREEN_DURATION_TOTAL / 1000, {_alpha: 100, onCompleteScope: this, onComplete: FADE_OUT});
        } // end else if
    } // End of the function
    function CLEAR_HELP_TEXT(params)
    {
        TICKET_NUMBER = params[0];
        if (!isClearing)
        {
            this.FADE_OUT();
            isClearing = true;
        } // end if
    } // End of the function
    function CLEAR_HELP_TEXT_NOW(params)
    {
        TICKET_NUMBER = params[0];
        CONTENT._alpha = 0;
        this.REMOVE();
    } // End of the function
    function FADE_OUT()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, 0, {_alpha: 0, onCompleteScope: this, onComplete: REMOVE});
    } // End of the function
    function REMOVE()
    {
        isAnimating = false;
        isClearing = false;
        arrowPosition = 0;
        boxOffset = 0;
        CONTENT._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        com.rockstargames.ui.game.GameInterface.call("CLEAR_HELP_TEXT", com.rockstargames.ui.game.GameInterface.HUD_TYPE, helpTextType, TICKET_NUMBER);
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    function COORDS_TO_SCREEN(posX, posY)
    {
        return (new flash.geom.Point(posX * screenWidth, posY * screenHeight));
    } // End of the function
    function clamp(value, min, max)
    {
        if (value > max)
        {
            return (max);
        }
        else if (value < min)
        {
            return (min);
        } // end else if
        return (value);
    } // End of the function
    var screenWidth = 1280;
    var screenHeight = 720;
} // End of Class
#endinitclip
