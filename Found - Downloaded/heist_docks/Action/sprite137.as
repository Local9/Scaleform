// Action script...

// [Initial MovieClip Action of sprite 137]
#initclip 28
class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardGamplaySelectDocks extends com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardGamplaySelect
{
    var _data, __get__data, gameplayMC, isAnimating, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function HeistBoardGamplaySelectDocks()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        gameplayMC.gotoAndStop(this.__get__data()[2]);
        gameplayMC.tintMC.gotoAndStop(1);
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        isAnimating = false;
        gameplayMC.tintMC.gotoAndStop(_h ? (2) : (1));
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
