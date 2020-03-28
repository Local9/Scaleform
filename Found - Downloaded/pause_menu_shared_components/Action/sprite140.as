// Action script...

// [Initial MovieClip Action of sprite 140]
#initclip 22
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var itemColour, _data, itemTextLeft, __get__data, colourBGMC, tabMC, type, bgMC, labelMC, _view, crewTagMC, getNextHighestDepth, attachMovie, _highlighted, __set__highlighted, uniqueID, __get__highlighted, __set__data;
    function PauseMPMenuFriendsListItem()
    {
        super();
        _global.gfxExtensions = true;
        itemColour = new com.rockstargames.ui.utils.HudColour();
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        if (_data[0] != undefined)
        {
            com.rockstargames.ui.utils.UIText.setSizedText(itemTextLeft, _data[0], true, false, 0, com.rockstargames.ui.utils.UIText.SIZE_GTAG);
        } // end if
        com.rockstargames.ui.utils.Colour.setHudColour(this.__get__data()[1], itemColour);
        isColour = this.__get__data()[1] >= 0;
        colourBGMC._visible = isColour;
        var _loc4 = this.__get__data()[2];
        tabMC._visible = isColour && type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_OFFLINE;
        if (isColour)
        {
            if (type != com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_OFFLINE)
            {
                com.rockstargames.ui.utils.Colour.ApplyHudColour(tabMC, _loc4 ? (com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE) : (this.__get__data()[1]));
            } // end if
            com.rockstargames.ui.utils.Colour.ApplyHudColour(bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        } // end if
        if (this.__get__data()[3] != com.rockstargames.gtav.constants.MPIconLabels.EMPTY[1])
        {
            this.__get__data()[4] = this.__get__data()[3];
        } // end if
        if (this.__get__data()[4] != undefined)
        {
            labelMC.iconMC.gotoAndStop(this.__get__data()[4]);
            if (labelMC.iconMC.animIcon)
            {
                labelMC.iconMC.animIcon.play();
            } // end if
        } // end if
        kick = this.__get__data()[7];
        if (this.__get__data()[7] != undefined)
        {
            if (kick >= 1)
            {
                _view.startKick(true);
            }
            else
            {
                _view.startKick(false);
                this.kickflip(0);
            } // end if
        } // end else if
        var _loc3 = this.__get__data()[6];
        if (_loc3 == undefined || _loc3 == "")
        {
            if (crewTagMC)
            {
                crewTagMC._visible = false;
            } // end if
        }
        else
        {
            if (crewTagMC == undefined)
            {
                crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", this.getNextHighestDepth(), {_y: 5, _xscale: 70, _yscale: 70});
            } // end if
            crewTagMC.UNPACK_CREW_TAG(_loc3);
            crewTagMC._x = itemTextLeft._x + itemTextLeft.textWidth + 8;
            crewTagMC._visible = true;
        } // end else if
        this.setStatus(this.__get__data()[8]);
        this.__set__highlighted(_highlighted);
        //return (this.data());
        null;
    } // End of the function
    function setView(v)
    {
        _view = v;
    } // End of the function
    function setStatus(statusStr)
    {
        if (statusStr)
        {
            labelMC.statusMC._visible = true;
            labelMC.statusMC.labelMC.itemTF.text = statusStr;
            labelMC.statusMC.bgMC._width = labelMC.statusMC.labelMC.itemTF.textWidth + 10;
            labelMC.statusMC.bgMC._x = 145 - labelMC.statusMC.bgMC._width;
        }
        else
        {
            labelMC.statusMC._visible = false;
        } // end else if
    } // End of the function
    function kickflip(kickAnim)
    {
        if (kickAnim == 1)
        {
            labelMC.iconMC.gotoAndStop("KICK");
            labelMC.iconMC.numTF.text = kick;
        }
        else
        {
            labelMC.iconMC.gotoAndStop(this.__get__data()[4]);
        } // end else if
    } // End of the function
    function set highlighted(_h)
    {
        var _loc11 = isColour ? (colourBGMC) : (bgMC);
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        var _loc8 = new com.rockstargames.ui.utils.HudColour();
        var _loc5 = new com.rockstargames.ui.utils.HudColour();
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        var _loc6 = new com.rockstargames.ui.utils.HudColour();
        var _loc3 = 100;
        var _loc9 = 100;
        var _loc10 = 100;
        if (isColour)
        {
            if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_OFFLINE)
            {
                _loc3 = _h ? (100) : (0);
                _loc9 = _h ? (60) : (30);
                _loc10 = _loc9;
            }
            else if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_ONLINE_DIFFERENT_SESSION)
            {
                _loc3 = _h ? (60) : (20);
                _loc10 = _h ? (60) : (30);
            }
            else if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_ONLINE_IN_SESSION)
            {
                _loc3 = _h ? (100) : (20);
            }
            else if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuFriendsListItem.AS_ONLINE_DIFFERENT_MATCH)
            {
                _loc3 = _h ? (60) : (20);
                _loc10 = 60;
            } // end else if
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc5);
        } // end if
        if (_h)
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc8);
            if (isColour)
            {
                _loc2 = itemColour;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc2);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc5);
                _loc3 = _loc2.a;
            } // end else if
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc4);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc6);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc8);
            if (isColour)
            {
                _loc2 = itemColour;
            }
            else
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc2);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc5);
                _loc3 = uniqueID == -1 ? (20) : (_loc2.a);
            } // end else if
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc4);
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc6);
            _loc4.a = 75;
            _loc6.a = 50;
        } // end else if
        com.rockstargames.ui.utils.Colour.Colourise(_loc11, _loc2.r, _loc2.g, _loc2.b, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(labelMC.titleTF, _loc8.r, _loc8.g, _loc8.b, _loc9);
        com.rockstargames.ui.utils.Colour.Colourise(labelMC.iconMC, _loc5.r, _loc5.g, _loc5.b, _loc5.a);
        com.rockstargames.ui.utils.Colour.Colourise(labelMC.statusMC.labelMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        com.rockstargames.ui.utils.Colour.Colourise(labelMC.statusMC.bgMC, _loc6.r, _loc6.g, _loc6.b, _loc6.a);
        if (crewTagMC)
        {
            crewTagMC._alpha = _loc9;
        } // end if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    static var AS_OFFLINE = 0;
    static var AS_ONLINE_DIFFERENT_SESSION = 1;
    static var AS_ONLINE_IN_SESSION = 2;
    static var AS_ONLINE_DIFFERENT_MATCH = 3;
    var isColour = false;
    var kick = 0;
} // End of Class
#endinitclip
