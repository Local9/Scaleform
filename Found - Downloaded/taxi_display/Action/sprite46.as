// Action script...

// [Initial MovieClip Action of sprite 46]
#initclip 9
class com.rockstargames.gtav.levelDesign.TAXI_DISPLAY extends com.rockstargames.ui.components.GUIController
{
    var CONTENT, pricePanel, destinationPanel, model, DISPLAY_VIEW;
    function TAXI_DISPLAY()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        pricePanel = CONTENT.attachMovie("pricePanel", "pricePanel", CONTENT.getNextHighestDepth());
        destinationPanel = CONTENT.createEmptyMovieClip("destinationPanel", CONTENT.getNextHighestDepth());
        model = new com.rockstargames.ui.components.GUIModel();
        model.createView(0, {id: 0, x: 0, y: 0, rowSpacing: 0, columnSpacing: 0, container: destinationPanel, visibleItems: 1, selectstyle: 2, linkage: ["panel"]});
    } // End of the function
    function ADD_TAXI_DESTINATION(positionInList, blip, r, g, b, destination, addressOne, addressTwo)
    {
        if (destination == undefined)
        {
            destination = "";
        } // end if
        if (addressOne == undefined)
        {
            addressOne = "";
        } // end if
        if (addressTwo == undefined)
        {
            addressTwo = "";
        } // end if
        this.SET_DATA_SLOT(positionInList, blip, r, g, b, destination, addressOne, addressTwo);
    } // End of the function
    function SHOW_TAXI_DESTINATION()
    {
        this.DISPLAY_VIEW(0, 1);
    } // End of the function
    function HIGHLIGHT_DESTINATION(forceDestination)
    {
        model.getCurrentView().__set__index(forceDestination);
    } // End of the function
    function SET_TAXI_PRICE(newPrice)
    {
        for (var _loc2 = String(newPrice); _loc2.length < cashCharLimit; _loc2 = "0" + _loc2)
        {
        } // end of for
        pricePanel.priceDollar.text = "$";
        pricePanel.priceUnits.text = _loc2.substr(3, 1);
        pricePanel.priceTens.text = _loc2.substr(2, 1);
        pricePanel.priceHundreds.text = _loc2.substr(1, 1);
        pricePanel.priceThousands.text = _loc2.substr(0, 1);
    } // End of the function
    function CLEAR_TAXI_DISPLAY()
    {
        this.SET_DATA_SLOT_EMPTY();
    } // End of the function
    function SET_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        model.addDataToView(0, _slotIndex, _loc3);
    } // End of the function
    function UPDATE_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        model.updateSlot(0, _slotIndex, _loc3);
    } // End of the function
    function SET_DATA_SLOT_EMPTY()
    {
        super.SET_DATA_SLOT_EMPTY(0, 0);
    } // End of the function
    var cashCharLimit = 4;
} // End of Class
#endinitclip
