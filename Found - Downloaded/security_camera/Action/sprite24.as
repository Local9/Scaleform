// Action script...

// [Initial MovieClip Action of sprite 24]
#initclip 5
class com.rockstargames.gtav.cutscenes.SECURITY_CAMERA extends com.rockstargames.ui.core.BaseScreenLayout
{
    var overlayMC, CONTENT, staticMC;
    function SECURITY_CAMERA()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.SHOW_CAMERA_OVERLAY();
    } // End of the function
    function SHOW_CAMERA_OVERLAY()
    {
        var _loc3 = arguments;
        if (overlayMC == undefined)
        {
            overlayMC = CONTENT.attachMovie("camera_overlay", "camera_overlay", CONTENT.getNextHighestDepth(), {_x: 0, _y: 0});
        } // end if
        if (_loc3[0] != undefined)
        {
            overlayMC.TF1.text = _loc3[0];
        } // end if
        if (_loc3[1] != undefined)
        {
            overlayMC.TF2.text = _loc3[1];
        } // end if
        if (_loc3[2] != undefined)
        {
            overlayMC.TF3.text = _loc3[2];
        } // end if
        if (_loc3[3] != undefined)
        {
            overlayMC.TF4.text = _loc3[3];
        } // end if
    } // End of the function
    function SHOW_STATIC()
    {
        if (staticMC == undefined)
        {
            staticMC = CONTENT.attachMovie("noise_animation", "noise_animation", CONTENT.getNextHighestDepth(), {_x: 0, _y: 0});
            overlayMC.removeMovieClip();
        } // end if
    } // End of the function
} // End of Class
#endinitclip
