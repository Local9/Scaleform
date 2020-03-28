// Action script...

// [Initial MovieClip Action of sprite 64]
#initclip 24
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryView extends com.rockstargames.ui.components.GUIView
{
    var container, document, textContainerMC, __get__params, viewLinkageList, viewContainer, rowSpacing, columnSpacing, itemList, itemY, index, __get__index, __set__index, dataList, highlightedItem, __set__params;
    function PauseMenuGalleryView()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function set params(_p)
    {
        super.__set__params(_p);
        container = _p.container;
        document = _p.document;
        batchCols = _p.batchCols;
        batchRows = _p.batchRows;
        batchW = _p.batchW;
        textContainerMC = container.textContainerMC;
        textContainerMC.trackValueTF.textAutoSize = "shrink";
        //return (this.params());
        null;
    } // End of the function
    function addDisplayItem(i, _dataArray)
    {
        var _loc5 = viewLinkageList[0];
        var _loc2 = viewContainer.attachMovie(_loc5, "g" + i + "MC", i);
        var _loc7 = i % batchCols * (batchW + rowSpacing);
        var _loc6 = Math.floor(i / batchCols) * (batchH + columnSpacing);
        _loc2._x = _loc7;
        _loc2._y = _loc6;
        var _loc4 = (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuGalleryItem)(_loc2);
        _loc4.__set__data(_dataArray);
        itemList[i] = _loc4;
        itemY = itemY + (_loc2.bgMC._height + rowSpacing);
    } // End of the function
    function moveHorz(dir)
    {
        index = index + dir;
        this.setDescription();
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
    function setDescription()
    {
        var _loc3 = dataList[this.__get__index()].slice(6);
        var _loc4 = _loc3[4];
        com.rockstargames.ui.utils.UIText.setSizedText(textContainerMC.titleTF, _loc3[0] != undefined ? (_loc3[0]) : (""));
        com.rockstargames.ui.utils.UIText.setSizedText(textContainerMC.dateValueTF, _loc3[1] != undefined ? (_loc3[1]) : (""));
        com.rockstargames.ui.utils.UIText.setSizedText(textContainerMC.locationValueTF, _loc3[6] != undefined ? (_loc3[6]) : (""));
        com.rockstargames.ui.utils.UIText.setSizedText(textContainerMC.trackValueTF, _loc3[7] != undefined ? (_loc3[7]) : (""));
        for (var _loc2 = 1; _loc2 <= 5; ++_loc2)
        {
            container.ratingMC["star" + _loc2]._alpha = _loc4 < _loc2 ? (50) : (100);
        } // end of for
    } // End of the function
    function clearDescription()
    {
        textContainerMC.dateTF.text = "";
        textContainerMC.locationTF.text = "";
        textContainerMC.trackTF.text = "";
        textContainerMC.titleTF.text = "";
        textContainerMC.dateValueTF.text = "";
        textContainerMC.locationValueTF.text = "";
        textContainerMC.trackValueTF.text = "";
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
    var maxGalleryItems = 1;
    var batchW = 0;
    var batchH = 106;
    var batchCols = 3;
    var batchRows = 2;
} // End of Class
#endinitclip
