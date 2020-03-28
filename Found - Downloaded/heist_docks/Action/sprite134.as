// Action script...

// [Initial MovieClip Action of sprite 134]
#initclip 25
class com.rockstargames.gtav.levelDesign.heists.HEIST_DOCKS extends com.rockstargames.gtav.levelDesign.heists.HeistControllerBase
{
    var model, CONTENT, SET_DATA_SLOT, DISPLAY_VIEW, FOCUS_VIEW, SET_INPUT_EVENT, SET_DATA_SLOT_EMPTY;
    function HEIST_DOCKS()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        model = new com.rockstargames.gtav.levelDesign.heists.HeistModel();
        heistAssetList = [];
        this.RegisterHeistAsset(0, CONTENT.boardMC.mapMC);
        this.RegisterHeistAsset(1, CONTENT.boardMC.bowMC);
        this.RegisterHeistAsset(2, CONTENT.boardMC.sternMC);
        this.RegisterHeistAsset(3, CONTENT.boardMC.secGuardMC);
        this.RegisterHeistAsset(4, CONTENT.boardMC.websiteMC);
        this.RegisterHeistAsset(5, CONTENT.boardMC.manifestoMC);
    } // End of the function
    function debug()
    {
        this.CREATE_VIEW(0, 0);
        this.CREATE_VIEW(1, 0);
        this.CREATE_VIEW(2, 1);
        this.CREATE_VIEW(3, 2);
        this.SET_LABELS("#SKILL", "#ACCURRACY", "#CUT", "#heist title", "#todo", "#approach", "#apprA", "#apprB");
        this.SET_DATA_SLOT(0, 0, 7, "name here1", "skill here1", "Skilled1", "750", "250");
        this.SET_DATA_SLOT(0, 1, 2, "name here2", "skill here1", "Skilled1", "750", "250");
        this.SET_DATA_SLOT(0, 2, 3, "name here3", "skill here1", "Skilled1", "750", "250");
        this.SET_DATA_SLOT(0, 3, 4, "name here4", "skill here1", "Skilled1", "750", "250");
        this.SET_DATA_SLOT(0, 4, 5, "name here5", "skill here1", "Skilled1", "750", "250");
        this.SET_DATA_SLOT(1, 0, 6);
        this.SET_DATA_SLOT(1, 1, 7);
        this.SET_DATA_SLOT(2, 0, 3);
        this.SET_DATA_SLOT(2, 1, 4);
        this.SET_DATA_SLOT(3, 0, 1, "Photograph Ship");
        this.SET_DATA_SLOT(3, 1, 0, "Investigate Escape Routes");
        this.SET_DATA_SLOT(3, 2, 1, "Check On-Board Security");
        this.SET_DATA_SLOT(3, 3, 1, "Decide approach");
        this.SET_DATA_SLOT(3, 4, 1, "Pick Crew");
        this.DISPLAY_VIEW(0);
        this.DISPLAY_VIEW(1);
        this.DISPLAY_VIEW(2);
        this.DISPLAY_VIEW(3);
        this.SHOW_HEIST_ASSET(0, 1);
        this.SHOW_HEIST_ASSET(1, 1);
        this.SHOW_HEIST_ASSET(2, 1);
        this.SHOW_HEIST_ASSET(3, 1);
        this.SHOW_HEIST_ASSET(4, 1);
        this.SHOW_HEIST_ASSET(5, 1);
        this.FOCUS_VIEW(1);
        var _loc2 = new Object();
        _loc2.onKeyDown = mx.utils.Delegate.create(this, getKeys);
        Key.addListener(_loc2);
    } // End of the function
    function getKeys()
    {
        if (Key.isDown(38))
        {
            this.SET_INPUT_EVENT(8);
        }
        else if (Key.isDown(39))
        {
            this.SET_INPUT_EVENT(11);
        }
        else if (Key.isDown(40))
        {
            this.SET_INPUT_EVENT(9);
        }
        else if (Key.isDown(37))
        {
            this.SET_INPUT_EVENT(10);
        }
        else if (Key.isDown(32))
        {
            this.FOCUS_VIEW(99);
        }
        else if (Key.isDown(16))
        {
            this.SET_DATA_SLOT_EMPTY(0);
            this.CREATE_VIEW(0, 0);
            this.SET_DATA_SLOT(0, 0, 1);
            this.SET_DATA_SLOT(0, 1, 2);
            this.SET_DATA_SLOT(0, 2, 3);
            this.DISPLAY_VIEW(0);
            this.SHOW_VIEW(0, 0);
        } // end else if
    } // End of the function
    function CREATE_VIEW(viewIndex, viewType, xp, yp)
    {
        var _loc6 = [116, 278, 524, 550];
        var _loc5 = [395, 400, 254, 114];
        var _loc12 = arguments[2];
        var _loc11 = arguments[3];
        if (_loc12 == undefined)
        {
            _loc12 = _loc6[viewIndex];
        } // end if
        if (_loc11 == undefined)
        {
            _loc11 = _loc5[viewIndex];
        } // end if
        switch (viewType)
        {
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
            {
                model.createView(viewIndex, {id: viewType, x: _loc12, y: _loc11, rowSpacing: 2, columnSpacing: 2, container: CONTENT.containerMC, visibleItems: 1, selectstyle: com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE, linkage: ["crewmemberSelection"]});
                break;
            } 
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            {
                model.createView(viewIndex, {id: viewType, x: _loc12, y: _loc11, rowSpacing: 100, columnSpacing: 0, container: CONTENT.containerMC, visibleItems: 1, selectstyle: 0, linkage: ["gameplaySelection"]});
                break;
            } 
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
            {
                model.createView(viewIndex, {id: viewType, x: _loc12, y: _loc11, rowSpacing: 10, columnSpacing: 10, container: CONTENT.containerMC, visibleItems: 1, selectstyle: 0, linkage: ["todolistSelection"]});
                break;
            } 
        } // End of switch
    } // End of the function
    function REPOSITION_VIEW(viewIndex, xp, yp)
    {
        var _loc2 = (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).getCurrentView(viewIndex);
        if (xp != undefined)
        {
            _loc2.viewContainer._x = _loc2.viewContainerX = xp;
        } // end if
        if (yp != undefined)
        {
            _loc2.viewContainer._y = _loc2.viewContainerY = yp;
        } // end if
    } // End of the function
    function SET_LABELS(_weaponname, _jobcut, _accuracy)
    {
        var _loc7 = arguments[6];
        var _loc6 = arguments[7];
        (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).setLabel(_weaponname, _jobcut, _accuracy, _loc7, _loc6);
        var _loc4 = arguments[3];
        var _loc3 = arguments[4];
        var _loc5 = arguments[5];
        if (_loc4 != undefined)
        {
            CONTENT.boardMC.tape01.headingTF.text = _loc4;
        } // end if
        if (_loc3 != undefined)
        {
            CONTENT.boardMC.tape02.headingTF.text = _loc3;
        } // end if
        if (_loc5 != undefined)
        {
            CONTENT.boardMC.tape03.headingTF.text = _loc5;
        } // end if
    } // End of the function
    function SHOW_VIEW(_viewIndex, _show)
    {
        var _loc2 = model.getCurrentView(_viewIndex);
        (com.rockstargames.gtav.levelDesign.heists.HeistView)(_loc2).show(Boolean(_show));
    } // End of the function
    function SET_TODO(_viewIndex, _itemIndex, _checked)
    {
        var _loc2 = (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).getCurrentView(_viewIndex).dataList[_itemIndex];
        _loc2[0] = _checked;
        var _loc3 = (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).getCurrentView(_viewIndex);
        _loc3.addItem(_itemIndex, _loc2);
        _loc3.itemList[_itemIndex].data = _loc2;
    } // End of the function
    function RegisterHeistAsset(enum, mc)
    {
        heistAssetList["hi" + enum] = mc;
        mc._visible = false;
    } // End of the function
    function SHOW_HEIST_ASSET(enum, visible, frame, x, y)
    {
        var _loc2 = heistAssetList["hi" + enum];
        _loc2._visible = Boolean(visible);
        if (frame != undefined)
        {
            _loc2.gotoAndStop(frame);
        } // end if
        if (x != undefined)
        {
            _loc2._x = x;
        } // end if
        if (y != undefined)
        {
            _loc2._y = y;
        } // end if
    } // End of the function
    var heistAssetList = new Array();
} // End of Class
#endinitclip
