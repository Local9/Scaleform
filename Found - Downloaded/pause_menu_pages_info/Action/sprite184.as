// Action script...

// [Initial MovieClip Action of sprite 184]
#initclip 18
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, iconMC, getNextHighestDepth, createEmptyMovieClip, feedImgContainer2, feedImgContainer1, bodyMC, itemTextLeft, __get__data, feedImgDefaultMC, placeholderImgMC, type, textIconLayerMC, crewTagMC, attachMovie, feedImgSecondaryMC, _height, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    static var TEXT_X;
    function PauseMenuFeedItem()
    {
        super();
        TEXT_X = labelMC._x;
        iconMC._visible = false;
        feedImgContainer2 = this.createEmptyMovieClip("feedImgContainer2", this.getNextHighestDepth());
        feedImgContainer1 = this.createEmptyMovieClip("feedImgContainer1", this.getNextHighestDepth());
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(bodyMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        itemTextLeft.htmlText = this.parseForTitleFonts(this.__get__data()[0]);
        var _loc15 = this.__get__data()[1] ? (this.__get__data()[1]) : ("");
        var _loc12 = this.__get__data()[2] ? (this.__get__data()[2]) : ("");
        var _loc9 = this.__get__data()[3] ? (this.__get__data()[3]) : ("");
        var _loc10 = this.__get__data()[4] ? (this.__get__data()[4]) : ("");
        this.indentLabel(_loc9 != undefined && _loc10 != undefined && _loc9 != "" && _loc10 != "");
        feedImgDefaultMC = this.loadFeedTexture(feedImgDefaultMC, feedImgContainer1, "feedImgDefault", _loc9, _loc10, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_X, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_Y, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH, fadeDefaultImgIn);
        labelMC.subtitleTF.htmlText = this.parseForFonts(_loc15);
        bodyMC.bodyTF.autoSize = "left";
        bodyMC.bodyTF.multiline = true;
        bodyMC.bodyTF.wordWrap = true;
        bodyMC.bodyTF.htmlText = this.parseForFonts(_loc12);
        placeholderImgMC._visible = true;
        switch (type)
        {
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.AWARD:
            {
                var _loc11 = this.__get__data()[5];
                com.rockstargames.ui.utils.Colour.ApplyHudColour(feedImgDefaultMC, _loc11);
                com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(labelMC.subtitleTF, _loc11);
                break;
            } 
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.UNLOCK:
            {
                this.indentLabel(true);
                placeholderImgMC._visible = false;
                iconMC._visible = true;
                iconMC.gotoAndStop(this.__get__data()[5] + 1);
                break;
            } 
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TOOLTIPS:
            {
                if (textIconLayerMC != undefined)
                {
                    textIconLayerMC.removeMovieClip();
                } // end if
                textIconLayerMC = this.createEmptyMovieClip("textIconLayerMC", this.getNextHighestDepth());
                textIconLayerMC._x = bodyMC._x;
                textIconLayerMC._y = 3;
                var _loc17 = new com.rockstargames.ui.utils.Text();
                _loc17.setTextWithIcons(_loc12, textIconLayerMC, bodyMC.bodyTF, 0, 13, 3, false);
            } 
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TICKER:
            {
                placeholderImgMC._visible = false;
                bodyMC._y = 3;
                break;
            } 
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.CREW_TAG:
            {
                if (crewTagMC == undefined)
                {
                    crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", this.getNextHighestDepth(), {_x: com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_X + com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH + 14, _y: com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_Y + 6, _xscale: 70, _yscale: 70});
                } // end if
                crewTagMC.UNPACK_CREW_TAG(this.__get__data()[5]);
                break;
            } 
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.DLC:
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.MSGPICTURE:
            {
                feedImgSecondaryMC = this.loadFeedTexture(feedImgSecondaryMC, feedImgContainer2, "feedImgSecondary", this.__get__data()[5], this.__get__data()[6], com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_X, com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_Y, 163, 64, fadeSecondaryImgIn);
                bodyMC._y = 72;
                break;
            } 
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.HEIST:
            {
                placeholderImgMC._visible = true;
                bodyMC._visible = false;
                var _loc13 = this.__get__data()[7];
                var _loc6 = _loc13 ? (48) : (21);
                var _loc7 = _loc13 ? (6) : (54);
                var _loc3 = 5;
                var _loc4 = 0;
                while (this.__get__data()[_loc3])
                {
                    var _loc5 = _loc6 + _loc4 * com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.STAT_HEIGHT;
                    this.setStat(_loc4, this.__get__data()[_loc3], this.__get__data()[_loc3 + 1], com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE, _loc7, _loc5, 6);
                    ++_loc4;
                    _loc3 = _loc3 + 2;
                } // end while
                break;
            } 
            case com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.STATS:
            {
                placeholderImgMC._visible = true;
                bodyMC._visible = false;
                var _loc14 = this.__get__data()[5] ? (this.__get__data()[5]) : (0);
                var _loc16 = this.__get__data()[6] ? (this.__get__data()[6]) : (0);
                var _loc8 = this.__get__data()[7] ? (this.__get__data()[7]) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
                switch (_loc9)
                {
                    case "CHAR_MICHAEL":
                    {
                        _loc8 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL;
                        break;
                    } 
                    case "CHAR_FRANKLIN":
                    {
                        _loc8 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRANKLIN;
                        break;
                    } 
                    case "CHAR_TREVOR":
                    {
                        _loc8 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR;
                        break;
                    } 
                    default:
                    {
                        _loc8 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
                        break;
                    } 
                } // End of switch
                this.setStat(0, _loc16 + _loc14, "", _loc8, 6, 33, 10);
                break;
            } 
            default:
            {
                placeholderImgMC._visible = false;
                break;
            } 
        } // End of switch
        itemTextLeft.autoSize = "left";
        itemTextLeft.multiline = true;
        itemTextLeft.wordWrap = true;
        labelMC.subtitleTF._y = labelMC.titleTF._y + labelMC.titleTF.textHeight;
        //return (this.data());
        null;
    } // End of the function
    function indentLabel(bIndent)
    {
        if (bIndent)
        {
            labelMC._x = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_X + com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuFeedItem.IMAGE_LENGTH + 5;
            itemTextLeft._width = labelMC.subtitleTF._width = 578 - itemTextLeft._x - 8;
        }
        else
        {
            labelMC._x = 5;
        } // end else if
    } // End of the function
    function parseForFonts(str)
    {
        str = str.split("<C>").join("<FONT FACE=\'$Font2_cond\' SIZE=\'15\'>");
        str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'12\'>");
        return (str);
    } // End of the function
    function parseForTitleFonts(str)
    {
        str = str.split("<C>").join("<FONT FACE=\'$Font2_cond\' SIZE=\'18\'>");
        str = str.split("</C>").join("<FONT FACE=\'$Font2\' SIZE=\'15\'>");
        return (str);
    } // End of the function
    function loadFeedTexture(loaderMC, containerMC, name, txd, txn, x, y, w, h, callback)
    {
        if (txd == undefined || txn == undefined || txd == "" || txn == "")
        {
            if (loaderMC)
            {
                loaderMC.removeTxdRef();
            } // end if
        }
        else
        {
            if (loaderMC == undefined)
            {
                loaderMC = (com.rockstargames.ui.media.ImageLoaderMC)(containerMC.attachMovie("GenericImageLoader", name, containerMC.getNextHighestDepth(), {_x: x, _y: y}));
            } // end if
            if (loaderMC.textureDict == txd)
            {
                if (loaderMC.isLoaded)
                {
                    loaderMC.init("PAUSE_MENU_SP_CONTENT", txd, txn, w, h);
                    loaderMC.displayTxdResponse(txd);
                    this.fadeImageIn(loaderMC);
                } // end if
            }
            else
            {
                if (loaderMC.isLoaded)
                {
                    loaderMC.removeTxdRef();
                } // end if
                loaderMC.init("PAUSE_MENU_SP_CONTENT", txd, txn, w, h);
                if (txd.substr(0, 5) == "CHAR_" || txn.substr(0, 5) == "HC_N_")
                {
                    var _loc5 = loaderMC.splitPath(String(loaderMC), 6);
                    loaderMC.requestTxdRef(_loc5, true, callback, this);
                }
                else
                {
                    loaderMC.addTxdRefWithPath(String(loaderMC), 6, callback, this);
                } // end else if
            } // end else if
        } // end else if
        return (loaderMC);
    } // End of the function
    function setStat(iIndex, iProgress, sName, eHudColour, x, y, h)
    {
        var _loc2 = this["statMC" + iIndex];
        if (_loc2 == undefined)
        {
            _loc2 = this.attachMovie("feedItemStat", "statMC" + iIndex, this.getNextHighestDepth(), {_x: x, _y: y});
            _loc2.progBarMC = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(_loc2.progBarMC);
            _loc2.progBarMC.mc._height = _loc2.barMaskMC._height = h;
        } // end if
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(_loc2.progBarMC).init(eHudColour);
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar)(_loc2.progBarMC).percent(iProgress);
        _loc2.nameTF.text = sName;
    } // End of the function
    function getHeight()
    {
        return (type == com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TICKER || type == com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TOOLTIPS ? (bodyMC._y + bodyMC.bodyTF.textHeight) : (_height));
    } // End of the function
    function onDestroy()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(feedImgDefaultMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(feedImgSecondaryMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(placeholderImgMC);
        if (feedImgDefaultMC.isLoaded)
        {
            feedImgDefaultMC.removeTxdRef();
        } // end if
        if (feedImgSecondaryMC.isLoaded)
        {
            feedImgSecondaryMC.removeTxdRef();
        } // end if
    } // End of the function
    function fadeDefaultImgIn()
    {
        this.fadeImageIn(feedImgDefaultMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(placeholderImgMC, com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION, {_alpha: 0, onComplete: cleanupPlaceholder, onCompleteScope: this});
    } // End of the function
    function fadeSecondaryImgIn()
    {
        this.fadeImageIn(feedImgSecondaryMC);
    } // End of the function
    function fadeImageIn(imgMC)
    {
        imgMC._alpha = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(imgMC, com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION, {_alpha: 100});
    } // End of the function
    function cleanupPlaceholder()
    {
        placeholderImgMC._visible = false;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    static var IMAGE_X = 8;
    static var IMAGE_Y = 6;
    static var IMAGE_LENGTH = 40;
    static var STAT_HEIGHT = 28;
} // End of Class
#endinitclip
