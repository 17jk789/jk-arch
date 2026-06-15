function create-cpp-pro --argument-names action name
    if test "$action" != "new"; or test -z "$name"
        echo "Usage: create-cpp-pro new <project-name>"
        return 1
    end

    set PROJECT_DIR (pwd)/$name

    if test -d "$PROJECT_DIR"
        echo “❌ Error: $PROJECT_DIR already exists!”
        return 1
    end

    mkdir -p "$PROJECT_DIR/src" "$PROJECT_DIR/include" "$PROJECT_DIR/build"
    cd "$PROJECT_DIR"

    printf '#include <iostream>\n\nint main() {\n    std::cout << "Hello C++ from Julian!" << std::endl;\n    return 0;\n}\n' > src/main.cpp

    printf 'cmake_minimum_required(VERSION 3.10)
project(%s VERSION 1.0 LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# Die Binary heißt IMMER app
add_executable(app src/main.cpp)
target_include_directories(app PUBLIC include)' "$name" > CMakeLists.txt

    cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug
    cmake --build build

    ln -s build/compile_commands.json .

    # printf "---\nLanguage: Cpp\nBasedOnStyle: Google\nIndentWidth: 4\nTabWidth: 4\nUseTab: Never\n..." > .clang-format
    printf "Language: Cpp\nBasedOnStyle: Google\nIndentWidth: 4\nTabWidth: 4\nUseTab: Never\n" > .clang-format

    git init -q
    printf "build/\n.cache/\ncompile_commands.json\n*.o\napp\n" > .gitignore

    echo ""
    echo “✅ C++ project '$name' ready!”
    echo “Binary: $PROJECT_DIR/build/app”
end
