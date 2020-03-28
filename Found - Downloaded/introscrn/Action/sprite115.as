// Action script...

// [Initial MovieClip Action of sprite 115]
#initclip 16
class com.rockstargames.ui.loadingScreens.LoadScreenMenuItem extends com.rockstargames.ui.components.GUIMenuItem
{
    var _data, bgMC, textMC, __get__data, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function LoadScreenMenuItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        bgMC.gotoAndStop(_data[1] ? (2) : (1));
        textMC.numberTF.text = _data[0];
        textMC.summaryTF.text = _data[2];
        textMC.tagsTF.text = _data[3];
        textMC.classTF.text = _data[4];
        textMC.dateTF.text = _data[5];
        textMC.ownerTF.text = _data[6];
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        if (_highlighted)
        {
            com.rockstargames.ui.utils.Colour.Colourise(textMC, 255, 255, 255, 100);
        }
        else
        {
            com.rockstargames.ui.utils.Colour.Colourise(textMC, 0, 0, 0, 100);
        } // end else if
        bgMC.highlightMC.gotoAndStop(_h ? (2) : (1));
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
