function activate --description "Activate a venv if it exists"
    if [ -e .venv/bin/activate.fish ];
        source .venv/bin/activate.fish
    end
end
