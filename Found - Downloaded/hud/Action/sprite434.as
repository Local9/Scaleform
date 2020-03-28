// Action script...

// [Initial MovieClip Action of sprite 434]
#initclip 22
class com.rockstargames.gtav.Multiplayer.MP_RANK_BAR extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var _queue, ON_SCREEN_DURATION, myColour, myColourDark, TIMELINE, CONTENT, BOUNDING_BOX, _enumID, leftText, rightText, rankText, rankTextWhite, bar, barChangedAmount, _nextRankLimit, _difBetweenRanks, _howFarIntoThisRankCurrently, _howFarIntoThisRankNow, _previousXPPercentage, _newXPPercentage, _playersPreviousXP, _playersCurrentXP, _playersTickingXP, FADE_DURATION, _HUD;
    function MP_RANK_BAR()
    {
        super();
        _queue = [];
        ON_SCREEN_DURATION = 4000;
        myColour = new com.rockstargames.ui.utils.HudColour();
        myColourDark = new com.rockstargames.ui.utils.HudColour();
    } // End of the function
    function INITIALISE()
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
    } // End of the function
    function READY(id)
    {
        _enumID = id;
        leftText = CONTENT.rankIconLeft.rankTF;
        rightText = CONTENT.rankIconRight.rankTF;
        rankText = CONTENT.rankText;
        rankTextWhite = CONTENT.rankTextWhite;
        bar = CONTENT.barParent.barScaler;
        barChangedAmount = CONTENT.barParent.barScalerChange;
        bar.mask._xscale = 0;
        barChangedAmount.mask._xscale = 0;
        CONTENT._alpha = 0;
    } // End of the function
    function RESET_MOVIE()
    {
    } // End of the function
    function SET_COLOUR(params)
    {
        var _loc3 = params[0];
        var _loc2 = params[1];
        com.rockstargames.ui.utils.Colour.setHudColour(_loc3, myColour);
        com.rockstargames.ui.utils.Colour.setHudColour(_loc2, myColourDark);
        com.rockstargames.ui.utils.Colour.Colourise(bar, myColour.r, myColour.g, myColour.b);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.rankIconLeft, myColour.r, myColour.g, myColour.b);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.rankIconRight, myColour.r, myColour.g, myColour.b);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.barParent.barTrough, myColourDark.r, myColourDark.g, myColourDark.b);
    } // End of the function
    function OVERRIDE_ANIMATION_SPEED(params)
    {
        var _loc2 = params[0];
        _animationDuration = _loc2 / 1000;
    } // End of the function
    function OVERRIDE_ONSCREEN_DURATION(params)
    {
        var _loc2 = params[0];
        ON_SCREEN_DURATION = _loc2;
    } // End of the function
    function SET_BAR_TEXT(params)
    {
        var _loc2 = params[0];
        var _loc3 = params[1];
        myAlpha = _loc3 == undefined ? (100) : (_loc3);
        this.SHOW();
        _showRankXP = false;
        rankText.text = _loc2;
        rankTextWhite.text = _loc2;
    } // End of the function
    function RESET_BAR_TEXT()
    {
        _showRankXP = true;
    } // End of the function
    function SET_RANK_SCORES(params)
    {
        var _loc7 = params[0];
        var _loc3 = params[1];
        var _loc6 = params[2];
        var _loc4 = params[3];
        var _loc5 = params[4];
        var _loc8 = params[5];
        myAlpha = _loc8 == undefined ? (100) : (_loc8);
        if (_isAnimatingRank)
        {
            _queue.push([_loc7, _loc3, _loc6, _loc4, _loc5]);
        }
        else
        {
            _isAnimatingRank = true;
            this.animatateScores(_loc7, _loc3, _loc6, _loc4, _loc5);
        } // end else if
        return (true);
    } // End of the function
    function animatateScores(currentRankLimit, nextRankLimit, playersPreviousXP, playersCurrentXP, rank)
    {
        this.SHOW();
        if (rank >= 100)
        {
            CONTENT.rankIconRight.gotoAndStop(2);
            CONTENT.rankIconLeft.gotoAndStop(2);
        } // end if
        leftText.text = String(rank);
        rightText.text = String(rank + 1);
        _showRankUp = playersCurrentXP == nextRankLimit;
        _isIncreasingRank = playersPreviousXP < playersCurrentXP;
        _nextRankLimit = nextRankLimit;
        _difBetweenRanks = _nextRankLimit - currentRankLimit;
        _howFarIntoThisRankCurrently = playersPreviousXP - currentRankLimit;
        _howFarIntoThisRankNow = playersCurrentXP - currentRankLimit;
        _previousXPPercentage = _howFarIntoThisRankCurrently / _difBetweenRanks * 100;
        _newXPPercentage = _howFarIntoThisRankNow / _difBetweenRanks * 100;
        _playersPreviousXP = playersPreviousXP;
        _playersCurrentXP = playersCurrentXP;
        _playersTickingXP = _playersPreviousXP;
        bar.mask._xscale = _previousXPPercentage;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(bar.mask, _animationDuration, {_xscale: _newXPPercentage});
        barChangedAmount.mask._xscale = _newXPPercentage;
        if (_showRankXP)
        {
            rankText.text = playersPreviousXP + " / " + nextRankLimit;
            rankTextWhite.text = playersPreviousXP + " / " + nextRankLimit;
        } // end if
        _increment = this.calcIncrement(_howFarIntoThisRankNow - _howFarIntoThisRankCurrently);
        TIMELINE.onEnterFrame = function ()
        {
            TIMELINE.tickUnderRank();
        };
    } // End of the function
    function tickUnderRank()
    {
        if (_isIncreasingRank)
        {
            _playersTickingXP = _playersTickingXP + _increment;
            if (_playersTickingXP >= _playersCurrentXP)
            {
                TIMELINE.onEnterFrame = null;
                _playersTickingXP = _playersCurrentXP;
                _isAnimatingRank = false;
                this.checkQueuedItems();
            } // end if
        }
        else
        {
            _playersTickingXP = _playersTickingXP + _increment;
            if (_playersTickingXP <= _playersCurrentXP)
            {
                TIMELINE.onEnterFrame = null;
                _playersTickingXP = _playersCurrentXP;
                _isAnimatingRank = false;
                this.checkQueuedItems();
            } // end if
        } // end else if
        if (_showRankXP)
        {
            rankText.text = Math.round(_playersTickingXP) + " / " + _nextRankLimit;
            rankTextWhite.text = Math.round(_playersTickingXP) + " / " + _nextRankLimit;
        } // end if
    } // End of the function
    function calcIncrement(difBetweenRanks)
    {
        return (difBetweenRanks / 30 / _animationDuration);
    } // End of the function
    function checkQueuedItems()
    {
        if (_showRankUp)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.rankIconLeft, 0.100000, {onComplete: checkQueuedItems, onCompleteScope: this});
            _showRankUp = false;
            return;
        } // end if
        if (_queue.length > 0)
        {
            this.SET_RANK_SCORES([_queue[0][0], _queue[0][1], _queue[0][2], _queue[0][3], _queue[0][4]]);
            _queue.shift();
        }
        else
        {
            this.SHOW();
        } // end else if
    } // End of the function
    function SHOW()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, 0.100000, {_alpha: myAlpha, onComplete: STAY_ON_SCREEN, onCompleteScope: this});
    } // End of the function
    function STAY_ON_SCREEN()
    {
        if (!_isAnimatingRank)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, ON_SCREEN_DURATION / 1000, {onComplete: HIDE, onCompleteScope: this});
        } // end if
    } // End of the function
    function FADE_BAR_OUT(params)
    {
        var _loc2 = params[0];
        if (_loc2)
        {
            this.REMOVE();
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, _animationDuration, {_alpha: 0, onComplete: REMOVE, onCompleteScope: this});
        } // end else if
    } // End of the function
    function HIDE()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, FADE_DURATION / 1000, {_alpha: 0, onComplete: REMOVE, onCompleteScope: this});
    } // End of the function
    function REMOVE()
    {
        _queue = [];
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.rankIconLeft);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(bar.mask);
        TIMELINE.onEnterFrame = null;
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
    function debug()
    {
        com.rockstargames.ui.utils.Colour.Colourise(bar, 144, 111, 178);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.rankIconLeft, 144, 111, 178);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.rankIconRight, 144, 111, 178);
        com.rockstargames.ui.utils.Colour.Colourise(barChangedAmount, 72, 55, 89);
        this.OVERRIDE_ANIMATION_SPEED([1000]);
    } // End of the function
    var _increment = 5;
    var _animationDuration = 1;
    var _onScreenDuration = 500;
    var _isIncreasingRank = true;
    var _isAnimatingRank = false;
    var _showRankXP = true;
    var _showRankUp = false;
    var myAlpha = 100;
} // End of Class
#endinitclip
