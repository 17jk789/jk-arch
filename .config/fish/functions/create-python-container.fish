function create-python-container --argument-names action name

    if test "$action" != "new"
        echo "Usage:"
        echo "  create-python-container new <projektname>"
        return 1
    end

    if test -z "$name"
        echo "❌ Please provide a project name."
        return 1
    end

    set PROJECT_DIR (pwd)/$name
    set IMAGE_NAME "python-secure-dev"
    set CONTAINER_NAME "$name"

    if test -d "$PROJECT_DIR"
        echo "❌ Folder '$name' already exists!"
        return 1
    end

    mkdir -p \
        "$PROJECT_DIR/src" \
        "$PROJECT_DIR/tests" \
        "$PROJECT_DIR/data" \
        "$PROJECT_DIR/logs"

    cd "$PROJECT_DIR"

    touch \
        main.py \
        README.md \
        requirements.txt \
        .gitignore

    echo "venv/" >> .gitignore
    echo "__pycache__/" >> .gitignore
    echo "*.pyc" >> .gitignore
    echo ".env" >> .gitignore

    echo 'print("🔥 Secure Python Container Ready!")' > main.py

    cat > Dockerfile << EOF
FROM python:3.12-alpine

RUN apk add --no-cache \
    fish \
    git \
    curl \
    bash

# Create non-root user
RUN adduser -D developer

USER developer

WORKDIR /workspace

ENV PATH="/workspace/venv/bin:\$PATH"

CMD ["fish"]
EOF

    echo "🐳 Building secure Docker image..."

    docker build -t $IMAGE_NAME .

    if test $status -ne 0
        echo "❌ Docker build failed!"
        return 1
    end

    echo "🚀 Starting secure container..."

    docker run -dit \
        --name $CONTAINER_NAME \
        --hostname $name \
        --security-opt=no-new-privileges:true \
        --cap-drop=ALL \
        --memory="2g" \
        --cpus="2" \
        -v "$PROJECT_DIR":/workspace \
        -w /workspace \
        $IMAGE_NAME

    if test $status -ne 0
        echo "❌ Failed to start container!"
        return 1
    end

    docker exec $CONTAINER_NAME python -m venv /workspace/venv

    docker exec $CONTAINER_NAME fish -c "
        source /workspace/venv/bin/activate.fish;
        pip install --upgrade pip;
        pip install bandit black pytest requests;
    "

    echo ""
    echo "✅ Secure Python project created!"
    echo ""
    echo "📁 Project: $name"
    echo "🐳 Container: $CONTAINER_NAME"
    echo ""
    echo "👉 Enter container with:"
    echo "   docker exec -it $CONTAINER_NAME fish"
    echo ""
    echo "👉 Activate venv:"
    echo "   source venv/bin/activate.fish"
    echo ""
    echo "🛑 Stop container:"
    echo "   docker stop $CONTAINER_NAME"
    echo ""
    echo "🔥 Done!"
end
