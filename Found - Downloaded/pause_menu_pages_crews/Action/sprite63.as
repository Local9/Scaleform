// Action script...

// [Initial MovieClip Action of sprite 63]
#initclip 1
class com.rockstargames.gtav.pauseMenuPages.PAUSE_MENU_PAGES_CREWS extends com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage
{
    var addColumn, colCrewListLeft, colCrewListMid, colCrewCard, colCrewRanks, colCrewCompare1, colCrewCompare2, colFriendsList, colPlayerModel, setupColumns, columnList, showColumns;
    function PAUSE_MENU_PAGES_CREWS()
    {
        super();
    } // End of the function
    function setupPage()
    {
        super.setupPage();
        colCrewListLeft = this.addColumn("crewsList", 1, 0);
        colCrewListMid = this.addColumn("crewsList", 2, 290);
        colCrewCard = this.addColumn("crewsCard", 3, 580);
        colCrewRanks = this.addColumn("crewRanks", 7, 580);
        colCrewCompare1 = this.addColumn("crewComparisonCard", 8, 580);
        colCrewCompare2 = this.addColumn("crewComparisonCard", 9, 725);
        colFriendsList = this.addColumn("mpFriendsList", 4, 0);
        colPlayerModel = this.addColumn("mpPlayerModel", 5, 290);
        this.setupColumns(colCrewListLeft, colCrewListMid, colCrewCard, colFriendsList, colPlayerModel, colCrewRanks, colCrewCompare1, colCrewCompare2);
        var _loc4 = colCrewRanks.model.getCurrentView();
        var _loc3 = colCrewListMid.model.getCurrentView();
        (com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuCrewListView)(_loc3).__set__sidecarColumn((com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuViewBase)(_loc4));
    } // End of the function
    function stateChanged(id)
    {
        if (id == com.rockstargames.gtav.constants.PauseMenuLUT.CREW_LIST)
        {
            return;
        } // end if
        super.stateChanged(id);
        switch (id)
        {
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW:
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREWS_FILTER:
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_OPTIONS:
            {
                if (!inCrewMembers)
                {
                    inCrewMembers = true;
                    colCrewListMid.SET_DATA_SLOT_EMPTY(0);
                    colCrewRanks.SET_DATA_SLOT_EMPTY(0);
                    colCrewCompare1.SET_DATA_SLOT_EMPTY(0);
                    colCrewCompare2.SET_DATA_SLOT_EMPTY(0);
                } // end if
                columnList = [colFriendsList, colPlayerModel, colCrewCard];
                break;
            } 
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREWS:
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREWS_CATEGORY:
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_MINE:
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_ROCKSTAR:
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_FRIENDS:
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_INVITES:
            case com.rockstargames.gtav.constants.PauseMenuLUT.CREW_LEADERBOARDS:
            default:
            {
                if (inCrewMembers)
                {
                    inCrewMembers = false;
                    colFriendsList.SET_DATA_SLOT_EMPTY(0);
                    colPlayerModel.SET_DATA_SLOT_EMPTY(0);
                } // end if
                columnList = [colCrewListLeft, colCrewListMid, colCrewCard, colCrewRanks, colCrewCompare1, colCrewCompare2];
                break;
                break;
            } 
        } // End of switch
        this.showColumns();
        colCrewCard.SHOW_COLUMN(false);
        colCrewRanks.SHOW_COLUMN(false);
        colCrewCompare1.SHOW_COLUMN(false);
        colCrewCompare2.SHOW_COLUMN(false);
    } // End of the function
    function onPageExit()
    {
        colCrewCard.ON_DESTROY();
        colCrewCompare1.ON_DESTROY();
        colCrewCompare2.ON_DESTROY();
    } // End of the function
    var inCrewMembers = false;
} // End of Class
#endinitclip
