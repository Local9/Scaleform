// Action script...

// [Initial MovieClip Action of sprite 238]
#initclip 26
class com.rockstargames.gtav.levelDesign.FEED_CREW_TAG extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var CONTENT, crewTagMC, important, crewImage, baseClassStrID, returnPathLvl, returnPath1, parseForFonts;
    function FEED_CREW_TAG()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, rank, hasFounderStatus, bodyStr, isImportant, txd, imgStr, gamerStr, crewPackedStr)
    {
        if (CONTENT.crewTagMC == undefined)
        {
            crewTagMC = (com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP)(CONTENT.attachMovie("CREW_TAG_MOVIECLIP", "CREW_TAG", CONTENT.getNextHighestDepth(), {_x: 42, _y: 9, _xscale: 105, _yscale: 105}));
        } // end if
        var _loc3 = true;
        var _loc12 = 5;
        important = isImportant;
        if (txd != undefined && txd != "" && imgStr != undefined && imgStr != "")
        {
            if (crewImage == undefined)
            {
                crewImage = CONTENT.imageMC.attachMovie("imageLoader", "iMC", CONTENT.imageMC.getNextHighestDepth());
            } // end if
            crewImage.init(baseClassStrID, txd, imgStr, 25, 25);
            var _loc4 = String(crewImage).split(".");
            returnPath1 = _loc4.slice(_loc4.length - returnPathLvl).join(".");
            crewImage.addTxdRef(returnPath1);
            _loc3 = false;
        }
        else
        {
            CONTENT.imageMC.imageTF._visible = false;
            crewTagMC._x = 11;
            _loc3 = true;
        } // end else if
        var _loc5;
        if (gamerStr == undefined || gamerStr == "")
        {
            gamerStr = "";
            _loc5 = bodyStr;
        }
        else
        {
            _loc5 = gamerStr + "<BR>" + bodyStr;
        } // end else if
        CONTENT.bodyTF.htmlText = this.parseForFonts(_loc5);
        CONTENT.bodyTF.autoSize = "left";
        CONTENT.bodyTF.multiline = true;
        CONTENT.bodyTF.wordWrap = true;
        var _loc6 = 0;
        if (rank > 5)
        {
            rank = 5;
        } // end if
        if (rank > 0)
        {
            ++rank;
        } // end if
        if (hasFounderStatus == true)
        {
            rank = 1;
        } // end if
        _loc6 = rank;
        if (crewPackedStr != undefined && crewPackedStr != "")
        {
            crewTagMC.UNPACK_CREW_TAG(crewPackedStr);
        }
        else
        {
            crewTagMC.SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, _loc6);
        } // end else if
        var _loc8 = CONTENT.bodyTF._y + CONTENT.bodyTF._height + 5;
        CONTENT.Background._height = _loc8;
        CONTENT.BackgroundFlash._height = _loc8;
    } // End of the function
    function CLEAR_TXD()
    {
        if (crewImage.isLoaded == true)
        {
            crewImage.removeTxdRef();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
