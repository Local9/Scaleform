// Action script...

// [Initial MovieClip Action of sprite 46]
#initclip 16
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsView extends com.rockstargames.ui.components.GUIView
{
    var container, __get__params, viewLinkageList, viewContainer, rowSpacing, columnSpacing, itemList, itemY, __get__index, __set__index, _index, dataList, highlightedItem, __set__params;
    function PauseMPMenuAwardsView()
    {
        super();
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        container = _p.container;
        batchCols = _p.batchCols;
        batchRows = _p.batchRows;
        batchW = _p.batchW;
        var _loc5 = container.descMC.colWhiteMC;
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc3);
        if (_loc5 != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(_loc5, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
        } // end if
        //return (this.params());
        null;
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc5 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc5, "a" + i + "MC", i);
        var _loc7 = i % batchCols * (batchW + rowSpacing);
        var _loc6 = Math.floor(i / batchCols) * (batchH + columnSpacing);
        _loc2._x = _loc7;
        _loc2._y = _loc6;
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.multiplayer.PauseMPMenuAwardsItem)(_loc2);
        _loc4.__set__data(_dataArray);
        itemList[i] = _loc4;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function moveHorz(dir)
    {
        var _loc2 = this.__get__index() + dir;
        var _loc3 = false;
        if (dir < 0)
        {
            if (_loc2 == -1 || _loc2 == 3 || _loc2 == 7)
            {
                _loc2 = index;
            } // end if
        } // end if
        if (dir > 0)
        {
            if (_loc2 == 4 || _loc2 == 8 || _loc2 == 12)
            {
                _loc2 = index;
            } // end if
        } // end if
        this.__set__index(_loc2);
        this.setDescription();
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
        this.setDescription();
    } // End of the function
    function set index(_i)
    {
        super.__set__index(_i);
        this.setDescription();
        //return (this.index());
        null;
    } // End of the function
    function get index()
    {
        return (_index);
    } // End of the function
    function setDescription(num)
    {
        var _loc3 = dataList[this.__get__index()].slice(6);
        var _loc2 = container.descMC.colWhiteMC;
        var _loc6 = container.descMC.colMC;
        if (num == -1)
        {
            _loc2.titleTF.text = "";
            _loc2.descTF.text = "";
            _loc2.progressTF.text = "";
            _loc2.awardsTF.text = "";
            _loc2.progressValMC.progressValTF.text = "";
            _loc2.awardsValTF.text = "";
            _loc2.hexMC._visible = false;
        }
        else if (_loc3 != undefined)
        {
            com.rockstargames.ui.utils.UIText.setSizedText(_loc2.titleTF, _loc3[0]);
            com.rockstargames.ui.utils.UIText.setDescText(_loc2.descTF, _loc3[1], false);
            var _loc7 = _loc3[4];
            var _loc13 = _loc3[5];
            var _loc9 = _loc3[6];
            var _loc10 = _loc3[7];
            var _loc8 = _loc3[8];
            var _loc11 = _loc3[9];
            var _loc12 = _loc3[10];
            if (_loc9 != undefined)
            {
                com.rockstargames.ui.utils.UIText.setSizedText(_loc2.progressTF, _loc9, true);
            } // end if
            var _loc5 = _loc13 < 100;
            _loc2.awardsTF._visible = _loc5;
            _loc2.hexMC._visible = _loc5;
            _loc2.awardsValTF._visible = _loc5;
            if (_loc8 != undefined && _loc5)
            {
                com.rockstargames.ui.utils.UIText.setSizedText(_loc2.awardsTF, _loc8, true);
            } // end if
            if (_loc10 != undefined)
            {
                com.rockstargames.ui.utils.UIText.setSizedText(_loc2.progressValMC.progressValTF, _loc10, false, true);
                _loc2.progressValMC._x = 578 - _loc2.progressValMC.progressValTF.textWidth - 10;
                com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.progressValMC, _loc7);
            } // end if
            if (_loc11 != undefined && _loc5)
            {
                com.rockstargames.ui.utils.UIText.setSizedText(_loc2.awardsValTF, _loc11, false, true);
                _loc2.awardsValTF._x = _loc2.hexMC._x - _loc2.hexMC._width / 2 - (TextField)(_loc2.awardsValTF).textWidth;
                _loc2.hexMC._visible = true;
            }
            else
            {
                _loc2.hexMC._visible = false;
            } // end else if
            if (_loc12 != undefined)
            {
                com.rockstargames.ui.utils.UIText.setSizedText(_loc6.colValTF, _loc12, false, true);
                _loc6._x = 572 - _loc6._width;
            } // end if
            var _loc4 = new com.rockstargames.ui.utils.HudColour();
            if (_loc7 != undefined)
            {
                com.rockstargames.ui.utils.Colour.setHudColour(_loc7, _loc4);
            } // end if
            if (_loc6 != undefined)
            {
                com.rockstargames.ui.utils.Colour.Colourise(_loc6, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
            } // end if
        } // end else if
    } // End of the function
    function setAwardsText(tf, str, alignleft)
    {
        tf.text = str;
        tf.autoSize = "left";
        tf.wordWrap = false;
        tf.multiline = false;
    } // End of the function
    function focusHighlightStyle(targetIndex)
    {
        var _loc3;
        var _loc2 = 0;
        for (var _loc2 = 0; _loc2 < itemList.length; ++_loc2)
        {
            _loc3 = itemList[_loc2];
            _loc3.__set__highlighted(_loc2 == targetIndex);
        } // end of for
        highlightedItem = targetIndex;
    } // End of the function
    var batchW = 0;
    var batchH = 106;
    var batchCols = 3;
    var batchRows = 2;
} // End of Class
#endinitclip
