// Action script...

// [Initial MovieClip Action of sprite 36]
#initclip 4
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBarItem extends MovieClip
{
    var __set__mycolour, tabMC, mc, textMC, __get__label, _menuenum, __get__menuenum, lockMC, _highlight, __get__highlight, __get__mycolour, __get__locked, _mywidth, __get__gapless, __get__width, __set__gapless, __set__highlight, __set__label, __set__locked, __set__menuenum, __set__width;
    function PauseMenuBarItem()
    {
        super();
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_DIMMED, _loc3);
        this.__set__mycolour([com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MENU_DIMMED, _loc3.r, _loc3.g, _loc3.b, _loc3.a]);
        tabMC._alpha = 0;
        textMC = mc.textMC;
    } // End of the function
    function set label(str)
    {
        textMC.labelTF.text = str;
        textMC.labelTF.autoSize = "left";
        textMC.labelTF.multiline = false;
        textMC.labelTF.wordWrap = false;
        //return (this.label());
        null;
    } // End of the function
    function set menuenum(m)
    {
        _menuenum = m;
        //return (this.menuenum());
        null;
    } // End of the function
    function get menuenum()
    {
        return (_menuenum);
    } // End of the function
    function set highlight(h)
    {
        var _loc3 = new com.rockstargames.ui.utils.HudColour();
        var _loc4 = new com.rockstargames.ui.utils.HudColour();
        var _loc2 = new com.rockstargames.ui.utils.HudColour();
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK, _loc3);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG, _loc4);
        com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE, _loc2);
        if (h)
        {
            tabMC._alpha = 100;
            com.rockstargames.ui.utils.Colour.Colourise(mc.bgMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
            com.rockstargames.ui.utils.Colour.Colourise(mc.textMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
            if (isLocked)
            {
                com.rockstargames.ui.utils.Colour.Colourise(lockMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
            } // end if
        }
        else
        {
            tabMC._alpha = 0;
            com.rockstargames.ui.utils.Colour.Colourise(mc.bgMC, _loc4.r, _loc4.g, _loc4.b, _loc4.a);
            com.rockstargames.ui.utils.Colour.Colourise(mc.textMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
            if (isLocked)
            {
                com.rockstargames.ui.utils.Colour.Colourise(lockMC, _loc2.r, _loc2.g, _loc2.b, _loc2.a);
            } // end if
        } // end else if
        _highlight = h;
        //return (this.highlight());
        null;
    } // End of the function
    function set mycolour(c)
    {
        com.rockstargames.ui.utils.Colour.Colourise(tabMC, c[1], c[2], c[3], _highlight ? (100) : (0));
        //return (this.mycolour());
        null;
    } // End of the function
    function set locked(l)
    {
        isLocked = Boolean(l);
        lockMC._alpha = isLocked ? (100) : (0);
        //return (this.locked());
        null;
    } // End of the function
    function set gapless(b)
    {
        var _loc2 = b ? (2) : (0);
        tabMC._width = mc.bgMC._width = _mywidth + _loc2;
        //return (this.gapless());
        null;
    } // End of the function
    function set width(w)
    {
        tabMC._width = mc.bgMC._width = _mywidth = w;
        this.realignText(w);
        //return (this.width());
        null;
    } // End of the function
    function get width()
    {
        return (_mywidth);
    } // End of the function
    function realignText()
    {
        textMC.labelTF._x = this.__get__width() / 2 - textMC.labelTF._width / 2;
        lockMC._x = textMC.labelTF._x + textMC.labelTF._width + 5;
    } // End of the function
    var isLocked = false;
} // End of Class
#endinitclip
