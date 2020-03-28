// Action script...

// [Initial MovieClip Action of sprite 234]
#initclip 22
class com.rockstargames.gtav.levelDesign.FEED_HEIST extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var contactTXD, contactTEXTURE, important, contactImage, CONTENT, parseForFonts, baseClassStrID, returnPathLvl, returnPath1;
    function FEED_HEIST()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(charName, txd, imgStr, statPct0, isImportant, statName0, statName1, statPct1, statName2, statPct2, statName3, statPct3)
    {
        contactTXD = txd;
        contactTEXTURE = imgStr;
        important = isImportant;
        if (contactImage == undefined)
        {
            contactImage = CONTENT.imageMC.attachMovie("imageLoader", "iMC", CONTENT.imageMC.getNextHighestDepth());
        } // end if
        CONTENT.titleTF.autoSize = true;
        CONTENT.titleTF.htmlText = this.parseForFonts(charName);
        contactImage.init(baseClassStrID, contactTXD, contactTEXTURE, 25, 25);
        var _loc3 = String(contactImage).split(".");
        returnPath1 = _loc3.slice(_loc3.length - returnPathLvl).join(".");
        contactImage.requestTxdRef(returnPath1, true);
        var _loc2 = statPct1 > 0 || statPct2 > 0 || statPct3 > 0;
        this.updateStat(0, statName0, statPct0, _loc2);
        if (statPct1)
        {
            this.updateStat(1, statName1, statPct1, _loc2);
        } // end if
        if (statPct2)
        {
            this.updateStat(2, statName2, statPct2, _loc2);
        } // end if
        if (statPct3)
        {
            this.updateStat(3, statName3, statPct3, _loc2);
        } // end if
        CONTENT.titleTF._y = 4;
    } // End of the function
    function updateStat(index, nameStr, pct, bMultiStat)
    {
        var _loc5 = 27;
        var _loc7 = bMultiStat ? (34) : (19);
        if (CONTENT["statMC" + index] == undefined)
        {
            var _loc6 = _loc7 + index * _loc5;
            CONTENT.attachMovie("heistStatMC", "statMC" + index, CONTENT.getNextHighestDepth(), {_y: _loc6});
        } // end if
        var _loc2 = CONTENT["statMC" + index];
        if (pct > 100)
        {
            pct = 100;
        } // end if
        _loc2.barMC.modifiedMC._visible = false;
        _loc2.barMC.yellowMC._xscale = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(pct, 31.200000, 2, 5);
        _loc2.nameTF.autoSize = true;
        _loc2.nameTF.htmlText = this.parseForFonts(nameStr);
        _loc2.nameTF._x = bMultiStat ? (6) : (34);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.barMC.yellowMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
        com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2.barMC.fadeMC, com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
        _loc2.barMC.fadeMC._alpha = 50;
        CONTENT.Background._height = _loc2._y + _loc2._height + 8;
        CONTENT.BackgroundFlash._height = CONTENT.Background._height;
    } // End of the function
    function CLEAR_TXD()
    {
        if (contactImage.isLoaded == true)
        {
            contactImage.removeTxdRef();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
