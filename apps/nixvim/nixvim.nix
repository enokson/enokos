{inputs, ... }: { pkgs, lib, config, ... } : {
  imports = [inputs.nixvim.nixosModules.nixvim];
  config = {
    programs.nixvim = {
      enable = true;
      #colorschemes.gruvbox.enable = true;
      extraConfigLua = builtins.readFile ./init.lua;
      keymaps = [
        #-- Normal --
        #-- Better window navigation
        { key = "<C-h>"; mode = "n"; action = "<C-w>h"; }
        { key = "<C-j>"; mode = "n"; action = "<C-w>j"; }
        { key = "<C-k>"; mode = "n"; action = "<C-w>k"; }
        { key = "<C-l>"; mode = "n"; action = "<C-w>l"; }

        #-- Resize with arrows
        { key = "<C-Up>"; mode = "n"; action = ":resize -2<CR>"; }
        { key = "<C-Down>"; mode = "n"; action = ":resize +2<CR>"; }
        { key = "<C-Left>"; mode = "n"; action = ":vertical resize -2<CR>"; }
        { key = "<C-Right>"; mode = "n"; action = ":vertical resize +2<CR>"; }

        #-- Naviagate buffers
        { key = "<S-l>"; mode = "n"; options = {}; action = ":bnext<CR>"; }
        { key = "<S-h>"; mode = "n"; options = {}; action = ":bprevious<CR>"; }

        #-- Move text up and down
        { key = "<A-j>"; mode = "n"; options = { silent = true; }; action = "<Esc>:m .+1<CR>==gi"; }
        { key = "<A-k>"; mode = "n"; options = { silent = true; }; action = "<Esc>:m .+1<CR>==gi"; }

        #-- Insert --
        #-- Press jk fast to enter
        { key = "jk"; mode = "i"; options = {}; action = "<ESC>"; }
        
        #-- Visual --
        #-- Stay in indent mode
        { key = "<"; mode = "v"; action = "<gv"; }
        { key = ">"; mode = "v"; action = ">gv"; }
        
        #-- Move text up and down
        { key = "<A-j>"; mode = "v"; action = ":m .+1<CR>=="; options = { silent = true; }; }
        { key = "<A-k>"; mode = "v"; action = ":m .-2<CR>=="; options = { silent = true; }; }
        
        #-- Visual Block --
        #-- Move text up and down
        { key = "J"; mode = "x"; action = ":move '>+1<CR>gv-gv"; }
        { key = "K"; mode = "x"; action = ":move '<-2<CR>gv-gv"; }
        { key = "<A-j>"; mode = "x"; action = ":move '>+1<CR>gv-gv"; }
        { key = "<A-k>"; mode = "x"; action = ":move '<-2<CR>gv-gv"; }

        #-- Terminal --
        #-- Better terminal navigation
        { mode = "t"; key = "<C-h>"; action = "<C-\\><C-N><C-w>h"; }
        { mode = "t"; key = "<C-j>"; action = "<C-\\><C-N><C-w>j"; }
        { mode = "t"; key = "<C-k>"; action = "<C-\\><C-N><C-w>k"; }
        { mode = "t"; key = "<C-l>"; action = "<C-\\><C-N><C-w>l"; }
        #-- Floaterm --
        { mode = "n"; key = "<A-t>"; action = ":FloatermToggle<CR>"; options = { desc = "Open Floaterm"; }; }
        { mode = "t"; key = "<A-t>"; action = ":FloatermToggle<CR>"; options = { desc = "Open Floaterm"; }; }
        # { mode = "n"; key = "<leader>ft"; action = ":FloatermNew<CR>"; }

        #-- set oil to open in floating mode
        { mode = "n"; key = "<A-f>"; action = ":Oil --float .<CR>"; options = { desc = "Open oil in float mode"; silent = true; }; }
      ];
      plugins = {
        barbecue.enable = true;
        bufferline.enable = false;
        cmp = {
          enable = true;
          settings = {
            mapping = {
            __raw = ''
              cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
              })'';
            };
            sources = [
              { name = "buffer"; }
              { name = "omni"; option = { disable_omnifuncs = [ "v:lua.vim.lsp.omnifunc" ]; }; }
              { name = "path"; }
              { name = "nvim_lsp"; }
            ];
          };
        };
        cmp-buffer.enable = true;
        cmp-omni.enable = true;
        cmp-nvim-lsp.enable = true;
        cmp-nvim-lsp-document-symbol.enable = true;
        cmp-nvim-lsp-signature-help.enable = true;
        cmp-path.enable = true;
        comment.enable = true;
        flash.enable = true;
        floaterm.enable = true;
        gitsigns.enable = true;
        glow.enable = true;
        harpoon.enable = true;
        indent-blankline.enable = true;
        ledger = {
          enable = true;
          settings = {
            alignCommodity = true;
            fillstring = ".";
            fuzzy_account_completion = true;
          };
        };
        lsp.enable = true;
        lsp.servers.rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          settings = {
            cargo = {
              loadOutDirsFromCheck = true;
            };
            procMacro = {
              enable = true;
            };
            completion = {
              autoimport.enable = true;
              autoself.enable = true;
              diagnostics.enable = true;
              fullFunctionSignatures.enable = true;
              postfix.enable = true;
              termSearch.enable = true;

            };
          };
        };
        lualine.enable = true;
        mini.enable = true;
        neogit.enable = true;
        /* neo-tree = {
          enable = true;
          enableGitStatus = true;
          enableModifiedMarkers = true;
          enableRefreshOnWrite = true;
          filesystem.filteredItems = {
            hideDotfiles = false;
            hideGitignored = false;
            visible = true;
          };
        }; */
        nix.enable = true;
        nix-develop.enable = true;
        noice.enable = true;
        notify.enable = true;
        nvim-autopairs.enable = true;
        oil = {
          enable = true;
          settings = {
            view_options = {
              show_hidden = true;
            };
          };
        };
        sleuth.enable = true;
        vim-surround.enable = true;
        telescope.enable = true;
        treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            ensure_installed = [ "markdown" "markdown_inline" ];
          };
        };
        todo-comments = {
          enable = true;
          settings = {
            keywords = {
              STUCK = { icon = " "; color = "test"; alt = [ "BLOCK" ]; };
            };
          };
        };
        toggleterm = {
          enable = true;
          settings.open_mapping = "[[<c-t>]]";
        };
        twilight.enable = true;
        web-devicons.enable = true;
        which-key.enable = true;
        zen-mode.enable = true;
      };
      extraPlugins = with pkgs; [
        vimPlugins.nvim-window-picker
        vimPlugins.render-markdown-nvim
        vimPlugins.nvim-treesitter-parsers.just
        vimPlugins.vim-prisma
        vimPlugins.nvim-web-devicons
      ];
    };
  };
}
