# Directory where the symbolic links will be created
BIN_DIR := $(HOME)/.local/bin

# List of scripts to link
SCRIPTS := $(wildcard *.sh)

# Default target: create symbolic links
all: install

# Install target: create the bin directory and symlink scripts
install: $(BIN_DIR)
	@echo "Linking scripts to $(BIN_DIR)..."
	@for script in $(SCRIPTS); do \
		ln -sf $(CURDIR)/$$script $(BIN_DIR)/$$(basename $$script .sh); \
	done

# Create the bin directory if it doesn't exist
$(BIN_DIR):
	@mkdir -p $(BIN_DIR)

# Clean target: remove symbolic links
clean:
	@echo "Removing symbolic links from $(BIN_DIR)..."
	@for script in $(SCRIPTS); do \
		rm -f $(BIN_DIR)/$$(basename $$script .sh); \
	done

.PHONY: all install clean
