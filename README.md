# ubuntu-scripts
## installation
In order to install clone the git repo into your desired location (e.g. into `~/.local/scripts`) 
```
git clone https://github.com/giulioiannelli/ubuntu-scripts.git ~/.local/scripts
```
Then `cd` into the scripts directory and run the `Makefile`
```
cd ~/.local/scripts
make
```
### symbolic links
This will also create all symbolic links into the default `BIN_DIR` path, i.e. `~/.local/bin`. 
If the directory does not exists it will be created, but be sure that it is included in the `PATH`
environmental variable, otherwise it will not be possible to run scripts from terminal. To change
the default location simply run `make` with `BIN_DIR` set at will
```
make BIN_DIR=/my/fancy/path
```
