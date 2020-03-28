// Action script...

// [Action in Frame 1]
play ();
var dateStr;
var latlongStr;

// [Action in Frame 49]
dateStr = dateTF.text;
latlongStr = latlongTF.text;

// [Action in Frame 68]
dateTF.text = dateStr;
latlongTF.text = latlongStr;

// [Action in Frame 107]
stop ();
infoMC._visible = dateTF._visible = latlongTF._visible = botMarginMC._visible = topMarginMC._visible = _root.DocumentClass.isWideScreen;
