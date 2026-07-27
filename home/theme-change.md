Führe: 

```bash
sudo nvim $(python -c "import pygments.styles._mapping as m; print(m.__file__)")
```

aus und füge:

```python
'CatppuccinMochaStyle': ('pygments.styles.catppuccin_mocha', 'catppuccin_mocha', ()),
```

hinzu, dann:

```bash
sudo nvim /usr/lib/python3.14/site-packages/pygments/styles/catppuccin_mocha.py 
```

und dann:

```python
from pygments.style import Style
from pygments.token import (
    Keyword, Name, Comment, String, Error, Token,
    Number, Operator, Generic, Whitespace,
    Punctuation, Other, Literal
)

__all__ = ['CatppuccinMochaStyle']


class CatppuccinMochaStyle(Style):
    name = 'catppuccin_mocha'

    # Catppuccin Mocha
    background_color = "#1e1e2e"  # Base
    highlight_color = "#313244"   # Surface0

    styles = {
        # Text
        Token:                      "#cdd6f4",  # Text
        Whitespace:                 "",
        Other:                      "#cdd6f4",

        # Errors
        Error:                      "#f38ba8 bg:#1e1e2e",  # Red

        # Comments
        Comment:                    "#6c7086 italic",  # Overlay0
        Comment.Multiline:          "#6c7086",
        Comment.Preproc:            "#f38ba8",
        Comment.Single:             "#6c7086",
        Comment.Special:            "#89b4fa",  # Blue

        # Keywords
        Keyword:                    "#cba6f7",  # Mauve
        Keyword.Constant:           "#fab387",  # Peach
        Keyword.Declaration:        "#cba6f7",
        Keyword.Namespace:          "#f38ba8",  # Red
        Keyword.Pseudo:             "#cba6f7",
        Keyword.Reserved:           "#cba6f7",
        Keyword.Type:               "#89b4fa",  # Blue

        # Operators
        Operator:                   "#94e2d5",  # Teal
        Operator.Word:              "#cba6f7",

        # Punctuation
        Punctuation:                "#bac2de",  # Subtext1

        # Names
        Name:                       "#cdd6f4",

        Name.Attribute:             "#a6e3a1",  # Green
        Name.Builtin:               "#89b4fa",  # Blue
        Name.Builtin.Pseudo:        "#89b4fa",

        Name.Class:                 "#f9e2af",  # Yellow
        Name.Constant:              "#fab387",  # Peach

        Name.Decorator:             "#f5c2e7",  # Pink
        Name.Entity:                "#f5e0dc",  # Rosewater

        Name.Exception:             "#f38ba8",  # Red
        Name.Function:              "#89b4fa",  # Blue

        Name.Label:                 "#f38ba8",
        Name.Namespace:             "#89b4fa",

        Name.Other:                 "#cdd6f4",
        Name.Property:              "#89dceb",  # Sky

        Name.Tag:                   "#f38ba8",

        Name.Variable:              "#cdd6f4",
        Name.Variable.Class:        "#f9e2af",
        Name.Variable.Global:       "#f9e2af",
        Name.Variable.Instance:     "#cdd6f4",

        # Numbers
        Number:                     "#fab387",
        Number.Float:               "#fab387",
        Number.Hex:                 "#fab387",
        Number.Integer:             "#fab387",
        Number.Integer.Long:        "#fab387",
        Number.Oct:                 "#fab387",

        # Literals
        Literal:                    "#fab387",
        Literal.Date:               "#f5c2e7",

        # Strings
        String:                     "#a6e3a1",  # Green
        String.Backtick:            "#a6e3a1",
        String.Char:                "#a6e3a1",
        String.Doc:                 "#6c7086",
        String.Double:              "#a6e3a1",
        String.Escape:              "#f5c2e7",
        String.Heredoc:             "#a6e3a1",
        String.Interpol:            "#f5c2e7",
        String.Other:               "#a6e3a1",
        String.Regex:               "#f38ba8",
        String.Single:              "#a6e3a1",
        String.Symbol:              "#fab387",

        # Generic output
        Generic:                    "",
        Generic.Deleted:            "#f38ba8",
        Generic.Emph:               "italic",
        Generic.Error:              "#f38ba8",
        Generic.Heading:            "#89b4fa",
        Generic.Inserted:           "#a6e3a1",
        Generic.Output:             "#94e2d5",
        Generic.Prompt:             "bold #cba6f7",
        Generic.Strong:             "bold",
        Generic.EmphStrong:         "bold italic",
        Generic.Subheading:         "#89b4fa",
        Generic.Traceback:          "#f38ba8",
    }
```
