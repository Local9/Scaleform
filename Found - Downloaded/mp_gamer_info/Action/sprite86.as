// Action script...

// [Initial MovieClip Action of sprite 86]
#initclip 2
class com.rockstargames.gtav.Multiplayer.MP_GAMER_INFO extends MovieClip
{
    var TIMELINE, GAMERNAME_PARTNER_TAG, GAMER_NAME, PARTNER_ICON, CREW_TAG, HEADSET_ICON;
    function MP_GAMER_INFO()
    {
        super();
        TIMELINE = this;
        GAMERNAME_PARTNER_TAG = TIMELINE.GAMERNAME_PARTNER_TAG;
        GAMER_NAME = GAMERNAME_PARTNER_TAG.GAMER_NAME;
        PARTNER_ICON = GAMERNAME_PARTNER_TAG.PARTNER_ICON;
        CREW_TAG = GAMERNAME_PARTNER_TAG.CREW_TAG.attachMovie("CREW_TAG_MOVIECLIP", "CREW_TAG_MOVIECLIP", GAMERNAME_PARTNER_TAG.CREW_TAG.getNextHighestDepth(), {_x: 0, _y: 0, _xscale: 70, _yscale: 70});
        HEADSET_ICON = TIMELINE.AUDIO_RANK_ITEMS.AUDIO_ICON;
        TIMELINE.healthArmour._visible = false;
    } // End of the function
    function SET_GAMERNAME_AND_CREW_TAG(gamerName, crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank)
    {
        var _loc2;
        var _loc3 = 5;
        var _loc4 = 0;
        GAMER_NAME.text = gamerName;
        GAMER_NAME.autoSize = true;
        _loc2 = GAMER_NAME.textWidth / 2;
        GAMER_NAME._x = -_loc2;
        CREW_TAG._x = _loc2 + _loc3 + 8;
        PARTNER_ICON._x = GAMER_NAME._x - PARTNER_ICON._width;
        CREW_TAG._y = GAMER_NAME._y;
        CREW_TAG.SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank);
        HEADSET_ICON._x = PARTNER_ICON._x - HEADSET_ICON._width;
        HEADSET_ICON._y = 26;
    } // End of the function
    function SET_GAMERNAME_AND_PACKED_CREW_TAG(gamerName, crewTag)
    {
        var _loc2;
        var _loc3 = 5;
        var _loc4 = 0;
        GAMER_NAME.text = gamerName;
        GAMER_NAME.autoSize = true;
        _loc2 = GAMER_NAME.textWidth / 2;
        GAMER_NAME._x = -_loc2;
        CREW_TAG._x = _loc2 + _loc3 + 8;
        PARTNER_ICON._x = GAMER_NAME._x - PARTNER_ICON._width;
        CREW_TAG._y = GAMER_NAME._y;
        CREW_TAG.UNPACK_CREW_TAG(crewTag);
        HEADSET_ICON._x = PARTNER_ICON._x - HEADSET_ICON._width;
        HEADSET_ICON._y = 26;
    } // End of the function
    function debug()
    {
    } // End of the function
} // End of Class
#endinitclip
