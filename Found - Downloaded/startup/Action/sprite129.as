// Action script...

// [Initial MovieClip Action of sprite 129]
#initclip 16
class com.rockstargames.ui.loadingScreens.DoNowMenuItem extends com.rockstargames.ui.components.GUIMenuItem
{
    var _data, textMC, gotoAndStop, __get__data, _highlighted, bgMC, __get__highlighted, __set__data, __set__highlighted;
    function DoNowMenuItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        if (_data[0] < 0)
        {
            textMC.numberTF.text = "";
            textMC.summaryTF.text = _data[1];
            textMC.summaryTF._x = textMC.numberTF._x;
            textMC.daysOpenTF.text = "";
            com.rockstargames.ui.utils.Colour.Colourise(textMC, 255, 255, 255, 100);
            this.gotoAndStop(2);
        }
        else
        {
            textMC.numberTF.text = _data[0];
            textMC.summaryTF.text = _data[1];
            textMC.daysOpenTF.text = _data[2];
            textMC.summaryTF._x = 85.050000;
            this.gotoAndStop(1);
            com.rockstargames.ui.utils.Colour.Colourise(textMC, 0, 0, 0, 100);
        } // end else if
        //return (this.data());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        if (_data[0] > 0)
        {
            if (_highlighted)
            {
                com.rockstargames.ui.utils.Colour.Colourise(textMC, 255, 255, 255, 100);
            }
            else
            {
                com.rockstargames.ui.utils.Colour.Colourise(textMC, 0, 0, 0, 100);
            } // end else if
            bgMC.highlightMC.gotoAndStop(_h ? (2) : (1));
        } // end if
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
