import binascii
import sys

def ascii_to_hex_le(string):
    hex_string = binascii.hexlify(string.encode()).decode()
    # Convert to little-endian by reversing the byte order
    hex_le = ''.join(reversed([hex_string[i:i+2] for i in range(0, len(hex_string), 2)]))
    # Insert "0x" before each pair of hex characters and format output
    formatted_hex = ["0x" + hex_le[i:i+8] for i in range(0, len(hex_le), 8)]
    return '\n'.join(formatted_hex)

if len(sys.argv) < 2:
    print("Usage: python hex.py <input_string>")
    sys.exit(1)

input_string = ' '.join(sys.argv[1:])
output_hex = ascii_to_hex_le(input_string)
print(output_hex)

