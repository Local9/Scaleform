// Action script...

// [Initial MovieClip Action of sprite 13]
#initclip 2
class com.rockstargames.gtav.Multiplayer.SAVING_FOOTER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var CONTENT, spinnerMC;
    function SAVING_FOOTER()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function SET_TEXT()
    {
        var _loc3 = arguments[0];
        this.setSaveText(_loc3);
    } // End of the function
    function SET_WAITING_TEXT()
    {
        var _loc4 = arguments[0];
        var _loc5 = arguments[1];
        var _loc3 = arguments[2];
        this.setSaveText(_loc3 + " (" + _loc4 + "/" + _loc5 + ")");
    } // End of the function
    function setSaveText(str)
    {
        CONTENT.saveTF.text = str;
        CONTENT.saveTF.autoSize = "left";
        CONTENT.saveTF.multiline = false;
        CONTENT.saveTF.wordWrap = false;
        CONTENT.bgMC._width = 58 + CONTENT.saveTF._width;
        this.setDropShadow();
        if (!isSpinning)
        {
            spinnerMC = CONTENT.attachMovie("spinner", "spinnerMC", 1, {_x: 24, _y: 20});
            isSpinning = true;
        } // end if
    } // End of the function
    function setDropShadow()
    {
        var _loc2 = new flash.filters.DropShadowFilter(1.200000, 45, 0, 1, 1, 1, 100, 1);
        CONTENT.saveTF.filters = [_loc2];
    } // End of the function
    var isSpinning = false;
} // End of Class
#endinitclip
