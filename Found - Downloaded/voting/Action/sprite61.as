// Action script...

// [Initial MovieClip Action of sprite 61]
#initclip 5
class com.rockstargames.gtav.levelDesign.VOTING extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, LINE_1, LINE_4, LINE_5, BACKGROUND_NEW, THUMB_UP, THUMB_DOWN, DPAD, RESULTS_NEW, CREW_TAG, screenWidthPixels;
    function VOTING()
    {
        super();
    } // End of the function
    function READY()
    {
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.READY();
        CONTENT._visible = false;
        this.SET_THUMB_HIGHLIGHT(0);
        CONTENT.infoMC._visible = false;
        LINE_1 = CONTENT.votingMC.LINE_1;
        LINE_4 = CONTENT.votingMC.LINE_4;
        LINE_5 = CONTENT.votingMC.LINE_5;
        BACKGROUND_NEW = CONTENT.votingMC.BACKGROUND_NEW;
        THUMB_UP = CONTENT.votingMC.THUMB_UP;
        THUMB_DOWN = CONTENT.votingMC.THUMB_DOWN;
        DPAD = CONTENT.votingMC.DPAD;
        RESULTS_NEW = CONTENT.votingMC.RESULTS_NEW;
        if (CREW_TAG == undefined)
        {
            CREW_TAG = CONTENT.votingMC.attachMovie("CREW_TAG_MOVIECLIP", "CREW_TAG_MOVIECLIP", CONTENT.votingMC.getNextHighestDepth(), {_xscale: 70, _yscale: 70});
        } // end if
    } // End of the function
    function SHOW_VOTING_MESSAGE_NEW(mainTitle, missionTitle, isVerified, createdByLabel, createdByGamertag, message)
    {
        CONTENT.infoMC._visible = true;
        THUMB_UP._visible = true;
        THUMB_DOWN._visible = true;
        DPAD._visible = true;
        RESULTS_NEW._visible = false;
        var _loc10 = 34;
        var _loc9 = CONTENT.votingMC.MAIN_TITLE;
        var _loc2 = CONTENT.votingMC.MISSION_TITLE_NEW;
        var _loc5 = CONTENT.votingMC.CREATED_BY_LABEL_NEW;
        var _loc6 = CONTENT.votingMC.GAMERTAG_NEW;
        var _loc4 = CONTENT.votingMC.MESSAGE_TEXT_NEW;
        var _loc8 = CONTENT.votingMC.VERIFIED_NEW;
        var _loc3 = CONTENT.votingMC.LINE_2;
        var _loc7 = CONTENT.votingMC.LINE_3;
        var _loc11 = CONTENT.votingMC.VERIFIED;
        _loc9.htmlText = mainTitle;
        _loc2.autoSize = "left";
        var _loc12 = _loc2.textHeight;
        _loc2.htmlText = missionTitle;
        _loc5.htmlText = createdByLabel;
        _loc6.htmlText = createdByGamertag;
        _loc4.htmlText = message;
        _loc2._y = LINE_1._y + LINE_1._height + SPACING;
        _loc8._y = _loc2._y - 7;
        _loc8.gotoAndStop(isVerified);
        _loc3._y = _loc2._y + _loc2.textHeight + SPACING;
        _loc5._y = _loc3._y + _loc3._height + SPACING;
        _loc6._y = _loc3._y + _loc3._height + SPACING - 2;
        _loc7._y = _loc5._y + _loc5.textHeight + SPACING;
        _loc4._y = _loc7._y + _loc7._height + SPACING;
        _loc4.autoSize = "left";
        LINE_4._y = _loc4._y + _loc4.textHeight + SPACING;
        THUMB_UP._y = LINE_4._y + LINE_4._height + SPACING;
        DPAD._y = THUMB_UP._y + THUMB_UP._height + 20 + DPAD._height / 2;
        THUMB_DOWN._y = DPAD._y + DPAD._height + SPACING + 10 + DPAD._height / 2;
        LINE_5._y = THUMB_DOWN._y + SPACING;
        BACKGROUND_NEW._height = LINE_5._y - LINE_1._y;
        _loc6._x = _loc10 - _loc6.textWidth - SPACING;
        CREW_TAG._y = _loc3._y + _loc3._height + SPACING;
        CONTENT._visible = true;
    } // End of the function
    function SHOW_VOTING_RESULTS(mainTitle, percent, thumbsUpLabel, thumbsDownLabel, thumbsUpResults, thumbsDownResults, message)
    {
        CONTENT.votingMC.MAIN_TITLE.htmlText = mainTitle;
        RESULTS_NEW._visible = true;
        THUMB_UP._visible = false;
        THUMB_DOWN._visible = false;
        DPAD._visible = false;
        var _loc3 = CONTENT.votingMC.MESSAGE_TEXT_NEW;
        _loc3.htmlText = message;
        LINE_4._y = _loc3._y + _loc3.textHeight + SPACING;
        var _loc2 = CONTENT.votingMC.PERCENT_NEW;
        _loc2._visible = true;
        _loc2.htmlText = percent;
        RESULTS_NEW.thumbsUpLabel.text = thumbsUpLabel;
        RESULTS_NEW.thumbsDownLabel.text = thumbsDownLabel;
        RESULTS_NEW.thumbsUpResults.text = thumbsUpResults;
        RESULTS_NEW.thumbsDownResults.text = thumbsDownResults;
        RESULTS_NEW._y = LINE_4._y + SPACING;
        LINE_5._y = _loc2._y + _loc2._height + SPACING;
        BACKGROUND_NEW._height = LINE_5._y - LINE_1._y;
        CONTENT._visible = true;
    } // End of the function
    function SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank, crewColour)
    {
        var _loc2 = 8;
        CREW_TAG.SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank, crewColour);
        CREW_TAG._x = CONTENT.votingMC.BACKGROUND_NEW._x + CONTENT.votingMC.BACKGROUND_NEW._width - CREW_TAG._width + SPACING;
        CREW_TAG._y = CONTENT.votingMC.LINE_2._y + CONTENT.votingMC.LINE_2._height;
        CONTENT.votingMC.GAMERTAG_NEW._x = CREW_TAG._x - CONTENT.votingMC.GAMERTAG_NEW.textWidth;
        CONTENT._visible = true;
    } // End of the function
    function SHOW_VOTING_MESSAGE(msecs, titleMsg, votingMsg, backgroundAlpha, infoMsg)
    {
        if (backgroundAlpha != undefined)
        {
            if (backgroundAlpha < 0)
            {
                backgroundAlpha = 0;
            }
            else if (backgroundAlpha > 100)
            {
                backgroundAlpha = 100;
            } // end else if
            CONTENT.background._alpha = backgroundAlpha;
            if (backgroundAlpha == 0)
            {
                CONTENT.background._visible = false;
            }
            else if (backgroundAlpha > 0)
            {
                CONTENT.background._visible = true;
            } // end if
        } // end else if
        if (titleMsg != undefined && titleMsg != "")
        {
            CONTENT.votingMC.titleTF.htmlText = titleMsg;
        } // end if
        if (votingMsg != undefined && votingMsg != "")
        {
            CONTENT.votingMC.labelTF.htmlText = votingMsg;
            CONTENT.votingMC.labelTF.autoSize = "center";
            CONTENT.votingMC.labelTF.multiline = true;
        } // end if
        if (infoMsg != undefined && infoMsg != "")
        {
            CONTENT.infoMC._visible = true;
            CONTENT.infoMC.infoTF.htmlText = infoMsg;
        } // end if
        CONTENT.votingMC._x = screenWidthPixels / 2 - CONTENT.votingMC._width / 2;
        var _loc3 = fadeSpeed;
        if (msecs != undefined)
        {
            _loc3 = msecs;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, _loc3 / 1000, {_alpha: 100});
        CONTENT.votingMC.labelBackground._width = CONTENT.votingMC.labelTF.textWidth + 80;
        CONTENT.votingMC.thumbDownMC._x = -28;
        CONTENT.votingMC.thumbDownMC._y = 395;
        CONTENT.votingMC.thumbUpMC._x = -28;
        CONTENT.votingMC.thumbUpMC._y = 210;
    } // End of the function
    function HIDE_VOTING_MESSAGE(msecs)
    {
        var _loc2 = fadeSpeed;
        if (msecs != undefined)
        {
            _loc2 = msecs;
        } // end if
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, _loc2 / 1000, {_alpha: 0});
    } // End of the function
    function SET_THUMB_HIGHLIGHT(highlight)
    {
        if (highlight == undefined)
        {
            highlight = 0;
        } // end if
        switch (highlight)
        {
            case 0:
            case 1:
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.votingMC.thumbUpMC, colUnselected[0], colUnselected[1], colUnselected[2]);
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.votingMC.thumbDownMC, colUnselected[0], colUnselected[1], colUnselected[2]);
                break;
            } 
            case 2:
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.votingMC.thumbUpMC, colSelected[0], colSelected[1], colSelected[2]);
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.votingMC.thumbDownMC, colUnselected[0], colUnselected[1], colUnselected[2]);
                break;
            } 
            default:
            {
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.votingMC.thumbUpMC, colUnselected[0], colUnselected[1], colUnselected[2]);
                com.rockstargames.ui.utils.Colour.Colourise(CONTENT.votingMC.thumbDownMC, colSelected[0], colSelected[1], colSelected[2]);
                break;
            } 
        } // End of switch
    } // End of the function
    function debug()
    {
    } // End of the function
    var fadeSpeed = 300;
    var SPACING = 8;
    var colSelected = [227, 178, 0];
    var colUnselected = [255, 255, 255];
} // End of Class
#endinitclip
