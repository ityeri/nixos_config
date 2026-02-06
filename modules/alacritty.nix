{ ... }: {
    programs.alacritty = {
        enable = true;
        settings = {
            env.TERM = "alacritty";
            font = {
                size = 10;
                bold = {
                    family = "MonaspiceKr Nerd Font";
                    style = "Bold";
                };
                italic = {
                    family = "MonaspiceKr Nerd Font";
                    style = "Italic";
                };
                bold_italic = {
                    family = "MonaspiceKr Nerd Font";
                    style = "BoldItalic";
                };
                normal = {
                    family = "MonaspiceKr Nerd Font";
                    style = "Regular";
                };
            };
            window = {
                opacity = 1.0;
                padding.x = 10;
                padding.y = 10;
            };
            scrolling.multiplier = 5;
            selection.save_to_clipboard = true;
            colors.primary.background = "#040404";
        };
    };
}
