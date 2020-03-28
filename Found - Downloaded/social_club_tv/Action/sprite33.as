// Action script...

// [Initial MovieClip Action of sprite 33]
#initclip 7
class com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick extends MovieClip
{
    var getNextHighestDepth, attachMovie, endMC, __get__tickWidth;
    function SocialClubTick()
    {
        super();
    } // End of the function
    function setLabel(enum, str)
    {
        var _loc4;
        var _loc5 = 0;
        for (var _loc3 = 0; _loc3 < arguments.length; _loc3 = _loc3 + 2)
        {
            switch (arguments[_loc3])
            {
                case com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick.TYPE_CREW_TAG:
                {
                    var _loc6 = (com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP)(this.attachMovie("CREW_TAG_MOVIECLIP", "l" + _loc3 / 2, this.getNextHighestDepth(), {_x: _loc5 + 8, _y: 10.500000, _xscale: crewTagScale, _yscale: crewTagScale}));
                    _loc6.UNPACK_CREW_TAG(arguments[_loc3 + 1]);
                    _loc4 = _loc6;
                    break;
                } 
                case com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick.TYPE_GAMER_TAG:
                {
                    _loc4 = this.attachMovie("TickGamerTag", "l" + _loc3 / 2, this.getNextHighestDepth(), {_x: _loc5 + 8});
                    _loc4.textTF.autoSize = true;
                    _loc4.textTF.text = arguments[_loc3 + 1];
                    break;
                } 
                case com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick.TYPE_TEXT:
                default:
                {
                    _loc4 = this.attachMovie("TickText", "l" + _loc3 / 2, this.getNextHighestDepth(), {_x: _loc5 + 8});
                    _loc4.textTF.autoSize = true;
                    _loc4.textTF.text = arguments[_loc3 + 1];
                    break;
                } 
            } // End of switch
            _loc5 = _loc4._x + _loc4._width;
            if (arguments[_loc3] == com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick.TYPE_CREW_TAG)
            {
                _loc5 = _loc5 + crewtagOffset;
            } // end if
        } // end of for
        endMC._x = Math.round(_loc5 + 8);
    } // End of the function
    function get tickWidth()
    {
        return (endMC._x + 1);
    } // End of the function
    static var TYPE_TEXT = 0;
    static var TYPE_GAMER_TAG = 1;
    static var TYPE_CREW_TAG = 2;
    var crewTagScale = 85;
    var crewtagOffset = -12;
} // End of Class
#endinitclip
