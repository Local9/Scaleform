// Action script...

// [Initial MovieClip Action of sprite 58]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_CHARACTER_SELECT extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
    var CONTENT;
    function PAUSE_MENU_CHARACTER_SELECT()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        if (mc != undefined)
        {
            super.INITIALISE(mc);
        }
        else
        {
            CONTENT = this;
        } // end else if
        for (var _loc4 = 1; _loc4 <= 5; ++_loc4)
        {
            var _loc3 = this["playerSil" + _loc4 + "MC"];
            _loc3.gotoAndStop(1);
            _loc3.gangBadgeMC._visible = false;
            _loc3.numMC.gotoAndStop(_loc4);
            _loc3.silhuetteMC._alpha = silAlpha;
            _loc3.numMC._alpha = numAlpha;
        } // end of for
        CONTENT.infoMC._visible = false;
        CONTENT.infoTeamSelectMC._visible = false;
        CONTENT.infoTeamSelectMC.vehicleMC._visible = false;
        CONTENT.infoTeamSelectMC.weaponMC._visible = false;
    } // End of the function
    function debug()
    {
        var _loc2 = true;
        var _loc3 = false;
        if (_loc2)
        {
            this.SET_DATA_SLOT(2, 0, 0, 0, 0, 0, 3, true);
            this.SET_TITLE("0", "1", "wins", "losses", "last played", "kd", "no wins", "stamina", "string date", "string date");
            this.SET_DESCRIPTION("0", "1", "2", 996, 997, 998, 999, 25, 25, -1, 25);
        }
        else if (_loc3)
        {
            this.SET_DATA_SLOT(0, 0, 0, 0, 1, 0, 1, true, 0);
            this.SET_DATA_SLOT(1, 0, 0, 0, 1, 0, 0, true, 1);
            this.SET_DATA_SLOT(2, 0, 0, 0, 1, 0, 1, false, 2);
            this.SET_DATA_SLOT(3, 0, 0, 0, 1, 0, 0, true, 3);
            this.SET_DATA_SLOT(4, 0, 0, 0, 1, 0, 1, true, 0);
            this.SET_TITLE("Vehicle:", "Weapon:", "Kit:", "Armor:", "Health:", "Stamina:");
            this.SET_DESCRIPTION("\"Director\"", "Lights, Camera, Action!", "Social Club TV is your new reality TV fix.", "Calvacade", 5, "Pistol", 2, "No Starting Kit", "Low Armor", "Low Health", "Low Stamina");
        } // end else if
    } // End of the function
    function SET_DATA_SLOT(_viewIndex, _slotIndex)
    {
        if (arguments[4] == 0)
        {
            CONTENT.infoMC._visible = true;
            CONTENT.infoTeamSelectMC._visible = false;
        }
        else if (arguments[4] == 1)
        {
            CONTENT.infoMC._visible = false;
            CONTENT.infoTeamSelectMC._visible = true;
        }
        else
        {
            CONTENT.infoMC._visible = false;
            CONTENT.infoTeamSelectMC._visible = false;
        } // end else if
        var _loc3 = arguments[0] + 1;
        var _loc5 = arguments[6];
        var _loc6 = arguments[7];
        var _loc4 = arguments[8];
        this.SetTeamBadge(_loc3, _loc4);
        this.SetCharacterProperties(_loc3, _loc6, _loc5);
    } // End of the function
    function SET_TITLE(str)
    {
        var _loc4 = arguments;
        if (CONTENT.infoTeamSelectMC._visible == false)
        {
            CONTENT.titleTF.text = str;
            com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.infoMC.gangType, _loc4[0], true);
            com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.infoMC.xpTitleTF, _loc4[1], true);
            for (var _loc3 = 0; _loc3 < 8; ++_loc3)
            {
                com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.infoMC["stat" + _loc3], _loc4[_loc3 + 2], true);
            } // end of for
        }
        else
        {
            CONTENT.infoTeamSelectMC.vehicleTitleTF.text = _loc4[0];
            CONTENT.infoTeamSelectMC.weaponTitleTF.text = _loc4[1];
            CONTENT.infoTeamSelectMC.kitTitleTF.text = _loc4[2];
            CONTENT.infoTeamSelectMC.armorTitleTF.text = _loc4[3];
            CONTENT.infoTeamSelectMC.healthTitleTF.text = _loc4[4];
            CONTENT.infoTeamSelectMC.staminaTitleTF.text = _loc4[5];
        } // end else if
    } // End of the function
    function SET_DESCRIPTION()
    {
        var _loc5 = arguments;
        if (CONTENT.infoTeamSelectMC._visible == false)
        {
            com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.infoMC.gangTypeValue, _loc5[0], true);
            var _loc12 = _loc5[1];
            var _loc11 = _loc5[2];
            var _loc13 = _loc5[14];
            if (_loc12 > _loc11)
            {
                _loc12 = _loc11;
            } // end if
            com.rockstargames.ui.utils.UIText.setSizedText(CONTENT.infoMC.xpPointsTF, _loc13 + " / " + _loc11, true);
            var _loc9 = _loc5[13];
            var _loc3 = 0;
            var _loc6 = 0;
            var _loc4;
            var _loc7;
            for (var _loc3 = 0; _loc3 < 8; ++_loc3)
            {
                _loc6 = _loc5[3 + _loc3];
                var _loc8 = Math.max(0, Math.min(_loc6, 100));
                _loc4 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(CONTENT.infoMC["bar" + _loc3]);
                _loc7 = CONTENT.infoMC["stat" + _loc3];
                _loc4.init(_loc9);
                _loc6 < 0 ? (_loc4.mc._visible = _loc7._visible = false) : (_loc4.percent(_loc8));
            } // end of for
            var _loc18 = _loc5[11];
            var _loc15 = _loc5[12];
            CONTENT.infoMC.rankNumTF.textAutoSize = "shrink";
            CONTENT.infoMC.rankNumTF.text = _loc18;
            CONTENT.infoMC.rankMaxTF.textAutoSize = "shrink";
            CONTENT.infoMC.rankMaxTF.text = _loc15;
            if (_loc9 != undefined)
            {
                var _loc10 = new com.rockstargames.ui.utils.HudColour();
                com.rockstargames.ui.utils.Colour.setHudColour(_loc9, _loc10);
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.infoMC.emblemMC, _loc10.r, _loc10.g, _loc10.b, 100);
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.infoMC.rankMaxMC, _loc10.r, _loc10.g, _loc10.b, 100);
                var _loc14 = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(CONTENT.infoMC.rankbarMC);
                _loc14.init(_loc9);
            } // end if
            var _loc19 = _loc11 - _loc12;
            var _loc16 = _loc13 - _loc12;
            var _loc17 = Math.round(_loc16 / _loc19 * 100);
            _loc14.percent(_loc17);
        }
        else
        {
            CONTENT.infoTeamSelectMC.headingTF.text = _loc5[0];
            CONTENT.infoTeamSelectMC.subheadingTF.text = _loc5[1];
            CONTENT.infoTeamSelectMC.descTF.text = _loc5[2];
            CONTENT.infoTeamSelectMC.vehicleDescTF.text = _loc5[3];
            CONTENT.infoTeamSelectMC.vehicleMC._visible = false;
            if (_loc5[4] > 0)
            {
                CONTENT.infoTeamSelectMC.vehicleMC._visible = true;
            } // end if
            CONTENT.infoTeamSelectMC.weaponDescTF.text = _loc5[5];
            CONTENT.infoTeamSelectMC.weaponMC._visible = false;
            if (_loc5[6] > 0)
            {
                CONTENT.infoTeamSelectMC.weaponMC._visible = true;
            } // end if
            CONTENT.infoTeamSelectMC.kitDescTF.text = _loc5[7];
            CONTENT.infoTeamSelectMC.armorDescTF.text = _loc5[8];
            CONTENT.infoTeamSelectMC.healthDescTF.text = _loc5[9];
            CONTENT.infoTeamSelectMC.staminaDescTF.text = _loc5[10];
        } // end else if
    } // End of the function
    function SetCharacterProperties(index, visible, highlight)
    {
        var _loc2 = this["playerSil" + index + "MC"];
        _loc2.silhuetteMC._visible = visible;
        _loc2.gangBadgeMC._visible = visible;
        _loc2.numMC.gotoAndStop(index);
        _loc2.silhuetteMC._alpha = highlight == 1 ? (100) : (silAlpha);
        _loc2.numMC._alpha = highlight == 1 ? (numAlpha * 2) : (numAlpha);
    } // End of the function
    function SetTeamBadge(index, gangBadgeIndex)
    {
        var _loc2 = this["playerSil" + index + "MC"];
        if (gangBadgeIndex == 0)
        {
            _loc2.gangBadgeMC._alpha = 0;
        }
        else
        {
            _loc2.gangBadgeMC.gotoAndStop(gangBadgeIndex);
            _loc2.gangBadgeMC._alpha = 100;
        } // end else if
    } // End of the function
    var silAlpha = 50;
    var numAlpha = 15;
    var COPS = 1;
} // End of Class
#endinitclip
