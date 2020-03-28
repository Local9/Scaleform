// Action script...

// [Initial MovieClip Action of sprite 175]
#initclip 27
class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardGamplaySelect extends com.rockstargames.ui.components.GUIMenuItem
{
    var gameplayMC, _data, __get__data, _highlighted, __get__highlighted, __get__labels, __set__data, __set__highlighted, __set__labels;
    function HeistBoardGamplaySelect()
    {
        super();
        gameplayMC.tintMC.gotoAndStop(2);
        _global.gfxExtensions = true;
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        gameplayMC.gotoAndStop(this.__get__data()[2]);
        gameplayMC.tintMC.gotoAndStop(2);
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        isAnimating = false;
        gameplayMC.tintMC.gotoAndStop(_h ? (1) : (2));
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    function set labels(_l)
    {
        var _loc3 = _l.slice(3);
        var _loc4 = gameplayMC._currentframe;
        var _loc5 = _loc3[_loc4 - 1];
        var _loc2 = gameplayMC.tintMC.choiceMC.subtitleMC.labelTF;
        _loc2.textAutoSize = "shrink";
        _loc2.text = _loc5;
        //return (this.labels());
        null;
    } // End of the function
    var isAnimating = false;
} // End of Class
#endinitclip
