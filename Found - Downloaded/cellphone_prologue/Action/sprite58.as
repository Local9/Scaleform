// Action script...

// [Initial MovieClip Action of sprite 58]
#initclip 4
class com.rockstargames.ui.controls.ScrollBar extends MovieClip
{
    var originX, originY, scrollBarContainer, gutter, scrubber;
    function ScrollBar()
    {
        super();
        gfx.motion.Tween.init();
    } // End of the function
    function construct(container, scrubberID, gutterID, newX, newY, Height)
    {
        originX = newX;
        originY = newY;
        scrollBarContainer.removeMovieClip();
        scrollBarContainer = container.createEmptyMovieClip("scrollBarContainer", container.getNextHighestDepth());
        gutter = scrollBarContainer.attachMovie(gutterID, "gutter", scrollBarContainer.getNextHighestDepth(), {_x: originX, _y: originY});
        if (Height != undefined)
        {
            gutter._height = Height;
        } // end if
        scrubber = scrollBarContainer.attachMovie(scrubberID, "scrubber", scrollBarContainer.getNextHighestDepth(), {_x: gutter._x, _y: gutter._y});
    } // End of the function
    function scrollToPercentage(percentage)
    {
        var _loc2 = (gutter._height - scrubber._height) / 100;
        var _loc3 = percentage * _loc2;
        scrubber._y = originY + _loc3;
    } // End of the function
    function SHOW()
    {
        scrollBarContainer.tweenEnd(true);
        scrollBarContainer._alpha = 100;
    } // End of the function
    function HIDE()
    {
        scrollBarContainer.tweenTo(fadeOutDuration, {_alpha: 0}, mx.transitions.easing.Strong.easeIn);
    } // End of the function
    var fadeOutDuration = 2.500000;
} // End of Class
#endinitclip
