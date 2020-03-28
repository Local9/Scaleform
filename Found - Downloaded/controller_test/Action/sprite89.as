// Action script...

// [Initial MovieClip Action of sprite 89]
#initclip 1
class com.rockstargames.gtav.utils.CONTROLLER_TEST
{
    var TIMELINE, CONTENT, stringArray;
    function CONTROLLER_TEST()
    {
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = mc;
        CONTENT = TIMELINE.attachMovie("CONTENT", "CONTENT", TIMELINE.getNextHighestDepth());
        CONTENT._xscale = 80;
        CONTENT._yscale = 80;
        CONTENT._x = 0;
        CONTENT._y = 0;
        stringArray = new Array();
    } // End of the function
    function restDpad()
    {
        CONTENT.DPAD.gotoAndStop("OFF");
    } // End of the function
    function resetIcon()
    {
        var _loc2 = arguments[0];
        _loc2._xscale = 60;
        _loc2._yscale = 60;
    } // End of the function
    function growIcon(mc)
    {
        mc._xscale = 100;
        mc._yscale = 100;
        com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(mc, MASTER_DELAY, {onComplete: resetIcon, onCompleteScope: this, onCompleteArgs: [mc]});
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        var _loc3 = " ";
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.LEFTSHOULDER1:
            {
                this.growIcon(CONTENT.LEFTSHOULDER1);
                _loc3 = "<img src=\'button_34\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.LEFTSHOULDER2:
            {
                this.growIcon(CONTENT.LEFTSHOULDER2);
                _loc3 = "<img src=\'button_35\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOULDER1:
            {
                this.growIcon(CONTENT.RIGHTSHOULDER1);
                _loc3 = "<img src=\'button_36\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOULDER2:
            {
                this.growIcon(CONTENT.RIGHTSHOULDER2);
                _loc3 = "<img src=\'button_37\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                CONTENT.DPAD.gotoAndStop("UP");
                com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.DPAD, MASTER_DELAY, {onComplete: restDpad, onCompleteScope: this});
                _loc3 = "<img src=\'button_4\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                CONTENT.DPAD.gotoAndStop("DOWN");
                com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.DPAD, MASTER_DELAY, {onComplete: restDpad, onCompleteScope: this});
                _loc3 = "<img src=\'button_5\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                CONTENT.DPAD.gotoAndStop("LEFT");
                com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.DPAD, MASTER_DELAY, {onComplete: restDpad, onCompleteScope: this});
                _loc3 = "<img src=\'button_6\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                CONTENT.DPAD.gotoAndStop("RIGHT");
                com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT.DPAD, MASTER_DELAY, {onComplete: restDpad, onCompleteScope: this});
                _loc3 = "<img src=\'button_7\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.START:
            {
                this.growIcon(CONTENT.START);
                _loc3 = "<img src=\'button_38\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.SELECT:
            {
                this.growIcon(CONTENT.SELECT);
                _loc3 = "<img src=\'button_39\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.SQUARE:
            {
                this.growIcon(CONTENT.SQUARE);
                _loc3 = "<img src=\'button_32\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.TRIANGLE:
            {
                this.growIcon(CONTENT.TRIANGLE);
                _loc3 = "<img src=\'button_33\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.CROSS:
            {
                this.growIcon(CONTENT.CROSS);
                _loc3 = "<img src=\'button_30\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            {
                this.growIcon(CONTENT.CIRCLE);
                _loc3 = "<img src=\'button_31\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.LEFTSHOCK:
            {
                this.growIcon(CONTENT.LEFTSTICK);
                _loc3 = "<img src=\'button_17\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.RIGHTSHOCK:
            {
                this.growIcon(CONTENT.RIGHTSTICK);
                _loc3 = "<img src=\'button_26\' height=\'25\' width=\'25\'/><br/>";
                break;
            } 
        } // End of switch
        if (_loc3 != " ")
        {
            if (stringArray.length > 19)
            {
                stringArray.shift();
            } // end if
            stringArray.push(_loc3);
            stringArray.reverse();
            var _loc2 = 0;
            var _loc4 = "";
            for (var _loc2 = 0; _loc2 < stringArray.length; ++_loc2)
            {
                _loc4 = _loc4 + stringArray[_loc2];
            } // end of for
            stringArray.reverse();
            CONTENT.outputTF.htmlText = _loc4;
        } // end if
    } // End of the function
    function SET_ANALOG_STICK_INPUT(isLeftStick, mouseX, mouseY)
    {
        if (isLeftStick == 1)
        {
            CONTENT.LeftXvalue.text = mouseX;
            CONTENT.LeftYvalue.text = mouseY;
        } // end if
        if (isLeftStick == 0)
        {
            CONTENT.RightXvalue.text = mouseX;
            CONTENT.RightYvalue.text = mouseY;
        } // end if
    } // End of the function
    var MASTER_DELAY = 0.010000;
} // End of Class
#endinitclip
