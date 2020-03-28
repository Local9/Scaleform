// Action script...

// [Initial MovieClip Action of sprite 75]
#initclip 19
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var valueMC, itemTextRight, leftTabMC, labelMC, textBGMC, statIconMC, isOption, hasIconText, hasRightTextBG, __set__highlighted, itemTextLeft, __get__data, topBorderMC, gamemodeMC, initialIndex, bgMC, type, getNextHighestDepth, isSelectable, dummybgMC, _highlighted, __get__highlighted, __set__data;
    function PauseMenuFreemodeItem()
    {
        super();
        _global.gfxExtensions = true;
        itemTextRight = valueMC.valueTF;
        leftTabMC._visible = false;
        labelMC.rMC._visible = false;
        labelMC.lMC._visible = false;
        textBGMC._visible = false;
        statIconMC._visible = false;
        labelMC.barMC._visible = false;
        isOption = false;
        hasIconText = false;
        hasRightTextBG = false;
        this.__set__highlighted(false);
    } // End of the function
    function setTitle()
    {
        itemTextLeft.textAutoSize = "none";
        itemTextLeft.autoSize = "left";
        itemTextLeft.multiline = false;
        itemTextLeft.wordWrap = false;
        itemTextLeft._x = 144 - itemTextLeft._width / 2;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        itemTextLeft.textAutoSize = "shrink";
        itemTextLeft.autoSize = false;
        itemTextLeft.multiline = false;
        itemTextLeft.wordWrap = false;
        itemTextLeft.text = this.__get__data()[0];
        topBorderMC._visible = false;
        var _loc7 = this.__get__data()[1];
        modeIcon = this.__get__data()[2];
        var _loc6 = _loc7 + 1;
        labelMC.verifiedMC.gotoAndStop(_loc6);
        var _loc3 = 1;
        if (modeIcon != undefined)
        {
            _loc3 = modeIcon + 1;
        } // end if
        gamemodeMC.gotoAndStop(_loc3);
        if (modeIcon != 0 && this.__get__data()[3] != undefined)
        {
            if (typeof(this.__get__data()[3]) == "number")
            {
                com.rockstargames.ui.utils.Colour.ApplyHudColour(gamemodeMC, this.__get__data()[3]);
            } // end if
        } // end if
        hasRightTextBG = initialIndex > 0;
        isOption = this.__get__data()[3] != undefined && this.__get__data()[3] != -1 && modeIcon == 0;
        if (isOption)
        {
            if (modeIcon != 0)
            {
                itemTextRight.htmlText = "";
            }
            else
            {
                var _loc4 = this.__get__data()[3];
                itemTextLeft.wordWrap = false;
                itemTextLeft.multiline = false;
                itemTextRight.htmlText = _loc4;
                itemTextRight.autoSize = "left";
                if (itemTextRight._width > 128)
                {
                    itemTextRight.autoSize = false;
                    itemTextRight._width = 128;
                    itemTextRight.textAutoSize = "shrink";
                    itemTextRight.htmlText = _loc4;
                } // end if
                itemTextRight._x = Math.round(bgMC._width - itemTextRight._width - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_OFFSET);
            } // end else if
            if (hasRightTextBG)
            {
                textBGMC._width = itemTextRight._width + com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING * 2;
                textBGMC._x = itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
                textBGMC._visible = true;
            } // end if
        }
        else
        {
            itemTextRight.htmlText = "";
        } // end else if
        if (_loc3 > 1 && isOption)
        {
            hasIconText = true;
            itemTextRight._x = Math.round(250 - itemTextRight._width);
        }
        else
        {
            hasIconText = false;
        } // end else if
        if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.PROGRESS_ITEM)
        {
            var _loc8 = this.__get__data()[4];
            statIconMC.gotoAndStop(com.rockstargames.gtav.constants.MPIconLabels.lookUp(_loc8)[1]);
            statIconMC._visible = true;
            itemTextLeft._x = 35;
            if (!labelMC.barMC)
            {
                labelMC.attachMovie("GenericColourBar", "barMC", this.getNextHighestDepth(), {_x: 155, _y: 10});
            } // end if
            labelMC.barMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE, 120);
            labelMC.barMC.percentDecimal(this.__get__data()[5]);
        }
        else if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(leftTabMC, this.__get__data()[4]);
        } // end else if
        if (this.__get__data()[7])
        {
            topBorderMC._visible = true;
        } // end if
        var _loc5 = isSelectable != 0 && isSelectable != IS_SELECTABLE_NOGAP;
        if (_loc5)
        {
            dummybgMC._visible = false;
        }
        else
        {
            dummybgMC._visible = true;
            com.rockstargames.ui.utils.Colour.ApplyHudColour(dummybgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
        } // end else if
        labelMC.rMC._visible = labelMC.lMC._visible = false;
        this.__set__highlighted(_highlighted);
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        var _loc13 = 100;
        var _loc9 = 100;
        if (isSelectable < 0 && isSelectable != IS_SELECTABLE_NOGAP || isSelectable == IS_SELECTABLE_GAP)
        {
            _loc9 = _h ? (60) : (30);
        } // end if
        if (_h)
        {
            if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
            {
                com.rockstargames.ui.utils.Colour.setHudColour(this.__get__data()[4], _loc3);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc4);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc4);
                if (hasRightTextBG)
                {
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE, _loc2);
                }
                else if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM && this.__get__data()[5])
                {
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY, _loc2);
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc2);
                } // end else if
            } // end else if
            var _loc6 = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc6);
            com.rockstargames.ui.utils.Colour.Colourise(labelMC.verifiedMC, _loc6.r, _loc6.g, _loc6.b, _loc6.a);
            if (isOption && type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM)
            {
                var _loc8 = this.__get__data()[8];
                var _loc10 = (hasRightTextBG ? (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING) : (0)) + com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.ARROW_PADDING;
                if (_loc8 == 1)
                {
                    itemTextRight._x = Math.round(labelMC.rMC._x - _loc10 - itemTextRight._width);
                    labelMC.rMC._visible = true;
                    labelMC.lMC._visible = false;
                }
                else if (_loc8 == -1)
                {
                    itemTextRight._x = 286 - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING - itemTextRight._width;
                    labelMC.rMC._visible = false;
                    labelMC.lMC._visible = true;
                }
                else if (_loc8 == undefined || _loc8 == 0)
                {
                    itemTextRight._x = Math.round(labelMC.rMC._x - _loc10 - itemTextRight._width);
                    labelMC.rMC._visible = labelMC.lMC._visible = true;
                } // end else if
                textBGMC._x = itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
                labelMC.lMC._x = itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.ARROW_PADDING - (hasRightTextBG ? (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING) : (0));
            }
            else
            {
                labelMC.rMC._visible = labelMC.lMC._visible = false;
            } // end else if
            bgMC._visible = true;
        }
        else
        {
            if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.COLOUR_ALL_ITEM)
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
                com.rockstargames.ui.utils.Colour.setHudColour(this.__get__data()[4], _loc4);
                com.rockstargames.ui.utils.Colour.setHudColour(this.__get__data()[4], _loc2);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc3);
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc4);
                if (hasRightTextBG)
                {
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PURE_WHITE, _loc2);
                }
                else if (type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM && this.__get__data()[5])
                {
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREY, _loc2);
                }
                else
                {
                    com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc2);
                } // end else if
            } // end else if
            if (isOption && type == com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.CYCLE_OPTION_ITEM)
            {
                labelMC.rMC._visible = labelMC.lMC._visible = false;
                itemTextRight._x = Math.round(bgMC._width - itemTextRight._width - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_OFFSET);
                textBGMC._x = itemTextRight._x - com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeItem.RIGHT_TXT_BG_PADDING;
            } // end if
            if (hasIconText)
            {
                itemTextRight._x = Math.round(262 - itemTextRight._width);
            } // end if
            var _loc12 = isSelectable != 0 && isSelectable != IS_SELECTABLE_NOGAP;
            bgMC._visible = _loc12;
        } // end else if
        if (modeIcon != 0 && this.__get__data()[3] == undefined)
        {
            var _loc5 = new com.rockstargames.ui.utils.HudColour();
            if (_h)
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc5);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc5);
            } // end else if
            com.rockstargames.ui.utils.Colour.Colourise(gamemodeMC, _loc5.r, _loc5.g, _loc5.b, _loc5.a);
        } // end if
        if (bgMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(bgMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        if (labelMC)
        {
            com.rockstargames.ui.utils.Colour.Colourise(labelMC, _loc4.r, _loc4.g, _loc4.b, _loc9);
            com.rockstargames.ui.utils.Colour.Colourise(valueMC, _loc2.r, _loc2.g, _loc2.b, _loc9);
            if (hasRightTextBG)
            {
                var _loc7 = new com.rockstargames.ui.utils.HudColour();
                com.rockstargames.ui.utils.Colour.setHudColour(initialIndex, _loc7);
                com.rockstargames.ui.utils.Colour.Colourise(textBGMC, _loc7.r, _loc7.g, _loc7.b, _loc7.a);
            } // end if
        } // end if
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    static var CYCLE_OPTION_ITEM = 0;
    static var COLOUR_ALL_ITEM = 2;
    static var PROGRESS_ITEM = 3;
    static var ARROW_PADDING = 4;
    static var RIGHT_TXT_BG_PADDING = 3;
    static var RIGHT_TXT_OFFSET = 6;
    var IS_SELECTABLE_GAP = 2;
    var IS_SELECTABLE_NOGAP = -2;
    var modeIcon = 0;
} // End of Class
#endinitclip
