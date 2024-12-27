def to_q8_8(value):
    """
    Convert a floating-point number to Q8.8 fixed-point format.
    
    Args:
        value (float): The number to convert.
    
    Returns:
        int: The number in Q8.8 format as a 16-bit signed integer.
    """
    if not (-128 <= value < 128):
        raise ValueError("Value out of range for Q8.8 format (-128 to 127.996).")
    
    # Multiply by 256 (2^8) and round to the nearest integer
    fixed_point = round(value * 256)
    
    # Ensure it's within the 16-bit signed integer range
    if not (-32768 <= fixed_point <= 32767):
        raise ValueError("Fixed-point value out of range for 16-bit signed integer.")
    
    return fixed_point


def from_q8_8(value):
    """
    Convert a Q8.8 fixed-point number back to floating-point format.
    
    Args:
        value (int): The Q8.8 fixed-point number.
    
    Returns:
        float: The floating-point representation.
    """
    if not (-32768 <= value <= 32767):
        raise ValueError("Value out of range for 16-bit signed integer.")
    
    # Divide by 256 (2^8) to get the floating-point value
    return value / 256


# Example usage
#float_number = 12.345
#q8_8_value = to_q8_8(float_number)
#print(f"Floating-point: {float_number} -> Q8.8: {q8_8_value}")

#converted_back = from_q8_8(q8_8_value)
#print(f"Q8.8: {q8_8_value} -> Floating-point: {converted_back}")