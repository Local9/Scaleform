// Action script...

// [Initial MovieClip Action of sprite 76]
#initclip 22
class com.rockstargames.gtav.cellphone.prologue.CallScreen_Prologue extends com.rockstargames.ui.core.PhoneUIComponent
{
    var header, container, offsetX, offsetY, linkageKey, content, dataProviderUI, __set__callState, __get__callState, TextBlackHex, _callState;
    function CallScreen_Prologue()
    {
        super();
    } // End of the function
    function construct(parentContainer, linkageID, params)
    {
        super.construct(parentContainer, linkageID, params);
        this.renderContainers();
    } // End of the function
    function renderContainers()
    {
        header._visible = false;
        if (container.content == undefined)
        {
            content = container.attachMovie(linkageKey, "content", container.getNextHighestDepth(), {_x: offsetX, _y: offsetY});
        } // end if
        this.populateContent();
    } // End of the function
    function populateContent()
    {
        this.__set__callState(dataProviderUI[0][0]);
        switch (this.__get__callState())
        {
            case com.rockstargames.gtav.cellphone.CallState.INITIAL_OUTGOING_CALL[0]:
            {
                content.gotoAndStop("INITIAL_OUTGOING_CALL");
                break;
            } 
            case com.rockstargames.gtav.cellphone.CallState.INITIAL_INCOMING_CALL[0]:
            {
                content.gotoAndStop("DEFAULT");
                break;
            } 
            case com.rockstargames.gtav.cellphone.CallState.ACTIVE_CALL[0]:
            {
                content.gotoAndStop("ACTIVE_CALL");
                content.fromAddress.textColor = TextBlackHex;
                break;
            } 
            case com.rockstargames.gtav.cellphone.CallState.ACTIVE_CALL_WAITING_FOR_RESPONSE[0]:
            {
                content.gotoAndStop("INITIAL_OUTGOING_CALL");
                break;
            } 
            case com.rockstargames.gtav.cellphone.CallState.ENGAGED_CALL[0]:
            {
                content.gotoAndStop("DEFAULT");
                content.fromAddress._alpha = offStateAlpha;
                content.fromAddress.textColor = TextBlackHex;
                content.jobTitle._alpha = offStateAlpha;
                break;
            } 
            case com.rockstargames.gtav.cellphone.CallState.ANSWERPHONE_CALL[0]:
            {
                content.gotoAndStop("ACTIVE_CALL");
                break;
            } 
        } // End of switch
        content.fromAddress._alpha = 100;
        content.jobTitle._alpha = 100;
        var _loc2 = dataProviderUI[0][1];
        var _loc3 = dataProviderUI[0][3];
        if (_loc2)
        {
            content.fromAddress.text = _loc2;
            content.fromAddress.textColor = TextBlackHex;
        } // end if
        if (_loc3)
        {
            content.jobTitle.text = _loc3;
            content.jobTitle.textColor = TextBlackHex;
        } // end if
    } // End of the function
    function get callState()
    {
        return (_callState);
    } // End of the function
    function set callState(newCallState)
    {
        _callState = newCallState;
        //return (this.callState());
        null;
    } // End of the function
    var isEngaged = false;
    var offStateAlpha = 60;
} // End of Class
#endinitclip
