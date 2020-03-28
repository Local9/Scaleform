// Action script...

// [Initial MovieClip Action of sprite 23]
#initclip 2
class com.rockstargames.gtav.minigames.darts.DARTS_SCOREBOARD extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
    var colPositions, plyrOneScores, plyrTwoScores, plyrScores, CONTENT, playerOneName, playerTwoName;
    function DARTS_SCOREBOARD()
    {
        super();
        colPositions = [15, 138];
        plyrOneScores = [];
        plyrTwoScores = [];
        plyrScores = [plyrOneScores, plyrTwoScores];
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        playerOneName = CONTENT.playerOneName;
        playerTwoName = CONTENT.playerTwoName;
        CONTENT.p1CrewTag._visible = false;
        CONTENT.p2CrewTag._visible = false;
    } // End of the function
    function debug()
    {
        this.SET_DARTS_PLAYER_NAMES("MICHAEL", "TREVOR");
        this.ADD_DARTS_SCORE(0, 301);
        this.ADD_DARTS_SCORE(0, 251);
        this.ADD_DARTS_SCORE(0, 201);
        this.ADD_DARTS_SCORE(1, 301);
        this.ADD_DARTS_SCORE(1, 251);
        this.ADD_DARTS_SCORE(1, 201);
        this.ADD_DARTS_SCORE(1, 200);
        this.ADD_DARTS_SCORE(1, 300);
        this.ADD_DARTS_SCORE(1, 400);
        this.ADD_DARTS_SCORE(1, 500);
        this.ADD_DARTS_SCORE(1, 600);
        this.ADD_DARTS_SCORE(1, 700);
        this.ADD_DARTS_SCORE(1, 800);
        this.ADD_DARTS_SCORE(1, 900);
        this.ADD_DARTS_SCORE(1, 1100);
        this.ADD_DARTS_SCORE(1, 1200);
        this.ADD_DARTS_SCORE(1, 1300);
        this.ADD_DARTS_SCORE(1, 1400);
        this.ADD_DARTS_SCORE(1, 1500);
        this.SET_PLAYER_HIGHLIGHT(2);
        this.SET_PLAYER_SETS_AND_LEGS(1, 1, 2, 0);
        this.SET_CREW_TAG(2, "WWW", false);
    } // End of the function
    function SET_PLAYER_HIGHLIGHT(who)
    {
        CONTENT.whosTurn._alpha = 0;
        if (who == 1)
        {
            CONTENT.whosTurn._alpha = 100;
            CONTENT.whosTurn._x = 14;
        } // end if
        if (who == 2)
        {
            CONTENT.whosTurn._alpha = 100;
            CONTENT.whosTurn._x = 142;
        } // end if
    } // End of the function
    function SET_CREW_TAG(player, tag, isPrivate)
    {
        if (player == 1)
        {
            CONTENT.p1CrewTag.gotoAndStop(Number(isPrivate) + 2);
            CONTENT.p1CrewTag.crewTag.text = tag;
            CONTENT.p1CrewTag._visible = true;
        } // end if
        if (player == 2)
        {
            CONTENT.p2CrewTag.gotoAndStop(Number(isPrivate) + 2);
            CONTENT.p2CrewTag.crewTag.text = tag;
            CONTENT.p2CrewTag._visible = true;
        } // end if
    } // End of the function
    function SET_PLAYER_SETS_AND_LEGS(p1Sets, p2Sets, p1Legs, p2Legs)
    {
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(CONTENT.headerSets, "MG_DARTS_SETS");
        com.rockstargames.ui.utils.Localisation.setTextWithTranslation(CONTENT.headerLegs, "MG_DARTS_LEGS");
        CONTENT.playerOneSets.text = p1Sets;
        CONTENT.playerTwoSets.text = p2Sets;
        CONTENT.playerOneLegs.text = p1Legs;
        CONTENT.playerTwoLegs.text = p2Legs;
    } // End of the function
    function SET_DARTS_PLAYER_NAMES(playerOne, playerTwo)
    {
        com.rockstargames.ui.utils.FitToTextfield.scaleText(playerOneName, playerOne, 124, "center", false);
        playerOneName._x = 62.800000 - playerOneName._width / 2;
        com.rockstargames.ui.utils.FitToTextfield.scaleText(playerTwoName, playerTwo, 124, "center", false);
        playerTwoName._x = 194.050000 - playerTwoName._width / 2;
    } // End of the function
    function ADD_DARTS_SCORE(playerID, score)
    {
        var _loc3;
        if (playerID == 0)
        {
            if (numberOfRowsPlyrOne > MAX_ROWS)
            {
                this.CLEAR_SCORES(playerID);
                numberOfRowsPlyrOne = 0;
            } // end if
            _loc3 = numberOfRowsPlyrOne;
            ++numberOfRowsPlyrOne;
        }
        else
        {
            if (numberOfRowsPlyrTwo > MAX_ROWS)
            {
                this.CLEAR_SCORES(playerID);
                numberOfRowsPlyrTwo = 0;
            } // end if
            _loc3 = numberOfRowsPlyrTwo;
            ++numberOfRowsPlyrTwo;
        } // end else if
        var _loc5 = plyrScores[playerID];
        var _loc7 = _loc5.length;
        var _loc6 = _loc7 - 1;
        if (_loc6 < 1)
        {
            _loc6 = 0;
        } // end if
        var _loc2 = new MovieClip();
        var _loc10 = "score" + playerID + _loc3;
        _loc2 = CONTENT.attachMovie("playerScore", _loc10, CONTENT.getNextHighestDepth());
        _loc2.score.text = score;
        var _loc9 = _loc3 * (_loc2._height + ROW_SPACER) + FIRST_ROW_YPOS;
        _loc2._x = colPositions[playerID];
        _loc2._y = _loc9;
        _loc5.push(_loc2);
        if (_loc3 > 0)
        {
            var _loc8 = _loc5[_loc6];
            _loc8.strikethrough._alpha = 100;
        } // end if
    } // End of the function
    function CLEAR_DARTBOARD()
    {
        this.CLEAR_SCORES(0);
        this.CLEAR_SCORES(1);
        this.SET_DARTS_PLAYER_NAMES("", "");
        numberOfRowsPlyrOne = 0;
        numberOfRowsPlyrTwo = 0;
    } // End of the function
    function CLEAR_SCORES(playerID)
    {
        var _loc4 = plyrScores[playerID];
        var _loc5 = _loc4.length;
        var _loc3;
        for (var _loc2 = 0; _loc2 < _loc5; ++_loc2)
        {
            _loc3 = _loc4[_loc2];
            _loc3.removeMovieClip();
        } // end of for
        this.resetRow(playerID);
    } // End of the function
    function resetRow(playerID)
    {
        if (playerID == 0)
        {
            numberOfRowsPlyrOne = 0;
        } // end if
        if (playerID == 1)
        {
            numberOfRowsPlyrTwo = 0;
        } // end if
    } // End of the function
    var MAX_ROWS = 7;
    var ROW_SPACER = 7;
    var FIRST_ROW_YPOS = 85;
    var numberOfRowsPlyrOne = 0;
    var numberOfRowsPlyrTwo = 0;
} // End of Class
#endinitclip
