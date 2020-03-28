// Action script...

// [Initial MovieClip Action of sprite 173]
#initclip 25
class com.rockstargames.gtav.levelDesign.heists.HEIST_JEWELLERY extends com.rockstargames.gtav.levelDesign.heists.HeistControllerBase
{
    var model, CONTENT, SET_DATA_SLOT, DISPLAY_VIEW, FOCUS_VIEW, SET_INPUT_EVENT, SET_DATA_SLOT_EMPTY;
    function HEIST_JEWELLERY()
    {
        super();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        model = new com.rockstargames.gtav.levelDesign.heists.HeistModel();
        heistAssetList = [];
        this.RegisterHeistAsset(0, CONTENT.boardMC.blueprintMC);
        this.RegisterHeistAsset(1, CONTENT.boardMC.photoExtMC);
        this.RegisterHeistAsset(2, CONTENT.boardMC.jewelsMC);
        this.RegisterHeistAsset(3, CONTENT.boardMC.secGuardsMC);
        this.RegisterHeistAsset(4, CONTENT.boardMC.ventsMC);
        this.RegisterHeistAsset(5, CONTENT.boardMC.tunnelMC);
        this.RegisterHeistAsset(6, CONTENT.boardMC.brochureMC);
        this.RegisterHeistAsset(7, CONTENT.boardMC.exterminationMC);
        this.RegisterHeistAsset(8, CONTENT.boardMC.bikeMC);
        this.RegisterHeistAsset(9, CONTENT.boardMC.alarmMC);
        this.RegisterHeistAsset(10, CONTENT.boardMC.gasMC);
        this.RegisterHeistAsset(11, CONTENT.boardMC.roofVentMC);
    } // End of the function
    function debug()
    {
        this.CREATE_VIEW(0, 0);
        this.CREATE_VIEW(1, 0);
        this.CREATE_VIEW(2, 0);
        this.CREATE_VIEW(3, 0);
        this.CREATE_VIEW(4, 1);
        this.CREATE_VIEW(5, 2);
        this.SET_LABELS("#SKILL", "#ACCURRACY", "#CUT", "#heist title", "#todo", "#approach", "#crew", "#fire", "#loor", "#bomb", "#drive", "#Aapproach ", "#Bapproach ");
        this.SET_DATA_SLOT(0, 0, 1, "name here1", "skill here1", "1st skill", 50, "2nd skill", 25, "3rd skill", 75);
        this.SET_DATA_SLOT(0, 1, 2, "name here2", "skill here2", "1st skill", 50, "2nd skill", 25, "3rd skill", 75);
        this.SET_DATA_SLOT(0, 2, 3, "name here3", "skill here3", "1st skill", 50, "2nd skill", 25, "3rd skill", 75);
        this.SET_DATA_SLOT(0, 3, 4, "name here4", "skill here4", "1st skill", 50, "2nd skill", 25, "3rd skill", 75);
        this.SET_DATA_SLOT(0, 4, 5, "name here5", "skill here5", "1st skill", 50, "2nd skill", 25, "3rd skill", 75);
        this.SET_DATA_SLOT(1, 0, 6, "name here1", "skill here1", "1st skill", 50, "2nd skill", 25, "3rd skill", 75);
        this.SET_DATA_SLOT(1, 1, 7);
        this.SET_DATA_SLOT(2, 0, 8);
        this.SET_DATA_SLOT(2, 1, 9);
        this.SET_DATA_SLOT(2, 2, 10);
        this.SET_DATA_SLOT(3, 0, 1);
        this.SET_DATA_SLOT(3, 1, 2);
        this.SET_DATA_SLOT(3, 2, 3);
        this.SET_DATA_SLOT(4, 0, 2);
        this.SET_DATA_SLOT(4, 1, 1);
        this.SET_DATA_SLOT(5, 0, 1, "Crew");
        this.SET_DATA_SLOT(5, 1, 0, "Van Route");
        this.SET_DATA_SLOT(5, 2, 1, "Armour & weapons");
        this.SET_DATA_SLOT(5, 3, 1, "Bank scouted");
        this.SET_DATA_SLOT(5, 4, 1, "Safe schematics");
        this.DISPLAY_VIEW(0);
        this.DISPLAY_VIEW(1);
        this.DISPLAY_VIEW(2);
        this.DISPLAY_VIEW(3);
        this.DISPLAY_VIEW(4);
        this.DISPLAY_VIEW(5);
        this.FOCUS_VIEW(4);
        this.SHOW_HEIST_ASSET(0, 1);
        this.SHOW_HEIST_ASSET(1, 1);
        this.SHOW_HEIST_ASSET(2, 1);
        this.SHOW_HEIST_ASSET(3, 1);
        this.SHOW_HEIST_ASSET(4, 1);
        this.SHOW_HEIST_ASSET(5, 1);
        this.SHOW_HEIST_ASSET(6, 1);
        this.SHOW_HEIST_ASSET(7, 1);
        this.SHOW_HEIST_ASSET(8, 1);
        this.SHOW_HEIST_ASSET(9, 1);
        this.SHOW_HEIST_ASSET(10, 1);
        this.SHOW_HEIST_ASSET(11, 1);
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
        } // end else if
    } // End of the function
    function CREATE_VIEW(viewIndex, viewType, xp, yp)
    {
        var _loc6 = [116, 248, 380, 510, 650, 684];
        var _loc5 = [420, 425, 425, 430, 300, 106];
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
                model.createView(viewIndex, {id: viewType, x: _loc12 + 26, y: _loc11 - 10, rowSpacing: 2, columnSpacing: 2, container: CONTENT.containerMC, visibleItems: 1, selectstyle: com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE, linkage: ["crewmemberSelection"]});
                break;
            } 
            case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            {
                model.createView(viewIndex, {id: viewType, x: _loc12 + 10, y: _loc11, rowSpacing: 100, columnSpacing: 0, container: CONTENT.containerMC, visibleItems: 1, selectstyle: 0, linkage: ["gameplaySelection"]});
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
        var _loc12 = arguments[11];
        var _loc11 = arguments[12];
        (com.rockstargames.gtav.levelDesign.heists.HeistModel)(model).setLabel(_weaponname, _jobcut, _accuracy, _loc12, _loc11);
        var _loc9 = arguments[3];
        var _loc4 = arguments[4];
        var _loc5 = arguments[5];
        var _loc10 = arguments[6];
        if (_loc9 != undefined)
        {
            CONTENT.boardMC.tape01.headingTF.text = _loc9;
        } // end if
        if (_loc4 != undefined)
        {
            CONTENT.boardMC.tape04.headingTF.text = _loc4;
        } // end if
        if (_loc5 != undefined)
        {
            CONTENT.boardMC.tape02.headingTF.text = _loc5;
        } // end if
        if (_loc10 != undefined)
        {
            CONTENT.boardMC.tape03.headingTF.text = _loc10;
        } // end if
        var _loc6 = arguments[7];
        var _loc8 = arguments[8];
        var _loc7 = arguments[9];
        var _loc3 = arguments[10];
        if (_loc6 != undefined)
        {
            CONTENT.boardMC.secGuardsMC.noteCCTVMC.labelTF.text = _loc6;
        } // end if
        if (_loc8 != undefined)
        {
            CONTENT.boardMC.ventsMC.noteVentMC.labelTF.text = _loc8;
        } // end if
        if (_loc7 != undefined)
        {
            CONTENT.boardMC.alarmMC.noteAlarmMC.labelTF.text = _loc7;
        } // end if
        if (_loc3 != undefined)
        {
            CONTENT.boardMC.tunnelMC.noteTunnalMC.labelTF.text = _loc3;
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
