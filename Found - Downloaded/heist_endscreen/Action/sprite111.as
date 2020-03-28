// Action script...

// [Initial MovieClip Action of sprite 111]
#initclip 2
class com.rockstargames.gtav.levelDesign.heists.HEIST_ENDSCREEN extends com.rockstargames.ui.core.BaseScriptUI
{
    var pieColours, CONTENT, pieChart, percent1, percent2, percent3, percent4, percent5, percent6, percent7, percent8, percent9;
    function HEIST_ENDSCREEN()
    {
        super();
        _global.gfxExtensions = true;
        pieColours = new Array();
        pieColours.push(new Array(250, 0, 0));
        pieColours.push(new Array(220, 0, 0));
        pieColours.push(new Array(190, 0, 0));
        pieColours.push(new Array(160, 0, 0));
        pieColours.push(new Array(130, 0, 0));
        pieColours.push(new Array(100, 0, 0));
        pieColours.push(new Array(70, 0, 0));
        pieColours.push(new Array(40, 0, 0));
        pieColours.push(new Array(10, 0, 0));
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        pieChart = CONTENT.pieChart;
    } // End of the function
    function SHOW_PIECHART_NUMBERS(vis)
    {
    } // End of the function
    function SET_PIECHART_COLOURS(playerNum, R1, G1, B1)
    {
        var _loc2 = playerNum - 1;
        pieColours[_loc2] = [R1, G1, B1];
    } // End of the function
    function SET_PIE_CHART()
    {
        var _loc3 = new Array();
        _loc3 = arguments;
        var _loc10;
        var _loc6 = pieChart.playerCutTF.getNewTextFormat();
        if (typeof(_loc3[0]) == "number")
        {
            _loc3.unshift("");
            pieChart.playerCutTF._y = -20.550000;
            _loc6.size = 36;
            _loc10 = true;
        }
        else
        {
            pieChart.playerCutTF._y = -3.550000;
            _loc6.size = 26;
            _loc10 = false;
        } // end else if
        pieChart.playerCutTF.setNewTextFormat(_loc6);
        if (_loc3[0] != undefined)
        {
            pieChart.cashTF.textColor = 16777215;
            pieChart.cashTF.textAutoSize = "shrink";
            pieChart.cashTF.text = _loc3[0];
        } // end if
        if (_loc3[1] != undefined)
        {
            pieChart.playerCutTF.textColor = 16777215;
            pieChart.playerCutTF.textAutoSize = "shrink";
            var _loc4 = _loc3[1].toString();
            if (_loc10 == true)
            {
                pieChart.playerCutTF.text = _loc4 + "%";
            }
            else
            {
                if (_loc4.length > 3)
                {
                    var _loc12 = _loc4.length;
                    var _loc8 = "";
                    var _loc5 = _loc4.slice(0, -3);
                    var _loc11 = "," + _loc4.slice(-3);
                    var _loc9;
                    if (_loc5.length > 3)
                    {
                        _loc8 = _loc5.slice(0, -3) + ",";
                        _loc5 = _loc5.slice(-3);
                    } // end if
                    _loc9 = _loc8 + _loc5 + _loc11;
                }
                else
                {
                    _loc9 = _loc4;
                } // end else if
                pieChart.playerCutTF.text = "$" + _loc9;
            } // end if
        } // end else if
        if (_loc3[2] != undefined)
        {
            percent1 = Math.round(_loc3[2]);
        }
        else
        {
            percent1 = 0;
        } // end else if
        if (_loc3[3] != undefined)
        {
            percent2 = Math.round(_loc3[3]);
        }
        else
        {
            percent2 = 0;
        } // end else if
        if (_loc3[4] != undefined)
        {
            percent3 = Math.round(_loc3[4]);
        }
        else
        {
            percent3 = 0;
        } // end else if
        if (_loc3[5] != undefined)
        {
            percent4 = Math.round(_loc3[5]);
        }
        else
        {
            percent4 = 0;
        } // end else if
        if (_loc3[6] != undefined)
        {
            percent5 = Math.round(_loc3[6]);
        }
        else
        {
            percent5 = 0;
        } // end else if
        if (_loc3[7] != undefined)
        {
            percent6 = Math.round(_loc3[7]);
        }
        else
        {
            percent6 = 0;
        } // end else if
        if (_loc3[8] != undefined)
        {
            percent7 = Math.round(_loc3[8]);
        }
        else
        {
            percent7 = 0;
        } // end else if
        if (_loc3[9] != undefined)
        {
            percent8 = Math.round(_loc3[9]);
        }
        else
        {
            percent8 = 0;
        } // end else if
        if (_loc3[10] != undefined)
        {
            percent9 = Math.round(_loc3[10]);
        }
        else
        {
            percent9 = 0;
        } // end else if
        this.drawArc(pieChart.pie1, 0, percent1, 1, pieColours[0][0], pieColours[0][1], pieColours[0][2]);
        this.drawArc(pieChart.pie2, percent1, percent2, 2, pieColours[1][0], pieColours[1][1], pieColours[1][2]);
        this.drawArc(pieChart.pie3, percent1 + percent2, percent3, 3, pieColours[2][0], pieColours[2][1], pieColours[2][2]);
        this.drawArc(pieChart.pie4, percent1 + percent2 + percent3, percent4, 4, pieColours[3][0], pieColours[3][1], pieColours[3][2]);
        this.drawArc(pieChart.pie5, percent1 + percent2 + percent3 + percent4, percent5, 5, pieColours[4][0], pieColours[4][1], pieColours[4][2]);
        this.drawArc(pieChart.pie6, percent1 + percent2 + percent3 + percent4 + percent5, percent6, 6, pieColours[5][0], pieColours[5][1], pieColours[5][2]);
        this.drawArc(pieChart.pie7, percent1 + percent2 + percent3 + percent4 + percent5 + percent6, percent7, 7, pieColours[6][0], pieColours[6][1], pieColours[6][2]);
        this.drawArc(pieChart.pie8, percent1 + percent2 + percent3 + percent4 + percent5 + percent6 + percent7, percent8, 8, pieColours[7][0], pieColours[7][1], pieColours[7][2]);
        this.drawArc(pieChart.pie9, percent1 + percent2 + percent3 + percent4 + percent5 + percent6 + percent7 + percent8, percent9, 9, pieColours[8][0], pieColours[8][1], pieColours[8][2]);
        var _loc7 = percent1 + percent2 + percent3 + percent4 + percent5 + percent6 + percent7 + percent8 + percent9;
        if (_loc7 > 100)
        {
            trace ("HEIST_ENDSCREEN.gfx ERROR! Script has passed percentage values for piechart that when added up exceed 100%. Current values add up to:" + _loc7);
            trace ("HEIST_ENDSCREEN.gfx percent1:" + percent1);
            trace ("HEIST_ENDSCREEN.gfx percent2:" + percent2);
            trace ("HEIST_ENDSCREEN.gfx percent3:" + percent3);
            trace ("HEIST_ENDSCREEN.gfx percent4:" + percent4);
            trace ("HEIST_ENDSCREEN.gfx percent5:" + percent5);
            trace ("HEIST_ENDSCREEN.gfx percent6:" + percent6);
            trace ("HEIST_ENDSCREEN.gfx percent7:" + percent7);
            trace ("HEIST_ENDSCREEN.gfx percent8:" + percent8);
            trace ("HEIST_ENDSCREEN.gfx percent9:" + percent9);
        } // end if
    } // End of the function
    function drawArc(pieMC, rotation, percent, pieNumber, _r, _g, _b)
    {
        if (percent != undefined && percent > 0)
        {
            pieMC.pieSlices._rotation = rotation * 3.600000;
            pieMC.pieSlices.gotoAndStop(percent);
            com.rockstargames.ui.utils.Colour.Colourise(pieMC.pieSlices, _r, _g, _b, 100);
        }
        else
        {
            pieMC.pieSlices._alpha = 0;
        } // end else if
    } // End of the function
    var showNumbers = false;
} // End of Class
#endinitclip
