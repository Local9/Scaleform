// Action script...

// [Initial MovieClip Action of sprite 35]
#initclip 5
class com.rockstargames.gtav.levelDesign.TRAFFIC_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
    var TIMELINE, CONTENT, positionToScreenLayout, safeRight, safeBottom, safeLeft, screenHeightPixels;
    function TRAFFIC_CAM()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        TIMELINE.DocumentClass = this;
    } // End of the function
    function initScreenLayout()
    {
        var _loc5 = CONTENT.camMC.topDetailsMC;
        this.positionToScreenLayout(_loc5, "xCT", true);
        var _loc2 = CONTENT.camMC.dateTF;
        _loc2._x = safeRight - _loc2._width;
        _loc2._y = safeBottom - _loc2._height;
        var _loc3 = CONTENT.camMC.latlongTF;
        _loc3._x = safeLeft;
        _loc3._y = safeBottom - _loc3._height;
        var _loc6 = CONTENT.camMC.topMarginMC;
        _loc6._height = _loc5._y + _loc5._height + 4;
        var _loc4 = CONTENT.camMC.botMarginMC;
        _loc4._height = screenHeightPixels - safeBottom + _loc2._height + 4;
        _loc4._y = screenHeightPixels - _loc4._height;
    } // End of the function
    function PLAY_CAM_MOVIE()
    {
        CONTENT.camMC.play();
    } // End of the function
    function SET_LAT_LONG(lat1, lat2, lon1, lon2)
    {
        var _loc2 = "Lat : N " + lat1 + " " + lat2;
        var _loc3 = " Lon : W " + lon1 + " " + lon2;
        CONTENT.camMC.latlongTF.text = _loc2 + _loc3;
    } // End of the function
    function SET_CAM_DATE(day, hrs, min)
    {
        var _loc3 = ["SUN", "MON", "TUE", "WED", "THURS", "FRI", "SAT"];
        var _loc6 = hrs > 9 ? (String(hrs)) : ("0" + hrs);
        var _loc4 = min > 9 ? (String(min)) : ("0" + min);
        var _loc7 = _loc3[day] + " " + _loc6 + ":" + _loc4;
        CONTENT.camMC.dateTF.text = _loc7;
    } // End of the function
} // End of Class
#endinitclip
