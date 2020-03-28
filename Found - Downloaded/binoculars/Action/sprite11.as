// Action script...

// [Initial MovieClip Action of sprite 11]
#initclip 5
class com.rockstargames.gtav.levelDesign.BINOCULARS extends com.rockstargames.ui.core.BaseScreenLayout
{
    var CONTENT, positionToScreenLayout;
    function BINOCULARS()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function initScreenLayout()
    {
        this.positionToScreenLayout(CONTENT.binocularsMC, "CC", true);
    } // End of the function
} // End of Class
#endinitclip
