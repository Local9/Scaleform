// Action script...

// [Initial MovieClip Action of sprite 116]
#initclip 7
class com.rockstargames.gtav.levelDesign.heists.selectors.HeistEndScreenPieChart extends com.rockstargames.ui.components.GUIMenuItem
{
    var _data, cashTF, playerCutTF, percent1, percent2, percent3, percent4, pie1, pie2, pie3, pie4, __get__data, __get__labels, _highlighted, __get__highlighted, __set__data, __set__highlighted, __set__labels;
    function HeistEndScreenPieChart()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        _data = _d.slice(2);
        if (_data[0] != undefined)
        {
            cashTF.textColor = blueRGB;
            cashTF.htmlText = "$" + _data[0];
            cashTF.autoSize = "center";
            cashTF.wordWrap = false;
            this.clampText(cashTF, 150);
        } // end if
        if (_data[1] != undefined)
        {
            playerCutTF.textColor = redRGB;
            playerCutTF.htmlText = "$" + _data[1];
            playerCutTF.autoSize = "center";
            playerCutTF.wordWrap = false;
            this.clampText(playerCutTF, 150);
        } // end if
        if (_data[2] != undefined)
        {
            percent1 = _data[2];
        }
        else
        {
            percent1 = 0;
        } // end else if
        if (_data[3] != undefined)
        {
            percent2 = _data[3];
        }
        else
        {
            percent2 = 0;
        } // end else if
        if (_data[4] != undefined)
        {
            percent3 = _data[4];
        }
        else
        {
            percent3 = 0;
        } // end else if
        if (_data[5] != undefined)
        {
            percent4 = _data[5];
        }
        else
        {
            percent4 = 0;
        } // end else if
        this.drawArc(pie1, 0, percent1, 1, 43, 113, 163, 20);
        this.drawArc(pie2, percent1, percent2, 2, 43, 113, 163, 45);
        this.drawArc(pie3, percent1 + percent2, percent3, 3, 43, 113, 163, 70);
        this.drawArc(pie4, percent1 + percent2 + percent3, percent4, 4, 43, 113, 163, 100);
        //return (this.data());
        null;
    } // End of the function
    function clampText(obj, maxVal)
    {
        if (obj._width > maxVal)
        {
            obj._xscale = maxVal / obj._width * 100;
        }
        else
        {
            obj._xscale = 100;
        } // end else if
        obj._x = -obj._width / 2;
    } // End of the function
    function drawArc(pieMC, rotation, percent, pieNumber, _r, _g, _b, _a)
    {
        if (percent != undefined && percent != 0)
        {
            pieMC.pieSlices._rotation = rotation * 3.600000;
            pieMC.pieSlices.gotoAndStop(percent);
            pieMC.pieNumberMC._rotation = pieMC.pieSlices._rotation + percent / 2 * 3.600000;
            pieMC.pieNumberMC.pieNumber._rotation = -(pieMC.pieSlices._rotation + percent / 2 * 3.600000);
            pieMC.pieLineMC._rotation = rotation * 3.600000;
            pieMC.pieNumberMC.pieNumber.numberTF.textColor = 16777215;
            pieMC.pieNumberMC.pieNumber.numberTF.htmlText = pieNumber;
            pieMC.pieNumberMC.pieNumber._alpha = 60;
            com.rockstargames.ui.utils.Colour.Colourise(pieMC.pieSlices, _r, _g, _b, _a);
            pieMC.pieLineMC.pieNumber._alpha = 60;
        }
        else
        {
            pieMC.pieSlices._alpha = 0;
            pieMC.pieNumberMC.pieNumber._alpha = 0;
            pieMC.pieLineMC._alpha = 0;
        } // end else if
    } // End of the function
    function set labels(_l)
    {
        //return (this.labels());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var redRGB = 12734544;
    var blueRGB = 2582162;
} // End of Class
#endinitclip
