// Action script...

// [Initial MovieClip Action of sprite 138]
#initclip 25
class com.rockstargames.gtav.pc.DesktopIcon extends com.rockstargames.gtav.pc.PCButtonBase
{
    var data, index, mc;
    function DesktopIcon()
    {
        super();
    } // End of the function
    function init(_mc, enum, args, _i, lbl)
    {
        super.init(_mc, enum, args);
        data = com.rockstargames.gtav.constants.PCAppLUT.lookUp(enum);
        index = _i;
        mc.iconsMC.gotoAndStop(data[1]);
        mc.labelTF.text = lbl;
        mc.labelTF.autoSize = true;
        mc.labelTF.wordWrap = true;
        mc.labelTF.multiline = true;
    } // End of the function
} // End of Class
#endinitclip
