// Action script...

// [Initial MovieClip Action of sprite 31]
#initclip 5
class com.rockstargames.gtav.Multiplayer.socialclubtv.SOCIAL_CLUB_TV extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, lowerThirdMC, ticker, livePanelMC, isWideScreen, isHiDef, FILE_WIDTH, FOUR_THREE_PADDING, safeLeft, safeRight, safeTop, safeBottom;
    function SOCIAL_CLUB_TV()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        lowerThirdMC = CONTENT.attachMovie("LowerThird", "lowerThirdMC", CONTENT.getNextHighestDepth());
        ticker = (com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTicker)(lowerThirdMC.attachMovie("Ticker", "ticker", lowerThirdMC.getNextHighestDepth(), {_y: 50}));
        livePanelMC = CONTENT.attachMovie("LivePanel", "livePanelMC", CONTENT.getNextHighestDepth());
        livePanelMC.titleTF.autoSize = true;
        livePanelMC.descTF.autoSize = true;
        livePanelMC.playerTF.autoSize = true;
        this.SHOW_LIVE_PANEL(false);
        this.SHOW_TICKER(false);
        this.SET_LIVE_PANEL();
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        super.initScreenLayout();
        this._positionLivePanel();
        this._positionLowerThird();
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
    function SHOW_LIVE_PANEL(value)
    {
        livePanelMC._visible = value;
    } // End of the function
    function SET_LIVE_PANEL(title, description, player, crewTag, txd, txn)
    {
        var _loc2 = livePanelMC.ct;
        var _loc5 = false;
        livePanelMC._visible = title != "" && title != undefined;
        livePanelMC.titleTF.text = title;
        if (description != "" && description != undefined && player != "" && player != undefined)
        {
            livePanelMC.descTF._width = 10;
            livePanelMC.descTF.text = description;
            livePanelMC.playerTF._width = 10;
            livePanelMC.playerTF.text = player;
            if (txd != "" && txd != undefined && txn != "" && txn != undefined)
            {
                livePanelMC.imgLdrFrameMC._visible = true;
                livePanelMC.descTF._x = 46;
                livePanelMC.playerTF._x = 46;
                var _loc3 = livePanelMC.imgLdrFrameMC.imgLdr;
                if (_loc3 == undefined)
                {
                    _loc3 = (com.rockstargames.ui.media.ImageLoaderMC)(livePanelMC.imgLdrFrameMC.attachMovie("GenericImageLoader", "imgLdr", livePanelMC.imgLdrFrameMC.getNextHighestDepth()));
                } // end if
                _loc3._visible = false;
                if (_loc3.textureDict != txd || _loc3.textureFilename != txn)
                {
                    if (_loc3.isLoaded)
                    {
                        _loc3.removeTxdRef();
                    } // end if
                    _loc3.init("SOCIAL_CLUB_TV", txd, txn, 32, 32);
                    _loc3.addTxdRef(String(_loc3));
                } // end if
            }
            else
            {
                livePanelMC.imgLdrFrameMC._visible = false;
                livePanelMC.descTF._x = 6;
                livePanelMC.playerTF._x = 6;
            } // end else if
            if (crewTag != "" && crewTag != undefined)
            {
                if (_loc2 == undefined)
                {
                    _loc2 = (com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP)(livePanelMC.attachMovie("CREW_TAG_MOVIECLIP", "ct", livePanelMC.getNextHighestDepth(), {_y: livePanelMC.playerTF._y + 3, _xscale: 70, _yscale: 70}));
                } // end if
                _loc2._x = livePanelMC.playerTF._x + livePanelMC.playerTF._width + 6;
                _loc2.UNPACK_CREW_TAG(crewTag);
            }
            else if (_loc2 != undefined)
            {
                _loc2.removeMovieClip();
                _loc2 = undefined;
            } // end else if
            livePanelMC.descTF._visible = true;
            livePanelMC.playerTF._visible = true;
            livePanelMC.bg._visible = true;
        }
        else
        {
            _loc5 = true;
            livePanelMC.imgLdrFrameMC._visible = false;
            livePanelMC.descTF._visible = false;
            livePanelMC.playerTF._visible = false;
            livePanelMC.bg._visible = false;
            _loc2.removeMovieClip();
            _loc2 = undefined;
        } // end else if
        var _loc4 = 142;
        var _loc10 = 11;
        if (!_loc5)
        {
            _loc4 = Math.max(this._howWide(livePanelMC.playerTF), Math.max(this._howWide(livePanelMC.descTF), _loc4));
            if (_loc2 != undefined)
            {
                _loc4 = Math.max(this._howWide(_loc2) - _loc10, _loc4);
            } // end if
        } // end if
        livePanelMC.titleBG._width = _loc4 + 10;
        livePanelMC.bg._width = _loc4 + 10;
        this._positionLivePanel();
    } // End of the function
    function SHOW_TICKER(value)
    {
        lowerThirdMC._visible = value;
    } // End of the function
    function SET_TICKER_TITLE(title)
    {
        lowerThirdMC.titleTF.htmlText = title;
    } // End of the function
    function ADD_TICKER_TEXT()
    {
        ticker.ADD_TICKER_TEXT.apply(ticker, arguments);
    } // End of the function
    function ADD_TXD_REF_RESPONSE(txd, strRef, success)
    {
        var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(strRef));
        il._visible = true;
        il.displayTxdResponse(txd);
    } // End of the function
    function _positionLivePanel()
    {
        livePanelMC._x = safeRight - livePanelMC.titleBG._width;
        livePanelMC._y = safeTop;
    } // End of the function
    function _positionLowerThird()
    {
        lowerThirdMC._x = safeLeft;
        lowerThirdMC._y = safeBottom - lowerThirdMC._height;
        lowerThirdMC.logoMC._x = safeRight - safeLeft - lowerThirdMC.logoMC._width;
        lowerThirdMC.titleBG._x = -safeLeft;
        lowerThirdMC.titleBG._width = lowerThirdMC.logoMC._x + safeLeft;
        ticker.updateWidth(lowerThirdMC.logoMC._x);
    } // End of the function
    function _howWide(target)
    {
        return (target._x + target._width);
    } // End of the function
} // End of Class
#endinitclip
