// Action script...

// [Initial MovieClip Action of sprite 31]
#initclip 1
class com.rockstargames.gtav.minimap.MINIMAP_MAIN_MAP extends MovieClip
{
    var TIMELINE, mapComponents, TXDLAYER, ROADS;
    function MINIMAP_MAIN_MAP(mc)
    {
        super();
        TIMELINE = mc;
        mapComponents = new Array();
        mapComponents.push("component_0");
        mapComponents.push("component_1");
        mapComponents.push("component_2");
        mapComponents.push("component_3");
        mapComponents.push("component_4");
    } // End of the function
    function REGISTER_MAP_LAYER(_MAP)
    {
        TXDLAYER = _MAP.attachMovie("TXD_MC", "TXD_MC", _MAP.getNextHighestDepth(), {_x: 0, _y: 0});
    } // End of the function
    function REGISTER_ROADS_LAYER(_ROADS)
    {
        ROADS = _ROADS;
    } // End of the function
    function hideALlComponents()
    {
        var _loc4 = _level0.asRootContainer.asMapContainer.asMapContainer.map;
        var _loc2;
        for (var _loc2 = 0; _loc2 < mapComponents.length; ++_loc2)
        {
            var _loc3;
            _loc3 = _loc4.main_map[mapComponents[_loc2]];
            _loc3._visible = false;
        } // end of for
    } // End of the function
    function TOGGLE_COMPONENT(component, visible)
    {
        var _loc4 = _level0.asRootContainer.asMapContainer.asMapContainer.map;
        var _loc3;
        if (component < 5)
        {
            _loc3 = _loc4.main_map[mapComponents[component]];
        }
        else if (component == 5)
        {
            var _loc2 = _level0.asRootContainer.asMapContainer.asMapContainer.asBackgroundOverlay3D.asFreewayLayer;
            if (ROADS != undefined)
            {
                _loc2 = ROADS;
            } // end if
            _loc3 = _loc2.roads_overlay;
        } // end else if
        _loc3._visible = visible;
    } // End of the function
    function SHOW_AIRCRAFT_COMPONENTS(shouldBeVisible)
    {
        var _loc2 = _level0.asRootContainer.asMapContainer.asMapContainer.map;
        var _loc4 = _loc2.main_map[mapComponents[0]];
        var _loc7 = _loc2.main_map[mapComponents[1]];
        var _loc5 = _loc2.main_map[mapComponents[2]];
        var _loc6 = _loc2.main_map[mapComponents[3]];
        _loc4._visible = shouldBeVisible;
        _loc7._visible = shouldBeVisible;
        _loc5._visible = shouldBeVisible;
        _loc6._visible = shouldBeVisible;
    } // End of the function
    function SET_BITMAP_MAP_ON(txd, xpos, ypos)
    {
        if (TXDLAYER[txd] != undefined)
        {
            this.SET_BITMAP_MAP_OFF(txd);
        } // end if
        var _loc3 = TXDLAYER.attachMovie("TXD_MC", txd, TXDLAYER.getNextHighestDepth(), {_x: xpos, _y: ypos});
        _loc3.SET_BITMAP_MAP_ON(txd, xpos, ypos);
    } // End of the function
    function SET_BITMAP_MAP_OFF(txd)
    {
        TXDLAYER[txd].removeMovieClip();
    } // End of the function
} // End of Class
#endinitclip
