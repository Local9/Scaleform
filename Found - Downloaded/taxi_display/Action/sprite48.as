// Action script...

// [Initial MovieClip Action of sprite 48]
#initclip 11
class com.rockstargames.gtav.levelDesign.TaxiDestination extends com.rockstargames.ui.components.GUIMenuItem
{
    var allBlips, blipList, missionName, blipName, addr1MC, addr1TF, addr2MC, addr2TF, _data, r, g, b, blipMC, getNextHighestDepth, attachMovie, __get__data, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function TaxiDestination()
    {
        super();
        allBlips = new com.rockstargames.gtav.constants.Blips();
        blipList = allBlips.getListOfBlips();
        blipName = missionName.txtString;
        addr1TF = addr1MC.txtString;
        addr2TF = addr2MC.txtString;
        blipName.html = addr1TF.html = addr2TF.html = true;
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        var _loc4 = _data[0];
        r = _data[1];
        g = _data[2];
        b = _data[3];
        var _loc3 = _data[4];
        var _loc6 = _data[5];
        var _loc5 = _data[6];
        blipName.htmlText = _loc3.toUpperCase();
        addr1TF.htmlText = _loc6.toUpperCase();
        addr2TF.htmlText = _loc5.toUpperCase();
        blipName.textColor = addr1TF.textColor = addr2TF.textColor = 16724736;
        if (blipMC != undefined)
        {
            blipMC.removeMovieClip();
        } // end if
        var _loc2 = 18;
        blipMC = this.attachMovie(blipList[_loc4], "currentBlip", this.getNextHighestDepth(), {_x: 4 + Math.round(_loc2 / 2), _y: 5.500000 + Math.round(_loc2 / 2), _width: _loc2, _height: _loc2});
        com.rockstargames.ui.utils.Colour.Colourise(blipMC, r, g, b, 75);
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
