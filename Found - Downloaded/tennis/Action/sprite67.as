// Action script...

// [Initial MovieClip Action of sprite 67]
#initclip 5
class com.rockstargames.gtav.minigames.tennis.TENNIS extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, getDisplayConfig, TIMELINE, _scoreboard, _playerCard, swingMeter, positionToScreenLayout, screenWidthPixels, screenHeightPixels, safeRight, safeLeft, FILE_WIDTH, isWideScreen, isHiDef, FOUR_THREE_PADDING, safeTop, safeBottom;
    function TENNIS()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        CONTENT.ref = this;
        this.getDisplayConfig();
        Object.registerClass("Scoreboard", com.rockstargames.gtav.minigames.tennis.Scoreboard);
        _scoreboard = (com.rockstargames.gtav.minigames.tennis.Scoreboard)(TIMELINE.attachMovie("Scoreboard", "_scoreboard", TIMELINE.getNextHighestDepth()));
        Object.registerClass("PlayerCard", com.rockstargames.gtav.minigames.tennis.PlayerCard);
        _playerCard = (com.rockstargames.gtav.minigames.tennis.PlayerCard)(CONTENT.attachMovie("PlayerCard", "_playerCard", CONTENT.getNextHighestDepth()));
        _playerCard._visible = _playerCardVisible;
        swingMeter = (com.rockstargames.gtav.minigames.components.SwingMeter)(CONTENT.attachMovie("SwingMeter", "swingMeter", CONTENT.getNextHighestDepth()));
        swingMeter._visible = false;
        this.positionToScreenLayout(swingMeter, "CC", true);
        this.DISPLAY_SCOREBOARD(false);
        this.DISPLAY_PLAYER_CARD(false);
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        swingMeter.screenWidth = screenWidthPixels;
        swingMeter.screenHeight = screenHeightPixels;
        this.positionToScreenLayout(_playerCard, "LT", true);
        var _loc2 = safeRight - safeLeft;
        if (_loc2 <= _scoreboard._width)
        {
            _scoreboard._width = _loc2;
        }
        else
        {
            _scoreboard._xscale = 100;
        } // end else if
        _scoreboard._x = Math.round((FILE_WIDTH - _scoreboard._width) / 2);
        _scoreboard._y = 190;
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
    {
        isWideScreen = _isWideScreen;
        isHiDef = _isHiDef;
        if (!isWideScreen)
        {
            Stage.scaleMode = "noBorder";
            var _loc4 = 1.777778;
            var _loc3 = 1.333333;
            FOUR_THREE_PADDING = (FILE_WIDTH - Math.round(FILE_WIDTH / _loc4 * _loc3)) / 2;
            _screenWidthPixels = FILE_WIDTH - FOUR_THREE_PADDING * 2;
        } // end if
        safeLeft = FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeLeftPercent);
        safeRight = FOUR_THREE_PADDING + Math.round(_screenWidthPixels * _safeRightPercent);
        safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
        safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
        this.initScreenLayout();
    } // End of the function
    function DISPLAY_SCOREBOARD(value)
    {
        _scoreboard._visible = value;
    } // End of the function
    function DISPLAY_PLAYER_CARD(value)
    {
        _playerCardVisible = value;
        _playerCard._visible = _mugShotsLoaded ? (_playerCardVisible) : (false);
    } // End of the function
    function SET_SCOREBOARD_TITLE(title, column0)
    {
        _scoreboard.SET_SCOREBOARD_TITLE.apply(_scoreboard, arguments);
        this.initScreenLayout();
    } // End of the function
    function SET_SCOREBOARD_SLOT(id, isMP, name, crewTag, isSelected, column0)
    {
        _scoreboard.SET_SCOREBOARD_SLOT.apply(_scoreboard, arguments);
        this.initScreenLayout();
    } // End of the function
    function SET_PLAYERCARD_TITLE(column0)
    {
        _playerCard.SET_PLAYERCARD_TITLE.apply(_playerCard, arguments);
        this.initScreenLayout();
    } // End of the function
    function SET_PLAYERCARD_SLOT(id, isMP, name, crewTag, isSelected, txd, txn, column0)
    {
        _playerCard.SET_PLAYERCARD_SLOT.apply(_playerCard, arguments);
        this.initScreenLayout();
    } // End of the function
    function SET_PLAYERCARD_HEADSET(id, headsetEnum)
    {
        _playerCard.SET_PLAYERCARD_HEADSET.apply(_playerCard, arguments);
    } // End of the function
    function ADD_TXD_REF_RESPONSE(txd, strRef, success)
    {
        _playerCard.ADD_TXD_REF_RESPONSE(txd, strRef, success);
        _mugShotsLoaded = true;
        _playerCard._visible = _playerCardVisible;
    } // End of the function
    function SWING_METER_SET_MARKER(hVisible, hPosition, vVisibile, vPosition)
    {
        swingMeter.setMarker(hVisible, hPosition, vVisibile, vPosition);
    } // End of the function
    function SWING_METER_SET_APEX_MARKER(hVisible, hPosition, vVisibile, vPosition)
    {
        swingMeter.setApexMarker(hVisible, hPosition, vVisibile, vPosition);
    } // End of the function
    function SWING_METER_SET_TARGET(span, position)
    {
        swingMeter.setTarget(span, position);
    } // End of the function
    function SWING_METER_SET_TARGET_COLOR(r, g, b, a)
    {
        swingMeter.setTargetColor(r, g, b, a);
    } // End of the function
    function SWING_METER_SET_FILL(span, state, fromTop)
    {
        swingMeter.setFill(span, state, fromTop);
    } // End of the function
    function SWING_METER_POSITION(x, y, center)
    {
        swingMeter.setPosition(x, y, center);
    } // End of the function
    function SWING_METER_SCALE(w, h)
    {
        swingMeter.setScale(w, h);
    } // End of the function
    function SWING_METER_IS_TRANSITIOING()
    {
        return (swingMeter.isTransitioing());
    } // End of the function
    function SWING_METER_TRANSITION_IN()
    {
        swingMeter.transitionIn();
    } // End of the function
    function SWING_METER_TRANSITION_OUT(duration)
    {
        swingMeter.transitionOut(duration);
    } // End of the function
    var _playerCardVisible = false;
    var _mugShotsLoaded = false;
} // End of Class
#endinitclip
