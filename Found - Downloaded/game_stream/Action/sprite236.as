// Action script...

// [Initial MovieClip Action of sprite 236]
#initclip 24
class com.rockstargames.gtav.levelDesign.FEED_MP_TICKER extends com.rockstargames.gtav.levelDesign.BaseGameStreamComponent
{
    var important, CONTENT, parseForFonts, CREW_TAG1, CREW_TAG2;
    function FEED_MP_TICKER()
    {
        super();
    } // End of the function
    function SET_FEED_COMPONENT(gamer1str, crew1TypeIsPrivate, crew1TagContainsRockstar, crew1Tag, crew1rank, crew1hasFounderStatus, bodyStr, gamer2str, crew2TypeIsPrivate, crew2TagContainsRockstar, crew2Tag, crew2rank, crew2hasFounderStatus, isImportant)
    {
        var _loc15 = 30;
        important = isImportant;
        var _loc12 = false;
        var _loc13 = false;
        var _loc10 = false;
        var _loc9 = false;
        if (gamer1str != "" && gamer1str != null && gamer1str != undefined)
        {
            _loc12 = true;
            CONTENT.gamer1TF.htmlText = this.parseForFonts(gamer1str);
            CONTENT.gamer1TF.autoSize = "left";
        }
        else
        {
            CONTENT.bodyTF._y = CONTENT.gamer1TF._y;
        } // end else if
        CONTENT.bodyTF.htmlText = this.parseForFonts(bodyStr);
        CONTENT.bodyTF.autoSize = "left";
        CONTENT.bodyTF.multiline = true;
        CONTENT.bodyTF.wordWrap = true;
        if (gamer2str != "" && gamer2str != null && gamer2str != undefined)
        {
            _loc13 = true;
            CONTENT.gamer2TF._y = CONTENT.bodyTF._y + CONTENT.bodyTF._height - 3;
            CONTENT.gamer2TF.htmlText = this.parseForFonts(gamer2str);
            CONTENT.gamer2TF.autoSize = "left";
        }
        else
        {
            CONTENT.gamer2TF._y = CONTENT.bodyTF._y + CONTENT.bodyTF._height - CONTENT.gamer2TF._height;
        } // end else if
        if (crew1Tag != "" && crew1Tag != null && crew1Tag != undefined)
        {
            _loc10 = true;
        } // end if
        if (crew2Tag != "" && crew2Tag != null && crew2Tag != undefined)
        {
            _loc9 = true;
        } // end if
        if (_loc10 == true)
        {
            if (CREW_TAG1 == undefined)
            {
                CREW_TAG1 = CONTENT.attachMovie("CREW_TAG_MOVIECLIP", "CT1", CONTENT.getNextHighestDepth(), {_visible: false});
            } // end if
            var _loc5 = 0;
            if (crew1rank > 5)
            {
                crew1rank = 5;
            } // end if
            if (crew1rank > 0)
            {
                ++crew1rank;
            } // end if
            if (crew1hasFounderStatus == true)
            {
                crew1rank = 1;
            } // end if
            _loc5 = crew1rank;
            CREW_TAG1.SET_CREW_TAG(crew1TypeIsPrivate, crew1TagContainsRockstar, crew1Tag, _loc5);
            CREW_TAG1._xscale = 50;
            CREW_TAG1._yscale = 50;
            CREW_TAG1._x = CONTENT.gamer1TF._x + CONTENT.gamer1TF._width + 4;
            CREW_TAG1._y = CONTENT.gamer1TF._y + 4;
            CREW_TAG1._visible = true;
        } // end if
        if (_loc9 == true)
        {
            if (CREW_TAG2 == undefined)
            {
                CREW_TAG2 = CONTENT.attachMovie("CREW_TAG_MOVIECLIP", "CT2", CONTENT.getNextHighestDepth(), {_visible: false});
            } // end if
            _loc5 = 0;
            if (crew2rank > 5)
            {
                crew2rank = 5;
            } // end if
            if (crew2rank > 0)
            {
                ++crew2rank;
            } // end if
            if (crew2hasFounderStatus == true)
            {
                crew2rank = 1;
            } // end if
            _loc5 = crew2rank;
            CREW_TAG2.SET_CREW_TAG(crew2TypeIsPrivate, crew2TagContainsRockstar, crew2Tag, _loc5);
            CREW_TAG2._xscale = 50;
            CREW_TAG2._yscale = 50;
            CREW_TAG2._x = CONTENT.gamer2TF._x + CONTENT.gamer2TF._width + 4;
            CREW_TAG2._y = CONTENT.gamer2TF._y + 4;
            CREW_TAG2._visible = true;
        } // end if
        var _loc6 = CONTENT.gamer2TF._y + CONTENT.gamer2TF._height + 5;
        CONTENT.Background._height = _loc6;
        CONTENT.BackgroundFlash._height = _loc6;
    } // End of the function
} // End of Class
#endinitclip
