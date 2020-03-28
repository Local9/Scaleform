// Action script...

// [Initial MovieClip Action of sprite 129]
#initclip 13
class com.rockstargames.gtav.pc.applications.App_Popups extends com.rockstargames.gtav.pc.applications.App_Base
{
    var __get__data, getNextHighestDepth, attachMovie, __get__desktopRef, safeLeft, safeRight, safeTop, safeBottom, screenWidthPixels, screenHeightPixels, __set__data;
    function App_Popups()
    {
        super();
    } // End of the function
    function set data(d)
    {
        _data = d;
        //return (this.data());
        null;
    } // End of the function
    function get data()
    {
        return (_data);
    } // End of the function
    function ready()
    {
        items = [];
        var _loc9;
        var _loc3;
        var _loc10;
        var _loc4 = [];
        var _loc5;
        var _loc6;
        for (var _loc2 = 0; _loc2 < this.__get__data().length; ++_loc2)
        {
            _loc9 = this.getNextHighestDepth();
            _loc3 = (com.rockstargames.gtav.pc.popups.Popup_Base)(this.attachMovie("popup", "popup" + _loc9, _loc9));
            _loc10 = _loc2;
            _loc4 = [];
            if (this.__get__data()[_loc2] != undefined)
            {
                _loc10 = this.__get__data()[_loc2][0];
                _loc4 = this.__get__data()[_loc2];
            } // end if
            _loc3.init(_loc10, _loc4);
            var _loc8 = 0;
            var _loc7 = 0;
            if (_loc4[1] != undefined)
            {
                _loc8 = _loc4[1];
            } // end if
            if (_loc4[2] != undefined)
            {
                _loc7 = _loc4[2];
            } // end if
            this.setPopupPostion(_loc3, _loc8, _loc7);
            _loc5 = new com.rockstargames.gtav.pc.PCButtonBase();
            _loc5.init(_loc3.closeMC, com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE[0], {index: _loc2, depth: (_loc2 + 1) * 100 + 1});
            this.__get__desktopRef().addButtons(_loc5);
            _loc6 = new com.rockstargames.gtav.pc.PCButtonBase();
            _loc6.init(_loc3.bgMC, com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW[0], {index: _loc2, depth: (_loc2 + 1) * 100});
            this.__get__desktopRef().addButtons(_loc6);
            _loc3.closebtn = _loc5;
            _loc3.win = _loc6;
            this.__get__desktopRef().activateButtons(_loc3.closebtn, false);
            this.__get__desktopRef().activateButtons(_loc3.win, false);
            items.push(_loc3);
            if (this.__get__desktopRef().autoMode)
            {
                com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc3, 0, {onComplete: openPopup, onCompleteScope: this, onCompleteArgs: [_loc2, 0]});
            } // end if
        } // end of for
        this.__get__desktopRef().checkUnderCursor();
    } // End of the function
    function setPopupPostion(mc, xPer, yPer)
    {
        var _loc3 = safeLeft + xPer * (safeRight - safeLeft);
        var _loc2 = safeTop + yPer * (safeBottom - safeTop);
        mc._x = _loc3;
        mc._y = _loc2;
    } // End of the function
    function repositionPopups(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent)
    {
        screenWidthPixels = _screenWidthPixels;
        screenHeightPixels = _screenHeightPixels;
        safeTop = _safeTopPercent;
        safeBottom = _safeBottomPercent;
        safeLeft = _safeLeftPercent;
        safeRight = _safeRightPercent;
        for (var _loc2 = 0; _loc2 < items.length; ++_loc2)
        {
            var _loc3 = items[_loc2];
            var _loc5 = this.__get__data()[_loc2][1];
            var _loc4 = this.__get__data()[_loc2][2];
            this.setPopupPostion(_loc3, _loc5, _loc4);
        } // end of for
    } // End of the function
    function openPopup(i, animspeed)
    {
        var _loc2 = items[i];
        if (animspeed == undefined)
        {
            animspeed = 0.300000;
        } // end if
        _loc2.centerMC._alpha = 0;
        _loc2._visible = true;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2.centerMC, animspeed, {_alpha: 100, _xScale: 100, _yScale: 100, onComplete: openPopupComplete, onCompleteScope: this, onCompleteArgs: [i]});
        this.__get__desktopRef().checkUnderCursor();
    } // End of the function
    function openPopupComplete(i)
    {
        var _loc2 = items[i];
        this.__get__desktopRef().activateButtons(_loc2.closebtn, true);
        this.__get__desktopRef().activateButtons(_loc2.win, true);
        this.__get__desktopRef().checkUnderCursor();
    } // End of the function
    function closePopup(i)
    {
        var _loc2 = items[i];
        if (_loc2 != undefined)
        {
            _loc2._visible = false;
            this.__get__desktopRef().activateButtons(_loc2.closebtn, false);
            this.__get__desktopRef().activateButtons(_loc2.win, false);
            this.__get__desktopRef().resetUnderCursor();
            this.__get__desktopRef().checkUnderCursor();
        } // end if
    } // End of the function
    var max = 12;
    var items = new Array();
    var _data = new Array();
} // End of Class
#endinitclip
