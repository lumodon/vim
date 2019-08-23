1. To start the transition, create your |init.vim| (user config) file:
```
    :call mkdir(stdpath('config'), 'p')  
    :exe 'edit '.stdpath('config').'/init.vim'  
```
2. Add these contents to the file:
```
    set runtimepath^=~/.vim runtimepath+=~/.vim/after  
    let &packpath = &runtimepath  
    source ~/.vimrc  
```
3. Restart Nvim, your existing Vim config will be loaded.

4. Install
```
    :PlugInstall  
``` 
5. Clean and Install again
```
    :PlugClean  
    :PlugInstall  
```
