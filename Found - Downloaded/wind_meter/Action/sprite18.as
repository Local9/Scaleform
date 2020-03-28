// Action script...

// [Initial MovieClip Action of sprite 18]
#initclip 2
class com.rockstargames.gtav.levelDesign.WIND_METER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var mc, _arrowRotation, _strength, CONTENT, __set__arrowRotation, __set__strength, __get__arrowRotation, __get__strength;
    function WIND_METER()
    {
        super();
        mc._textBig_tf = mc.txt_strength.getTextFormat();
        mc._textBig_tf.letterSpacing = -1;
        mc._textSub_tf = mc.txt_strength.getTextFormat();
        mc._textSub_tf.letterSpacing = 1;
        mc._textSub_tf.size = 10;
        _arrowRotation = mc.mc_arrow._rotation;
        _strength = mc.mc_strengthBG._currentframe;
    } // End of the function
    function INITIALISE(_mc)
    {
        super.INITIALISE(_mc);
        mc = CONTENT.mc;
        this.initCompass();
    } // End of the function
    function SET_WIND_DIRECTION(rotation, strg)
    {
        this.__set__arrowRotation(rotation);
        this.__set__strength(Math.round(strg));
    } // End of the function
    function SET_COMPASS_DIRECTION(rotation)
    {
        this.setCompass(rotation);
    } // End of the function
    function TINT_WIND_POINTER(id, r, g, b)
    {
        switch (id)
        {
            case 0:
            {
                com.rockstargames.ui.utils.Colour.Colourise(mc.mc_arrow, r, g, b);
                break;
            } 
            case 1:
            {
                com.rockstargames.ui.utils.Colour.Colourise(mc.mc_arrowBG, r, g, b);
                break;
            } 
        } // End of switch
    } // End of the function
    function get arrowRotation()
    {
        return (_arrowRotation);
    } // End of the function
    function set arrowRotation(value)
    {
        if (value == _arrowRotation)
        {
            return;
        } // end if
        mc.mc_arrow._rotation = _arrowRotation = value;
        //return (this.arrowRotation());
        null;
    } // End of the function
    function get strength()
    {
        return (_strength);
    } // End of the function
    function set strength(value)
    {
        mc.txt_strength.setNewTextFormat(mc._textBig_tf);
        mc.txt_strength.text = value + " mph".toUpperCase();
        mc.txt_strength.setTextFormat(value.toString().length, mc.txt_strength.text.length, mc._textSub_tf);
        //return (this.strength());
        null;
    } // End of the function
    function initCompass()
    {
        compassPointList = [];
        var _loc4 = ["N", "W", "S", "E"];
        for (var _loc2 = 0; _loc2 < _loc4.length; ++_loc2)
        {
            var _loc3 = mc.compassWordsMC.attachMovie("compassletter", "compassletter" + _loc4[_loc2], mc.compassWordsMC.getNextHighestDepth());
            _loc3.letterTF.text = _loc4[_loc2];
            _loc3._alpha = 0;
            compassPointList.push(_loc3);
        } // end of for
        var _loc5 = 30;
        halfWidth = _loc5 / 2;
        angleSteps = _loc5 * 2;
    } // End of the function
    function setCompass(a)
    {
        var _loc6 = Math.max(0, Math.min(a, 360));
        var _loc5 = -_loc6 / 360 * angleSteps;
        var _loc7 = _loc5 % 28;
        for (var _loc4 in compassPointList)
        {
            var _loc2 = (a + 90 * _loc4) % 360;
            this.setCompassPoint(compassPointList[_loc4], _loc2, _loc4);
        } // end of for...in
    } // End of the function
    function setCompassPoint(mc, a, index)
    {
        var _loc2 = a / afactor;
        mc._x = Math.sin(_loc2) * halfWidth;
        var _loc3 = Math.abs(a - 180) - 80;
        mc._alpha = _loc3;
    } // End of the function
    var _windColors = [13485106, 7772776, 1336471, 6961750, 13440791];
    var compassPointList = new Array();
    var angle = 0;
    var afactor = 57.295780;
    var halfWidth = 15;
    var angleSteps = 60;
} // End of Class
#endinitclip
