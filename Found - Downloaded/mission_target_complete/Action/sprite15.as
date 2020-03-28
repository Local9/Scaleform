// Action script...

// [Initial MovieClip Action of sprite 15]
#initclip 2
class com.rockstargames.gtav.levelDesign.MISSION_TARGET_COMPLETE extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, innerMC;
    function MISSION_TARGET_COMPLETE()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        innerMC = CONTENT.targetItemMC.innerMC;
        CONTENT._alpha = 0;
    } // End of the function
    function SET_DATA_SLOT()
    {
        var _loc3 = arguments;
        data = _loc3;
        innerMC.animMC._alpha = 100;
        var _loc9 = _loc3[1];
        var _loc4 = "";
        var _loc10 = _loc3[_loc3.length - 1];
        innerMC._alpha = 100;
        switch (_loc9)
        {
            case 0:
            {
                innerMC._alpha = 50;
                break;
            } 
            case 1:
            {
                _loc4 = _loc3[_loc3.length - 2];
                break;
            } 
            case 2:
            {
                _loc4 = _loc3[_loc3.length - 2];
                break;
            } 
            case 3:
            {
                _loc4 = _loc3[_loc3.length - 2] + "%";
                break;
            } 
            case 4:
            {
                var _loc5 = _loc3[_loc3.length - 3];
                var _loc7 = String(_loc5);
                if (_loc5 < 10)
                {
                    _loc7 = "0" + _loc5;
                } // end if
                var _loc6 = _loc3[_loc3.length - 2];
                var _loc8 = String(_loc6);
                if (_loc6 < 10)
                {
                    _loc8 = "0" + _loc6;
                } // end if
                _loc4 = _loc7 + ":" + _loc8;
                break;
            } 
            case 5:
            {
                _loc4 = _loc3[_loc3.length - 3] + "/" + _loc3[_loc3.length - 2];
                break;
            } 
            case 6:
            {
                _loc4 = "$" + _loc3[_loc3.length - 2];
                break;
            } 
        } // End of switch
        innerMC.itemTextLeft.text = _loc10;
        innerMC.itemTextLeft.autoSize = "left";
        innerMC.itemTextRight.text = _loc4;
        innerMC.itemTextRight.autoSize = "right";
    } // End of the function
    function clampText(textF, labelS, maxVal)
    {
        textF.text = labelS;
        textF.wordWrap = false;
        if (textF._width > maxVal)
        {
            textF._xscale = maxVal / textF._width * 100;
        } // end if
    } // End of the function
    function SHOW(_fadeTime)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, _fadeTime == undefined ? (fadeTime) : (_fadeTime), {_alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT, onComplete: onShow, onCompleteScope: this});
    } // End of the function
    function onShow()
    {
        innerMC.completeMC.gotoAndStop(data[0] == 1 ? (2) : (1));
        com.rockstargames.ui.tweenStar.TweenStarLite.to(innerMC.animMC, 1, {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
    } // End of the function
    function HIDE(_fadeTime)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.to(CONTENT, _fadeTime == undefined ? (fadeTime) : (_fadeTime), {_alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
    } // End of the function
    var totalHeight = 41;
    var itemsPadding = 10;
    var data = new Array();
    var fadeTime = 1;
} // End of Class
#endinitclip
