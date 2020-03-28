// Action script...

// [Initial MovieClip Action of sprite 29]
#initclip 2
class com.rockstargames.gtav.Multiplayer.MP_MISSION_NAME_FREEMODE extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, SINGLE_LINE_METRICS, TIMELINE;
    function MP_MISSION_NAME_FREEMODE()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        CONTENT._width = 1280;
        CONTENT._x = 640;
        SINGLE_LINE_METRICS = this.calcMissionNameSize("Through");
        CONTENT.background_single_line._visible = false;
        CONTENT.background_double_line._visible = false;
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.background_single_line.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(CONTENT.background_double_line.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
        CONTENT.infoPanel._visible = false;
    } // End of the function
    function SET_MISSION_INFO(missionName, missionType, playerInfo, percentage, debugValue, isRockstarVerified, playersRequired)
    {
        var _loc3 = false;
        CONTENT.background_single_line._visible = false;
        CONTENT.background_double_line._visible = false;
        var _loc2;
        if (missionName != undefined && missionName != "")
        {
            _loc3 = true;
            CONTENT.missionNameTF.text = missionName;
            if (isRockstarVerified)
            {
                CONTENT.missionNameTF.text = CONTENT.missionNameTF.text + (" " + TIMELINE.verified.text);
                CONTENT.missionNameTF.autoSize = "center";
            } // end if
        } // end if
        if (percentage == "")
        {
            CONTENT.infoPanel.icon_thumb._visible = false;
        } // end if
        CONTENT.infoPanel.percentageTF.htmlText = percentage;
        CONTENT.missionTypeTF.textAutoSize = "shrink";
        CONTENT.missionTypeTF.htmlText = missionType;
        if (playersRequired != undefined && playersRequired != "")
        {
            CONTENT.infoPanel.icon_players._visible = true;
            CONTENT.infoPanel.playersRequiredTF._visible = true;
            CONTENT.infoPanel.playersRequiredTF.autoSize = "right";
            CONTENT.infoPanel.playersRequiredTF.htmlText = playersRequired;
        }
        else
        {
            CONTENT.infoPanel.icon_players._visible = false;
            CONTENT.infoPanel.playersRequiredTF._visible = false;
        } // end else if
        if (debugValue != undefined)
        {
            CONTENT.debugPercentageTF.htmlText = debugValue;
        } // end if
        var _loc4 = this.calcMissionNameSize(CONTENT.missionNameTF.text);
        if (_loc4.y > SINGLE_LINE_METRICS.y)
        {
            _loc2 = CONTENT.background_double_line;
            CONTENT.missionNameTF._y = 123;
            CONTENT.infoPanel._y = 227;
        }
        else
        {
            CONTENT.missionNameTF._y = 125;
            _loc2 = CONTENT.background_single_line;
            CONTENT.infoPanel._y = 180;
        } // end else if
        CONTENT.infoPanel.icon_players._x = CONTENT.infoPanel.playersRequiredTF._x - (CONTENT.infoPanel.icon_players._width + SPACE_BETWEEN_ICON_TEXT);
        _loc2._visible = _loc3;
        _loc2._width = Number(_loc4.x) + BACKGROUND_BAR_PADDING + isRockstarVerified * 100;
        CONTENT.infoPanel._visible = true;
        this.centreInformation(_loc3, _loc2);
    } // End of the function
    function calcMissionNameSize(str)
    {
        CONTENT.measuringTF.autoSize = true;
        CONTENT.measuringTF.htmlText = str;
        var _loc2 = new flash.geom.Point(CONTENT.measuringTF.textWidth, CONTENT.measuringTF.textHeight);
        CONTENT.measuringTF.htmlText = "";
        return (_loc2);
    } // End of the function
    function centreInformation(hasName, mc)
    {
        var _loc2;
        var _loc3;
        var _loc4;
        if (CONTENT.infoPanel.icon_players._visible)
        {
            _loc2 = CONTENT.infoPanel.icon_players._x;
            _loc3 = CONTENT.infoPanel.percentageTF._x + CONTENT.infoPanel.percentageTF.textWidth;
            _loc4 = _loc3 - _loc2;
        }
        else
        {
            _loc2 = CONTENT.infoPanel.icon_thumb._x;
            _loc3 = CONTENT.infoPanel.percentageTF._x + CONTENT.infoPanel.percentageTF.textWidth;
            _loc4 = _loc3 - _loc2;
        } // end else if
        var _loc5 = _loc4 / 2 + _loc2;
        CONTENT.infoPanel._x = 10 - _loc5;
        if (hasName)
        {
            CONTENT.infoPanel._y = mc._y + mc._height + 8;
        }
        else
        {
            CONTENT.infoPanel._y = CONTENT.missionNameTF._y;
        } // end else if
    } // End of the function
    function debug()
    {
        this.SET_MISSION_INFO("this is great ", "gta RACE", "Rockstar", "10%", "45%", true);
    } // End of the function
    var BACKGROUND_BAR_PADDING = 100;
    var SPACE_BETWEEN_ICON_TEXT = 10;
} // End of Class
#endinitclip
