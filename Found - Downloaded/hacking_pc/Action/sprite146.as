// Action script...

// [Initial MovieClip Action of sprite 146]
#initclip 30
class com.rockstargames.gtav.pc.applications.hacking.BaseHacking extends com.rockstargames.gtav.pc.applications.App_Base
{
    var hackingRef;
    function BaseHacking()
    {
        super();
    } // End of the function
    function setupButton(mc, id, depth)
    {
        var _loc2 = new com.rockstargames.gtav.pc.PCButtonBase();
        _loc2.init(mc, id, {depth: depth});
        hackingRef.ADD_BUTTONS(_loc2);
        return (_loc2);
    } // End of the function
    function setupIcon(mc, fr, label)
    {
        mc.iconsMC.gotoAndStop(fr);
        if (label != undefined)
        {
            mc.labelTF.text = label;
        } // end if
        mc.labelTF.autoSize = true;
        mc.labelTF.wordWrap = true;
        mc.labelTF.multiline = true;
    } // End of the function
    function getRndNumber()
    {
        var _loc1 = Math.floor(Math.random() * 99);
        if (_loc1 < 10)
        {
            return (String("0" + _loc1));
        }
        else
        {
            return (String(_loc1));
        } // end else if
    } // End of the function
    function setInputEvent(direction)
    {
    } // End of the function
    var lives = 7;
    var gameSpeed = 1;
} // End of Class
#endinitclip
