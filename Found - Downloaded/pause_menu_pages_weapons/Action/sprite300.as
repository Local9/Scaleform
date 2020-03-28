// Action script...

// [Initial MovieClip Action of sprite 300]
#initclip 9
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsView extends com.rockstargames.ui.components.GUIView
{
    var container, __get__params, viewLinkageList, viewContainer, rowSpacing, columnSpacing, itemList, itemY, __get__index, index, __set__index, highlightedItem, __set__params;
    function PauseMPMenuWeaponsView()
    {
        super();
    } // End of the function
    function displayView()
    {
        super.displayView();
        container.progStatsMC.damageBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, STAT_BAR_W, STAT_BAR_H);
        container.progStatsMC.fireRateBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, STAT_BAR_W, STAT_BAR_H);
        container.progStatsMC.accuracyBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, STAT_BAR_W, STAT_BAR_H);
        container.progStatsMC.rangeBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, STAT_BAR_W, STAT_BAR_H);
        container.progStatsMC.clipSizeBarMC.init(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, STAT_BAR_W, STAT_BAR_H);
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        container = _p.container;
        batchCols = _p.batchCols;
        batchRows = _p.batchRows;
        batchW = _p.batchW;
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE, _loc4);
        com.rockstargames.ui.utils.Colour.Colourise(container.rankIconMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE, _loc3);
        com.rockstargames.ui.utils.Colour.Colourise(container.progStatsMC.damageAttBarMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        com.rockstargames.ui.utils.Colour.Colourise(container.progStatsMC.fireRateAttBarMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        com.rockstargames.ui.utils.Colour.Colourise(container.progStatsMC.accuracyAttBarMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        com.rockstargames.ui.utils.Colour.Colourise(container.progStatsMC.rangeAttBarMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        com.rockstargames.ui.utils.Colour.Colourise(container.progStatsMC.clipSizeAttBarMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        container.rankNumTF.textAutoSize = "shrink";
        this.showDescription(false);
        this.showRank(false);
        //return (this.params());
        null;
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc4 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc4, _loc4 + i + "MC", i);
        var _loc7 = i % batchCols * (batchW + rowSpacing);
        var _loc6 = Math.floor(i / batchCols) * (batchH + columnSpacing);
        _loc2._x = _loc7;
        _loc2._y = _loc6;
        var _loc5 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuWeaponsItem)(_loc2);
        _loc5.__set__data(_dataArray);
        itemList[i] = _loc5;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function moveHorz(dir)
    {
        var _loc2 = this.__get__index() + dir;
        var _loc3 = false;
        if (dir < 0)
        {
            if (_loc2 == -1 || _loc2 == 2 || _loc2 == 5)
            {
                _loc2 = index;
            } // end if
        } // end if
        if (dir > 0)
        {
            if (_loc2 == 3 || _loc2 == 6 || _loc2 == 9)
            {
                _loc2 = index;
            } // end if
        } // end if
        this.__set__index(_loc2);
        return (_loc3);
    } // End of the function
    function moveVert(dir)
    {
        var _loc2 = this.__get__index() + dir * batchCols;
        if (_loc2 < 0)
        {
            _loc2 = _loc2 + batchCols * batchRows;
        } // end if
        if (_loc2 >= batchCols * batchRows)
        {
            _loc2 = _loc2 - batchCols * batchRows;
        } // end if
        this.__set__index(_loc2);
    } // End of the function
    function setDescription(data)
    {
        if (data[0] == undefined)
        {
            this.showDescription(false);
            this.showRank(false);
        }
        else
        {
            this.showDescription(true);
            com.rockstargames.ui.utils.UIText.setSizedText(container.weaponTF, data[0]);
            com.rockstargames.ui.utils.UIText.setDescText(container.descTF, data[1]);
            var _loc3 = container.progStatsMC;
            var _loc5 = container.textStatsMC;
            com.rockstargames.ui.utils.UIText.setSizedText(_loc5.killsValTF, data[2] == -1 ? ("") : (data[2]));
            com.rockstargames.ui.utils.UIText.setSizedText(_loc5.deathsValTF, data[3] == -1 ? ("") : (data[3]));
            com.rockstargames.ui.utils.UIText.setSizedText(_loc5.headshotsValTF, data[4] == -1 ? ("") : (data[4]));
            var _loc4 = data[14];
            if (_loc4 == -1)
            {
                _loc4 = "";
            }
            else if (_loc4 == undefined)
            {
                _loc4 = "0";
            }
            else
            {
                _loc4 = com.rockstargames.ui.utils.MathStar.toFixedRound(_loc4, 2);
            } // end else if
            com.rockstargames.ui.utils.UIText.setSizedText(_loc5.kdRatioValTF, _loc4);
            com.rockstargames.ui.utils.UIText.setSizedText(_loc5.accuracyValTF, data[5] == -1 ? ("") : (String(com.rockstargames.ui.utils.MathStar.toFixedRound(data[5], 2))));
            this.setBar(_loc3.damageBarMC, _loc3.damageAttBarMC, data[6], data[10]);
            this.setBar(_loc3.fireRateBarMC, _loc3.fireRateAttBarMC, data[7], data[11]);
            this.setBar(_loc3.accuracyBarMC, _loc3.accuracyAttBarMC, data[9], data[12]);
            this.setBar(_loc3.rangeBarMC, _loc3.rangeAttBarMC, data[15], data[16]);
            this.setBar(_loc3.clipSizeBarMC, _loc3.clipSizeAttBarMC, data[8], data[13]);
            if (data[17])
            {
                this.showRank(true);
                container.rankNumTF.text = data[17];
            }
            else
            {
                this.showRank(false);
            } // end else if
        } // end else if
    } // End of the function
    function showDescription(show)
    {
        container.weaponTF._visible = show;
        container.descTF._visible = show;
        container.textStatsMC._visible = show;
        container.progStatsMC._visible = show;
    } // End of the function
    function showRank(show)
    {
        container.rankNumTF._visible = show;
        container.rankIconMC._visible = show;
    } // End of the function
    function setBar(barmc, attmc, base, attpct)
    {
        if (base > 100)
        {
            base = 100;
        } // end if
        attmc._visible = barmc._visible = base != -1;
        if (base + attpct > 100)
        {
            attpct = 100 - base;
        } // end if
        if (attpct >= 0)
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(attmc, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLUE);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.ApplyHudColour(attmc, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED);
            base = base + attpct;
            if (base < 0)
            {
                base = 0;
            } // end if
        } // end else if
        barmc.percent(base);
        var _loc5 = Math.round(142 + ATTACHMENT_BAR_W * base / 100);
        var _loc6 = ATTACHMENT_BAR_W * (Math.abs(attpct) / 100);
        attmc._width = _loc6;
        attmc._x = _loc5;
    } // End of the function
    function focusHighlightStyle(targetIndex)
    {
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            itemList[_loc2].highlighted = _loc2 == targetIndex;
        } // end of for
        highlightedItem = targetIndex;
    } // End of the function
    var STAT_BAR_W = 280;
    var STAT_BAR_H = 18;
    var ATTACHMENT_BAR_W = 126;
    var batchW = 0;
    var batchH = 106;
    var batchCols = 3;
    var batchRows = 2;
} // End of Class
#endinitclip
