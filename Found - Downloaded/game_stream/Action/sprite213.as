// Action script...

// [Initial MovieClip Action of sprite 213]
#initclip 1
class com.rockstargames.gtav.levelDesign.GAME_STREAM extends MovieClip
{
    var TIMELINE, CONTENT, BOUNDING_BOX, _enumID, topLine, baseLine, defaultBaseLine, bigmapBaseLine, loadingscreenBaseLine, onlineBaseLine, intervalId, currentHeight;
    function GAME_STREAM()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX = TIMELINE.attachMovie("BOUNDING_BOX", "BOUNDING_BOX", TIMELINE.getNextHighestDepth());
        BOUNDING_BOX._visible = false;
        CONTENT.debug_top._visible = false;
        CONTENT.debug_bottom._visible = false;
        componentList = [];
        this.SHOW();
        this.SET_DISPLAY_CONFIG(screenWidth, screenHeight, 0.040000, 0.960000, 0.040000, 0.960000, true, false);
        CONTENT.debug_top._visible = false;
        CONTENT.debug_bottom._visible = false;
        CONTENT.debug_stage._visible = false;
        com.rockstargames.ui.game.GameInterface.call("GAME_STREAM_INITIALISED", SF_BASE_CLASS_GAMESTREAM);
    } // End of the function
    function READY(id)
    {
        _enumID = id;
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept)
    {
        safeLeft = _safeLeftPercent * _screenWidthPixels;
        safeRight = (1 - _safeRightPercent) * _screenWidthPixels;
        safeTop = _safeTopPercent * _screenHeightPixels * 2;
        safeBottom = _screenHeightPixels;
        screenWidth = _screenWidthPixels;
        screenHeight = _screenHeightPixels;
        isWideScreen = _isWideScreen;
        isCircleAccept = _isCircleAccept;
        topLine = safeTop + helpTextHeight * screenHeight;
        this.adjustBaselines();
        switch (mapVisibleState)
        {
            case 0:
            case 1:
            {
                baseLine = screenHeight;
                break;
            } 
            case 2:
            {
                baseLine = defaultBaseLine;
                break;
            } 
            case 3:
            {
                baseLine = bigmapBaseLine;
                break;
            } 
            case 4:
            {
                baseLine = loadingscreenBaseLine;
                break;
            } 
            default:
            {
                baseLine = onlineBaseLine;
                break;
            } 
        } // End of switch
        this.reorderListComponents();
        if (debugIsEnabled == true)
        {
            this.redraw_debug_lines();
        } // end if
    } // End of the function
    function SET_HELPTEXT_HEIGHT(_helpTextHeight)
    {
        helpTextHeight = _helpTextHeight;
        topLine = safeTop + helpTextHeight * screenHeight;
        this.reorderListComponents();
        if (debugIsEnabled == true)
        {
            this.redraw_debug_lines();
        } // end if
    } // End of the function
    function adjustBaselines()
    {
        defaultBaseLine = screenHeight - minimapSizeY;
        bigmapBaseLine = screenHeight - bigmapSizeY;
        loadingscreenBaseLine = screenHeight - loadingLogoSize;
        onlineBaseLine = screenHeight - onlineLogoSize;
        baseLine = defaultBaseLine;
    } // End of the function
    function showContent()
    {
        this.SHOW();
        CONTENT._visible = true;
        clearInterval(intervalId);
    } // End of the function
    function SET_MINIMAP_VISIBLE_STATE(_mapVisibleState)
    {
        mapVisibleState = _mapVisibleState;
        this.adjustBaselines();
        switch (mapVisibleState)
        {
            case 0:
            case 1:
            {
                baseLine = screenHeight;
                break;
            } 
            case 2:
            {
                baseLine = defaultBaseLine;
                break;
            } 
            case 3:
            {
                baseLine = bigmapBaseLine;
                break;
            } 
            case 4:
            {
                baseLine = loadingscreenBaseLine;
                break;
            } 
            default:
            {
                baseLine = onlineBaseLine;
                break;
            } 
        } // End of switch
        this.reorderListComponents();
        if (debugIsEnabled == true)
        {
            this.redraw_debug_lines();
        } // end if
    } // End of the function
    function SET_IMPORTANT_PARAMS(bgR, bgG, bgB, _flashAlpha, _flashRate)
    {
        com.rockstargames.ui.utils.Debug.log("SET_IMPORTANT_PARAMS bgR:" + bgR + " bgG:" + bgG + " bgB:" + bgB + " _flashAlpha:" + _flashAlpha + " _flashRate:" + _flashRate);
        flashAlpha = _flashAlpha;
        timerDuration = _flashRate;
        bgColour[0] = bgR;
        bgColour[1] = bgG;
        bgColour[2] = bgB;
    } // End of the function
    function createStreamComponent(type, id)
    {
        var _loc6 = CONTENT.getNextHighestDepth();
        var _loc4 = "comp" + type;
        var _loc5 = _loc4 + id;
        var _loc3 = CONTENT.attachMovie(_loc4, _loc5 + "MC", _loc6, {_visible: false, _y: baseLine});
        var _loc2 = new com.rockstargames.gtav.levelDesign.StreamShuffleObj();
        _loc2.storeId = _loc5;
        _loc2.mc = _loc3;
        _loc2.id = id;
        _loc2.ypos = baseLine - (_loc3.Background._height + spacing);
        _loc2.type = type;
        _loc2.priority = 0;
        componentList.push(_loc2);
        return (_loc2);
    } // End of the function
    function getStreamComponent(type, id)
    {
        var _loc3;
        var _loc4;
        for (var _loc2 = 0; _loc2 < componentList.length; ++_loc2)
        {
            _loc3 = componentList[_loc2];
            if (_loc3.type == type && _loc3.id == id)
            {
                _loc4 = _loc3;
                break;
            } // end if
        } // end of for
        return (_loc4);
    } // End of the function
    function shuffleStreamComponents(currComp)
    {
        var _loc6 = baseLine;
        var _loc12;
        if (componentList.length > 1)
        {
            var _loc2;
            var _loc11 = false;
            for (var _loc5 = 0; _loc5 < componentList.length; ++_loc5)
            {
                var _loc7 = componentList[_loc5];
                _loc2 = _loc7;
                if (currComp.priority <= _loc2.priority)
                {
                    currComp.ypos = currComp.mc._y = baseLine - (_loc2.mc.Background._height + spacing);
                    componentList.splice(_loc5, 0, currComp);
                    componentList.pop();
                    _loc11 = true;
                    break;
                } // end if
                if (_loc2.ypos < _loc6)
                {
                    _loc6 = _loc2.ypos;
                } // end if
                if (currComp.storeId == _loc7.storeId)
                {
                    break;
                } // end if
            } // end of for
            if (_loc11)
            {
                var _loc13 = componentList[0];
                _loc13.ypos = _loc13.mc._y = baseLine - _loc13.mc.Background._height;
                var _loc8 = _loc13.ypos;
                for (var _loc4 = 1; _loc4 < componentList.length; ++_loc4)
                {
                    _loc2 = componentList[_loc4];
                    _loc8 = _loc8 - (_loc2.mc.Background._height + spacing);
                    _loc2.ypos = _loc8;
                    if (_loc2 == currComp)
                    {
                        _loc2.mc._alpha = 0;
                    } // end if
                    if (_loc8 < topLine)
                    {
                        _loc2.mc._visible = false;
                    }
                    else
                    {
                        if (_loc2.mc._visible == false)
                        {
                            _loc2.mc._alpha = 0;
                        } // end if
                        _loc2.mc._visible = true;
                    } // end else if
                    com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2.mc, 0.200000, {_alpha: 100, _y: _loc2.ypos, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [_loc2.mc]});
                    _loc2.mc._visible = true;
                    _loc12 = _loc4;
                    if (_loc2.ypos < _loc6)
                    {
                        _loc6 = _loc2.ypos;
                    } // end if
                } // end of for
            } // end if
        }
        else
        {
            var _loc10 = componentList[0];
            _loc10.ypos = _loc10.mc._y = baseLine - _loc10.mc.Background._height;
            _loc6 = _loc10.ypos;
            if (_loc10.mc._y < topLine)
            {
                if (_loc10.mc != undefined)
                {
                    com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc10.mc);
                } // end if
                com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc10.mc, 0.200000, {_y: baseLine, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [_loc10.mc]});
            } // end if
        } // end else if
        currentHeight = _loc6;
        this.animateInComplete(currComp.mc);
    } // End of the function
    function animateInComplete(comp)
    {
        (com.rockstargames.gtav.levelDesign.BaseGameStreamComponent)(comp).STREAM_COMP_READY();
    } // End of the function
    function reorderListComponents()
    {
        var _loc5 = baseLine;
        var _loc2;
        var _loc7;
        _loc7 = componentList[0];
        _loc7.ypos = _loc7.mc._y = baseLine - _loc7.mc.Background._height;
        var _loc6;
        var _loc4 = _loc7.ypos;
        for (var _loc3 = 1; _loc3 < componentList.length; ++_loc3)
        {
            _loc2 = componentList[_loc3];
            _loc4 = _loc4 - (_loc2.mc.Background._height + spacing);
            _loc2.ypos = _loc4;
            if (_loc4 < topLine)
            {
                _loc2.mc._visible = false;
            }
            else
            {
                if (_loc2.mc._visible == false)
                {
                    _loc2.mc._alpha = 0;
                } // end if
                _loc2.mc._visible = true;
            } // end else if
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2.mc);
            _loc2.mc._y = _loc2.ypos;
            _loc6 = _loc3;
            if (_loc2.ypos < _loc5)
            {
                _loc5 = _loc2.ypos;
            } // end if
        } // end of for
        currentHeight = _loc5;
    } // End of the function
    function deleteStreamComponent(type, id)
    {
        var _loc2;
        var _loc4 = componentList.length;
        for (var _loc3 = 0; _loc3 < _loc4; ++_loc3)
        {
            _loc2 = componentList[_loc3];
            if (_loc2.type == type && _loc2.id == id)
            {
                if (_loc2.mc != undefined)
                {
                    (com.rockstargames.gtav.levelDesign.BaseGameStreamComponent)(_loc2.mc).CLEAR_TXD();
                    com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc2.mc);
                    (com.rockstargames.gtav.levelDesign.BaseGameStreamComponent)(_loc2.mc).removeMovieClip();
                    componentList.splice(_loc3, 1);
                    this.reorderListComponents();
                    break;
                } // end if
            } // end if
        } // end of for
        if (componentList.length == 0)
        {
            com.rockstargames.ui.game.GameInterface.call("GAME_STREAM_EMPTY", SF_BASE_CLASS_GAMESTREAM);
        } // end if
    } // End of the function
    function willComponentFit(compHeight, compID)
    {
        var _loc2 = true;
        if (currentHeight - (compHeight + spacing) < topLine)
        {
            _loc2 = false;
            com.rockstargames.ui.game.GameInterface.call("STREAM_ITEM_FAILED", com.rockstargames.ui.game.GameInterface.HUD_TYPE, compID);
        } // end if
        return (_loc2);
    } // End of the function
    function validateComponent(comp)
    {
        if (this.willComponentFit(comp.mc.Background._height, comp.id))
        {
            comp.mc._visible = true;
            if ((comp.type == com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.MSGPICTURE || comp.type == com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.MSGTEXT) && playSound)
            {
                com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "DPAD_WEAPON_SCROLL", "HUD_FRONTEND_DEFAULT_SOUNDSET");
            } // end if
            com.rockstargames.ui.game.GameInterface.call("STREAM_ITEM_SHOWN", SF_BASE_CLASS_GAMESTREAM, comp.id);
            this.shuffleStreamComponents(comp);
        }
        else
        {
            this.deleteStreamComponent(comp.type, comp.id);
        } // end else if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        if (success == true)
        {
            var tempArray = uniqueID.split(".");
            var MCstring = tempArray[0];
            if (this.CONTENT[MCstring] == undefined)
            {
                com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "GAME_STREAM", textureDict);
            }
            else
            {
                var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(this.CONTENT + "." + uniqueID));
                if (il != undefined)
                {
                    il.displayTxdResponse(textureDict, success);
                } // end if
            } // end if
        } // end else if
    } // End of the function
    function TXD_ALREADY_LOADED(textureDict, uniqueID)
    {
        var tempArray = uniqueID.split(".");
        var MCstring = tempArray[0];
        if (this.CONTENT[MCstring] == undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "GAME_STREAM", textureDict);
        }
        else
        {
            var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(this.CONTENT + "." + uniqueID));
            if (il != undefined)
            {
                il.displayTxdResponse(textureDict, true);
            } // end if
        } // end else if
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID)
    {
        var tempArray = uniqueID.split(".");
        var MCstring = tempArray[0];
        if (this.CONTENT[MCstring] == undefined)
        {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "GAME_STREAM", textureDict);
        }
        else
        {
            var il = (com.rockstargames.ui.media.ImageLoaderMC)(eval(this.CONTENT + "." + uniqueID));
            if (il != undefined)
            {
                il.displayTxdResponse(textureDict, true);
            } // end if
        } // end else if
    } // End of the function
    function SET_STREAM_COMPONENT()
    {
        com.rockstargames.ui.utils.Debug.log("Creating Stream Component: " + arguments);
        var _loc3 = this.createStreamComponent(arguments[arguments.length - 1], arguments[0]);
        (com.rockstargames.gtav.levelDesign.BaseGameStreamComponent)(_loc3.mc).INITIALISE(bgColour[0], bgColour[1], bgColour[2], flashAlpha, timerDuration, isWideScreen, isCircleAccept);
        (com.rockstargames.gtav.levelDesign.BaseGameStreamComponent)(_loc3.mc).SET_FEED_COMPONENT.apply(_loc3.mc, arguments.slice(1, arguments.length - 1));
        this.validateComponent(_loc3);
    } // End of the function
    function UPDATE_STREAM_COMPONENT()
    {
        com.rockstargames.ui.utils.Debug.log("Updating Stream Component: " + arguments);
        var _loc3 = this.getStreamComponent(arguments[arguments.length - 1], arguments[0]);
        if (_loc3 != undefined)
        {
            (com.rockstargames.gtav.levelDesign.BaseGameStreamComponent)(_loc3.mc).SET_FEED_COMPONENT.apply(_loc3.mc, arguments.slice(1));
            (com.rockstargames.gtav.levelDesign.BaseGameStreamComponent)(_loc3.mc).STREAM_COMP_READY();
            this.reorderListComponents();
        } // end if
    } // End of the function
    function REMOVE_STREAM_COMPONENT(compTypeIndex, compType)
    {
        com.rockstargames.ui.utils.Debug.log("Removing Stream Component: " + arguments);
        this.deleteStreamComponent(compType, compTypeIndex);
    } // End of the function
    function UPDATE_STREAM_STATS()
    {
        arguments.push(com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.STATS);
        UPDATE_STREAM_COMPONENT.apply(this, arguments);
    } // End of the function
    function UPDATE_STREAM_TICKER()
    {
        arguments.push(com.rockstargames.gtav.levelDesign.GAME_STREAM_ENUMS.TICKER);
        UPDATE_STREAM_COMPONENT.apply(this, arguments);
    } // End of the function
    function SHOW()
    {
        playSound = true;
    } // End of the function
    function HIDE()
    {
        playSound = false;
    } // End of the function
    function ENABLE_DEBUG(_debugIsEnabled)
    {
        debugIsEnabled = _debugIsEnabled;
        CONTENT.debug_top._visible = debugIsEnabled;
        CONTENT.debug_bottom._visible = debugIsEnabled;
        CONTENT.debug_stage._visible = debugIsEnabled;
        this.redraw_debug_lines();
    } // End of the function
    function redraw_debug_lines()
    {
        CONTENT.debug_top._y = topLine;
        CONTENT.debug_bottom._y = baseLine;
        CONTENT.debug_top.gotoAndPlay(2);
        CONTENT.debug_bottom.gotoAndPlay(2);
    } // End of the function
    var componentList = new Array();
    var spacing = 2;
    var SF_BASE_CLASS_GAMESTREAM = 8;
    var helpTextHeight = 0;
    var mapVisibleState = 0;
    var minimapPosY = 0;
    var minimapSizeY = 132;
    var bigmapPosY = 0;
    var bigmapSizeY = 308;
    var onlineLogoSize = 190;
    var loadingLogoSize = 195;
    var screenWidth = 1280;
    var screenHeight = 720;
    var safeTop = 36;
    var safeBottom = 36;
    var safeLeft = 64;
    var safeRight = 64;
    var isWideScreen = true;
    var isCircleAccept = false;
    var debugIsEnabled = false;
    var timer = 20;
    var timercount = 0;
    var timerDuration = 3;
    var flashAlpha = 80;
    var bgColour = [0, 0, 0];
    var playSound = true;
} // End of Class
#endinitclip
