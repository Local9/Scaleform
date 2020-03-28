// Action script...

// [Initial MovieClip Action of sprite 178]
#initclip 30
class com.rockstargames.gtav.levelDesign.heists.selectors.HeistBoardTodoItem extends com.rockstargames.ui.components.GUIMenuItem
{
    var _data, tickMC, todoItemTF, __get__data, highlightMC, _highlighted, __get__highlighted, __set__data, __set__highlighted;
    function HeistBoardTodoItem()
    {
        super();
    } // End of the function
    function set data(_d)
    {
        _data = _d;
        tickMC.gotoAndStop(Boolean(_data[0]) ? (2) : (1));
        todoItemTF.text = _data[1];
        todoItemTF.autoSize = "left";
        todoItemTF.wordWrap = false;
        this.clampText(todoItemTF, 74);
        //return (this.data());
        null;
    } // End of the function
    function clampText(obj, maxVal)
    {
        if (obj._width > maxVal)
        {
            obj._xscale = maxVal / obj._width * 100;
        } // end if
    } // End of the function
    function set highlighted(_h)
    {
        highlightMC.gotoAndStop(_h ? (2) : (1));
        _highlighted = _h;
        //return (this.highlighted());
        null;
    } // End of the function
} // End of Class
#endinitclip
