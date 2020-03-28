// Action script...

// [Initial MovieClip Action of sprite 25]
#initclip 15
class com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase extends MovieClip
{
    var scrollPosMC, scrollPosTXT, upDownMC, allArrowsMC, _y, _visible, bgMC, _x, _currentPosition, _maxPosition, _maxVisible, _caption, _component, _model, _columnSpan, _scrollType, _arrowPosition, arrowsMC, captionBlipLayer;
    function PM_ScrollBase()
    {
        super();
        scrollPosTXT = scrollPosMC.scrollPosTXT;
        scrollPosTXT.autoSize = true;
        scrollPosTXT.html = true;
        scrollPosMC._visible = false;
        upDownMC._visible = false;
        allArrowsMC._visible = false;
        _y = 432;
        _visible = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(allArrowsMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(upDownMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
    } // End of the function
    function INIT_SCROLL_BAR(visible, columns, scrollType, arrowPosition, override, columnXOffset, forceInvisible)
    {
        _codeOverride = override;
        this.setColumnSpan(columns);
        this.setArrows(scrollType, arrowPosition);
        if (columnXOffset != undefined)
        {
            _x = 290 * columnXOffset;
        } // end if
        this.forceInvisible = forceInvisible;
        _visible = forceInvisible ? (false) : (visible != undefined ? (visible) : (false));
        this.updateScroll();
    } // End of the function
    function SET_SCROLL_BAR(currentPosition, maxPosition, maxVisible, caption, forceInvisible)
    {
        _currentPosition = currentPosition;
        _maxPosition = maxPosition;
        _maxVisible = maxVisible;
        this.forceInvisible = forceInvisible;
        if (caption != undefined && caption != "")
        {
            this.SET_CAPTION(caption);
        }
        else
        {
            this.CLEAR_CAPTION();
        } // end else if
    } // End of the function
    function SET_CAPTION(caption)
    {
        _captionOn = true;
        _caption = caption;
        this.updateScroll();
    } // End of the function
    function CLEAR_CAPTION()
    {
        _captionOn = false;
        _caption = undefined;
        this.updateScroll();
    } // End of the function
    function displayEnabled()
    {
        return (forceInvisible ? (false) : (_currentPosition != -1 || _maxPosition != -1 || _maxVisible != -1 || _captionOn));
    } // End of the function
    function init(component, columns, scrollType, arrowPosition, codeOverride)
    {
        _codeOverride = codeOverride;
        this.setComponent(component);
        this.setColumnSpan(columns);
        this.setArrows(scrollType, arrowPosition);
        this.updateScroll();
    } // End of the function
    function setComponent(component)
    {
        _component = component != undefined ? (component) : (null);
        _model = _component.model;
        this.updateScroll();
    } // End of the function
    function setColumnSpan(columns)
    {
        if (columns > 0)
        {
            _visible = this.displayEnabled();
        }
        else
        {
            _visible = false;
            return;
        } // end else if
        _columnSpan = columns;
        bgMC._width = 290 * _columnSpan - 2;
        this.updateDisplay();
    } // End of the function
    function setArrows(type, position)
    {
        _scrollType = type;
        _arrowPosition = position;
        switch (_scrollType)
        {
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_ALL:
            {
                upDownMC._visible = false;
                allArrowsMC._visible = true;
                arrowsMC = allArrowsMC;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_LEFT_RIGHT:
            {
                allArrowsMC._visible = false;
                upDownMC._visible = true;
                upDownMC._rotation = 90;
                arrowsMC = upDownMC;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_NONE:
            {
                allArrowsMC._visible = false;
                upDownMC._visible = false;
                arrowsMC = upDownMC;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.SCROLL_TYPE_UP_DOWN:
            default:
            {
                allArrowsMC._visible = false;
                upDownMC._visible = true;
                upDownMC._rotation = 0;
                arrowsMC = upDownMC;
                break;
            } 
        } // End of switch
        scrollPosMC._visible = false;
        switch (_arrowPosition)
        {
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_RIGHT:
            {
                scrollPosMC._visible = true;
                arrowsMC._x = bgMC._width - arrowsMC._width / 2 - 8;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_LEFT:
            {
                arrowsMC._x = 8 + arrowsMC._width / 2;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_CENTER:
            default:
            {
                arrowsMC._x = bgMC._width / 2;
                break;
            } 
        } // End of switch
        this.updateDisplay();
    } // End of the function
    function updateScroll()
    {
        if (!_codeOverride)
        {
            _currentPosition = _model.getCurrentSelection();
            _maxPosition = _model.getCurrentView().maxitems;
            _maxVisible = _model.getCurrentView().visibleItems;
        } // end if
        this.updateDisplay();
    } // End of the function
    function updateDisplay()
    {
        scrollPosMC._visible = false;
        if (captionBlipLayer != undefined)
        {
            captionBlipLayer.removeMovieClip();
        } // end if
        if (_captionOn)
        {
            scrollPosMC._visible = true;
            captionBlipLayer = scrollPosMC.createEmptyMovieClip("captionBlipLayer", 1000);
            var _loc3 = new com.rockstargames.ui.utils.Text();
            _loc3.setTextWithIcons(_caption, captionBlipLayer, scrollPosTXT, 0, 13.500000, 0, false);
        }
        else if (_arrowPosition == com.rockstargames.gtav.pauseMenu.pauseComponents.PM_ScrollBase.POSITION_ARROW_RIGHT && _maxPosition > 0)
        {
            scrollPosMC._visible = true;
            if (_currentPosition >= 0)
            {
                var _loc2 = _currentPosition;
                _loc2 = _loc2++ > _maxPosition ? (_maxPosition) : (_loc2);
                scrollPosTXT.text = _loc2 + "/" + _maxPosition;
            }
            else
            {
                scrollPosTXT.text = _maxPosition + "";
            } // end else if
        } // end else if
        com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(scrollPosMC.scrollPosTXT, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        _visible = this.displayEnabled();
    } // End of the function
    static var SCROLL_TYPE_ALL = 0;
    static var SCROLL_TYPE_UP_DOWN = 1;
    static var SCROLL_TYPE_LEFT_RIGHT = 2;
    static var SCROLL_TYPE_NONE = 3;
    static var POSITION_ARROW_LEFT = 0;
    static var POSITION_ARROW_CENTER = 1;
    static var POSITION_ARROW_RIGHT = 2;
    var _maxPositionSet = false;
    var _captionOn = false;
    var _codeOverride = false;
    var forceInvisible = false;
} // End of Class
#endinitclip
