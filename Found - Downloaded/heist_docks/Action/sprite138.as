// Action script...

// [Initial MovieClip Action of sprite 138]
#initclip 29
class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardCrewMember extends com.rockstargames.ui.components.GUIMenuItem
{
    var __set__highlighted, _data, picMC, getNextHighestDepth, attachMovie, nameTF, surnameTF, jobTF, __get__data, nametitleTF, nametitlebgMC, jobtitleTF, jobtitlebgMC, stattitleTF, stattitlebgMC, __get__labels, bgMC, _highlighted, __get__highlighted, __set__data, __set__labels;
    function HeistBoardCrewMember()
    {
        super();
        this.__set__highlighted(false);
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        var _loc4 = com.rockstargames.gtav.constants.HeistCrewMemberLUT.lookUp(_data[0]);
        var _loc3 = _loc4[1];
        if (picMC != undefined)
        {
            picMC.removeMovieClip();
        } // end if
        if (_loc3 != undefined)
        {
            picMC = this.attachMovie(_loc3, _loc3 + "MC", this.getNextHighestDepth(), {_x: 9, _y: -55, _xscale: 80, _yscale: 80});
        } // end if
        var _loc2 = _data[1].split(" ");
        type = _loc4[2];
        this.clampText(nameTF, _loc2[0].toUpperCase(), 100);
        if (_loc2[1] != "" && _loc2[1] != undefined)
        {
            this.clampText(surnameTF, _loc2[1].toUpperCase(), 100);
        }
        else
        {
            surnameTF.text = "";
        } // end else if
        this.clampText(jobTF, _data[2], 110);
        this.setStats();
        //return (this.data());
        null;
    } // End of the function
    function setStats()
    {
        var _loc3 = this.__get__data().slice(3);
        var _loc9 = "";
        var _loc5 = 1;
        for (var _loc2 = 0; _loc2 < _loc3.length; ++_loc2)
        {
            _loc5 = Math.floor(_loc2 / 2) + 1;
            if (_loc2 % 2 == 0)
            {
                var _loc7 = this["statlabel" + _loc5 + "TF"];
                _loc7.textAutoSize = "shrink";
                _loc7.text = _loc3[_loc2];
                continue;
            } // end if
            var _loc4 = this["statbar" + _loc5];
            var _loc6 = this["statvalue" + _loc5 + "TF"];
            if (_loc2 == _loc3.length - 1)
            {
                _loc4._alpha = 0;
                _loc6.text = _loc3[_loc2] + "%";
                continue;
            } // end if
            var _loc8 = Math.max(0, Math.min(_loc3[_loc2], 100));
            _loc4.gotoAndStop(_loc8);
            _loc4._alpha = 100;
            _loc6.text = "";
        } // end of for
    } // End of the function
    function clampText(textF, label, maxVal)
    {
        if (label != "" && label != undefined)
        {
            textF.text = label;
            textF.autoSize = true;
            textF.wordWrap = false;
            if (textF._width > maxVal)
            {
                textF._xscale = maxVal / textF._width * 100;
            } // end if
        } // end if
    } // End of the function
    function set labels(l)
    {
        if (l[0] != undefined)
        {
            this.clampText(nametitleTF, l[0], 52);
            nametitlebgMC._width = nametitleTF._width;
        } // end if
        if (l[1] != undefined)
        {
            this.clampText(jobtitleTF, l[1], 52);
            jobtitlebgMC._width = jobtitleTF._width;
        } // end if
        if (l[2] != undefined)
        {
            this.clampText(stattitleTF, l[2], 52);
            stattitlebgMC._width = stattitleTF._width;
        } // end if
        //return (this.labels());
        null;
    } // End of the function
    function set highlighted(_h)
    {
        bgMC.frameMC.gotoAndStop(_h ? (1) : (2));
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
    var type = "";
    var bgSelected = false;
} // End of Class
#endinitclip
