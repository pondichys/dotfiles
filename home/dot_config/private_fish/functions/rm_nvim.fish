# Function to cleanup nvim related directories when wanting to try new configs
function rm_nvim
    set nvim_dirs $HOME/.config/nvim $HOME/.local/share/nvim $HOME/.local/state/nvim $HOME/.cache/nvim
    for dir in $nvim_dirs
        echo "Removing $dir"
        rm -rf $dir
    end
    echo "All nvim directories cleaned up!"
end
