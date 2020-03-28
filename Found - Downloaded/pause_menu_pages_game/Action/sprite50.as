// Action script...

// [Initial MovieClip Action of sprite 50]
#initclip 14
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuReplayListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem
{
    var iconMC, type, __get__data, multiListItems, _data, itemTextLeft, initialIndex, __set__textIndex, __set__data;
    function PauseMenuReplayListItem()
    {
        super();
        iconMC._visible = false;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        switch (type)
        {
            case 1:
            {
                multiListItems = this.__get__data().slice(1);
                com.rockstargames.ui.utils.UIText.setSizedText(itemTextLeft, _data[0]);
                this.__set__textIndex(initialIndex);
                iconMC._visible = false;
                break;
            } 
            case 3:
            {
                var _loc3 = new com.rockstargames.ui.utils.HudColour();
                com.rockstargames.ui.utils.Colour.setHudColour(this.__get__data()[1], _loc3);
                if (iconMC != undefined)
                {
                    com.rockstargames.ui.utils.Colour.Colourise(iconMC, _loc3.r, _loc3.g, _loc3.b, _loc3.a);
                    iconMC._visible = true;
                } // end if
                break;
            } 
            default:
            {
                iconMC._visible = false;
                break;
            } 
        } // End of switch
        //return (this.data());
        null;
    } // End of the function
} // End of Class
#endinitclip
