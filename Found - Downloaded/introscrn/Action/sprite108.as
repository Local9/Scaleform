// Action script...

// [Initial MovieClip Action of sprite 108]
#initclip 9
class com.rockstargames.ui.loadingScreens.LOAD_SCREEN extends com.rockstargames.ui.components.GUIController
{
    var imagePosition, textPosition, CONTENT, traceText, model, uobba_image, progress_graph, scrollBarReportOne, STATES, STATES_SIZES, TIMELINE, scrollBarReportTwo, headings, DISPLAY_VIEW, FOCUS_VIEW, scrollBar, scrollbarContainer, yPossitions, PROGRESS_INFO, object, MAX_BUGS;
    function LOAD_SCREEN()
    {
        super();
        _global.gfxExtensions = true;
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
        this.initProgressBar();
        imagePosition = new flash.geom.Point(0, 0);
        textPosition = new flash.geom.Point(97, 581.100000);
        traceText = CONTENT.outputTF;
        ox = textPosition.x;
        model = new com.rockstargames.ui.loadingScreens.LoadScreenModel();
        model.createView(0, {id: 0, x: ox, y: oy + menuHeight, rowSpacing: 0, columnSpacing: 0, selectstyle: 3, container: CONTENT.guiMC, visibleItems: 5, linkage: ["LoadingMenuItem"]});
        uobba_image = CONTENT.imgContainer.attachMovie("uobba_image", "uobba_image", CONTENT.imgContainer.getNextHighestDepth(), {_x: imagePosition.x, _y: imagePosition.y});
        progress_graph = CONTENT.imgContainer.attachMovie("progress_graph", "progress_graph", CONTENT.imgContainer.getNextHighestDepth(), {_x: imagePosition.x, _y: imagePosition.y});
        var _loc5 = CONTENT.attachMovie("bugText", "bugText", CONTENT.getNextHighestDepth(), {_x: textPosition.x, _y: textPosition.y});
        var _loc4 = 1186;
        var _loc3 = 510;
        scrollBarReportOne = new com.rockstargames.ui.controls.ScrollBar();
        scrollBarReportOne.construct(uobba_image, "scrubber", "gutter", _loc4 + 1, 50, _loc3);
        scrollBarReportOne.scrollBarContainer._visible = true;
        scrollBarReportOne.scrollToPercentage(0);
        scrollBarReportOne.SHOW();
        uobba_image.scroller = scrollBarReportOne;
        traceText = _loc5.outputTF;
        uobba_image._visible = false;
        progress_graph._visible = false;
        STATES = [CONTENT.guiMC, uobba_image, progress_graph];
        STATES_SIZES = [0, -530, -340];
        TIMELINE.onEnterFrame = gfx.utils.Delegate.create(this, checkScroll);
    } // End of the function
    function checkScroll()
    {
        var _loc2 = (uobba_image.report._y - percentageOffset) * -1;
        var _loc3 = Math.floor(_loc2 / oneHundredPercent * 100);
        scrollBarReportOne.scrollToPercentage(_loc3);
        var _loc5 = (progress_graph.report._y - percentageOffset) * -1;
        var _loc4 = Math.floor(_loc5 / 390 * 100);
        scrollBarReportTwo.scrollToPercentage(_loc4);
    } // End of the function
    function NO_BUGSTAR_DATA()
    {
        IS_BUGSTAR_DATA = false;
        this.GOTO_STATE(1);
    } // End of the function
    function DRAW_MENU_LIST(_viewIndex)
    {
        if (_viewIndex == undefined || _viewIndex == 0)
        {
            var _loc2 = model.getCurrentView(0).__get__maxitems();
            var _loc3 = 20;
            if (_loc2 > _loc3)
            {
                _loc2 = _loc3;
            } // end if
            model.getCurrentView(0).visibleItems = displayableItems = _loc2;
            if (headings == undefined)
            {
                CONTENT.guiMC.HeadingMenuItem.removeMovieClip();
                headings = CONTENT.guiMC.attachMovie("HeadingMenuItem", "HeadingMenuItemMC", 1000, {_x: ox, _y: oy});
            } // end if
            this.SET_HEADERS("Number", "Summary", "Tags", "Class", "Due Date", "QA Owner");
            this.DISPLAY_VIEW(0);
            this.RESIZE_BACKGROUND(0);
            this.FOCUS_VIEW(0);
            (com.rockstargames.ui.loadingScreens.LoadScreenMenuItem)(model.getCurrentView().itemList[0]).__set__highlighted(true);
            this.SET_TIMER();
            
        } // end if
    } // End of the function
    function SET_TEXT(str)
    {
        traceText.htmlText = str;
    } // End of the function
    function SET_HEADERS()
    {
        var _loc3 = arguments.slice(0);
        headings.numberTF.text = _loc3[0];
        headings.summaryTF.text = _loc3[1];
        headings.tagsTF.text = _loc3[2];
        headings.classTF.text = _loc3[3];
        headings.dateTF.text = _loc3[4];
        headings.ownerTF.text = _loc3[5];
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
    function RESIZE_BACKGROUND(_viewIndex)
    {
        var _loc2 = model.getCurrentView(_viewIndex).viewContainer._height + oy;
        if (model.getCurrentView().__get__maxitems() > displayableItems)
        {
            if (scrollBar == undefined)
            {
                scrollbarContainer = CONTENT.guiMC.attachMovie("scrollbarContainer", "scrollbarContainer", CONTENT.guiMC.getNextHighestDepth());
                scrollBar = (com.rockstargames.ui.components.GUIScroll)(scrollbarContainer.attachMovie("scrollBarMC", "scrollBarMC", scrollbarContainer.getNextHighestDepth()));
            } // end if
            scrollBar.init(ox + headings._width - 5, oy + menuHeight, _loc2 - oy);
            scrollBar.setGutterHeight(model.getCurrentView(_viewIndex).visibleItems, model.getCurrentView().__get__maxitems());
            model.__set__scrollBar(scrollBar);
            scrollBar.__set__scrollpercent(0);
        }
        else if (scrollBar != undefined)
        {
            scrollBar.removeMovieClip();
            scrollBar = undefined;
            model.__set__scrollBar(undefined);
        } // end else if
    } // End of the function
    function SET_INPUT_EVENT(direction)
    {
        com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(CONTENT);
        shouldAnimate = false;
        switch (direction)
        {
            case com.rockstargames.ui.game.GamePadConstants.DPADUP:
            {
                if (currentState == 0)
                {
                    model.prevItem();
                }
                else
                {
                    --currentImagePosition;
                    if (currentImagePosition < 1)
                    {
                        currentImagePosition = 1;
                    } // end if
                    var _loc2 = (MovieClip)(STATES[currentState]).report;
                    if (currentState == 1)
                    {
                        if (_loc2._y + imageScrollIncrement >= percentageOffset)
                        {
                            _loc2._y = percentageOffset;
                        }
                        else
                        {
                            _loc2._y = _loc2._y + imageScrollIncrement;
                        } // end if
                    } // end else if
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADDOWN:
            {
                ++currentImagePosition;
                if (currentState == 0)
                {
                    model.nextItem();
                }
                else
                {
                    if (currentImagePosition > 3)
                    {
                        currentImagePosition = 3;
                    } // end if
                    _loc2 = (MovieClip)(STATES[currentState]).report;
                    if (currentState == 1)
                    {
                        if (_loc2._y - imageScrollIncrement <= STATES_SIZES[currentState])
                        {
                            _loc2._y = STATES_SIZES[currentState];
                        }
                        else
                        {
                            _loc2._y = _loc2._y - imageScrollIncrement;
                        } // end if
                    } // end else if
                } // end else if
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.SQUARE:
            {
                this.GOTO_STATE(0);
                currentState = 0;
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.TRIANGLE:
            {
                this.GOTO_STATE(1);
                currentState = 1;
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.CIRCLE:
            {
                this.GOTO_STATE(2);
                currentState = 2;
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                ++currentState;
                if (currentState > 2)
                {
                    currentState = 0;
                } // end if
                this.GOTO_STATE(currentState);
                break;
            } 
            case com.rockstargames.ui.game.GamePadConstants.DPADRIGHT:
            {
                --currentState;
                if (currentState < 0)
                {
                    currentState = 2;
                } // end if
                this.GOTO_STATE(currentState);
                break;
            } 
        } // End of switch
    } // End of the function
    function GOTO_STATE(stateID)
    {
        if (shouldAnimate)
        {
            if (stateID == undefined)
            {
                ++currentState;
                if (currentState > STATES.length - 1)
                {
                    currentState = 0;
                } // end if
            }
            else
            {
                currentState = stateID;
            } // end else if
            if (!IS_BUGSTAR_DATA && currentState == 0)
            {
                currentState = 1;
            } // end if
            var _loc4 = STATES[0];
            var _loc2 = STATES[1];
            var _loc3 = STATES[2];
            _loc4._visible = false;
            _loc2._visible = false;
            _loc3._visible = false;
            _loc2._y = yPossitions[0];
            _loc2._y = yPossitions[0];
            currentImagePosition = 1;
            if (currentState == 2)
            {
                currentImagePosition = 3;
            } // end if
            (MovieClip)(STATES[currentState]).report._y = percentageOffset;
            (MovieClip)(STATES[currentState])._visible = true;
            this.FOCUS_VIEW(0);
            (com.rockstargames.ui.loadingScreens.LoadScreenMenuItem)(model.getCurrentView().itemList[0]).__set__highlighted(true);
            (com.rockstargames.ui.loadingScreens.LoadScreenMenuItem)(model.getCurrentView().__set__index(0));
            this.SET_TIMER();
        } // end if
    } // End of the function
    function SET_TIMER(duration)
    {
        if (duration == undefined)
        {
            duration = DEFAULT_DURATION;
        } // end if
        if (shouldAnimate)
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(CONTENT, duration, {onComplete: GOTO_STATE, onCompleteScope: this});
        }
        else
        {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeAllTweens();
        } // end else if
    } // End of the function
    function SET_PROGRESS_BAR(percentage)
    {
        if (PROGRESS_INFO._visible == false)
        {
            PROGRESS_INFO._visible = true;
        } // end if
        PROGRESS_INFO.progress_bar._xscale = percentage;
    } // End of the function
    function SET_PROGRESS_TEXT(progressText)
    {
        if (PROGRESS_INFO._visible == false)
        {
            PROGRESS_INFO._visible = true;
        } // end if
        PROGRESS_INFO.progressText.text = progressText;
    } // End of the function
    function initProgressBar()
    {
        PROGRESS_INFO = CONTENT.attachMovie("PROGRESS_INFO", "PROGRESS_INFO", CONTENT.getNextHighestDepth());
        PROGRESS_INFO._x = 96;
        PROGRESS_INFO._y = 636;
        this.SET_PROGRESS_BAR(0);
        PROGRESS_INFO._visible = false;
    } // End of the function
    function debug()
    {
        this.ADD_UOBBA_ROW(0, "jobTitle1", 1000, "18/05/11", "Gareth Evans", 10, 100, 200, 150, 150, 10, 10, 10, 10, 10, 10, 50);
        this.ADD_UOBBA_ROW(1, "jobTitle2", 486, "18/05/11", "Gareth Evans", 102, 210, 30, 40, 150, 60, 71, 81, 11, 10, 110, 50);
        this.ADD_UOBBA_ROW(2, "jobTitle3", 234, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 34, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(3, "jobTitle4", 12, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(4, "jobTitle5", 213, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(5, "jobTitle6", 3, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(6, "jobTitle7", 3, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(7, "jobTitle8", 12, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(8, "jobTitle9", 3, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(9, "jobTitle10", 3, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(10, "jobTitle11", 65, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(11, "jobTitle12", 123, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(12, "jobTitle13", 45, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(13, "jobTitle14", 560, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(14, "jobTitle15", 12, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(15, "jobTitle16", 343, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(16, "jobTitle17", 486, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(17, "jobTitle18", 341, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(18, "jobTitle19", 81, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(19, "jobTitle486", 891, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(20, "jobTitle21", 561, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(21, "jobTitle22", 231, "18/05/11", "Gareth Evans", 486, 343, 34, 486, 343, 34, 486, 343, 34, 486, 343, 34, 56);
        this.ADD_UOBBA_ROW(22, "jobTitle23", 121, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.ADD_UOBBA_ROW(23, "jobTitle24", 121, "18/05/11", "Gareth Evans", 486, 343, 34, 210, 343, 234, 486, 343, 134, 46, 343, 134, 56);
        this.SET_TEXT("Project: Example project text goes here <br/>Matthew: Example person text goes here");
        this.SET_DATA_SLOT(22, 22, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(21, 21, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(20, 20, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(19, 19, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(18, 18, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(17, 17, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(16, 16, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(15, 15, 0, "Summary goes in here", "[pt]", "C", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(14, 14, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(13, 13, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(12, 12, 0, "Summary goes in here", "[pt]", "C", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(11, 11, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(10, 10, 0, "Summary goes in here", "[pt]", "TODO", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(9, 9, 0, "Summary goes in here", "[pt]", "C", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(8, 8, 0, "Summary goes in here", "[pt]", "C", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(7, 7, 0, "Summary goes in here", "[pt]", "C", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(6, 6, 1, "Summary goes in here", "[pt]", "B", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(5, 5, 1, "Summary goes in here", "[pt]", "B", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(4, 4, 1, "Summary goes in here", "[pt]", "B", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(3, 3, 1, "Summary goes in here", "[pt]", "A", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(2, 2, 1, "Summary goes in here", "[pt]", "A", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(1, 1, 1, "Summary goes in here", "[pt]", "A", "18/05/11", "Steve Milne");
        this.SET_DATA_SLOT(0, 0, 1, "Summary goes in here", "[pt]", "A", "18/05/11", "Steve Milne");
        this.DRAW_MENU_LIST(0);
        CONTENT.object = this;
        CONTENT.onEnterFrame = function ()
        {
            object.getKeys();
        };
    } // End of the function
    function ADD_UOBBA_ROW(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        if (_slotIndex == 0)
        {
            var _loc4 = _loc3[1];
            MAX_BUGS = _loc4;
        } // end if
        _loc3.push(MAX_BUGS);
        model.addDataToView(1, _slotIndex, _loc3);
    } // End of the function
    function SET_UOBBA_HEADERS()
    {
        var _loc3 = arguments.slice(0);
        if (_loc3[0] != undefined)
        {
            headings.numberTF.text = _loc3[0];
        } // end if
        if (_loc3[1] != undefined)
        {
            headings.userTF.text = _loc3[1];
        } // end if
    } // End of the function
    function getKeys()
    {
        --timerDelay;
        if (timerDelay <= 0)
        {
            timerDelay = 3;
            if (Key.isDown(38))
            {
                this.SET_INPUT_EVENT(8);
            }
            else if (Key.isDown(40))
            {
                this.SET_INPUT_EVENT(9);
            }
            else if (Key.isDown(32))
            {
            }
            else
            {
                timerDelay = 0;
            } // end else if
        } // end else if
    } // End of the function
    var oneHundredPercent = 580;
    var percentageOffset = 50;
    var imageScrollIncrement = 10;
    var DEFAULT_DURATION = 20;
    var timerDelay = 0;
    var ox = 400;
    var oy = 50;
    var menuHeight = 30;
    var displayableItems = 10;
    var currentState = 0;
    var currentImagePosition = 1;
    var IS_BUGSTAR_DATA = true;
    var shouldAnimate = true;
} // End of Class
#endinitclip
