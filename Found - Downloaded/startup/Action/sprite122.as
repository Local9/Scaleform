// Action script...

// [Initial MovieClip Action of sprite 122]
#initclip 9
class com.rockstargames.gtav.loadingScreens.STARTUP extends com.rockstargames.ui.components.GUIController
{
    var imagePosition, textPosition, CONTENT, traceText, model, uobba_image, progress_graph, report_three, report_four, report_five, scrollBarReportOne, STATES, STATES_SIZES, TIMELINE, scrollBarReportTwo, headingsTwo, headingsTwoPageTitle, DISPLAY_VIEW, FOCUS_VIEW, headings, scrollBar, scrollbarContainer, yPossitions, PROGRESS_INFO, object, MAX_BUGS;
    function STARTUP()
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
        model.createView(0, {id: 0, x: ox, y: oy + menuHeight * 2, rowSpacing: 0, columnSpacing: 0, selectstyle: 3, container: CONTENT.guiMCTwo, visibleItems: 19, linkage: ["DoNowMenuItem"]});
        model.createView(1, {id: 1, x: ox, y: oy + menuHeight, rowSpacing: 0, columnSpacing: 0, selectstyle: 3, container: CONTENT.guiMC, visibleItems: 20, linkage: ["LoadingMenuItem"]});
        uobba_image = CONTENT.imgContainer.attachMovie("uobba_image", "uobba_image", CONTENT.imgContainer.getNextHighestDepth(), {_x: imagePosition.x, _y: imagePosition.y});
        progress_graph = CONTENT.imgContainer.attachMovie("progress_graph", "progress_graph", CONTENT.imgContainer.getNextHighestDepth(), {_x: imagePosition.x, _y: imagePosition.y});
        report_three = CONTENT.imgContainer.attachMovie("report_three", "report_three", CONTENT.imgContainer.getNextHighestDepth(), {_x: imagePosition.x, _y: imagePosition.y});
        report_four = CONTENT.imgContainer.attachMovie("report_four", "report_four", CONTENT.imgContainer.getNextHighestDepth(), {_x: imagePosition.x, _y: imagePosition.y});
        report_five = CONTENT.imgContainer.attachMovie("report_five", "report_five", CONTENT.imgContainer.getNextHighestDepth(), {_x: imagePosition.x, _y: imagePosition.y});
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
        report_three._visible = false;
        report_four._visible = false;
        report_five._visible = false;
        STATES = [CONTENT.guiMCTwo, CONTENT.guiMC, uobba_image, progress_graph, report_three, report_four, report_five];
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
            var _loc3 = model.getCurrentView(0).__get__maxitems();
            var _loc2 = 19;
            if (_loc3 > _loc2)
            {
                _loc3 = _loc2;
            } // end if
            if (headingsTwo == undefined)
            {
                CONTENT.guiMCTwo.DoNowPageTitle.removeMovieClip();
                CONTENT.guiMCTwo.HeadingMenuItem.removeMovieClip();
                headingsTwoPageTitle = CONTENT.guiMCTwo.attachMovie("DoNowPageTitle", "DoNowPageTitle", 200, {_x: ox, _y: oy});
                var _loc4 = headingsTwoPageTitle._y + headingsTwoPageTitle._height;
                headingsTwo = CONTENT.guiMCTwo.attachMovie("DoNowHeaders", "HeadingMenuItemMCTwo", 1, {_x: ox, _y: _loc4});
            } // end if
            this.SET_DO_NOW_HEADERS("Bug Number", "Summary", "Days Open");
            this.DISPLAY_VIEW(1);
            this.RESIZE_BACKGROUND(1);
            this.FOCUS_VIEW(1);
            (com.rockstargames.ui.loadingScreens.DoNowMenuItem)(model.getCurrentView().itemList[0]).__set__highlighted(true);
        }
        else
        {
            _loc3 = model.getCurrentView(1).__get__maxitems();
            _loc2 = 20;
            if (_loc3 > _loc2)
            {
                _loc3 = _loc2;
            } // end if
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
        } // end else if
        this.GOTO_STATE(0);
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
        model.addDataToView(1, _slotIndex, _loc3);
    } // End of the function
    function UPDATE_DATA_SLOT(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        model.updateSlot(1, _slotIndex, _loc3);
    } // End of the function
    function RESIZE_BACKGROUND(_viewIndex)
    {
        var _loc2 = model.getCurrentView(_viewIndex).viewContainer._height + oy;
        if (model.getCurrentView().__get__maxitems() > displayableItems)
        {
            if (scrollBar == undefined)
            {
                scrollbarContainer = CONTENT.attachMovie("scrollbarContainer", "scrollbarContainer", CONTENT.getNextHighestDepth());
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
                if (currentState == 0 || currentState == 1)
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
                if (currentState == 0 || currentState == 1)
                {
                    model.nextItem();
                }
                else
                {
                    if (currentImagePosition > STATES.length - 1)
                    {
                        currentImagePosition = STATES.length - 1;
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
            case com.rockstargames.ui.game.GamePadConstants.DPADLEFT:
            {
                ++currentState;
                if (currentState > STATES.length - 1)
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
                    currentState = STATES.length;
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
            scrollBar._visible = false;
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
            var _loc5 = STATES[0];
            var _loc3 = STATES[1];
            for (var _loc2 = 0; _loc2 < STATES.length; ++_loc2)
            {
                STATES[_loc2]._visible = false;
            } // end of for
            _loc3._y = yPossitions[0];
            _loc3._y = yPossitions[0];
            currentImagePosition = 1;
            if (currentState == 3)
            {
                currentImagePosition = 2;
            } // end if
            (MovieClip)(STATES[currentState]).report._y = percentageOffset;
            (MovieClip)(STATES[currentState])._visible = true;
            if (currentState == 1)
            {
                this.FOCUS_VIEW(currentState);
                this.RESIZE_BACKGROUND(currentState);
                (com.rockstargames.ui.loadingScreens.LoadScreenMenuItem)(model.getCurrentView().__set__index(0));
                (com.rockstargames.ui.loadingScreens.LoadScreenMenuItem)(model.getCurrentView().itemList[0]).__set__highlighted(true);
                scrollBar._visible = true;
            } // end if
            if (currentState == 0)
            {
                this.FOCUS_VIEW(currentState);
                this.RESIZE_BACKGROUND(currentState);
                (com.rockstargames.ui.loadingScreens.DoNowMenuItem)(model.getCurrentView().__set__index(0));
                (com.rockstargames.ui.loadingScreens.DoNowMenuItem)(model.getCurrentView().itemList[0]).__set__highlighted(true);
                scrollBar._visible = true;
            } // end if
            this.SET_TIMER();
        } // end if
    } // End of the function
    function SET_TIMER(duration)
    {
        if (duration == undefined)
        {
            duration = DEFAULT_DURATION;
        } // end if
        if (currentState == 0)
        {
            duration = DO_NOW_DURATION;
        }
        else
        {
            duration = DEFAULT_DURATION;
        } // end else if
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
        this.ADD_DO_NOW_ROW(0, -99, "Summary goes in here", 50);
        this.ADD_DO_NOW_ROW(1, 1234567, "Summary goes in here", 51);
        this.ADD_DO_NOW_ROW(2, 1234567, "Summary goes in here", 52);
        this.ADD_DO_NOW_ROW(3, 1234567, "Summary goes in here", 53);
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
        this.DRAW_MENU_LIST(1);
        CONTENT.object = this;
        CONTENT.onEnterFrame = function ()
        {
            object.getKeys();
        };
    } // End of the function
    function ADD_DO_NOW_ROW(_slotIndex)
    {
        var _loc3 = arguments.slice(1);
        if (_slotIndex == 0)
        {
            var _loc4 = _loc3[1];
            MAX_BUGS = _loc4;
        } // end if
        _loc3.push(MAX_BUGS);
        model.addDataToView(0, _slotIndex, _loc3);
    } // End of the function
    function SET_DO_NOW_HEADERS()
    {
        var _loc3 = arguments.slice(0);
        if (_loc3[0] != undefined)
        {
            headingsTwo.numberTF.text = _loc3[0];
        } // end if
        if (_loc3[1] != undefined)
        {
            headingsTwo.summaryTF.text = _loc3[1];
        } // end if
        if (_loc3[2] != undefined)
        {
            headingsTwo.daysOpenTF.text = _loc3[2];
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
    var DEFAULT_DURATION = 15;
    var DO_NOW_DURATION = 40;
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
