// Action script...

// [Initial MovieClip Action of sprite 142]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_MAP extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, column0, column1, column2, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_MAP()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        column0 = this.addColumn("mapLegend", 10, 0);
        column1 = this.addColumn("mapLegend", 1, 0);
        column2 = this.addColumn("freemodeDetails", 2, 0);
        this.setupColumns(column1, column2);
        column0.INITIALISE();
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)(column1);
        dx = _loc3.details._x;
        dy = _loc3.details._y;
    } // End of the function
    function setDisplayConfig(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen)
    {
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)(column0);
        var _loc2 = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)(column1);
        var _loc7 = _loc3.model.getCurrentView().viewContainer;
        var _loc5 = _loc2.model.getCurrentView().viewContainer;
        if (inFullscreenMode)
        {
            var _loc6 = 0;
            var _loc4 = 0;
            if (!_isWideScreen)
            {
                var _loc17 = 1.777778;
                var _loc15 = 1.333333;
                var _loc8 = 1280;
                var _loc14 = 720;
                _loc6 = (_loc8 - Math.round(_loc8 / _loc17 * _loc15)) / 2;
                _loc4 = 0;
                _screenWidthPixels = _loc8 - _loc6 * 2;
                _screenHeightPixels = _loc14 - _loc4 * 2;
            } // end if
            var _loc10 = _loc4 + Math.round(_safeTopPercent * 100 * (_screenHeightPixels / 100));
            var _loc16 = _loc4 + Math.round(_safeBottomPercent * 100 * (_screenHeightPixels / 100));
            var _loc9 = _loc6 + Math.round(_safeLeftPercent * 100 * (_screenWidthPixels / 100));
            var _loc12 = _loc6 + Math.round(_safeRightPercent * 100 * (_screenWidthPixels / 100));
            _loc3.details._x = _loc2.details._x = _loc9;
            _loc3.details._y = _loc2.details._y = _loc16;
            _loc7._x = _loc5._x = _loc12;
            _loc7._y = _loc5._y = _loc10;
            column2._x = _loc9;
            column2._y = _loc10;
        }
        else
        {
            _loc3.details._x = _loc2.details._x = dx;
            _loc3.details._y = _loc2.details._y = dy;
            _loc7._x = _loc5._x = 868;
            _loc7._y = _loc5._y = 0;
            column2._x = column2._y = 0;
        } // end else if
        _loc2.scrollBase._visible = false;
        _loc2.updateScroll();
    } // End of the function
    function setScaledContent()
    {
        inFullscreenMode = arguments[0];
    } // End of the function
    function stateChanged(id)
    {
        super.stateChanged(id);
        columnList = [column1, column2, column0];
        this.showColumns();
        var _loc3 = (com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_MAP)(column1);
        _loc3.scrollBase._visible = false;
        _loc3.updateScroll();
    } // End of the function
    var dx = 0;
    var dy = 430;
    var inFullscreenMode = false;
} // End of Class
#endinitclip
