// Action script...

// [Initial MovieClip Action of sprite 435]
#initclip 23
class com.rockstargames.gtav.hud.hudComponents.HUD_MP_INVENTORY extends com.rockstargames.ui.hud.HUD_COMPONENT
{
    var TIMELINE, CONTENT, BOUNDING_BOX, _enumID, _HUD;
    function HUD_MP_INVENTORY()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        TIMELINE = this;
        CONTENT = TIMELINE.CONTENT;
        BOUNDING_BOX = TIMELINE.BOUNDING_BOX;
        BOUNDING_BOX._visible = false;
    } // End of the function
    function SHOW_MP_INVENTORY_ITEM_WITH_TEXT(params)
    {
        var _loc4 = params[0];
        if (params[1] != undefined)
        {
            var _loc2 = params[1];
            CONTENT.inventoryTF.text = _loc2;
        } // end if
        CONTENT.gotoAndStop(_loc4 - 2);
        CONTENT._alpha = 100;
    } // End of the function
    function SHOW_MP_INVENTORY_ITEM(params)
    {
        this.SHOW_MP_INVENTORY_ITEM_WITH_TEXT(params);
    } // End of the function
    function REMOVE_MP_INVENTORY_ITEM()
    {
        _HUD.REMOVE_HUD_ITEM(_enumID);
    } // End of the function
} // End of Class
#endinitclip
