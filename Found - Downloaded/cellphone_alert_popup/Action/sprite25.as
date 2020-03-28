// Action script...

// [Initial MovieClip Action of sprite 25]
#initclip 2
class com.rockstargames.gtav.cellphone.CELLPHONE_ALERT_POPUP extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, alert;
    function CELLPHONE_ALERT_POPUP()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        alert = CONTENT.createEmptyMovieClip("alert", CONTENT.getNextHighestDepth());
    } // End of the function
    function CREATE_ALERT(iconID, newX, newY, titleString)
    {
        var _loc4 = iconID;
        var _loc5 = titleString;
        var _loc3 = alert.getNextHighestDepth();
        var _loc2 = alert.attachMovie("alertDialogBox", "alertDialogBox" + _loc3, _loc3, {_x: newX, _y: newY});
        if (_loc5 != undefined)
        {
            _loc2.alertTitle.text = _loc5;
        } // end if
        if (_loc4 != undefined)
        {
            _loc2.alertIcon.gotoAndStop(com.rockstargames.gtav.cellphone.IconLabels.lookUp(_loc4)[1]);
        } // end if
    } // End of the function
    function CLEAR_ALL()
    {
        alert.removeMovieClip();
        alert = CONTENT.createEmptyMovieClip("alert", CONTENT.getNextHighestDepth());
    } // End of the function
} // End of Class
#endinitclip
