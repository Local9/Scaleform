// Action script...

// [Initial MovieClip Action of sprite 122]
#initclip 2
class com.rockstargames.gtav.levelDesign.UV_CARSLIST extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var BOUNDING_BOX, CONTENT;
    function UV_CARSLIST()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        wordsList = ["bullet", "cheetah", "cogcabrio", "cogsport", "entityxf", "exemplar", "F620", "feltzer", "infernus", "JB700", "khamelion", "monroe", "ninef", "rapidGT", "stingerGT", "superD", "veloce", "venem", "voltic", "ztype", "notes_01", "notes_02", "notes_03", "notes_04", "notes_05", "notes_06", "notes_07", "notes_08", "notes_09", "notes_10", "Daemon", "Barbarian", "Bati", "felonGT"];
        wordsMCList = [];
        sw = BOUNDING_BOX._width;
        sh = BOUNDING_BOX._height;
    } // End of the function
    function SET_COLOUR(r, g, b)
    {
        red = r;
        green = g;
        blue = b;
    } // End of the function
    function SET_DATA_SLOT(enum, xp, yp, crossed)
    {
        var _loc5 = wordsMCList[enum] == undefined;
        if (_loc5)
        {
            var _loc3 = this.lookUp(enum);
            var _loc4 = CONTENT.getNextHighestDepth();
            var _loc2 = CONTENT.attachMovie(_loc3, _loc3 + "MC" + _loc4, _loc4, {_x: xp * sw, _y: yp * sh, _xscale: scaleFactor, _yscale: scaleFactor});
            com.rockstargames.ui.utils.Colour.Colourise(_loc2, red, green, blue);
            if (crossed != undefined)
            {
                this.crossWord(_loc2, Boolean(crossed));
            } // end if
            wordsMCList[enum] = _loc2;
        } // end if
    } // End of the function
    function lookUp(enum)
    {
        return (wordsList[enum]);
    } // End of the function
    function crossWord(mc, isCrossed)
    {
        if (mc.crossMC != undefined)
        {
            if (isCrossed)
            {
                mc.crossMC.gotoAndStop(1 + Math.ceil(Math.random() * 2));
            }
            else
            {
                mc.crossMC.gotoAndStop(1);
            } // end if
        } // end else if
    } // End of the function
    function REPOSITION_WORD(enum, xp, yp)
    {
        var _loc2 = wordsMCList[enum];
        _loc2._x = xp * sw;
        _loc2._y = yp * sh;
    } // End of the function
    function CROSS_WORD(enum, crossed)
    {
        var _loc2 = wordsMCList[enum];
        if (crossed != undefined)
        {
            this.crossWord(_loc2, Boolean(crossed));
        } // end if
    } // End of the function
    function DELETE_WORD(enum)
    {
        var _loc2 = wordsMCList[enum];
        if (_loc2 != undefined)
        {
            _loc2.removeMovieClip();
            delete wordsMCList[enum];
        } // end if
    } // End of the function
    var wordsList = new Array();
    var wordsMCList = new Array();
    var sw = 742;
    var sh = 864;
    var red = 255;
    var green = 255;
    var blue = 255;
    var scaleFactor = 50;
} // End of Class
#endinitclip
