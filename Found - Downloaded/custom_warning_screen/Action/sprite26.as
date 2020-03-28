// Action script...

// [Initial MovieClip Action of sprite 26]
#initclip 9
class com.rockstargames.gtav.levelDesign.WarningScreenList extends MovieClip
{
    var CurrentIndex, ItemCounter, getNextHighestDepth, attachMovie;
    function WarningScreenList()
    {
        super();
        CurrentIndex = 0;
        ItemCounter = 0;
    } // End of the function
    function setItem(text)
    {
        if (text != "")
        {
            var _loc2 = this.attachMovie("WarningScreenListItem", "Option" + ItemCounter + "MC", this.getNextHighestDepth());
            Elements[ItemCounter] = _loc2;
            _loc2.setText(text);
            _loc2._y = ItemCounter * (_loc2._height + 2);
            ++ItemCounter;
        } // end if
    } // End of the function
    function setSelectedItem(selectedItem)
    {
        var _loc2 = Elements[CurrentIndex];
        _loc2.setActive(false);
        CurrentIndex = selectedItem;
        _loc2 = Elements[CurrentIndex];
        _loc2.setActive(true);
    } // End of the function
    function reset()
    {
        for (var _loc2 = 0; _loc2 < ItemCounter; ++_loc2)
        {
            Elements[_loc2].removeMovieClip();
            Elements[_loc2] = null;
        } // end of for
        Elements = [];
        CurrentIndex = 0;
        ItemCounter = 0;
    } // End of the function
    function debug()
    {
        ItemCounter = 6;
    } // End of the function
    var Elements = [];
} // End of Class
#endinitclip
