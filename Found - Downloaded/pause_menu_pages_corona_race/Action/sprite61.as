// Action script...

// [Initial MovieClip Action of sprite 61]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var hBGColour, leftIconColour, rightIconColour, selectAlpha, nonSelectAlpha, kickAnim, isAnimating, labelMC, rankNumMC, bgMC, __get__data, type, groupBGMC, groupNumTF, colourIconL, colourIconR, colourStrokeMC, eyeMC, crewTagMC, icon1MC, betMC, icon2MC, oddsTF, icon3MC, carIconBGMC, isSelectable, avatarImg, rankingTF, scoreTF, initialIndex, rankBGMC, _highlighted, __set__highlighted, uniqueID, getNextHighestDepth, attachMovie, highlightBGMC, __get__highlighted, __get__isStandalone, __set__data, __set__isStandalone;
    function PauseMPMenuMatchmakingCardItem()
    {
        super();
        hBGColour = new com.rockstargames.ui.utils.HudColour();
        leftIconColour = new com.rockstargames.ui.utils.HudColour();
        rightIconColour = new com.rockstargames.ui.utils.HudColour();
        selectAlpha = 100;
        nonSelectAlpha = 30;
        kickAnim = 0;
        isAnimating = false;
        _global.gfxExtensions = true;
        labelMC.nameTF.textAutoSize = "shrink";
        rankNumMC.rankNumTF.textAutoSize = "shrink";
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        var _loc7 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc7);
        com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc7.r, _loc7.g, _loc7.b, 50);
        if (this.__get__data()[0] == "")
        {
            this.__get__data()[0] = "-";
        } // end if
        labelMC.titleTF.text = type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.VEHICLE_ITEM ? ("") : (this.__get__data()[0]);
        labelMC.nameTF.text = type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.VEHICLE_ITEM ? (this.__get__data()[0]) : ("");
        groupBGMC._visible = false;
        groupNumTF._visible = false;
        colourIconL._visible = type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.VEHICLE_ITEM;
        colourIconR._visible = colourIconL._visible;
        colourStrokeMC._visible = false;
        eyeMC._visible = false;
        if (crewTagMC)
        {
            crewTagMC._visible = false;
        } // end if
        var _loc5 = this.__get__data()[1];
        if (_loc5 == 1 || _loc5 == 0)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(Boolean(_loc5) ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED), hBGColour);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(_loc5, hBGColour);
        } // end else if
        var _loc6 = type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.PLAYER_BET_ITEM;
        this.setIcon(_loc6 ? (0) : (this.__get__data()[2]), icon1MC);
        betMC._visible = _loc6;
        this.setIcon(_loc6 ? (0) : (this.__get__data()[3]), icon2MC);
        oddsTF._visible = _loc6;
        if (!isAnimating)
        {
            this.setIcon(this.__get__data()[4], icon3MC);
        } // end if
        var _loc4 = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(carIconBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
        switch (type)
        {
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.VEHICLE_ITEM:
            {
                com.rockstargames.ui.utils.Colour.Colourise(colourIconL, this.__get__data()[5], this.__get__data()[6], this.__get__data()[7], 100);
                com.rockstargames.ui.utils.Colour.Colourise(colourIconR, this.__get__data()[8], this.__get__data()[9], this.__get__data()[10], 100);
                colourStrokeMC._alpha = 30;
                colourStrokeMC._visible = true;
                if (this.__get__data()[11])
                {
                    if (isNaN(this.__get__data()[11]))
                    {
                        labelMC.titleTF.text = "";
                        labelMC.nameTF.text = this.__get__data()[11];
                        this.setCrewTag(this.__get__data()[12]);
                        this.formatNameTF();
                        if (this.__get__data()[0] > 0)
                        {
                            this.setGroupedBG(this.__get__data()[0]);
                        } // end if
                    }
                    else if (this.__get__data()[11] > 0)
                    {
                        this.setGroupedBG(this.__get__data()[11]);
                    } // end if
                } // end else if
                _loc4 = true;
                break;
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.PLAYER_BET_ITEM:
            {
                if (this.__get__data()[2])
                {
                    betMC.labelMC.itemTF.text = this.__get__data()[2];
                    betMC.bgMC._width = betMC.labelMC.itemTF.textWidth + 10;
                    betMC.bgMC._x = 145 - betMC.bgMC._width;
                }
                else
                {
                    betMC._visible = false;
                } // end else if
                if (this.__get__data()[3])
                {
                    oddsTF.text = this.__get__data()[3];
                }
                else
                {
                    oddsTF._visible = false;
                } // end else if
                var _loc8 = Boolean(isSelectable);
                var _loc3 = new com.rockstargames.ui.utils.HudColour();
                if (_loc8)
                {
                    com.rockstargames.ui.utils.Colour.ApplyHudColour(betMC.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc3);
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.Colourise(betMC.bgMC, hBGColour.r, hBGColour.g, hBGColour.b, hBGColour.a);
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE, _loc3);
                } // end else if
                com.rockstargames.ui.utils.Colour.Colourise(betMC.labelMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
                if (this.__get__data()[10])
                {
                    eyeMC._visible = Boolean(this.__get__data()[10]);
                } // end if
            } 
            case com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.PLAYER_ITEM:
            {
                if (this.__get__data()[9] > 0)
                {
                    this.setGroupedBG(this.__get__data()[9]);
                } // end if
                if (isNaN(this.__get__data()[5]))
                {
                    this.setAvatarImg(this.__get__data()[5], this.__get__data()[6]);
                    avatarImg._alpha = _loc8 || type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuMatchmakingCardItem.PLAYER_ITEM ? (100) : (35);
                    _loc4 = true;
                }
                else
                {
                    rankingTF.text = this.__get__data()[5];
                    rankingTF._visible = this.__get__data()[5] >= 0;
                    _loc4 = this.__get__data()[5] != -1;
                    if (_loc4)
                    {
                        com.rockstargames.ui.utils.Colour.ApplyHudColour(carIconBGMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
                    } // end if
                    scoreTF.text = this.__get__data()[6];
                } // end else if
                this.setCrewTag(this.__get__data()[7]);
                this.formatNameTF();
                break;
            } 
        } // End of switch
        rankNumMC.rankNumTF.text = initialIndex;
        com.rockstargames.ui.utils.Colour.Colourise(rankBGMC, hBGColour.r, hBGColour.g, hBGColour.b, hBGColour.a);
        rankBGMC._visible = initialIndex != "";
        carIconBGMC._visible = _loc4;
        this.__set__highlighted(_highlighted);
        //return (this.data());
        null;
    } // End of the function
    function setGroupedBG(numMembers)
    {
        groupBGMC._visible = true;
        groupNumTF._visible = true;
        groupBGMC._height = 27 * numMembers - 2;
        groupNumTF.text = String(uniqueID);
        groupNumTF._y = groupBGMC._height * 0.500000 - groupNumTF._height * 0.500000;
    } // End of the function
    function setIcon(iconEnum, iconMC)
    {
        if (iconEnum == undefined)
        {
            iconEnum = 0;
        } // end if
        var _loc3 = com.rockstargames.gtav.constants.MPIconLabels.lookUp(iconEnum)[1];
        iconMC.gotoAndStop(_loc3);
        if (iconMC.animIcon)
        {
            iconMC.animIcon.play();
        } // end if
    } // End of the function
    function setAvatarImg(txd, txn)
    {
        if (txd != undefined && txn != undefined)
        {
            this.ADD_TXD_REF(txd, txn);
        } // end if
    } // End of the function
    function setCrewTag(crewTagStr)
    {
        if (crewTagStr && crewTagStr != "")
        {
            if (!crewTagMC)
            {
                crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", this.getNextHighestDepth(), {_y: 5, _xscale: 70, _yscale: 70});
            } // end if
            crewTagMC.UNPACK_CREW_TAG(crewTagStr);
            crewTagMC._visible = true;
        } // end if
    } // End of the function
    function formatNameTF()
    {
        var _loc2 = 210 - (crewTagMC._visible ? (crewTagMC._width) : (0)) - (betMC._visible ? (betMC.bgMC._width) : (0));
        labelMC.nameTF._width = _loc2;
        crewTagMC._x = labelMC._x + labelMC.nameTF._x + labelMC.nameTF.textWidth + 10;
    } // End of the function
    function animateKick(doAnimate)
    {
        if (doAnimate)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(rankNumMC, 1, {onCompleteScope: this, onComplete: kickflip});
            isAnimating = true;
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(rankNumMC);
            isAnimating = false;
        } // end else if
    } // End of the function
    function kickflip()
    {
        kickAnim >= 1 ? (kickAnim = 0) : (kickAnim++);
        if (kickAnim)
        {
            icon3MC.gotoAndStop("KICK");
            icon3MC.numTF.text = this.__get__data()[8];
            rankNumMC._visible = false;
        }
        else
        {
            icon3MC.gotoAndStop(this.__get__data()[3][2]);
            rankNumMC._visible = true;
        } // end else if
        this.animateKick(true);
    } // End of the function
    function set highlighted(_h)
    {
        var _loc2 = _h ? (selectAlpha) : (nonSelectAlpha);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(labelMC, _h ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK) : (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE));
        com.rockstargames.ui.utils.Colour.Colourise(highlightBGMC, hBGColour.r, hBGColour.g, hBGColour.b, _loc2);
        if (groupBGMC._visible)
        {
            groupNumTF._alpha = _loc2 + 25;
            com.rockstargames.ui.utils.Colour.Colourise(groupBGMC, hBGColour.r, hBGColour.g, hBGColour.b, _loc2);
        } // end if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    function set isStandalone(_s)
    {
        _isStandalone = _s;
        //return (this.isStandalone());
        null;
    } // End of the function
    function get isStandalone()
    {
        return (_isStandalone);
    } // End of the function
    function ADD_TXD_REF(txd, txn)
    {
        if (avatarImg == undefined)
        {
            avatarImg = (com.rockstargames.ui.media.ImageLoaderMC)(this.attachMovie("avatarImage", "a", this.getNextHighestDepth(), {_x: 25, _y: 0}));
        } // end if
        var _loc3 = this.__get__isStandalone() ? ("mp_matchmaking_card") : ("PAUSE_MENU_SP_CONTENT");
        if (avatarImg.textureDict == txd)
        {
            if (avatarImg.isLoaded)
            {
                avatarImg.init(_loc3, txd, txn, 25, 25);
                avatarImg.displayTxdResponse(txd);
            } // end if
        }
        else
        {
            if (avatarImg.isLoaded)
            {
                avatarImg.removeTxdRef();
            } // end if
            avatarImg.init(_loc3, txd, txn, 25, 25);
            var _loc5 = this.__get__isStandalone() ? (3) : (4);
            var _loc4 = avatarImg.splitPath(String(avatarImg), _loc5);
            avatarImg.requestTxdRef(_loc4, true);
        } // end else if
    } // End of the function
    function ON_DESTROY()
    {
        this.animateKick(false);
        if (avatarImg != undefined && avatarImg.isLoaded)
        {
            avatarImg.removeTxdRef();
        } // end if
    } // End of the function
    static var VEHICLE_ITEM = 0;
    static var PLAYER_BET_ITEM = 1;
    static var PLAYER_ITEM = 2;
    var _isStandalone = true;
} // End of Class
#endinitclip
