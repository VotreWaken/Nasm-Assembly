# Makefile for assembling and linking NASM assembly code

# Define the target (the final executable)
TARGET = FlagJc

# Define the source file (NASM assembly code)
SOURCE = FlagJc.asm

# Default rule: Build the target executable
all: $(TARGET)

# Rule to build the target executable
$(TARGET): $(SOURCE)
	nasm -f elf64 $(SOURCE) -o $(TARGET).o
	ld -o $(TARGET) $(TARGET).o

# Rule to clean up intermediate files and the executable
clean:
	rm -f $(TARGET) $(TARGET).o

# Rule to run the executable
run: $(TARGET)
	./$(TARGET)

