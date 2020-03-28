// Action script...

// [Initial MovieClip Action of sprite 212]
#initclip 22
class com.rockstargames.gtav.cellphone.apps.SHUTTER extends MovieClip
{
    var CONTENT;
    function SHUTTER()
    {
        super();
        CONTENT = this;
    } // End of the function
    function construct()
    {
        _level0.TIMELINE.toggleCellphoneButtonsVisible(false);
    } // End of the function
    function populateContent()
    {
    } // End of the function
    function CLEAN_UP_DATA()
    {
    } // End of the function
    function CLOSE_APP()
    {
        _level0.TIMELINE.toggleCellphoneButtonsVisible(true);
    } // End of the function
} // End of Class
#endinitclip
