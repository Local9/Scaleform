// Action script...

// [Initial MovieClip Action of sprite 6]
#initclip 2
class com.rockstargames.gtav.Multiplayer.MP_CREW_TAG extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, CREW_TAG;
    function MP_CREW_TAG()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        CREW_TAG = CONTENT.attachMovie("CREW_TAG_MOVIECLIP", "CREW_TAG_MOVIECLIP", CONTENT.getNextHighestDepth(), {_x: 0, _y: 8, _xscale: 70, _yscale: 70});
    } // End of the function
    function SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank)
    {
        CREW_TAG.SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank);
    } // End of the function
    function debug()
    {
        this.SET_CREW_TAG(true, true, "RSG", false);
    } // End of the function
} // End of Class
#endinitclip
