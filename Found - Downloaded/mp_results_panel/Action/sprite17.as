// Action script...

// [Initial MovieClip Action of sprite 17]
#initclip 5
class com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL extends com.rockstargames.ui.core.BaseScreenLayout
{
    var slots, displayStateBM, CONTENT, titleTF, panelMC, bgFillMC, bgTopMC, bgBottomMC, barMC, subtitleTF, _slotContainer, screenWidthPixels, slotJustifiedFormat;
    function MP_RESULTS_PANEL()
    {
        super();
        slots = [];
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        displayStateBM = new com.rockstargames.ui.utils.BitMonger();
        titleTF = CONTENT.titleTF;
        titleTF.autoSize = "center";
        panelMC = CONTENT.panelMC;
        panelMC._visible = false;
        bgFillMC = panelMC.fillMC;
        bgTopMC = panelMC.topMC;
        bgBottomMC = panelMC.bottomMC;
        barMC = CONTENT.panelMC.barMC;
        barMC._visible = false;
        barMC._y = 0;
        subtitleTF = CONTENT.panelMC.subtitleTF;
        subtitleTF.autoSize = "center";
        _slotContainer = panelMC.createEmptyMovieClip("_slotContainer", panelMC.getNextHighestDepth());
        this.initScreenLayout();
    } // End of the function
    function initScreenLayout()
    {
        CONTENT._x = screenWidthPixels / 2;
    } // End of the function
    function SET_TITLE(title)
    {
        titleTF.htmlText = title != undefined ? (title) : ("");
        if (title != undefined && title != "")
        {
            displayStateBM.setBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_TITLE);
        }
        else
        {
            displayStateBM.clearBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_TITLE);
        } // end else if
    } // End of the function
    function SET_SUBTITLE(label)
    {
        if (label != undefined && label != "")
        {
            subtitleTF.htmlText = label;
            displayStateBM.setBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SUBTITLE);
        }
        else
        {
            displayStateBM.clearBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SUBTITLE);
        } // end else if
        this.updateDisplay();
    } // End of the function
    function SET_SLOT(id, state, label)
    {
        var _loc2 = slots[id];
        if (_loc2 != undefined)
        {
            _loc2.removeMovieClip();
        } // end if
        _loc2 = _slotContainer.attachMovie("Slot", "s" + id, _slotContainer.getNextHighestDepth());
        slots[id] = _slotContainer.attachMovie("Slot", "s" + id, _slotContainer.getNextHighestDepth());
        if (slotJustifiedFormat == undefined)
        {
            slotJustifiedFormat = _loc2.labelTF.getTextFormat();
            slotJustifiedFormat.align = "justify";
            slotJustifiedFormat.leading = 3;
        } // end if
        _loc2.labelTF.autoSize = true;
        _loc2.labelTF.htmlText = label;
        _loc2.bgMC._alpha = 0;
        if (_loc2.labelTF._height > 25)
        {
            _loc2.bgMC._height = Math.ceil(_loc2.labelTF._y + _loc2.labelTF._height + 3);
        }
        else
        {
            _loc2.bgMC._height = 25;
        } // end else if
        displayStateBM.setBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SLOTS);
        this.SET_SLOT_STATE(id, state);
    } // End of the function
    function SET_SLOT_STATE(id, state)
    {
        var _loc3 = new com.rockstargames.ui.utils.BitMonger(state);
        var _loc2 = slots[id];
        if (com.rockstargames.ui.utils.BitMonger.IS_BIT_SET(state, com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.SLOT_JUSTIFIED))
        {
            _loc2.labelTF.setTextFormat(slotJustifiedFormat);
            _loc2.labelTF._y = 6;
            _loc2.bgMC._height = Math.ceil(_loc2.labelTF._y + _loc2.labelTF._height + 6);
        } // end if
        if (_loc3.isBitSet(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.SLOT_SELECTED))
        {
            this.ApplyHudColourToTF(_loc2.labelTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
            com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.bgMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            _loc2.bgMC._alpha = 100;
        }
        else
        {
            this.ApplyHudColourToTF(_loc2.labelTF, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
            _loc2.bgMC._alpha = 0;
        } // end else if
        this.updateDisplay();
    } // End of the function
    function CLEAR_SLOT(id)
    {
        var _loc3 = slots[id];
        if (_loc3 != undefined)
        {
            slots[id].removeMovieClip();
        } // end if
        if (id == slots.length - 1)
        {
            slots.pop();
        }
        else
        {
            slots[id] = undefined;
        } // end else if
        if (slots.length == 0)
        {
            displayStateBM.clearBit(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SLOTS);
        } // end if
        this.updateDisplay();
    } // End of the function
    function CLEAR_ALL_SLOTS()
    {
        _supressUpdate = true;
        for (var _loc2 = slots.length - 1; _loc2 >= 0; --_loc2)
        {
            this.CLEAR_SLOT(_loc2);
        } // end of for
        _supressUpdate = false;
        this.updateDisplay();
    } // End of the function
    function updateDisplay()
    {
        if (_supressUpdate)
        {
            return;
        } // end if
        var _loc5;
        var _loc4;
        var _loc2;
        var _loc3 = 0;
        for (var _loc2 = 0; _loc2 < slots.length; ++_loc2)
        {
            if (slots[_loc2] != undefined)
            {
                _loc4 = _loc5;
                _loc5 = slots[_loc2];
                _loc3 = 0;
            }
            else
            {
                ++_loc3;
            } // end else if
            if (_loc2 > 0)
            {
                _loc5._y = Math.round(_loc4._y + _loc4._height + _loc3 * 25);
            } // end if
        } // end of for
        if (displayStateBM.isBitSet(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SUBTITLE))
        {
            barMC._y = Math.ceil(subtitleTF._height + 4);
            bgFillMC._height = barMC._y - 2;
            panelMC._visible = true;
            subtitleTF._visible = true;
        }
        else
        {
            barMC._y = 0;
            panelMC._visible = false;
            subtitleTF._visible = false;
        } // end else if
        if (displayStateBM.isBitSet(com.rockstargames.gtav.Multiplayer.MP_RESULTS_PANEL.DISPLAY_SLOTS))
        {
            _slotContainer._y = barMC._y + barMC._height;
            bgFillMC._height = _slotContainer._y + _slotContainer._height - 2;
            panelMC._visible = true;
            barMC._visible = true;
            _slotContainer._visible = true;
        }
        else
        {
            barMC._visible = false;
            _slotContainer._visible = false;
        } // end else if
        bgBottomMC._y = bgFillMC._y + bgFillMC._height;
        this.initScreenLayout();
    } // End of the function
    function ApplyHudColourToTF(tf, colourId)
    {
        var _loc1 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(colourId, _loc1);
        tf.textColor = com.rockstargames.ui.utils.Colour.RGBToHex(_loc1.r, _loc1.g, _loc1.b);
    } // End of the function
    static var SLOT_SELECTED = 0;
    static var SLOT_JUSTIFIED = 1;
    static var DISPLAY_TITLE = 0;
    static var DISPLAY_SUBTITLE = 1;
    static var DISPLAY_SLOTS = 2;
    var rowStartY = 192;
    var rowYSpacing = 25;
    var rowXPadding = 10;
    var widestSlot = 0;
    var _supressUpdate = false;
} // End of Class
#endinitclip
