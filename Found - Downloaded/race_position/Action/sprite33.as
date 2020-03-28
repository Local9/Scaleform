// Action script...

// [Initial MovieClip Action of sprite 33]
#initclip 4
class com.rockstargames.gtav.levelDesign.RACE_POSITION extends com.rockstargames.ui.core.ScreenLayoutUI
{
    var SET_SAFE, SET_RATIO, CONTENT, screenManager, racePositionMC, raceTimeMC, bestTimeMC, gateCounterMC, raceScoreBoardMC;
    function RACE_POSITION()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        raceResultData = [];
        raceResultSlots = [];
        this.SET_SAFE(com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[0]);
        this.SET_RATIO(com.rockstargames.ui.core.ScreenLayoutManager.SCREEN_FORMAT_WIDE);
        racePositionMC = screenManager.addToScreen("raceposition", "racePositionMC", CONTENT, "RB");
        raceTimeMC = screenManager.addToScreen("racetime", "raceTimeMC", CONTENT, "RT");
        bestTimeMC = screenManager.addToScreen("besttime", "bestTimeMC", CONTENT, "RT");
        gateCounterMC = screenManager.addToScreen("gatecounter", "gateCounterMC", CONTENT, "LT");
        raceScoreBoardMC = screenManager.addToScreen("raceresult", "raceScoreBoardMC", CONTENT, "CC");
        raceResultModules = [racePositionMC, raceTimeMC, bestTimeMC, gateCounterMC, raceScoreBoardMC];
        this.SET_RACE_LABELS("", "", "", "", "");
        this.SHOW_RACE_RESULTS(0);
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(38))
        {
            this.SET_RACE_POSITION(Math.ceil(Math.random() * 8));
            this.SET_GATES_POSITION(Math.ceil(Math.random() * 20));
            var _loc3 = Math.ceil(Math.random() * 999);
            var _loc2 = Math.ceil(Math.random() * 60);
            var _loc4 = Math.ceil(Math.random() * 1);
            this.SET_RACE_TIME(_loc4 + "\'" + _loc2 + "\"" + _loc3);
        }
        else if (Key.isDown(39))
        {
        }
        else if (Key.isDown(40))
        {
        }
        else if (Key.isDown(37))
        {
        }
        else if (Key.isDown(8))
        {
        }
        else if (Key.isDown(32))
        {
            raceResultVisible ? (this.SHOW_RACE_RESULTS(0)) : (this.SHOW_RACE_RESULTS(1));
        } // end else if
    } // End of the function
    function debug()
    {
        this.SET_RACE_LABELS("POSITION", "TIME", "BEST TIME", " GATES", "RACE RESULTS");
        this.SET_RACE_POSITION(4, 10);
        this.SET_GATES_POSITION(3, 20);
        this.SET_RACE_TIME("1\'34\"567");
        this.SET_BEST_TIME("9\'99\"999");
        this.SET_RACE_RESULTS("0", "1", "Michael", "0.01.118");
        this.SET_RACE_RESULTS("1", "2", "Trevor", "0.01.456");
        this.SET_RACE_RESULTS("2", "3", "Franklin", "0.01.987");
        this.SET_RACE_RESULTS("3", "4", "Barry", "0.02.246");
        this.SET_RACE_RESULTS("4", "5", "Ken", "0.01.987");
        this.SET_RACE_RESULTS("5", "6", "Sue", "0.02.246");
        this.SET_RACE_RESULTS("6", "7", "Lewis", "0.02.246");
        this.SET_RACE_RESULTS("7", "8", "Mark", "0.02.246");
        this.SHOW_RACE_RESULTS(1);
        var _loc2 = new Object();
        _loc2.onKeyDown = mx.utils.Delegate.create(this, getKeys);
        Key.addListener(_loc2);
    } // End of the function
    function setText(tf, txt, alignLeft)
    {
        tf.htmlText = txt;
        tf.html = true;
        var _loc2 = "left";
        if (alignLeft == false)
        {
            _loc2 = "right";
        } // end if
        tf.autoSize = _loc2;
        tf.multiline = false;
        tf.wordWrap = false;
    } // End of the function
    function setResults()
    {
        for (var _loc2 = 0; _loc2 < racers; ++_loc2)
        {
            var _loc3 = raceResultSlots[_loc2];
            var _loc4 = raceResultData[_loc2];
            this.setText(_loc3.positionTF, _loc4[0]);
            this.setText(_loc3.racerTF, _loc4[1]);
            this.setText(_loc3.timeTF, _loc4[2]);
        } // end of for
    } // End of the function
    function createResults()
    {
        raceResultData = [];
        raceResultSlots = [];
        var _loc4 = 50;
        for (var _loc3 = 0; _loc3 < racers; ++_loc3)
        {
            var _loc2 = raceScoreBoardMC.innerMC.attachMovie("raceresultslot", "result" + _loc3 + "MC", _loc3);
            _loc2._x = -_loc2._width * 0.500000;
            _loc2._y = _loc4 + (_loc2._height + 2) * _loc3;
            raceResultSlots.push(_loc2);
            raceResultData.push([]);
        } // end of for
        raceScoreBoardMC.innerMC.bgMC._height = _loc2._y + _loc4;
        screenManager.positionToScreen(raceScoreBoardMC, "CC");
    } // End of the function
    function SET_RACE_LABELS(racePosLabel, raceTimeLabel, bestTimeLabel, gateCounterLabel, raceResultsLabel)
    {
        var _loc2 = 1044;
        this.setText(racePositionMC.labelTF, racePosLabel.toUpperCase(), false);
        racePositionMC._x = _loc2;
        racePositionMC._y = 410;
        this.setText(gateCounterMC.labelTF, gateCounterLabel.toUpperCase(), false);
        gateCounterMC._x = _loc2;
        gateCounterMC._y = 474;
        this.setText(raceTimeMC.labelTF, raceTimeLabel.toUpperCase(), false);
        raceTimeMC._x = _loc2;
        raceTimeMC._y = 538;
        this.setText(bestTimeMC.labelTF, bestTimeLabel.toUpperCase(), false);
        bestTimeMC._x = _loc2;
        bestTimeMC._y = 602;
        this.setText(raceScoreBoardMC.innerMC.resultslabelTF, raceResultsLabel.toUpperCase());
        raceScoreBoardMC.innerMC.resultslabelTF._x = -raceScoreBoardMC.innerMC.resultslabelTF._width * 0.500000;
    } // End of the function
    function SHOW_RACE_MODULE(enum, show)
    {
        var _loc2 = raceResultModules[enum];
        _loc2._visible = Boolean(show);
    } // End of the function
    function SET_RACE_POSITION(_position, _racers)
    {
        var _loc2 = racePositionMC.innerMC;
        if (_racers != undefined)
        {
            racers = _racers;
            this.createResults();
            _loc2.maxTF.text = racers;
            _loc2.maxTF.autoSize = "left";
            _loc2.maxTF.multiline = false;
            _loc2.maxTF.wordWrap = false;
            _loc2._x = 140 - _loc2._width;
        } // end if
        position = Math.max(Math.min(racers, _position), 1);
        _loc2.currTF.text = position;
    } // End of the function
    function SET_GATES_POSITION(_gateposition, _gates)
    {
        var _loc2 = gateCounterMC.innerMC;
        if (_gates != undefined)
        {
            gates = _gates;
            _loc2.maxTF.text = gates;
            _loc2.maxTF.autoSize = "left";
            _loc2.maxTF.multiline = false;
            _loc2.maxTF.wordWrap = false;
            _loc2._x = 140 - _loc2._width;
        } // end if
        gateposition = Math.max(Math.min(gates, _gateposition), 1);
        _loc2.currTF.text = gateposition;
    } // End of the function
    function SET_RACE_TIME(_time)
    {
        var _loc2 = raceTimeMC.innerMC;
        _loc2.timeTF.text = _time;
        _loc2.timeTF.autoSize = "left";
        _loc2.timeTF.multiline = false;
        _loc2.timeTF.wordWrap = false;
        _loc2._x = 140 - _loc2._width;
    } // End of the function
    function SET_BEST_TIME(_time)
    {
        var _loc2 = bestTimeMC.innerMC;
        _loc2.timeTF.text = _time;
        _loc2.timeTF.text = _time;
        _loc2.timeTF.autoSize = "left";
        _loc2.timeTF.multiline = false;
        _loc2.timeTF.wordWrap = false;
        _loc2._x = 140 - _loc2._width;
    } // End of the function
    function SET_RACE_RESULTS(_index, _position, _racer, _time)
    {
        raceResultData[_index][0] = _position;
        raceResultData[_index][1] = _racer;
        raceResultData[_index][2] = _time;
    } // End of the function
    function SHOW_RACE_RESULTS(vis)
    {
        raceResultVisible = Boolean(vis);
        raceScoreBoardMC._alpha = raceResultVisible ? (100) : (0);
        this.setResults();
    } // End of the function
    var position = 1;
    var racers = 6;
    var gateposition = 0;
    var gates = 20;
    var raceResultData = new Array();
    var raceResultSlots = new Array();
    var raceResultModules = new Array();
    var raceResultVisible = false;
} // End of Class
#endinitclip
