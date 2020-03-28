// Action script...

// [Initial MovieClip Action of sprite 131]
#initclip 5
class com.rockstargames.gtav.Multiplayer.MP_BIG_MESSAGE_FREEMODE extends com.rockstargames.ui.core.BaseScreenLayout
{
    var SINGLE_TEXT_HEIGHT, BIG_TEXT_OUTLINE_STRENGTH, BigMessageMaster, CONTENT, screenHeightPixels, isAnimating, crewEmblemImg, MESSAGE_POSITION, RankIconImageMC, BigMessageTF, BigMessageTextMC, IconNameTF, RankUpIconMC, strapline_background, weaponPurchased, hasMsgBG, showDoubleBG;
    function MP_BIG_MESSAGE_FREEMODE()
    {
        super();
        _global.gfxExtensions = true;
        SINGLE_TEXT_HEIGHT = 26;
        BIG_TEXT_OUTLINE_STRENGTH = 9;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function createMessage(linkageID, args)
    {
        var _loc3 = args[0];
        var _loc6 = args[1];
        var _loc4 = args[2];
        var _loc5 = args[3];
        var _loc8 = args[4];
        if (BigMessageMaster != undefined)
        {
            BigMessageMaster.removeMovieClip();
        } // end if
        BigMessageMaster = CONTENT.attachMovie(linkageID, linkageID, ENFORCED_DEPTH, {_x: 640, _alpha: _loc4 == undefined ? (100) : (_loc4)});
        BigMessageMaster.BIG_TEXT.textAutoSize = "shrink";
        BigMessageMaster.BIG_TEXT.htmlText = _loc3;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(BigMessageMaster.BLACK_BAR_DOUBLE.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(BigMessageMaster.BLACK_BAR_SINGLE.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        this.UPDATE_STRAP_MESSAGE(_loc6);
        if (_loc5)
        {
            bigTextDestY = BigMessageMaster.BIG_TEXT._y;
            BigMessageMaster.BIG_TEXT._y = (screenHeightPixels - BigMessageMaster.BIG_TEXT.textHeight) * 0.500000;
            isAnimating = true;
            this.saveStrapStateOnAnimate();
        }
        else if (linkageID == "GENERIC_CENTRAL_MESSAGE" && !BigMessageMaster.BLACK_BAR_DOUBLE._visible && !BigMessageMaster.BLACK_BAR_SINGLE._visible)
        {
            BigMessageMaster.BIG_TEXT._y = (screenHeightPixels - BigMessageMaster.BIG_TEXT.textHeight) * 0.500000;
        } // end else if
        this.setBigMessageOutline(_loc3);
    } // End of the function
    function setBigMessageOutline(bigTextStr)
    {
        BigMessageMaster.BIG_TEXT_OUTLINE.textAutoSize = "shrink";
        BigMessageMaster.BIG_TEXT_OUTLINE.outline = BIG_TEXT_OUTLINE_STRENGTH;
        BigMessageMaster.BIG_TEXT_OUTLINE._y = BigMessageMaster.BIG_TEXT._y;
        BigMessageMaster.BIG_TEXT_OUTLINE.htmlText = bigTextStr;
        BigMessageMaster.BIG_TEXT_OUTLINE.textColor = 0;
    } // End of the function
    function SHOW_BUSTED_MP_MESSAGE()
    {
        this.createMessage("GENERIC_CENTRAL_MESSAGE", arguments);
    } // End of the function
    function SHOW_WASTED_MP_MESSAGE()
    {
        this.createMessage("GENERIC_CENTRAL_MESSAGE", arguments);
    } // End of the function
    function SHOW_RANKUP_MP_MESSAGE(bigText)
    {
        var _loc6;
        if (BigMessageMaster != undefined)
        {
            BigMessageMaster.removeMovieClip();
        } // end if
        var _loc7 = arguments[3];
        BigMessageMaster = CONTENT.attachMovie("MASTER_RANK_UP", "MASTER_RANK_UP", ENFORCED_DEPTH, {_x: 640, _alpha: _loc7 == undefined ? (100) : (_loc7)});
        BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
        BigMessageMaster.RANK_ICON._visible = false;
        var _loc4 = arguments[1];
        var _loc3 = arguments[2];
        BigMessageMaster.BIG_TEXT.textAutoSize = "shrink";
        BigMessageMaster.BIG_TEXT.htmlText = bigText;
        this.setBigMessageOutline(bigText);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(BigMessageMaster.BLACK_BAR_SINGLE.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        if (_loc4 != "" && _loc4 != undefined)
        {
            BigMessageMaster.MESSAGE_TEXT.htmlText = _loc4;
            var _loc5 = new flash.geom.Point(BigMessageMaster.MESSAGE_TEXT.textWidth, BigMessageMaster.MESSAGE_TEXT.textHeight);
            BigMessageMaster.BLACK_BAR_SINGLE._width = _loc5.x + 10 + PADDING + BigMessageMaster.RANK_ICON._width;
            BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
            _loc6 = _loc5.x + 10 + BigMessageMaster.RANK_ICON._width;
            BigMessageMaster.RANK_ICON._x = -_loc6 / 2;
            BigMessageMaster.MESSAGE_TEXT._x = BigMessageMaster.RANK_ICON._x + BigMessageMaster.RANK_ICON._width + 10;
        } // end if
        BigMessageMaster.RANK_ICON._visible = Number(_loc3) > 0;
        if (Number(_loc3) > 0 && _loc3 != undefined)
        {
            if (Number(_loc3) > 99)
            {
                BigMessageMaster.RANK_ICON.RANK_THREE_DIGITS.htmlText = _loc3;
                BigMessageMaster.RANK_ICON.RANK_THREE_DIGITS._visible = true;
                BigMessageMaster.RANK_ICON.RANK_DIGITS._visible = false;
            }
            else
            {
                BigMessageMaster.RANK_ICON.RANK_DIGITS.htmlText = _loc3;
                BigMessageMaster.RANK_ICON.RANK_DIGITS._visible = true;
                BigMessageMaster.RANK_ICON.RANK_THREE_DIGITS._visible = false;
            } // end else if
        }
        else
        {
            BigMessageMaster.MESSAGE_TEXT._x = -_loc6 / 2 - 10;
        } // end else if
    } // End of the function
    function UPDATE_STRAP_MESSAGE(msgText)
    {
        if (msgText == undefined)
        {
            msgText = "";
        } // end if
        BigMessageMaster.BLACK_BAR_DOUBLE._visible = false;
        BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
        BigMessageMaster.MESSAGE_TEXT.htmlText = msgText;
        BigMessageMaster.MESSAGE_TEXT.autosize = true;
        if (msgText != "" && msgText != undefined)
        {
            var _loc2 = new flash.geom.Point(BigMessageMaster.MESSAGE_TEXT.textWidth, BigMessageMaster.MESSAGE_TEXT.textHeight);
            if (_loc2.y > SINGLE_TEXT_HEIGHT)
            {
                BigMessageMaster.BLACK_BAR_DOUBLE._visible = true;
                BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
                BigMessageMaster.BLACK_BAR_DOUBLE._width = _loc2.x + 100;
            }
            else
            {
                BigMessageMaster.BLACK_BAR_DOUBLE._visible = false;
                BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
                BigMessageMaster.BLACK_BAR_SINGLE._width = _loc2.x + 100;
            } // end if
        } // end else if
        if (isAnimating)
        {
            this.saveStrapStateOnAnimate();
        } // end if
    } // End of the function
    function SHOW_CREW_RANKUP_MP_MESSAGE(titleStr, msgStr, rankNumber, emblemTXD, emblemTXN, alpha)
    {
        var _loc5;
        if (BigMessageMaster != undefined)
        {
            BigMessageMaster.removeMovieClip();
        } // end if
        BigMessageMaster = CONTENT.attachMovie("MASTER_CREW_RANK_UP", "MASTER_CREW_RANK_UP", ENFORCED_DEPTH, {_x: 640, _alpha: alpha == undefined ? (100) : (alpha)});
        BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
        BigMessageMaster.CREW_RANK_ICON._visible = false;
        BigMessageMaster.BIG_TEXT.textAutoSize = "shrink";
        BigMessageMaster.BIG_TEXT.htmlText = titleStr;
        this.setBigMessageOutline(titleStr);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(BigMessageMaster.BLACK_BAR_SINGLE.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        var _loc2 = 0;
        if (msgStr != "" && msgStr != undefined)
        {
            BigMessageMaster.MESSAGE_TEXT.htmlText = msgStr;
            var _loc3 = new flash.geom.Point(BigMessageMaster.MESSAGE_TEXT.textWidth, BigMessageMaster.MESSAGE_TEXT.textHeight);
            BigMessageMaster.BLACK_BAR_SINGLE._width = _loc3.x + 10 + PADDING + BigMessageMaster.CREW_RANK_ICON._width;
            BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
            _loc5 = _loc3.x + 10 + BigMessageMaster.CREW_RANK_ICON._width;
            _loc2 = -_loc5 / 2 - 50;
            BigMessageMaster.CREW_RANK_ICON._x = _loc2;
            _loc2 = _loc2 + (BigMessageMaster.CREW_RANK_ICON._width + 10);
        } // end if
        BigMessageMaster.CREW_RANK_ICON._visible = Number(rankNumber) > 0;
        if (Number(rankNumber) > 0 && rankNumber != undefined)
        {
            BigMessageMaster.CREW_RANK_ICON.RANK_DIGITS.textAutoSize = "shrink";
            BigMessageMaster.CREW_RANK_ICON.RANK_DIGITS.htmlText = rankNumber;
        } // end if
        if (!crewEmblemImg)
        {
            crewEmblemImg = (com.rockstargames.ui.media.ImageLoaderMC)(BigMessageMaster.attachMovie("GenericImageLoader", "GenericImageLoaderMC", BigMessageMaster.getNextHighestDepth(), {_x: _loc2, _y: 192}));
        } // end if
        crewEmblemImg.loadWithValidation("MP_BIG_MESSAGE_FREEMODE", emblemTXD, emblemTXN, 2, 25, 25);
        _loc2 = _loc2 + 35;
        BigMessageMaster.MESSAGE_TEXT._x = _loc2;
    } // End of the function
    function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
    {
        crewEmblemImg.displayTxdResponse(textureDict, success);
    } // End of the function
    function CLEAR_CREW_RANKUP_MP_MESSAGE()
    {
        if (BigMessageMaster != undefined)
        {
            BigMessageMaster.removeMovieClip();
        } // end if
        if (crewEmblemImg)
        {
            crewEmblemImg.removeTxdRef();
            crewEmblemImg.removeMovieClip();
            crewEmblemImg = null;
        } // end if
    } // End of the function
    function SHOW_LOCKED_UP_MP_MESSAGE()
    {
        MESSAGE_POSITION = MESSAGE_POSITION_TOP_Y;
        return (SHOW_BIG_MP_MESSAGE.apply(this, arguments));
    } // End of the function
    function SHOW_MISSION_END_MP_MESSAGE()
    {
        this.createMessage("MISSION_PASSED_FAILED", arguments);
    } // End of the function
    function SHOW_MISSION_FAILED_MP_MESSAGE()
    {
        this.createMessage("MISSION_PASSED_FAILED", arguments);
    } // End of the function
    function SHOW_MISSION_PASSED_MESSAGE()
    {
        this.createMessage("MISSION_PASSED_FAILED", arguments);
    } // End of the function
    function SHOW_WEAPON_PURCHASED(bigMessage, weaponName, weaponHash, weaponDescription, alpha)
    {
        if (BigMessageMaster != undefined)
        {
            BigMessageMaster.removeMovieClip();
        } // end if
        BigMessageMaster = CONTENT.attachMovie("WEAPON_PURCHASED", "WEAPON_PURCHASED", ENFORCED_DEPTH, {_x: 640, _alpha: alpha == undefined ? (100) : (alpha)});
        var _loc8 = 10;
        var _loc3 = BigMessageMaster.BLACK_BAR_DOUBLE;
        var _loc5 = BigMessageMaster.BLACK_BAR_SINGLE;
        var _loc2 = BigMessageMaster.WEAPON_ICON_AND_INFO.weaponIcon;
        var _loc12 = BigMessageMaster.WEAPON_ICON_AND_INFO;
        var _loc9 = BigMessageMaster.BIG_TEXT;
        var _loc4 = BigMessageMaster.WEAPON_ICON_AND_INFO.MESSAGE_TEXT;
        var _loc10 = BigMessageMaster.WEAPON_ICON_AND_INFO.DETAILS;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(BigMessageMaster.BLACK_BAR_DOUBLE.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(BigMessageMaster.BLACK_BAR_SINGLE.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        _loc3._visible = false;
        _loc2._visible = true;
        _loc5._visible = false;
        _loc9.textAutoSize = "shrink";
        _loc9.htmlText = bigMessage;
        this.setBigMessageOutline(bigMessage);
        var _loc6 = weaponName;
        if (weaponHash != -1 && weaponHash != 0)
        {
            _loc2.gotoAndStop("INT" + weaponHash);
        }
        else
        {
            _loc2.gotoAndStop(1);
        } // end else if
        _loc4._x = 0 + _loc2._x + _loc2._width + _loc8;
        if (_loc6 != "" && _loc6 != undefined)
        {
            _loc4.autoSize = "left";
            _loc4.htmlText = _loc6;
            _loc10.autoSize = true;
            var _loc7 = new flash.geom.Point(_loc4.textWidth, _loc4.textHeight);
            if (weaponDescription != undefined)
            {
                _loc2._y = 0 + _loc3._height / 2;
                _loc3._visible = true;
                _loc5._visible = false;
                _loc3._width = _loc7.x + 100 + _loc2._width;
            }
            else
            {
                _loc3._visible = false;
                _loc5._visible = true;
                _loc2._y = 0 + _loc5._height / 2;
                _loc5._width = _loc7.x + 100 + _loc2._width;
            } // end if
        } // end else if
        _loc12._x = -(_loc7.x + _loc8 + _loc2._width) / 2;
    } // End of the function
    function SHOW_TERRITORY_CHANGE_MP_MESSAGE()
    {
        MESSAGE_POSITION = MESSAGE_POSITION_TOP_Y;
        return (SHOW_BIG_MP_MESSAGE.apply(this, arguments));
    } // End of the function
    function SHOW_MP_MESSAGE_TOP()
    {
        this.createMessage("MASTER_GENERIC_SINGLE_LINE", arguments);
    } // End of the function
    function SHOW_CENTERED_MP_MESSAGE()
    {
        this.createMessage("GENERIC_CENTRAL_MESSAGE", arguments);
    } // End of the function
    function SHOW_CENTERED_TOP_MP_MESSAGE()
    {
        this.createMessage("MASTER_GENERIC_SINGLE_LINE", arguments);
    } // End of the function
    function SHOW_BIG_MP_MESSAGE_WITH_STRAP_AND_RANK()
    {
        SHOW_BIG_MP_MESSAGE.apply(this, arguments);
        var _loc3 = BIG_MSG_DURATION;
        _loc3 = _loc3 + Math.min(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION);
        _loc3 = _loc3 + (Math.max(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION) - Math.min(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION));
        return (_loc3 * 1000);
    } // End of the function
    function SHOW_BIG_MP_MESSAGE_WITH_STRAP()
    {
        SHOW_BIG_MP_MESSAGE.apply(this, arguments);
        var _loc3 = BIG_MSG_DURATION;
        _loc3 = _loc3 + Math.min(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION);
        _loc3 = _loc3 + (Math.max(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION) - Math.min(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION));
        return (_loc3 * 1000);
    } // End of the function
    function SET_RANK_ICON_RGB(r, g, b)
    {
        com.rockstargames.ui.utils.Colour.Colourise(RankIconImageMC, r, g, b);
    } // End of the function
    function SHOW_BIG_MP_MESSAGE()
    {
        this.RESET_MOVIE();
        BigMessageMaster._y = MESSAGE_POSITION;
        var _loc4 = BIG_MSG_DURATION;
        var _loc3 = arguments;
        var _loc8 = _loc3[0];
        var _loc9 = _loc3[3];
        if (_loc3[2] != undefined)
        {
            var _loc5 = _loc3[2];
            if (RankIconImageMC.numberTF != undefined)
            {
                RankIconImageMC.numberTF.htmlText = _loc5;
                if (_loc5 > 99)
                {
                    RankIconImageMC.numberTF._y = 11;
                    var _loc7 = RankIconImageMC.numberTF.getTextFormat();
                    _loc7.size = 24;
                    RankIconImageMC.numberTF.setTextFormat(_loc7);
                } // end if
            } // end if
        }
        else
        {
            RankIconImageMC.rankIconImage._visible = false;
            RankIconImageMC.gotoAndStop(1);
        } // end else if
        BigMessageTF.htmlText = _loc8;
        BigMessageTextMC._xscale = 100;
        BigMessageTextMC._yscale = 100;
        var _loc6 = _loc3[1];
        if (_loc6 != undefined)
        {
            _loc4 = _loc4 + Math.min(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION);
            _loc4 = _loc4 + (Math.max(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION) - Math.min(STRAP_MSG_DELAY_DURATION, STRAP_MSG_DURATION));
            this.playIconAnimation(_loc6);
        } // end if
        return (_loc4 * 1000);
    } // End of the function
    function playIconAnimation(iconText)
    {
        var _loc4;
        var _loc2 = RankIconImageMC.strapline_background;
        IconNameTF.htmlText = iconText;
        IconNameTF.autoSize = true;
        IconNameTF._x = 0;
        RankIconImageMC._x = IconNameTF._x + IconNameTF._width + 10;
        _loc2._width = IconNameTF.textWidth + TEXT_PADDING_LEFT + TEXT_PADDING_RIGHT;
        if (isAlignedCenter)
        {
            _loc2.gotoAndStop(2);
            IconNameTF._x = IconNameTF._parent._x * -1 - IconNameTF.textWidth / 2;
            _loc2._x = IconNameTF._x + TEXT_PADDING_LEFT;
            RankUpIconMC._alpha = 100;
        }
        else
        {
            RankUpIconMC._x = 30;
            RankUpIconMC._alpha = 100;
        } // end else if
    } // End of the function
    function TRANSITION_OUT(duration)
    {
        if (duration == undefined)
        {
            duration = 0.200000;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BigMessageMaster.BIG_TEXT);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BigMessageMaster.BIG_TEXT_OUTLINE);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(BigMessageMaster, duration, {_alpha: 0, Ease: com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(BigMessageMaster.BIG_TEXT_OUTLINE, duration * 0.750000, {_alpha: 0, Ease: com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT});
    } // End of the function
    function getStringSize(str)
    {
        CONTENT.MESSAGE_TEXT.autoSize = true;
        CONTENT.MESSAGE_TEXT.htmlText = str;
        var _loc2 = new flash.geom.Point(CONTENT.MESSAGE_TEXT.textWidth, CONTENT.MESSAGE_TEXT.textHeight);
        CONTENT.MESSAGE_TEXT.htmlText = "";
        return (_loc2);
    } // End of the function
    function RESET_MOVIE()
    {
        BigMessageTextMC._xscale = 100;
        BigMessageTextMC._yscale = 100;
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(RankUpIconMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BigMessageTextMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(RankUpIconMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BigMessageTextMC);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(BigMessageMaster.smallMessageText);
        if (BigMessageMaster != undefined)
        {
            BigMessageMaster.removeMovieClip();
        } // end if
        BigMessageMaster = CONTENT.attachMovie("BigMessage_Anim", "BigMessage_Anim", ENFORCED_DEPTH, {_x: 640, _y: 140});
        BigMessageTextMC = BigMessageMaster.BigMessageText;
        RankUpIconMC = BigMessageMaster.rankup_icon;
        IconNameTF = RankUpIconMC.nameTF;
        BigMessageTF = BigMessageTextMC.bigMessageTF;
        strapline_background = BigMessageMaster.rankup_icon.strapline_background;
        if (RankUpIconMC.rankIconImage != undefined)
        {
            RankIconImageMC = RankUpIconMC.rankIconImage;
        } // end if
        CONTENT.fullScreenBlack._alpha = 0;
        BigMessageMaster.FailedText.htmlText = "";
        BigMessageMaster.FailedText._alpha = 0;
        BigMessageMaster.smallMessageText._alpha = 0;
        weaponPurchased = BigMessageMaster.weaponPurchased;
        weaponPurchased._alpha = 0;
        weaponPurchased.weaponNameTF.htmlText = "";
    } // End of the function
    function OVERRIDE_Y_POSITION(newYPosition)
    {
        CONTENT._y = newYPosition * screenHeightPixels;
    } // End of the function
    function TRANSITION_IN(duration)
    {
    } // End of the function
    function TRANSITION_UP(duration)
    {
        if (hasMsgBG)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, duration * 0.500000, {onCompleteScope: this, onComplete: showStrapMessage});
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(BigMessageMaster.BIG_TEXT, duration, {_y: bigTextDestY, onCompleteScope: this, onComplete: transitionUpComplete});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(BigMessageMaster.BIG_TEXT_OUTLINE, duration, {_y: bigTextDestY});
    } // End of the function
    function showStrapMessage()
    {
        BigMessageMaster.MESSAGE_TEXT._visible = true;
        if (showDoubleBG)
        {
            BigMessageMaster.BLACK_BAR_DOUBLE._visible = true;
        }
        else
        {
            BigMessageMaster.BLACK_BAR_SINGLE._visible = true;
        } // end else if
    } // End of the function
    function transitionUpComplete()
    {
        isAnimating = false;
    } // End of the function
    function saveStrapStateOnAnimate()
    {
        hasMsgBG = BigMessageMaster.BLACK_BAR_DOUBLE._visible || BigMessageMaster.BLACK_BAR_SINGLE._visible;
        if (hasMsgBG)
        {
            showDoubleBG = BigMessageMaster.BLACK_BAR_DOUBLE._visible;
            BigMessageMaster.MESSAGE_TEXT._visible = false;
            BigMessageMaster.BLACK_BAR_DOUBLE._visible = false;
            BigMessageMaster.BLACK_BAR_SINGLE._visible = false;
        } // end if
    } // End of the function
    var BIG_MSG_DURATION = 0;
    var STRAP_MSG_DURATION = 0;
    var STRAP_MSG_DELAY_DURATION = 0;
    var MESSAGE_POSITION_TOP_Y = 90;
    var MESSAGE_POSITION_CENTER_Y = 240;
    var TEXT_PADDING_LEFT = 20;
    var TEXT_PADDING_RIGHT = 50;
    var isAlignedCenter = false;
    var ENFORCED_DEPTH = 100;
    var PADDING = 100;
    var bigTextDestY = 116;
    var _isPlayingMessage = false;
} // End of Class
#endinitclip
