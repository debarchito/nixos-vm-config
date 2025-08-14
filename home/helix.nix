{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "base16_transparent";
      editor = {
        bufferline = "multiple";
        color-modes = true;
        completion-replace = true;
        line-number = "relative";
        true-color = true;
        scroll-lines = 1;
        idle-timeout = 200;
        end-of-line-diagnostics = "hint";
        file-picker.hidden = false;
        statusline = {
          left = [
            "mode"
            "spacer"
            "version-control"
            "spacer"
            "file-name"
            "file-modification-indicator"
          ];
          right = [
            "spinner"
            "spacer"
            "workspace-diagnostics"
            "spacer"
            "diagnostics"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
        };
        cursor-shape.insert = "bar";
        indent-guides = {
          render = true;
          character = "╎";
        };
        soft-wrap = {
          enable = true;
          max-wrap = 10;
        };
        inline-diagnostics.cursor-line = "error";
      };
      keys = {
        normal = {
          esc = [
            "collapse_selection"
            "keep_primary_selection"
            ":w"
          ];
          g = {
            q = ":bc";
            Q = ":bc!";
          };
          C-y = [
            ":sh rm -f /tmp/unique-file"
            ":insert-output yazi \"%{buffer_name}\" --chooser-file=/tmp/unique-file"
            ":insert-output echo '\x1b[?1049h\x1b[?2004h' > /dev/tty"
            ":open %sh{cat /tmp/unique-file}"
            ":redraw"
            ":set mouse false"
            ":set mouse true"
          ];
          A-j = [
            "extend_to_line_bounds"
            "delete_selection"
            "paste_after"
          ];
          A-k = [
            "extend_to_line_bounds"
            "delete_selection"
            "move_line_up"
            "paste_before"
          ];
        };
        insert.C-space = "completion";
      };
    };
  };
}
