// Action script...

// [Initial MovieClip Action of sprite 242]
#initclip 30
class com.rockstargames.gtav.levelDesign.FEED_STATS extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var contactTXD, contactTEXTURE, important, CONTENT, contactImage, baseClassStrID, returnPathLvl, returnPath1, parseForFonts, colourRed;
    function FEED_STATS()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(statTitleStr, statBodyStr, iconEnum, stepVal, barValue, isImportant, txd, imgStr)
    {
        contactTXD = txd;
        contactTEXTURE = imgStr;
        important = isImportant;
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc5;
        switch (contactTXD)
        {
            case "CHAR_MICHAEL":
            {
                _loc5 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL;
                break;
            } 
            case "CHAR_FRANKLIN":
            {
                _loc5 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRANKLIN;
                break;
            } 
            case "CHAR_TREVOR":
            {
                _loc5 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR;
                break;
            } 
            default:
            {
                _loc5 = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE;
                break;
            } 
        } // End of switch
        com.rockstargames.ui.utils.Colour.setHudColour(_loc5, _loc3);
        if (CONTENT.barMC.yellowMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.barMC.yellowMC, _loc3.r, _loc3.g, _loc3.b, 100);
        } // end if
        if (CONTENT.barMC.fadeMC != undefined)
        {
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.barMC.fadeMC, _loc3.r, _loc3.g, _loc3.b, 50);
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.barMC.modifiedMC);
        if (txd != undefined)
        {
            if (contactImage == undefined)
            {
                contactImage = CONTENT.imageMC.attachMovie("imageLoader", "iMC", CONTENT.imageMC.getNextHighestDepth());
            } // end if
            contactImage.init(baseClassStrID, contactTXD, contactTEXTURE, 25, 25);
            var _loc7 = String(contactImage).split(".");
            returnPath1 = _loc7.slice(_loc7.length - returnPathLvl).join(".");
            if (txd.substr(0, 5) == "CHAR_")
            {
                contactImage.requestTxdRef(returnPath1, true);
            }
            else
            {
                contactImage.addTxdRef(returnPath1);
            } // end if
        } // end else if
        if (statBodyStr == undefined || statBodyStr == "" || statBodyStr == statTitleStr)
        {
            statBodyStr = "";
        } // end if
        CONTENT.titleTF.autoSize = true;
        CONTENT.titleTF.htmlText = this.parseForFonts(statTitleStr);
        CONTENT.bodyTF.autoSize = true;
        CONTENT.bodyTF.htmlText = this.parseForFonts(statBodyStr);
        if (CONTENT.bodyTF._y + CONTENT.bodyTF._height > 39)
        {
            CONTENT.barMC._y = CONTENT.maskMC._y = CONTENT.bodyTF._y + CONTENT.bodyTF._height;
        } // end if
        var _loc8 = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(barValue + stepVal, 31.200000, 2, 5);
        barValue = com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(barValue, 31.200000, 2, 5);
        stepVal = _loc8 - barValue;
        if (barValue > 100)
        {
            barValue = 100;
        } // end if
        if (barValue + stepVal > 100)
        {
            stepVal = 100 - barValue;
        } // end if
        if (stepVal > 0)
        {
            CONTENT.barMC.yellowMC._xscale = barValue;
            CONTENT.barMC.modifiedMC._xscale = barValue + stepVal;
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.barMC.modifiedMC, 255, 255, 255, 100);
            CONTENT.barMC.modifiedMC._visible = true;
            this.flashGlowOff(CONTENT.barMC.modifiedMC, 0.250000);
        }
        else if (stepVal < 0)
        {
            CONTENT.barMC.yellowMC._xscale = barValue + stepVal;
            CONTENT.barMC.modifiedMC._xscale = barValue;
            colourRed = new com.rockstargames.ui.utils.HudColour();
            com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_RED, colourRed);
            com.rockstargames.ui.utils.Colour.Colourise(CONTENT.barMC.modifiedMC, colourRed.r, colourRed.g, colourRed.b, 100);
            CONTENT.barMC.modifiedMC._visible = true;
            this.flashGlowOff(CONTENT.barMC.modifiedMC, 0.250000);
        }
        else
        {
            CONTENT.barMC.modifiedMC._visible = false;
            CONTENT.barMC.yellowMC._xscale = barValue;
        } // end else if
        CONTENT.Background._height = CONTENT.barMC._y + 18;
        CONTENT.BackgroundFlash._height = CONTENT.Background._height;
    } // End of the function
    function flashGlowOn(targetMC, blinkSpeed)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(targetMC, blinkSpeed, {_alpha: 100, delay: blinkSpeed / 2, onCompleteScope: this, onComplete: flashGlowOff, onCompleteArgs: [targetMC, blinkSpeed]});
    } // End of the function
    function flashGlowOff(targetMC, blinkSpeed)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(targetMC, blinkSpeed, {_alpha: 0, delay: blinkSpeed / 2, onCompleteScope: this, onComplete: flashGlowOn, onCompleteArgs: [targetMC, blinkSpeed]});
    } // End of the function
    function STREAM_COMP_READY()
    {
        super.STREAM_COMP_READY();
    } // End of the function
    function CLEAR_TXD()
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT.barMC.modifiedMC);
        if (contactImage.isLoaded == true)
        {
            contactImage.removeTxdRef();
        } // end if
    } // End of the function
    var barMaxWidth = 134;
    var stepVal = 0;
} // End of Class
#endinitclip
