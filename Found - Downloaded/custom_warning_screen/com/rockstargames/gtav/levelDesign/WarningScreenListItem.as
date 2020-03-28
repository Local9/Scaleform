class com.rockstargames.gtav.levelDesign.WarningScreenListItem extends MovieClip
{
    var ListItemTextTF, BackgroundMC;
    function WarningScreenListItem()
    {
        super();
        ListItemTextTF._visible = false;
        BackgroundMC._visible = false;
        this.INITIALISE();
    } // End of the function
    function INITIALISE(mc)
    {
        super.INITIALISE(mc);
    } // End of the function
    function getActive()
    {
        return (BackgroundMC._visible);
    } // End of the function
    function setActive(_bActive)
    {
        BackgroundMC._visible = _bActive;
        ListItemTextTF.textColor = _bActive ? (4278190080.000000) : (4294967295.000000);
    } // End of the function
    function setText(_text)
    {
        ListItemTextTF.text = _text;
        ListItemTextTF._visible = true;
        ListItemTextTF.textColor = 4294967295.000000;
    } // End of the function
    function getText()
    {
        return (ListItemTextTF.text);
    } // End of the function
    function getEnabled()
    {
        return (ListItemTextTF._visible);
    } // End of the function
    function reset()
    {
        ListItemTextTF.text = "";
        ListItemTextTF._visible = false;
        BackgroundMC._visible = false;
    } // End of the function
    function debug()
    {
        this.setText("TEST OPTION");
        this.setActive(false);
    } // End of the function
} // End of Class
