function create-ss-pro --description 'Create a malware analysis environment with Python venv'
    if test (count $argv) -lt 1
        echo "Error: Please provide a folder name."
        echo "Usage: create-ss-pro project_name"
        return 1
    end

    set -l folder_name $argv[1]

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
    pip install --upgrade pip

    echo "Installing analysis tools..."
    pip install \
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
