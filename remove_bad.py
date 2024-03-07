BAD = ["clts", "hlt", "lmsw", "ltr", "lgdt", "lidt", "lldt", "mov cr", "mov dr",
       "mov tr", "in ", "ins", "invlpg", "invd", "out", "outs", "cli", "sti",
       "popf", "pushf", "int", "iret", "iretd", "swapgs", "wbinvd", "call",
       "jmp", "leave", "ja", "jb", "jc", "je", "jr", "jg", "jl", "jn", "jo",
       "jp", "js", "jz", "lock", "enter", "wait", "???"]

def is_line_bad(line):
    for bad_word in BAD:
        if bad_word in line:
            return True
    return False

def filter_file(input_file, output_file):
    with open(input_file, 'r') as f_in, open(output_file, 'w') as f_out:
        for line in f_in:
            if not is_line_bad(line):
                f_out.write(line)

if __name__ == "__main__":
    input_file = input("Enter input file name: ")
    output_file = input("Enter output file name: ")
    filter_file(input_file, output_file)
    
