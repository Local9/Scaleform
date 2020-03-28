// Action script...

// [Initial MovieClip Action of sprite 34]
#initclip 1
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var outlineMC, labelMC, itemTextRight, leftlabelMC, itemTextLeft, __get__data, bgMC, iconMC, type, attachMovie, crewTagMC, getNextHighestDepth, _data, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function PauseMenuFreemodeDetailsItem()
    {
        super();
        outlineMC._visible = false;
        _global.gfxExtensions = true;
        itemTextRight = labelMC.valueTF;
        itemTextLeft = leftlabelMC.titleTF;
        basetextW = itemTextLeft._width;
        labelMC.nameTF.textAutoSize = "shrink";
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        if (this.__get__data()[1] != undefined)
        {
            com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, this.__get__data()[1], true);
        } // end if
        this.snapBGGrid(bgMC);
        bgMC._visible = false;
        if (iconMC != undefined)
        {
            iconMC.removeMovieClip();
        } // end if
        var _loc7 = 5;
        switch (type)
        {
            case 0:
            case 1:
            {
                itemTextRight._width = 288 - (itemTextLeft._x + itemTextLeft.textWidth + 25);
                itemTextRight._x = 288 - itemTextRight._width - 6;
                break;
            } 
            case 2:
            {
                var _loc8 = ["CUSTOM_MISSION", "DEATHMATCH", "RACE", "SURVIVAL", "TEAM_DEATHMATCH", "", "GANG_ATTACK", "", "BASE_JUMPING", "VEHICLE_DEATHMATCH", "RACE_LAND", "RACE_FOOT", "RACE_BICYCLE", "RACE_WATER", "RACE_AIR"];
                var _loc4 = _loc8[this.__get__data()[2]];
                iconMC = this.attachMovie(_loc4, _loc4 + "MC", 1);
                if (iconMC != undefined)
                {
                    iconMC._xscale = iconMC._yscale = 80;
                    iconMC._x = bgMC._width - iconMC._width * 0.500000 - 9;
                    iconMC._y = 13;
                    itemTextRight._x = iconMC._x - iconMC._width * 0.500000 - 132 - _loc7;
                    var _loc6 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE;
                    if (this.__get__data()[3] != undefined)
                    {
                        _loc6 = this.__get__data()[3];
                    } // end if
                    com.rockstargames.ui.utils.Colour.ApplyHudColour(iconMC, _loc6);
                } // end if
                break;
            } 
            case 3:
            {
                labelMC.nameTF.text = this.__get__data()[1];
                itemTextRight.htmlText = "";
                var _loc3 = this.__get__data()[2];
                if (_loc3 == undefined || _loc3 == "")
                {
                    if (crewTagMC)
                    {
                        crewTagMC._visible = false;
                    } // end if
                }
                else
                {
                    if (!crewTagMC)
                    {
                        crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP", "crewTagMC", this.getNextHighestDepth(), {_y: 5, _xscale: 60, _yscale: 60});
                    } // end if
                    crewTagMC.UNPACK_CREW_TAG(_loc3);
                    crewTagMC._visible = true;
                    crewTagMC._x = 288 - crewTagMC._width + 3;
                    labelMC.nameTF._x = crewTagMC._x - 6 - labelMC.nameTF._width;
                } // end else if
                break;
            } 
            case 4:
            {
                outlineMC._visible = true;
                bgMC._y = labelMC._y = leftlabelMC._y = 2;
                break;
            } 
            case 5:
            {
                com.rockstargames.ui.utils.UIText.setDescText(itemTextLeft, _data[0], true);
                var _loc5 = 3;
                itemTextLeft._y = _loc5;
                bgMC._height = _loc5 + itemTextLeft.textHeight;
                itemTextRight.htmlText = "";
                break;
            } 
        } // End of switch
        com.rockstargames.ui.utils.Colour.ApplyHudColour(leftlabelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(labelMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
        //return (this.data());
        null;
    } // End of the function
    function snapBGGrid(bgMC)
    {
        var _loc2 = Math.ceil(itemTextLeft.textHeight / 27);
        bgMC._height = _loc2 * 27 - 2;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var basetextW = 266;
} // End of Class
#endinitclip
