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

    # Catppuccin Mocha inspired (pwndbg optimized)
    background_color = "#1e1e2e"  # Base
    highlight_color = "#313244"   # Surface0

    styles = {
        # Text
        Token:                      "#cdd6f4",
        Whitespace:                 "",
        Other:                      "#cdd6f4",

        # Errors
        Error:                      "#f38ba8 bg:#1e1e2e",

        # Comments
        Comment:                    "#6c7086 italic",
        Comment.Multiline:          "#7f849c",
        Comment.Preproc:            "#eba0ac",
        Comment.Single:             "#6c7086",
        Comment.Special:            "#74c7ec",

        # Keywords
        Keyword:                    "#cba6f7",
        Keyword.Constant:           "#fab387",
        Keyword.Declaration:        "#b4befe",
        Keyword.Namespace:          "#f38ba8",
        Keyword.Pseudo:             "#f5c2e7",
        Keyword.Reserved:           "#94e2d5",
        Keyword.Type:               "#f5e0dc",

        # Operators
        Operator:                   "#89dceb",
        Operator.Word:              "#cba6f7",

        # Punctuation
        Punctuation:                "#bac2de",

        # Names
        Name:                       "#cdd6f4",

        Name.Attribute:             "#a6e3a1",
        Name.Builtin:               "#f9e2af",
        Name.Builtin.Pseudo:        "#e5c890",

        Name.Class:                 "#ffd580",
        Name.Constant:              "#fab387",

        Name.Decorator:             "#f5c2e7",
        Name.Entity:                "#f5e0dc",

        Name.Exception:             "#eba0ac",
        Name.Function:              "#a6e3a1",

        Name.Label:                 "#f38ba8",
        Name.Namespace:             "#cba6f7",

        Name.Other:                 "#b4befe",
        Name.Property:              "#89dceb",

        Name.Tag:                   "#f38ba8",

        Name.Variable:              "#cdd6f4",
        Name.Variable.Class:        "#f9e2af",
        Name.Variable.Global:       "#fab387",
        Name.Variable.Instance:     "#a6adc8",

        # Numbers
        Number:                     "#fab387",
        Number.Float:               "#f2cdcd",
        Number.Hex:                 "#eba0ac",
        Number.Integer:             "#f9e2af",
        Number.Integer.Long:        "#ffd580",
        Number.Oct:                 "#f5e0dc",

        # Literals
        Literal:                    "#f2cdcd",
        Literal.Date:               "#f5c2e7",

        # Strings
        String:                     "#94e2d5",
        String.Backtick:            "#a6e3a1",
        String.Char:                "#8bd5ca",
        String.Doc:                 "#585b70",
        String.Double:              "#94e2d5",
        String.Escape:              "#f5c2e7",
        String.Heredoc:             "#89dceb",
        String.Interpol:            "#f5c2e7",
        String.Other:               "#94e2d5",
        String.Regex:               "#eba0ac",
        String.Single:              "#94e2d5",
        String.Symbol:              "#fab387",

        # Generic output
        Generic:                    "",
        Generic.Deleted:            "#f38ba8",
        Generic.Emph:               "italic",
        Generic.Error:              "#eba0ac",
        Generic.Heading:            "#cba6f7",
        Generic.Inserted:           "#a6e3a1",
        Generic.Output:             "#89dceb",
        Generic.Prompt:             "bold #cba6f7",
        Generic.Strong:             "bold",
        Generic.EmphStrong:         "bold italic",
        Generic.Subheading:         "#cba6f7",
        Generic.Traceback:          "#f38ba8",
    }

```
