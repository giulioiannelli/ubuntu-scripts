# Default directory where the symbolic links will be created
DEFAULT_BIN_DIR := $(HOME)/.local/bin

# Allow the user to specify BIN_DIR, or fall back to the default
BIN_DIR ?= $(DEFAULT_BIN_DIR)

# List of scripts to link
SCRIPTS := $(wildcard *.sh)

# Default target: create symbolic links
all: install

# Install target: create the bin directory (if needed) and symlink scripts
install: check_dir
	@echo "Ensuring scripts are executable..."
	@for script in $(SCRIPTS); do \
		chmod +x $$script; \
	done
	@echo "Linking scripts to $(BIN_DIR)..."
	@for script in $(SCRIPTS); do \
		ln -sf $(CURDIR)/$$script $(BIN_DIR)/$$(basename $$script .sh); \
	done

# Check if the directory exists, or create it
check_dir:
	@if [ ! -d $(BIN_DIR) ]; then \
		echo "Directory $(BIN_DIR) does not exist. Creating it..."; \
		mkdir -p $(BIN_DIR); \
	else \
		echo "Directory $(BIN_DIR) already exists."; \
	fi

# Clean target: remove symbolic links
clean:
	@echo "Removing symbolic links from $(BIN_DIR)..."
	@for script in $(SCRIPTS); do \
		rm -f $(BIN_DIR)/$$(basename $$script .sh); \
	done

.PHONY: all install clean check_dir
