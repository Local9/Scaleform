// Action script...

// [Initial MovieClip Action of sprite 140]
#initclip 11
class com.rockstargames.ui.utils.BitMonger extends Number
{
    var _bitfield, __get__bitfield, __set__bitfield;
    function BitMonger(value)
    {
        super();
        _bitfield = value != undefined ? (value) : (0);
    } // End of the function
    static function BIT(value)
    {
        var _loc3 = 0;
        for (var _loc2 = 0; _loc2 < arguments.length; ++_loc2)
        {
            _loc3 = _loc3 | 1 << arguments[_loc2];
        } // end of for
        return (_loc3);
    } // End of the function
    static function SET_BIT(bitfield, bit)
    {
        bitfield = bitfield | com.rockstargames.ui.utils.BitMonger.BIT(bit);
        return (bitfield);
    } // End of the function
    static function CLEAR_BIT(bitfield, bit)
    {
        bitfield = bitfield & (com.rockstargames.ui.utils.BitMonger.BIT(bit) ^ 4294967295.000000);
        return (bitfield);
    } // End of the function
    static function IS_BIT_SET(bitfield, bit)
    {
        return ((bitfield & com.rockstargames.ui.utils.BitMonger.BIT(bit)) == com.rockstargames.ui.utils.BitMonger.BIT(bit));
    } // End of the function
    static function UNPACK_INT(bitfield, index, width)
    {
        var _loc1 = com.rockstargames.ui.utils.BitMonger.BIT(width) - 1;
        return (bitfield >> index & _loc1);
    } // End of the function
    static function PACK_INT(bitfield, index, width, value)
    {
        var _loc1 = com.rockstargames.ui.utils.BitMonger.BIT(width) - 1;
        bitfield = bitfield | (value & _loc1) << index;
        return (bitfield);
    } // End of the function
    function set bitfield(value)
    {
        _bitfield = value;
        //return (this.bitfield());
        null;
    } // End of the function
    function get bitfield()
    {
        return (_bitfield);
    } // End of the function
    function setBit(bit)
    {
        _bitfield = com.rockstargames.ui.utils.BitMonger.SET_BIT(_bitfield, bit);
    } // End of the function
    function clearBit(bit)
    {
        _bitfield = com.rockstargames.ui.utils.BitMonger.CLEAR_BIT(_bitfield, bit);
    } // End of the function
    function isBitSet(bit)
    {
        return (com.rockstargames.ui.utils.BitMonger.IS_BIT_SET(_bitfield, bit));
    } // End of the function
    function unpackInt(index, width)
    {
        return (com.rockstargames.ui.utils.BitMonger.UNPACK_INT(_bitfield, index, width));
    } // End of the function
    function packInt(index, width, value)
    {
        _bitfield = com.rockstargames.ui.utils.BitMonger.PACK_INT(_bitfield, index, width, value);
    } // End of the function
} // End of Class
#endinitclip
