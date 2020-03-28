// Action script...

// [Initial MovieClip Action of sprite 34]
#initclip 1
class com.rockstargames.gtav.cellphone.apps.APP_TRACKIFY extends MovieClip
{
    var TIMELINE, loadingAnim, loadingText, mainScreen, target, player, rings, sweepMC, depthArrow, depthTF, intervalIdSweep, _direction, _distance, _range, skipLoadingScreen;
    function APP_TRACKIFY()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        loadingAnim = TIMELINE.loadingAnim;
        loadingText = loadingAnim.loadingTextMc;
        mainScreen = TIMELINE.mainScreen;
        target = mainScreen.target;
        player = mainScreen.player;
        rings = mainScreen.rings;
        sweepMC = mainScreen.sweepMC;
        depthArrow = mainScreen.depthArrow;
        depthTF = mainScreen.depthTF;
        this.showDepth(false);
        loadingText.text1TF._visible = false;
        loadingText.text2TF._visible = false;
        loadingText.text3TF._visible = false;
    } // End of the function
    function CLOSE_APP()
    {
        mainScreen._visible = false;
        clearInterval(intervalIdSweep);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(loadingText);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mainScreen);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(rings);
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(target);
    } // End of the function
    function SET_TARGET(direction, distance, range, relativeDepth)
    {
        if (direction != undefined)
        {
            _direction = direction;
        } // end if
        if (distance != undefined)
        {
            _distance = distance;
        } // end if
        if (range != undefined)
        {
            _range = range;
        } // end if
        this.updateTargetPosition();
        if (_distance > _range && rings._xscale != 100)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(rings, sonarTime, {_xscale: 100, _yscale: 100, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [rings]});
        }
        else if (_distance <= _range && rings._xscale != 250)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(rings, sonarTime, {_xscale: 250, _yscale: 250, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [rings]});
        } // end else if
        if (relativeDepth != undefined)
        {
            this.displayDepth(relativeDepth);
        }
        else
        {
            this.showDepth(false);
        } // end else if
    } // End of the function
    function displayDepth(relativeDepth)
    {
        if (relativeDepth < 0)
        {
            depthArrow._rotation = 180;
            depthArrow._alpha = 100;
        }
        else if (relativeDepth > 0)
        {
            depthArrow._rotation = 0;
            depthArrow._alpha = 100;
        }
        else if (relativeDepth == 0)
        {
            depthArrow._alpha = 0;
        } // end else if
        var _loc3 = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(relativeDepth), 2);
        depthTF.text = _loc3 + "m";
        this.showDepth(true);
    } // End of the function
    function showDepth(_vis)
    {
        depthArrow._visible = _vis;
        depthTF._visible = _vis;
    } // End of the function
    function construct(dataProviderUI)
    {
        _level0.TIMELINE.SET_HEADER();
        loadingText.text1TF.autoSize = "center";
        loadingText.text2TF.autoSize = "center";
        loadingText.text3TF.autoSize = "center";
        com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "CELL_TRACKIFY1", loadingText.text1TF);
        com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "CELL_TRACKIFY2", loadingText.text2TF);
        com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "CELL_TRACKIFY2", loadingText.text3TF);
        this.populateContent(dataProviderUI);
    } // End of the function
    function populateContent(dataProviderUI)
    {
        if (dataProviderUI[0][0] == undefined || dataProviderUI[0][0] < 0)
        {
            noTarget = true;
        } // end if
        skipLoadingScreen = dataProviderUI[0][3];
        targetArrowVisible = dataProviderUI[0][4];
        if (firstRun == true)
        {
            firstRun = false;
            if (skipLoadingScreen == true)
            {
                this.setupMainScreenSkipLoading();
            }
            else if (noTarget == true)
            {
                this.set_loading_text("text3TF");
                this.flashOff();
            }
            else
            {
                this.set_loading_text("text1TF");
                this.flashOff();
            } // end else if
        }
        else
        {
            this.SET_TARGET(dataProviderUI[0][0], dataProviderUI[0][1], dataProviderUI[0][2], dataProviderUI[0][5]);
        } // end else if
    } // End of the function
    function APP_FUNCTION()
    {
    } // End of the function
    function setupMainScreen()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(loadingText);
        loadingCounter = 0;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(loadingAnim, 1, {_alpha: 0, delay: 1, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [loadingAnim]});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(player, 1, {_alpha: 100, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [player]});
        clearInterval(intervalIdSweep);
        intervalIdSweep = setInterval(this, "animateSweep", sweepTime);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(sweepMC.sweep, 1, {_alpha: 100, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [sweepMC.sweep]});
    } // End of the function
    function setupMainScreenSkipLoading()
    {
        loadingAnim._visible = false;
        player._alpha = 100;
        clearInterval(intervalIdSweep);
        intervalIdSweep = setInterval(this, "animateSweep", sweepTime);
        sweepMC.sweep._alpha = 100;
    } // End of the function
    function updateTargetPosition()
    {
        var _loc10 = -149;
        var _loc8 = 39;
        var _loc11 = -84;
        var _loc9 = 84;
        var _loc16 = 84 / _range;
        var _loc13 = _loc16 * _distance;
        var _loc15 = (_direction - 90) * 3.141593 / 180;
        var _loc3 = Math.cos(_loc15) * _loc13;
        var _loc2 = Math.sin(_loc15) * _loc13;
        var _loc14;
        var _loc12;
        if (_loc3 > 0)
        {
            _loc14 = _loc3 / _loc9;
        }
        else
        {
            _loc14 = _loc3 / _loc11;
        } // end else if
        if (_loc2 > 0)
        {
            _loc12 = _loc2 / _loc8;
        }
        else
        {
            _loc12 = _loc2 / _loc10;
        } // end else if
        var _loc5 = Math.max(Math.abs(_loc14), Math.abs(_loc12));
        var _loc4 = false;
        if (_distance > _range)
        {
            _loc4 = true;
        } // end if
        var _loc7 = _loc3;
        var _loc6 = _loc2;
        if (_loc2 < _loc10)
        {
            _loc7 = _loc3 / _loc5;
            _loc4 = true;
            _loc6 = _loc10;
        }
        else if (_loc2 > _loc8)
        {
            _loc7 = _loc3 / _loc5;
            _loc4 = true;
            _loc6 = _loc8;
        } // end else if
        if (_loc3 < _loc11)
        {
            _loc7 = _loc11;
            _loc6 = _loc2 / _loc5;
            _loc4 = true;
        }
        else if (_loc3 > _loc9)
        {
            _loc7 = _loc9;
            _loc6 = _loc2 / _loc5;
            _loc4 = true;
        } // end else if
        if (_loc2 < _loc10 || _loc2 > _loc8)
        {
            _loc6 = _loc2 / _loc5;
            _loc4 = true;
        } // end if
        if (_loc3 < _loc11 || _loc3 > _loc9)
        {
            _loc7 = _loc3 / _loc5;
            _loc4 = true;
        } // end if
        if (targetArrowVisible == false)
        {
            _loc4 = false;
        } // end if
        target._x = _loc7 + player._x;
        target._y = _loc6 + player._y;
        target.arrow._rotation = _direction;
        target.arrow._visible = _loc4;
    } // End of the function
    function testTarget()
    {
        if (targetVisible == true)
        {
            var _loc2 = sweepMC._rotation;
            if (_loc2 < 0)
            {
                _loc2 = _loc2 + 360;
            } // end if
            if (_loc2 > _direction - sweepStep * 2 && _loc2 < _direction + sweepStep * 2)
            {
                if (target._alpha < 90)
                {
                    com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, "TRACKIFY_BEEP", "PHONE_SOUNDSET_DEFAULT");
                } // end if
                com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(target);
                target._alpha = 100;
                target._xscale = 100;
                target._yscale = 100;
                com.rockstargames.ui.tweenStar.TweenStarLite.to(target, targetFadeTime, {_alpha: 0, _xscale: 50, _yscale: 50, onCompleteScope: this, onComplete: com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf, onCompleteArgs: [target]});
            } // end if
        } // end if
    } // End of the function
    function set_loading_text(textString)
    {
        loadingText.text1TF._visible = false;
        loadingText.text2TF._visible = false;
        loadingText.text3TF._visible = false;
        loadingText[textString]._visible = true;
    } // End of the function
    function flashOn()
    {
        if (noTarget == false)
        {
            ++loadingCounter;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(loadingText);
        if (loadingCounter < 3)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(loadingText, flashTime, {_alpha: 100, onCompleteScope: this, onComplete: flashOff});
        }
        else
        {
            this.set_loading_text("text2TF");
            com.rockstargames.ui.tweenStar.TweenStarLite.to(loadingText, flashTime, {_alpha: 100, onCompleteScope: this, onComplete: setupMainScreen});
        } // end else if
    } // End of the function
    function flashOff(mc)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(loadingText);
        com.rockstargames.ui.tweenStar.TweenStarLite.to(loadingText, flashTime, {_alpha: 40, delay: 0.500000, onCompleteScope: this, onComplete: flashOn});
    } // End of the function
    function distance(x1, y1, x2, y2)
    {
        var _loc2 = x2 - x1;
        var _loc1 = y2 - y1;
        return (Math.sqrt(_loc2 * _loc2 + _loc1 * _loc1));
    } // End of the function
    function animateSweep()
    {
        var _loc2 = sweepMC._rotation;
        _loc2 = _loc2 + sweepStep;
        if (_loc2 > 360)
        {
            _loc2 = _loc2 - 360;
        } // end if
        sweepMC._rotation = _loc2;
        this.testTarget();
    } // End of the function
    var sweepStep = 4;
    var loadingCounter = 1;
    var sweepTime = 1;
    var targetFadeTime = 4;
    var sonarTime = 2;
    var flashTime = 0.500000;
    var firstRun = true;
    var targetVisible = true;
    var targetArrowVisible = true;
    var noTarget = false;
} // End of Class
#endinitclip
