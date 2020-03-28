// Action script...

// [Initial MovieClip Action of sprite 17]
#initclip 2
class com.rockstargames.gtav.cellphone.CAMERA_GALLERY extends com.rockstargames.ui.core.BaseScriptUI
{
    var CONTENT, shutter;
    function CAMERA_GALLERY()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        shutter = CONTENT.attachMovie("shutterSlideMC", "shutter", CONTENT.getNextHighestDepth(), {_x: 0, _y: 0});
        this.SHOW_PHOTO_FRAME(false);
        this.getDisplayConfig();
    } // End of the function
    function getDisplayConfig()
    {
        var _loc2 = new com.rockstargames.ui.utils.DisplayConfig();
        com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG", com.rockstargames.ui.game.GameInterface.GENERIC_TYPE, _loc2);
        if (!_loc2.isWideScreen)
        {
            Stage.scaleMode = "noBorder";
        } // end if
        var _loc3 = _loc2.screenWidth;
        var _loc6 = _loc2.screenHeight;
        if (!_loc2.isWideScreen)
        {
            _loc3 = Math.round(_loc3 / 1.300000);
        } // end if
        var _loc4 = Math.round(_loc3 * _loc2.safeRight);
        var _loc5 = Math.round(_loc6 * _loc2.safeTop);
        CONTENT.photoFrame.savedPhotos._x = _loc4;
        CONTENT.photoFrame.savedPhotos._y = _loc5;
    } // End of the function
    function DISPLAY_VIEW(viewIndex)
    {
    } // End of the function
    function SHOW_PHOTO_FRAME(vis)
    {
        if (vis == undefined)
        {
            vis = true;
        } // end if
        CONTENT.photoFrame.focusFrameGlow._alpha = 0;
        CONTENT.photoFrame._visible = vis;
    } // End of the function
    function FLASH_PHOTO_FRAME()
    {
    } // End of the function
    function SET_REMAINING_PHOTOS(photosTaken, photosLeft)
    {
        var _loc2 = photosTaken + "/" + photosLeft;
        CONTENT.photoFrame.savedPhotos.photosLeftTF.text = _loc2;
    } // End of the function
    function OPEN_SHUTTER()
    {
        this.goTo("openShutter");
    } // End of the function
    function CLOSE_SHUTTER()
    {
        this.goTo("closeShutter");
    } // End of the function
    function CLOSE_THEN_OPEN_SHUTTER()
    {
        this.goTo("close_then_open");
    } // End of the function
    function goTo(whichFrame)
    {
        if (shutter != undefined)
        {
            shutter.blade0.gotoAndPlay(whichFrame);
            shutter.blade1.gotoAndPlay(whichFrame);
        } // end if
    } // End of the function
} // End of Class
#endinitclip
