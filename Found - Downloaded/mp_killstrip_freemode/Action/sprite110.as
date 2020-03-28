// Action script...

// [Initial MovieClip Action of sprite 110]
#initclip 5
class com.rockstargames.gtav.Multiplayer.MP_KILLSTRIP_FREEMODE extends com.rockstargames.ui.core.BaseScreenLayout
{
    var BONES, CONTENT, CREW_TAG, DispConf, getDisplayConfig, pedImgMC, safeLeft, safeRight, safeTop, safeBottom, isWideScreen, isHiDef, FOUR_THREE_PADDING, rank, _componentsForLoadingImages, loaderObject, thisObj, componentID;
    function MP_KILLSTRIP_FREEMODE()
    {
        super();
        _global.gfxExtensions = true;
        BONES = [];
    } // End of the function
    function INITIALISE(mc, fileName)
    {
        super.INITIALISE(mc);
        CREW_TAG = CONTENT.PANEL_PLAYER_INFO.CREW_TAG.attachMovie("CREW_TAG_MOVIECLIP", "CREW_TAG_MOVIECLIP", CONTENT.PANEL_PLAYER_INFO.CREW_TAG.getNextHighestDepth(), {_x: 0, _y: 0, _visible: false});
        CONTENT.PANEL_PLAYER_INFO.crewEmblem._visible = false;
        DispConf = new com.rockstargames.ui.utils.DisplayConfig();
        DispConf = this.getDisplayConfig(true);
        pedImgMC = CONTENT.PANEL_PLAYER_INFO.attachMovie("GenericImageLoader", "GenericImageLoaderMC", CONTENT.PANEL_PLAYER_INFO.getNextHighestDepth(), {_x: 81, _y: 40});
        pedImgMC._visible = false;
        CONTENT.PANEL_PLAYER_INFO.rankSmallTF.textAutoSize = "shrink";
        CONTENT.PANEL_PLAYER_INFO.rankLargeTF.textAutoSize = "shrink";
    } // End of the function
    function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
    {
        safeLeft = _safeLeftPercent * _screenWidthPixels;
        safeRight = (1 - _safeRightPercent) * _screenWidthPixels;
        safeTop = _safeTopPercent * _screenHeightPixels;
        safeBottom = (1 - _safeBottomPercent) * _screenHeightPixels;
        isWideScreen = _isWideScreen;
        isHiDef = _isHiDef;
        DispConf.isHiDef = _isHiDef;
        DispConf.isWideScreen = _isWideScreen;
        DispConf.safeBottom = _safeBottomPercent;
        DispConf.safeLeft = _safeLeftPercent;
        DispConf.safeRight = _safeRightPercent;
        DispConf.safeTop = _safeTopPercent;
        DispConf.screenHeight = _screenHeightPixels;
        DispConf.screenWidth = _screenWidthPixels;
        if (!DispConf.isWideScreen)
        {
            FOUR_THREE_PADDING = 160;
        } // end if
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        if (DispConf.screenHeight != -1 && DispConf.screenHeight != undefined)
        {
            var _loc2 = Math.floor(DispConf.safeRight * DispConf.screenWidth - CONTENT.PANEL_PLAYER_INFO._width) - FOUR_THREE_PADDING;
            CONTENT.PANEL_PLAYER_INFO._y = Math.floor(DispConf.safeTop * DispConf.screenHeight);
            CONTENT.PANEL_PLAYER_INFO._x = _loc2;
            CONTENT.PANEL_WEAPON._y = CONTENT.PANEL_PLAYER_INFO._y + CONTENT.PANEL_PLAYER_INFO._height;
            CONTENT.PANEL_WEAPON._x = _loc2;
            CONTENT.PANEL_TARGET._y = CONTENT.PANEL_WEAPON._y + CONTENT.PANEL_WEAPON._height;
            CONTENT.PANEL_TARGET._x = _loc2;
            CONTENT.PANEL_SCORE._y = CONTENT.PANEL_TARGET._y + 142;
            CONTENT.PANEL_SCORE._x = _loc2;
            if (_isMinimised)
            {
                CONTENT.PANEL_SCORE._y = CONTENT.PANEL_WEAPON._y;
            } // end if
        } // end if
    } // End of the function
    function SET_KILLER_AND_VICTIM_COLOURS(killerR, killerG, killerB, victimR, victimG, victimB)
    {
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.PANEL_PLAYER_INFO.headerAndRank, killerR, killerG, killerB, 100);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.PANEL_TARGET.targetManMC.targetKillShots, killerR, killerG, killerB, 100);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.PANEL_SCORE.killerScore, killerR, killerG, killerB, 100);
        com.rockstargames.ui.utils.Colour.Colourise(CONTENT.PANEL_SCORE.victimScore, victimR, victimG, victimB, 100);
    } // End of the function
    function SET_PLAYER_INFO(gamerName, rank, killerScore, victimScore, weaponHash, gangHudColourEnum)
    {
        _isMinimised = false;
        var _loc3 = CONTENT.PANEL_PLAYER_INFO.nameWhiteTF;
        _loc3.text = gamerName;
        _loc3.autoSize = true;
        CONTENT.PANEL_PLAYER_INFO.CREW_TAG._x = _loc3._width + _loc3._x + 10;
        CONTENT.PANEL_PLAYER_INFO.CREW_TAG._y = 5;
        CONTENT.PANEL_SCORE.killerScore.leftScoreTF.text = String(killerScore);
        CONTENT.PANEL_SCORE.victimScore.rightScoreTF.text = String(victimScore);
        this.rank = rank;
        if (weaponHash != -1 && weaponHash != 0)
        {
            if (weaponHash == -540120700)
            {
                weaponHash = 55733900;
            } // end if
            CONTENT.PANEL_WEAPON.weaponIcon.gotoAndStop("INT" + weaponHash);
        }
        else
        {
            CONTENT.PANEL_WEAPON.weaponIcon.gotoAndStop(1);
        } // end else if
        if (CONTENT.PANEL_WEAPON.weaponIcon._currentframe == 1)
        {
            this.showMinimisedPanels();
        }
        else if (gangHudColourEnum != undefined && gangHudColourEnum != -1)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.PANEL_WEAPON.background, gangHudColourEnum);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.PANEL_TARGET.background, gangHudColourEnum);
        }
        else
        {
            var _loc2 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.PANEL_WEAPON.background, _loc2.r, _loc2.g, _loc2.b, 60);
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.PANEL_TARGET.background, _loc2.r, _loc2.g, _loc2.b, 60);
        } // end else if
        this.adjustRankAndPed();
        this.calculatePercentages(killerScore, victimScore);
    } // End of the function
    function UPDATE_PLAYER_SCORES(killerScore, victimScore)
    {
        CONTENT.PANEL_SCORE.killerScore.leftScoreTF.text = String(killerScore);
        CONTENT.PANEL_SCORE.victimScore.rightScoreTF.text = String(victimScore);
        this.calculatePercentages(killerScore, victimScore);
    } // End of the function
    function SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank, crewColour)
    {
        CREW_TAG.SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank, crewColour);
        CREW_TAG._visible = true;
    } // End of the function
    function ADD_DAMAGE_TO_VICTIM()
    {
        this.setupBones();
        var _loc4 = arguments;
        var _loc6;
        var _loc5 = true;
        for (var _loc3 = 0; _loc3 < _loc4.length; ++_loc3)
        {
            this.addDamageIndicator(_loc4[_loc3] + 1, _loc5);
            if (_loc5)
            {
                _loc5 = false;
                BONES[_loc4[_loc3] + 1].killstripX._height = BONES[_loc4[_loc3] + 1].killstripX._height + 20;
                BONES[_loc4[_loc3] + 1].killstripX._width = BONES[_loc4[_loc3] + 1].killstripX._width + 20;
            } // end if
        } // end of for
    } // End of the function
    function SET_PLAYERS_HEADSHOT(killerHeadShot)
    {
        pedImgMC.init("MP_KILLSTRIP_FREEMODE", killerHeadShot, killerHeadShot, 128, 128);
        pedImgMC.addTxdRef("HEADSHOT");
    } // End of the function
    function SET_KILLERS_CREW_EMBLEM(crewEmblem)
    {
        com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, FILE_NAME, crewEmblem, "CREW_EMBLEM");
    } // End of the function
    function ADD_TXD_REF_RESPONSE(texture, whichImage, success)
    {
        if (success)
        {
            if (whichImage == "HEADSHOT")
            {
                pedImgMC.displayTxdResponse(texture);
                pedImgMC._visible = true;
                this.adjustRankAndPed();
            } // end if
            if (whichImage == "CREW_EMBLEM")
            {
                this.loadTexture(texture, texture, CONTENT.PANEL_PLAYER_INFO.crewEmblem);
                CONTENT.PANEL_PLAYER_INFO.crewEmblem._visible = true;
                this.adjustRankAndPed();
            } // end if
        } // end if
    } // End of the function
    function TXD_HAS_LOADED(textureDict, success, uniqueID)
    {
        com.rockstargames.ui.utils.Debug.log("TXD_HAS_LOADED textureDict: " + textureDict + " success: " + success + " uniqueID: " + uniqueID);
        if (success == true)
        {
            pedImgMC.displayTxdResponse(textureDict, success);
        } // end if
    } // End of the function
    function showMinimisedPanels()
    {
        _isMinimised = true;
        CONTENT.PANEL_WEAPON._visible = false;
        CONTENT.PANEL_TARGET._visible = false;
        CONTENT.PANEL_SCORE._y = CONTENT.PANEL_WEAPON._y;
    } // End of the function
    function positionTarget(yPosFinalBullet, indicatorIndex)
    {
        CONTENT.PANEL_TARGET.targetManMC._y = CONTENT.PANEL_TARGET.background._y + CONTENT.PANEL_TARGET.background._height / 2 - yPosFinalBullet;
        if (indicatorIndex == BONES.length - 1)
        {
            CONTENT.PANEL_TARGET.targetManMC._y = CONTENT.PANEL_TARGET.targetManMC._y - 30;
        } // end if
    } // End of the function
    function setupBones()
    {
        var _loc2 = CONTENT.PANEL_TARGET.targetManMC.targetKillShots;
        BONES.push(_loc2.NOT_A_WEAPON);
        BONES.push(_loc2.RAGDOLL_PELVIS);
        BONES.push(_loc2.RAGDOLL_THIGH_L);
        BONES.push(_loc2.RAGDOLL_CALF_L);
        BONES.push(_loc2.RAGDOLL_FOOT_L);
        BONES.push(_loc2.RAGDOLL_THIGH_R);
        BONES.push(_loc2.RAGDOLL_CALF_R);
        BONES.push(_loc2.RAGDOLL_FOOT_R);
        BONES.push(_loc2.RAGDOLL_SPINE);
        BONES.push(_loc2.RAGDOLL_SPINE1);
        BONES.push(_loc2.RAGDOLL_SPINE2);
        BONES.push(_loc2.RAGDOLL_SPINE3);
        BONES.push(_loc2.RAGDOLL_CLAVICLE_L);
        BONES.push(_loc2.RAGDOLL_UPPERARM_L);
        BONES.push(_loc2.RAGDOLL_LOWERARM_L);
        BONES.push(_loc2.RAGDOLL_HAND_L);
        BONES.push(_loc2.RAGDOLL_CLAVICLE_R);
        BONES.push(_loc2.RAGDOLL_UPPERARM_R);
        BONES.push(_loc2.RAGDOLL_LOWERARM_R);
        BONES.push(_loc2.RAGDOLL_HAND_R);
        BONES.push(_loc2.RAGDOLL_NECK);
        BONES.push(_loc2.RAGDOLL_HEAD);
    } // End of the function
    function loadTexture(txd, texture, targetLoadedInto)
    {
        var thisObj = this;
        var _loc3 = _componentsForLoadingImages.length + 1;
        var _loc2 = new com.rockstargames.ui.core.BaseComponentInfo(_loc3);
        _componentsForLoadingImages[_loc3] = _loc3;
        _loc2._depth = _loc3 + 10;
        _loc2._mc = targetLoadedInto;
        _loc2._loader = new MovieClipLoader();
        _loc2._listener = new Object();
        _loc2._loader.addListener(loaderObject._listener);
        _loc2._listener.thisObj = thisObj;
        _loc2._listener.componentID = _loc3;
        _loc2._listener.onLoadInit = function (target_mc)
        {
            var _loc2 = thisObj._componentsForLoadingImages[componentID];
            _loc2._loader.removeListener(_loc2._listener);
            _loc2._loader = null;
        };
        var _loc5 = "img://" + txd + "/" + texture;
        _loc2._loader.loadClip(_loc5, _loc2._mc);
    } // End of the function
    function addDamageIndicator(indicatorIndex, killerShot)
    {
        BONES[indicatorIndex]._rotation = BONES[indicatorIndex]._parent._rotation * -1;
        var _loc4 = Math.floor(this.randRange(0, BONES[indicatorIndex].KILLSTRIP_POSITIONAL_RECT._width));
        var _loc3 = Math.floor(this.randRange(0, BONES[indicatorIndex].KILLSTRIP_POSITIONAL_RECT._height));
        BONES[indicatorIndex].killstripX._alpha = 100;
        BONES[indicatorIndex].killstripX._x = _loc4;
        BONES[indicatorIndex].killstripX._y = _loc3;
        if (killerShot)
        {
            this.positionTarget((BONES[indicatorIndex]._y + BONES[indicatorIndex].killstripX._y) / 100 * CONTENT.PANEL_TARGET.targetManMC._xscale, indicatorIndex);
        } // end if
    } // End of the function
    function randRange(min, max)
    {
        var _loc1 = Math.floor(Math.random() * (max - min + 1)) + min;
        return (_loc1);
    } // End of the function
    function calculatePercentages(killerScore, victimScore)
    {
        var _loc5 = Math.max(killerScore, victimScore);
        var _loc2;
        if (_loc5 == killerScore)
        {
            _loc2 = victimScore / killerScore * 100;
            CONTENT.PANEL_SCORE.killerScore.leftKDRBar._xscale = 100;
            CONTENT.PANEL_SCORE.victimScore.rightKDRBar._xscale = _loc2;
        }
        else
        {
            _loc2 = killerScore / victimScore * 100;
            CONTENT.PANEL_SCORE.victimScore.rightKDRBar._xscale = 100;
            CONTENT.PANEL_SCORE.killerScore.leftKDRBar._xscale = _loc2;
        } // end else if
    } // End of the function
    function OVERRIDE_SCORES(killerScore, victimScore)
    {
        CONTENT.PANEL_SCORE.killerScore.leftScoreTF.text = String(killerScore);
        CONTENT.PANEL_SCORE.victimScore.rightScoreTF.text = String(victimScore);
    } // End of the function
    function adjustRankAndPed()
    {
        if (CREW_TAG._visible || CONTENT.PANEL_PLAYER_INFO.crewEmblem._visible)
        {
            CONTENT.PANEL_PLAYER_INFO.rankSmallTF._visible = true;
            CONTENT.PANEL_PLAYER_INFO.rankSmallTF.text = rank;
            CONTENT.PANEL_PLAYER_INFO.rankLargeTF.text = "";
            CONTENT.PANEL_PLAYER_INFO.rankLargeTF._visible = false;
            pedImgMC._x = 81;
            CONTENT.PANEL_PLAYER_INFO.headerAndRank.rankIcon._width = 64;
            CONTENT.PANEL_PLAYER_INFO.headerAndRank.rankIcon._height = 54;
        }
        else
        {
            CONTENT.PANEL_PLAYER_INFO.rankLargeTF._visible = true;
            CONTENT.PANEL_PLAYER_INFO.rankLargeTF.text = rank;
            CONTENT.PANEL_PLAYER_INFO.rankSmallTF.text = "";
            CONTENT.PANEL_PLAYER_INFO.rankSmallTF._visible = false;
            pedImgMC._x = 138;
            CONTENT.PANEL_PLAYER_INFO.headerAndRank.rankIcon._width = 115;
            CONTENT.PANEL_PLAYER_INFO.headerAndRank.rankIcon._height = 97;
        } // end else if
    } // End of the function
    var FILE_NAME = "MP_KILLSTRIP_FREEMODE";
    var _isMinimised = false;
} // End of Class
#endinitclip
