function create-ss-pro --description 'Create a malware analysis environment with Python venv'
    if test (count $argv) -lt 2
        echo "Error: Please provide a command and folder name."
        echo "Usage: create-ss-pro new <project_name>"
        return 1
    end

    if test "$argv[1]" != new
        echo "Error: Unknown command '$argv[1]'."
        echo "Usage: create-ss-pro new <project_name>"
        return 1
    end

    set -l folder_name $argv[2]

    echo "Creating directory: $folder_name..."
    mkdir -p "$folder_name"; and cd "$folder_name"
    if test $status -ne 0
        echo "Error: Failed to create or enter directory."
        return 1
    end

    echo "Creating Python venv..."
    python -m venv venv
    if test $status -ne 0
        echo "Error: Failed to create venv."
        return 1
    end

    echo "Activating venv..."
    source venv/bin/activate.fish

    echo "Upgrading pip..."
    python -m pip install --upgrade pip

    echo "Installing analysis tools..."
    python -m pip install \
        angr \
        capstone \
        unicorn \
        keystone-engine \
        pefile \
        pwn \
        flare-floss \
        olefile \
        scapy \
        malduck \
        yara-python \
        flare-capa

    echo "Setup complete. Environment is active."
end
