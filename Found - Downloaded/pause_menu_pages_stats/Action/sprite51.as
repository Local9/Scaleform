// Action script...

// [Initial MovieClip Action of sprite 51]
#initclip 8
class com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuVerticalListItem extends com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuBaseItem
{
    var labelMC, itemTextRight, crewTagMC, type, __get__data, _data, itemTextLeft, initialIndex, __set__textIndex, getNextHighestDepth, attachMovie, storeFunc, storeScope, selectedIndex, selectedValue, __get__textIndex, index, _highlighted, __set__highlighted, __set__data;
    function PauseMenuVerticalListItem()
    {
        super();
        itemTextRight = labelMC.valueTF;
    } // End of the function
    function set data(_d)
    {
        super.__set__data(_d);
        if (crewTagMC)
        {
            crewTagMC._visible = false;
        } // end if
        switch (type)
        {
            case 1:
            {
                multiListItems = this.__get__data().slice(1);
                com.rockstargames.ui.utils.UIText.setSizedText(itemTextLeft, _data[0]);
                this.__set__textIndex(initialIndex);
                break;
            } 
            case 2:
            {
                if (!crewTagMC)
                {
                    crewTagMC = this.attachMovie("CREW_TAG_MOVIECLIP", "CREW_TAG", this.getNextHighestDepth(), {_y: 4, _xscale: 70, _yscale: 70});
                } // end if
                crewTagMC._visible = true;
                crewTagMC.UNPACK_CREW_TAG(this.__get__data()[1]);
                crewTagMC._x = itemTextLeft._x + itemTextLeft.textWidth + 10;
                break;
            } 
        } // End of switch
        //return (this.data());
        null;
    } // End of the function
    function initStoreMethod(func, scope)
    {
        storeFunc = func;
        storeScope = scope;
    } // End of the function
    function set textIndex(ti)
    {
        multiListIndex = ti;
        selectedIndex = multiListIndex;
        selectedValue = multiListItems[multiListIndex];
        com.rockstargames.ui.utils.UIText.setSizedText(itemTextRight, selectedValue);
        //return (this.textIndex());
        null;
    } // End of the function
    function stepVal(dir)
    {
        switch (type)
        {
            case 1:
            {
                multiListIndex = multiListIndex + dir;
                if (multiListIndex < 0)
                {
                    multiListIndex = multiListItems.length - 1;
                } // end if
                if (multiListIndex > multiListItems.length - 1)
                {
                    multiListIndex = 0;
                } // end if
                this.__set__textIndex(multiListIndex);
                storeFunc.apply(storeScope, [index, multiListIndex]);
                break;
            } 
        } // End of switch
        this.__set__highlighted(_highlighted);
    } // End of the function
    var multiListIndex = 0;
    var multiListItems = new Array();
} // End of Class
#endinitclip
