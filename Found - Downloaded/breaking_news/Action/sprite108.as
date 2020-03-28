// Action script...

// [Initial MovieClip Action of sprite 108]
#initclip 6
class com.rockstargames.gtav.levelDesign.BreakingNewsTicker extends MovieClip
{
    var labelMC, getNextHighestDepth, curLabel, bgMC, removeMovieClip, _x;
    function BreakingNewsTicker()
    {
        super();
        labelMC._visible = false;
    } // End of the function
    function DISPLAY_SCROLL_TEXT(str)
    {
        this.CLEAR_SCROLL_TEXT();
        ++labelCount;
        curLabel = labelMC.duplicateMovieClip("l" + labelCount, this.getNextHighestDepth(), {_x: labelMC._x + 100, _alpha: 0, _visible: true});
        curLabel.labelTF.autoSize = true;
        curLabel.labelTF.htmlText = str;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(bgMC.barMC, 0.300000, {_width: labelMC._x + curLabel._width + 20, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(bgMC.tipMC, 0.300000, {_x: labelMC._x + curLabel._width + 20, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        com.rockstargames.ui.tweenStar.TweenStarLite.to(curLabel, 0.300000, {_x: labelMC._x, _alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
    } // End of the function
    function CLEAR_SCROLL_TEXT()
    {
        var _loc2 = curLabel;
        com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2, 0.200000, {_x: labelMC._x - 50, _alpha: 0, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT, onComplete: removeMovieClip, onCompleteScope: _loc2});
    } // End of the function
    function setLabelSafeZone(value)
    {
        labelMC._x = value - _x;
        if (curLabel)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(curLabel, 0.100000, {_x: labelMC._x, _alpha: 100, ease: com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
        } // end if
    } // End of the function
    var labelCount = 0;
} // End of Class
#endinitclip
