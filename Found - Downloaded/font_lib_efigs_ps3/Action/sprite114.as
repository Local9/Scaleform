// Action script...

// [Initial MovieClip Action of sprite 114]
#initclip 1
class com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP extends MovieClip
{
    var CREW_TAG;
    function CREW_TAG_MOVIECLIP()
    {
        super();
        CREW_TAG = this;
    } // End of the function
    function SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank, crewColour)
    {
        founderOrRank = Number(founderOrRank);
        var _loc4 = ["", "", "&", "{", "|", "}", "~", "â‚¬"];
        var _loc6 = ["", "", "&", "Ã€", "Ã", "Ã‚", "Ãƒ", "Ã„"];
        if (crewTypeIsPrivate)
        {
            CREW_TAG.midgroundTF.htmlText = ".";
            CREW_TAG.backgroundTF.htmlText = "/";
            CREW_TAG.rankOrFounderTF.htmlText = _loc4[founderOrRank];
            if (crewColour != undefined)
            {
                CREW_TAG.rankOrFounderTF._visible = true;
                CREW_TAG.rankOrFounderTF.textColor = crewColour;
            }
            else
            {
                CREW_TAG.rankOrFounderTF._visible = false;
            } // end else if
        }
        else
        {
            CREW_TAG.midgroundTF.htmlText = ",";
            CREW_TAG.backgroundTF.htmlText = "-";
            CREW_TAG.rankOrFounderTF._visible = false;
        } // end else if
        if (crewTagContainsRockstar)
        {
            crewTag = "@" + crewTag;
        }
        else
        {
            crewTag = "" + crewTag;
        } // end else if
        crewTag = "" + crewTag;
        CREW_TAG.crewTagTF.htmlText = crewTag;
    } // End of the function
    function UNPACK_CREW_TAG(crewStr)
    {
        var _loc5 = crewStr.charAt(0) == "(" ? (true) : (false);
        var _loc6 = crewStr.charAt(1) == "*" ? (true) : (false);
        var _loc7 = crewStr.slice(3);
        var _loc3 = _loc7.split("#");
        var _loc4 = 0;
        if (crewStr.charAt(2) == "+")
        {
            _loc4 = 1;
        }
        else if (crewStr.charAt(2) == "_")
        {
            _loc4 = 0;
        }
        else
        {
            _loc4 = Number(crewStr.charAt(2));
        } // end else if
        com.rockstargames.ui.utils.Debug.log("WHOLE MESS OF COLOR JUST HAPPENED: " + _loc3[0] + ", " + "0x" + _loc3[1]);
        this.SET_CREW_TAG(_loc5, _loc6, _loc3[0], _loc4, "0x" + _loc3[1]);
    } // End of the function
    function debug()
    {
        this.SET_CREW_TAG(false, true, "RSG", false);
    } // End of the function
} // End of Class
#endinitclip
