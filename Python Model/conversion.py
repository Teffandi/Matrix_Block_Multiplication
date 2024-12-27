def to_q8_8_hex(number):
    """
    Convert a number into Q8.8 format and return the hexadecimal representation.
    
    Args:
        number (float): The input number to be converted.
        
    Returns:
        str: Hexadecimal representation of the Q8.8 fixed-point number.
    """
    # Scale the number by 2^8 (256)
    scaled_value = int(round(number * 256))
    
    # Ensure the value fits in 16-bit signed range (-32768 to 32767)
    if scaled_value < -32768 or scaled_value > 32767:
        raise ValueError(f"Number {number} is out of range for Q8.8 format.")
    
    # Convert to 16-bit signed integer representation
    if scaled_value < 0:
        scaled_value = (1 << 16) + scaled_value  # Two's complement for negative numbers
    
    # Convert to hexadecimal
    hex_value = hex(scaled_value)[2:].zfill(4).upper()  # Remove "0x" and pad to 4 characters
    return hex_value
