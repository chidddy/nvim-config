<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Size][codesize-shield]][url]
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

# chiddy's neovim config

97 plugins with still a 9-10ms start time. my daily driver with [neovim-git]

:warning: **this is my personal config, any commit is breaking**

<!-- TODO: -->
<details>
  <summary>
    <strong>table of contents</strong>
    <small><i>(🔎 click to expand/collapse)</i></small>
  </summary>

* [features](#features)
<!-- * [Screenshot](#screenshot) -->
* [requirements](#requirements)
* [install](#install)
<!-- * [Install LSP, DAP, Linters, Formatters](#install-lsp-dap-linters-formatters) -->
<!--   * [Language-Server Protocol (LSP)](#language-server-protocol-lsp) -->
<!--   * [Recommended LSP](#recommended-lsp) -->
<!--   * [Recommended Linters](#recommended-linters) -->
<!--   * [Recommended Formatters](#recommended-formatters) -->
<!-- * [Recommended Fonts](#recommended-fonts) -->
<!-- * [Upgrade](#upgrade) -->
* [structure](#structure)
<!-- * [Extending](#extending) -->
<!--   * [Extend: Config](#extend-config) -->
<!--   * [Extend: Plugins](#extend-plugins) -->
<!--   * [Extend: Defaults](#extend-defaults) -->
<!--   * [Extend: LSP Settings](#extend-lsp-settings) -->
<!-- * [Plugin Highlights](#plugin-highlights) -->
* [plugins](#plugins)
  * [completion plugins](#cmp-plugins)
  * [debug plugins](#dap-plugins)
  * [editor plugins](#editor-plugins)
  * [filetypes](#filetypes-plugins)
  * [fun plugins](#fun-plugins)
  * [git plugins](#git-plugins)
  * [lsp plugins](#lsp-plugins)
  * [notes plugins](#notes-plugins)
  * [runners plugins](#runners-plugins)
  * [tests plugins](#tests-plugins)
  * [themes](#themes-plugins)
  * [treesitter plugins](#treesitter-plugins)
  * [ui plugins](#ui-plugins)
  * [utils plugins](#utils-plugins)
  * [visuals plugins](#visuals-plugins)
* [language servers](#language-servers)
<!-- * [keymaps](#keymaps) -->
<!--   * [Navigation](#navigation) -->
<!--   * [File Operations](#file-operations) -->
<!--   * [Auto-Completion](#auto-completion) -->
<!--   * [LSP](#lsp) -->
<!--   * [Edit](#edit) -->
<!--   * [Search & Replace](#search--replace) -->
<!--   * [Clipboard](#clipboard) -->
<!--   * [Command & History](#command--history) -->
<!--   * [Diagnostics](#diagnostics) -->
<!--   * [Editor UI](#editor-ui) -->
<!--   * [Custom Tools & Plugins](#custom-tools--plugins) -->
<!--   * [Window Management](#window-management) -->
<!--   * [Plugin: Mini.Surround](#plugin-minisurround) -->
<!--   * [Plugin: Gitsigns](#plugin-gitsigns) -->
<!--   * [Plugin: Telescope](#plugin-telescope) -->
<!--   * [Plugin: Neo-Tree](#plugin-neo-tree) -->
<!--   * [Plugin: Zk](#plugin-zk) -->
<!--   * [Plugin: Spectre](#plugin-spectre) -->
<!--   * [Plugin: Marks](#plugin-marks) -->
* [inspirations](#inspirations)
* [todos](#todos)
* [contact](#contact)

</details>

<!-- TODO: split into general/nav/coding -->
## features

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TODO: -->
## requirements

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TODO: -->
## install

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TODO: -->
## keybinds

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## structure

* [init.lua](./init.lua) -- entrypoint
* [lua/chiddy](./lua/chiddy) -- my lua config
  * [core/](./lua/chiddy/core) -- core neovim configs
    * [autocmd.lua](./lua/chiddy/core/autocmd.lua) -- auto-commands
    * [config.lua](./lua/chiddy/core/config.lua) -- **important:** user config
    * [lazy.lua](./lua/chiddy/core/lazy.lua) -- lazy plugin manager
    * [lsp.lua](./lua/chiddy/core/lsp.lua) -- nvim lsp/diag setups
    * [opts.lua](./lua/chiddy/core/opts.lua) -- nvim options
    * [keymaps/](./lua/chiddy/core/keymaps) -- non-lsp keymap defs
      * [wk.lua](./lua/chiddy/core/keymaps/wk.lua) -- which-key keymaps
      * [hydra.lua](./lua/chiddy/core/keymaps/hydra.lua) -- hydra keymaps
  * [dap/](./lua/chiddy/dap) -- debug configurations and setup
    * [adapters/](./lua/chiddy/dap/adapters) -- debug adapter defs
    * [configs/](./lua/chiddy/dap/configs) -- debug adapter configs
  * [external/](./lua/chiddy/external) -- external libraries (e.g stacktraceplus)
    * [profile/](./lua/chiddy/external/profile) -- [profile.nvim]
    * [hsluv.lua](./lua/chiddy/external/hsluv.lau) -- [hsluv]
    * [stacktraceplus.lua](./lua/chiddy/external/stacktraceplus.lau) -- [stacktraceplus]
  * [lsp/](./lua/chiddy/lsp) -- lsp config and setup
    * [servers/](./lua/chiddy/lsp/servers) -- per-server lsp config
    * [keymaps/](./lua/chiddy/lsp/keymaps) -- lsp-specific keymap defs
      * [wk.lua](./lua/chiddy/lsp/keymaps/wk.lua) -- which-key keymaps
      * [hydra.lua](./lua/chiddy/lsp/keymaps/hydra.lua) -- hydra keymaps
  * [plugins/](./lua/chiddy/plugins) -- plugins and their configs
    * [cmp/](./lua/chiddy/plugins/cmp) -- completion plugins
    * [dap/](./lua/chiddy/plugins/dap) -- debug plugins
    * [editor/](./lua/chiddy/plugins/editor) -- generic editor plugins (e.g pairs)
    * [filetypes/](./lua/chiddy/plugins/filetypes) -- custom filetype plugins
    * [fun/](./lua/chiddy/plugins/fun) -- fun non-productive plugins
    * [git/](./lua/chiddy/plugins/git) -- git integration plugins
    * [lsp/](./lua/chiddy/plugins/lsp) -- lsp related plugins
    * [notes/](./lua/chiddy/plugins/notes) -- notetaking/productivity plugins
    * [runners/](./lua/chiddy/plugins/runners) -- code-running plugins
    * [tests/](./lua/chiddy/plugins/tests) -- code-testing plugins
    * [themes/](./lua/chiddy/plugins/themes) -- colorschemes
    * [treesitter/](./lua/chiddy/plugins/treesitter) -- treesitter related plugins
    * [ui/](./lua/chiddy/plugins/ui) -- interface plugins (e.g statusline)
    * [utils/](./lua/chiddy/plugins/utils) -- utility plugins
    * [visuals/](./lua/chiddy/plugins/visuals) -- visual additions (e.g hlchunk)
  * [ui/](./lua/chiddy/ui) -- ui and themes
    * [colors.lua](./lua/chiddy/ui/colors.lua) -- color interface
    * [components/](./lua/chiddy/ui/components) -- building blocks for themes
    * [themes/](./lua/chiddy/ui/themes) -- themes
      * [basic/](./lua/chiddy/ui/themes/basic) -- my default theme
  <!-- TODO: cleanup -->
  * [utils/](./lua/chiddy/utils) -- utility funcs
    * [cmp.lua](./lua/chiddy/utils/api.lua) -- completion related util functions
    * [lsp.lua](./lua/chiddy/utils/api.lua) -- lsp on-attach etc
    * [dap.lua](./lua/chiddy/utils/api.lua) -- dap related util functions
    * [status.lua](./lua/chiddy/utils/api.lua) -- statusline related util funcs
    * [icons.lua](./lua/chiddy/utils/api.lua) -- all the icons used
    * [colors.lua](./lua/chiddy/utils/api.lua) -- color related utils
* [ftplugin/](./ftplugin) -- filetype plugins (currently only used for java lsp)
* [snippets/](./snippets) -- code snippets
* [templates/](./templates) -- file templates
* [types/](./types) -- personal lua types

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## plugins

### cmp plugins

* [ChatGPT.nvim](https://github.com/jackMort/ChatGPT.nvim) ![](https://img.shields.io/github/stars/jackMort/ChatGPT.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/jackMort/ChatGPT.nvim.svg?style=for-the-badge)
* [LuaSnip](https://github.com/L3MON4D3/LuaSnip) ![](https://img.shields.io/github/stars/L3MON4D3/LuaSnip.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/L3MON4D3/LuaSnip.svg?style=for-the-badge)
* [cheeky-snippets.nvim](https://github.com/madskjeldgaard/cheeky-snippets.nvim) ![](https://img.shields.io/github/stars/madskjeldgaard/cheeky-snippets.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/madskjeldgaard/cheeky-snippets.nvim.svg?style=for-the-badge)
* [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) ![](https://img.shields.io/github/stars/hrsh7th/cmp-buffer.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-buffer.svg?style=for-the-badge)
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) ![](https://img.shields.io/github/stars/hrsh7th/cmp-nvim-lsp.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-nvim-lsp.svg?style=for-the-badge)
* [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help) ![](https://img.shields.io/github/stars/hrsh7th/cmp-nvim-lsp-signature-help.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-nvim-lsp-signature-help.svg?style=for-the-badge)
* [cmp-path](https://github.com/hrsh7th/cmp-path) ![](https://img.shields.io/github/stars/hrsh7th/cmp-path.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/hrsh7th/cmp-path.svg?style=for-the-badge)
* [cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator) ![](https://img.shields.io/github/stars/lukas-reineke/cmp-under-comparator.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/lukas-reineke/cmp-under-comparator.svg?style=for-the-badge)
* [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) ![](https://img.shields.io/github/stars/saadparwaiz1/cmp_luasnip.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/saadparwaiz1/cmp_luasnip.svg?style=for-the-badge)
* [coq.artifacts](https://github.com/ms-jpq/coq.artifacts) ![](https://img.shields.io/github/stars/ms-jpq/coq.artifacts.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/ms-jpq/coq.artifacts.svg?style=for-the-badge)
* [coq.thirdparty](https://github.com/ms-jpq/coq.thirdparty) ![](https://img.shields.io/github/stars/ms-jpq/coq.thirdparty.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/ms-jpq/coq.thirdparty.svg?style=for-the-badge)
* [coq_nvim](https://github.com/ms-jpq/coq_nvim) ![](https://img.shields.io/github/stars/ms-jpq/coq_nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/ms-jpq/coq_nvim.svg?style=for-the-badge)
* [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) ![](https://img.shields.io/github/stars/rafamadriz/friendly-snippets.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/rafamadriz/friendly-snippets.svg?style=for-the-badge)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) ![](https://img.shields.io/github/stars/hrsh7th/nvim-cmp.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/hrsh7th/nvim-cmp.svg?style=for-the-badge)

### dap plugins

* [nvim-dap](https://github.com/mfussenegger/nvim-dap) ![](https://img.shields.io/github/stars/mfussenegger/nvim-dap.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/mfussenegger/nvim-dap.svg?style=for-the-badge)
* [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) ![](https://img.shields.io/github/stars/rcarriga/nvim-dap-ui.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/rcarriga/nvim-dap-ui.svg?style=for-the-badge)
* [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) ![](https://img.shields.io/github/stars/theHamsta/nvim-dap-virtual-text.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/theHamsta/nvim-dap-virtual-text.svg?style=for-the-badge)
* [telescope-dap.nvim](https://github.com/nvim-telescope/telescope-dap.nvim) ![](https://img.shields.io/github/stars/nvim-telescope/telescope-dap.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-telescope/telescope-dap.nvim.svg?style=for-the-badge)

### editor plugins

* [Comment.nvim](https://github.com/numToStr/Comment.nvim) ![](https://img.shields.io/github/stars/numToStr/Comment.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/numToStr/Comment.nvim.svg?style=for-the-badge)
* [dial.nvim](https://github.com/monaqa/dial.nvim) ![](https://img.shields.io/github/stars/monaqa/dial.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/monaqa/dial.nvim.svg?style=for-the-badge)
* [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) ![](https://img.shields.io/github/stars/smjonas/inc-rename.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/smjonas/inc-rename.nvim.svg?style=for-the-badge)
* [mini.move](https://github.com/echasnovski/mini.move) ![](https://img.shields.io/github/stars/echasnovski/mini.move.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/echasnovski/mini.move.svg?style=for-the-badge)
* [neogen](https://github.com/danymat/neogen) ![](https://img.shields.io/github/stars/danymat/neogen.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/danymat/neogen.svg?style=for-the-badge)
* [nvim-autopairs](https://github.com/windwp/nvim-autopairs) ![](https://img.shields.io/github/stars/windwp/nvim-autopairs.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/windwp/nvim-autopairs.svg?style=for-the-badge)
* [nvim-surround](https://github.com/kylechui/nvim-surround) ![](https://img.shields.io/github/stars/kylechui/nvim-surround.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/kylechui/nvim-surround.svg?style=for-the-badge)
* [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) ![](https://img.shields.io/github/stars/kevinhwang91/nvim-ufo.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/kevinhwang91/nvim-ufo.svg?style=for-the-badge)
* [promise-async](https://github.com/kevinhwang91/promise-async) ![](https://img.shields.io/github/stars/kevinhwang91/promise-async.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/kevinhwang91/promise-async.svg?style=for-the-badge)
* [sqlite.lua](https://github.com/kkharji/sqlite.lua) ![](https://img.shields.io/github/stars/kkharji/sqlite.lua.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/kkharji/sqlite.lua.svg?style=for-the-badge)
* [ssr.nvim](https://github.com/cshuaimin/ssr.nvim) ![](https://img.shields.io/github/stars/cshuaimin/ssr.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/cshuaimin/ssr.nvim.svg?style=for-the-badge)
* [tabout.nvim](https://github.com/abecodes/tabout.nvim) ![](https://img.shields.io/github/stars/abecodes/tabout.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/abecodes/tabout.nvim.svg?style=for-the-badge)
* [template-string.nvim](https://github.com/axelvc/template-string.nvim) ![](https://img.shields.io/github/stars/axelvc/template-string.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/axelvc/template-string.nvim.svg?style=for-the-badge)
* [ultimate-autopair.nvim](https://github.com/altermo/ultimate-autopair.nvim) ![](https://img.shields.io/github/stars/altermo/ultimate-autopair.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/altermo/ultimate-autopair.nvim.svg?style=for-the-badge)
* [yanky.nvim](https://github.com/gbprod/yanky.nvim) ![](https://img.shields.io/github/stars/gbprod/yanky.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/gbprod/yanky.nvim.svg?style=for-the-badge)

### filetypes plugins

* **none**

### fun plugins

* **none**

### git plugins

* [diffview.nvim](https://github.com/sindrets/diffview.nvim) ![](https://img.shields.io/github/stars/sindrets/diffview.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/sindrets/diffview.nvim.svg?style=for-the-badge)
* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) ![](https://img.shields.io/github/stars/lewis6991/gitsigns.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/lewis6991/gitsigns.nvim.svg?style=for-the-badge)
* [neogit](https://github.com/NeogitOrg/neogit) ![](https://img.shields.io/github/stars/NeogitOrg/neogit.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/NeogitOrg/neogit.svg?style=for-the-badge)

### lsp plugins

* [SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) ![](https://img.shields.io/github/stars/b0o/SchemaStore.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/b0o/SchemaStore.nvim.svg?style=for-the-badge)
* [clangd_extensions.nvim](https://git.sr.ht/~p00f/clangd_extensions.nvim) ![](https://img.shields.io/github/stars/nil.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nil.svg?style=for-the-badge)
* [conform.nvim](https://github.com/stevearc/conform.nvim) ![](https://img.shields.io/github/stars/stevearc/conform.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/stevearc/conform.nvim.svg?style=for-the-badge)
* [diagflow.nvim](https://github.com/dgagn/diagflow.nvim) ![](https://img.shields.io/github/stars/dgagn/diagflow.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/dgagn/diagflow.nvim.svg?style=for-the-badge)
* [efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim) ![](https://img.shields.io/github/stars/creativenull/efmls-configs-nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/creativenull/efmls-configs-nvim.svg?style=for-the-badge)
* [formatter.nvim](https://github.com/mhartington/formatter.nvim) ![](https://img.shields.io/github/stars/mhartington/formatter.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/mhartington/formatter.nvim.svg?style=for-the-badge)
* [go.nvim](https://github.com/ray-x/go.nvim) ![](https://img.shields.io/github/stars/ray-x/go.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/ray-x/go.nvim.svg?style=for-the-badge)
* [guard-collection](https://github.com/nvimdev/guard-collection) ![](https://img.shields.io/github/stars/nvimdev/guard-collection.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvimdev/guard-collection.svg?style=for-the-badge)
* [guard.nvim](https://github.com/nvimdev/guard.nvim) ![](https://img.shields.io/github/stars/nvimdev/guard.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvimdev/guard.nvim.svg?style=for-the-badge)
* [lsp-lens.nvim](https://github.com/VidocqH/lsp-lens.nvim) ![](https://img.shields.io/github/stars/VidocqH/lsp-lens.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/VidocqH/lsp-lens.nvim.svg?style=for-the-badge)
* [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) ![](https://img.shields.io/github/stars/williamboman/mason-lspconfig.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/williamboman/mason-lspconfig.nvim.svg?style=for-the-badge)
* [mason.nvim](https://github.com/williamboman/mason.nvim) ![](https://img.shields.io/github/stars/williamboman/mason.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/williamboman/mason.nvim.svg?style=for-the-badge)
* [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) ![](https://img.shields.io/github/stars/nvimtools/none-ls.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvimtools/none-ls.nvim.svg?style=for-the-badge)
* [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) ![](https://img.shields.io/github/stars/mfussenegger/nvim-jdtls.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/mfussenegger/nvim-jdtls.svg?style=for-the-badge)
* [nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb) ![](https://img.shields.io/github/stars/kosayoda/nvim-lightbulb.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/kosayoda/nvim-lightbulb.svg?style=for-the-badge)
* [nvim-lint](https://github.com/mfussenegger/nvim-lint) ![](https://img.shields.io/github/stars/mfussenegger/nvim-lint.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/mfussenegger/nvim-lint.svg?style=for-the-badge)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) ![](https://img.shields.io/github/stars/neovim/nvim-lspconfig.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/neovim/nvim-lspconfig.svg?style=for-the-badge)
* [rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim) ![](https://img.shields.io/github/stars/simrat39/rust-tools.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/simrat39/rust-tools.nvim.svg?style=for-the-badge)
* [vim-sourcepawn](https://github.com/withgod/vim-sourcepawn) ![](https://img.shields.io/github/stars/withgod/vim-sourcepawn.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/withgod/vim-sourcepawn.svg?style=for-the-badge)

### notes plugins

* [neorg](https://github.com/nvim-neorg/neorg) ![](https://img.shields.io/github/stars/nvim-neorg/neorg.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-neorg/neorg.svg?style=for-the-badge)
* [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) ![](https://img.shields.io/github/stars/epwalsh/obsidian.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/epwalsh/obsidian.nvim.svg?style=for-the-badge)

### runners plugins

* [overseer.nvim](https://github.com/stevearc/overseer.nvim) ![](https://img.shields.io/github/stars/stevearc/overseer.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/stevearc/overseer.nvim.svg?style=for-the-badge)

### tests plugins

* [neotest](https://github.com/nvim-neotest/neotest) ![](https://img.shields.io/github/stars/nvim-neotest/neotest.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest.svg?style=for-the-badge)
* [neotest-go](https://github.com/nvim-neotest/neotest-go) ![](https://img.shields.io/github/stars/nvim-neotest/neotest-go.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest-go.svg?style=for-the-badge)
* [neotest-jest](https://github.com/haydenmeade/neotest-jest) ![](https://img.shields.io/github/stars/haydenmeade/neotest-jest.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/haydenmeade/neotest-jest.svg?style=for-the-badge)
* [neotest-plenary](https://github.com/nvim-neotest/neotest-plenary) ![](https://img.shields.io/github/stars/nvim-neotest/neotest-plenary.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-neotest/neotest-plenary.svg?style=for-the-badge)
* [neotest-rust](https://github.com/rouge8/neotest-rust) ![](https://img.shields.io/github/stars/rouge8/neotest-rust.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/rouge8/neotest-rust.svg?style=for-the-badge)

### themes plugins

* [catppuccin](https://github.com/catppuccin/nvim) ![](https://img.shields.io/github/stars/catppuccin/nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/catppuccin/nvim.svg?style=for-the-badge)

### treesitter plugins

* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) ![](https://img.shields.io/github/stars/nvim-treesitter/nvim-treesitter.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-treesitter/nvim-treesitter.svg?style=for-the-badge)
* [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) ![](https://img.shields.io/github/stars/nvim-treesitter/nvim-treesitter-context.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-treesitter/nvim-treesitter-context.svg?style=for-the-badge)
* [nvim-treesitter-endwise](https://github.com/RRethy/nvim-treesitter-endwise) ![](https://img.shields.io/github/stars/RRethy/nvim-treesitter-endwise.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/RRethy/nvim-treesitter-endwise.svg?style=for-the-badge)
* [nvim-treesitter-textsubjects](https://github.com/RRethy/nvim-treesitter-textsubjects) ![](https://img.shields.io/github/stars/RRethy/nvim-treesitter-textsubjects.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/RRethy/nvim-treesitter-textsubjects.svg?style=for-the-badge)
* [nvim-ts-autotag](https://github.com/gungun974/nvim-ts-autotag) ![](https://img.shields.io/github/stars/gungun974/nvim-ts-autotag.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/gungun974/nvim-ts-autotag.svg?style=for-the-badge)
* [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) ![](https://img.shields.io/github/stars/JoosepAlviste/nvim-ts-context-commentstring.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/JoosepAlviste/nvim-ts-context-commentstring.svg?style=for-the-badge)
* [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) ![](https://img.shields.io/github/stars/HiPhish/rainbow-delimiters.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/HiPhish/rainbow-delimiters.nvim.svg?style=for-the-badge)
* [tree-climber.nvim](https://github.com/drybalka/tree-climber.nvim) ![](https://img.shields.io/github/stars/drybalka/tree-climber.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/drybalka/tree-climber.nvim.svg?style=for-the-badge)
* [treesj](https://github.com/wansmer/treesj) ![](https://img.shields.io/github/stars/wansmer/treesj.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/wansmer/treesj.svg?style=for-the-badge)
* [ts-node-action](https://github.com/CKolkey/ts-node-action) ![](https://img.shields.io/github/stars/CKolkey/ts-node-action.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/CKolkey/ts-node-action.svg?style=for-the-badge)

### ui plugins

* [alpha-nvim](https://github.com/goolord/alpha-nvim) ![](https://img.shields.io/github/stars/goolord/alpha-nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/goolord/alpha-nvim.svg?style=for-the-badge)
* [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) ![](https://img.shields.io/github/stars/nvimdev/dashboard-nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvimdev/dashboard-nvim.svg?style=for-the-badge)
* [dressing.nvim](https://github.com/stevearc/dressing.nvim) ![](https://img.shields.io/github/stars/stevearc/dressing.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/stevearc/dressing.nvim.svg?style=for-the-badge)
* [heirline.nvim](https://github.com/rebelot/heirline.nvim) ![](https://img.shields.io/github/stars/rebelot/heirline.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/rebelot/heirline.nvim.svg?style=for-the-badge)
* [hover.nvim](https://github.com/lewis6991/hover.nvim) ![](https://img.shields.io/github/stars/lewis6991/hover.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/lewis6991/hover.nvim.svg?style=for-the-badge)
* [lspkind.nvim](https://github.com/onsails/lspkind.nvim) ![](https://img.shields.io/github/stars/onsails/lspkind.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/onsails/lspkind.nvim.svg?style=for-the-badge)
* [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) ![](https://img.shields.io/github/stars/nvim-neo-tree/neo-tree.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-neo-tree/neo-tree.nvim.svg?style=for-the-badge)
* [noice.nvim](https://github.com/folke/noice.nvim) ![](https://img.shields.io/github/stars/folke/noice.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/folke/noice.nvim.svg?style=for-the-badge)
* [nui.nvim](https://github.com/MunifTanjim/nui.nvim) ![](https://img.shields.io/github/stars/MunifTanjim/nui.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/MunifTanjim/nui.nvim.svg?style=for-the-badge)
* [nvim-notify](https://github.com/rcarriga/nvim-notify) ![](https://img.shields.io/github/stars/rcarriga/nvim-notify.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/rcarriga/nvim-notify.svg?style=for-the-badge)
* [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) ![](https://img.shields.io/github/stars/nvim-tree/nvim-tree.lua.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-tree/nvim-tree.lua.svg?style=for-the-badge)
* [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) ![](https://img.shields.io/github/stars/kyazdani42/nvim-web-devicons.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/kyazdani42/nvim-web-devicons.svg?style=for-the-badge)
* [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) ![](https://img.shields.io/github/stars/nvim-lua/plenary.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-lua/plenary.nvim.svg?style=for-the-badge)
* [popup.nvim](https://github.com/nvim-lua/popup.nvim) ![](https://img.shields.io/github/stars/nvim-lua/popup.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-lua/popup.nvim.svg?style=for-the-badge)
* [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim) ![](https://img.shields.io/github/stars/luukvbaal/statuscol.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/luukvbaal/statuscol.nvim.svg?style=for-the-badge)
* [trouble.nvim](https://github.com/folke/trouble.nvim) ![](https://img.shields.io/github/stars/folke/trouble.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/folke/trouble.nvim.svg?style=for-the-badge)

### utils plugins

* [ccc.nvim](https://github.com/uga-rosa/ccc.nvim) ![](https://img.shields.io/github/stars/uga-rosa/ccc.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/uga-rosa/ccc.nvim.svg?style=for-the-badge)
* [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) ![](https://img.shields.io/github/stars/m4xshen/hardtime.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/m4xshen/hardtime.nvim.svg?style=for-the-badge)
* [hydra.nvim](https://github.com/anuvyklack/hydra.nvim) ![](https://img.shields.io/github/stars/anuvyklack/hydra.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/anuvyklack/hydra.nvim.svg?style=for-the-badge)
* [instant.nvim](https://github.com/jbyuki/instant.nvim) ![](https://img.shields.io/github/stars/jbyuki/instant.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/jbyuki/instant.nvim.svg?style=for-the-badge)
* [neoconf.nvim](https://github.com/folke/neoconf.nvim) ![](https://img.shields.io/github/stars/folke/neoconf.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/folke/neoconf.nvim.svg?style=for-the-badge)
* [neodev.nvim](https://github.com/folke/neodev.nvim) ![](https://img.shields.io/github/stars/folke/neodev.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/folke/neodev.nvim.svg?style=for-the-badge)
* [nvim-navic](https://github.com/SmiteshP/nvim-navic) ![](https://img.shields.io/github/stars/SmiteshP/nvim-navic.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/SmiteshP/nvim-navic.svg?style=for-the-badge)
* [nvim-nio](https://github.com/nvim-neotest/nvim-nio) ![](https://img.shields.io/github/stars/nvim-neotest/nvim-nio.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-neotest/nvim-nio.svg?style=for-the-badge)
* [project.nvim](https://github.com/ahmedkhalf/project.nvim) ![](https://img.shields.io/github/stars/ahmedkhalf/project.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/ahmedkhalf/project.nvim.svg?style=for-the-badge)
* [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) ![](https://img.shields.io/github/stars/nvim-telescope/telescope-file-browser.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-telescope/telescope-file-browser.nvim.svg?style=for-the-badge)
* [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) ![](https://img.shields.io/github/stars/nvim-telescope/telescope-fzf-native.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-telescope/telescope-fzf-native.nvim.svg?style=for-the-badge)
* [telescope-luasnip.nvim](https://github.com/benfowler/telescope-luasnip.nvim) ![](https://img.shields.io/github/stars/benfowler/telescope-luasnip.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/benfowler/telescope-luasnip.nvim.svg?style=for-the-badge)
* [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide) ![](https://img.shields.io/github/stars/jvgrootveld/telescope-zoxide.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/jvgrootveld/telescope-zoxide.svg?style=for-the-badge)
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) ![](https://img.shields.io/github/stars/nvim-telescope/telescope.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvim-telescope/telescope.nvim.svg?style=for-the-badge)
* [template.nvim](https://github.com/nvimdev/template.nvim) ![](https://img.shields.io/github/stars/nvimdev/template.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nvimdev/template.nvim.svg?style=for-the-badge)
* [vim-startuptime](https://github.com/dstein64/vim-startuptime) ![](https://img.shields.io/github/stars/dstein64/vim-startuptime.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/dstein64/vim-startuptime.svg?style=for-the-badge)
* [which-key.nvim](https://github.com/folke/which-key.nvim) ![](https://img.shields.io/github/stars/folke/which-key.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/folke/which-key.nvim.svg?style=for-the-badge)

### visuals plugins

* [hlargs.nvim](https://github.com/m-demare/hlargs.nvim) ![](https://img.shields.io/github/stars/m-demare/hlargs.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/m-demare/hlargs.nvim.svg?style=for-the-badge)
* [hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim) ![](https://img.shields.io/github/stars/shellRaining/hlchunk.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/shellRaining/hlchunk.nvim.svg?style=for-the-badge)
* [lsp-inlayhints.nvim](https://github.com/lvimuser/lsp-inlayhints.nvim) ![](https://img.shields.io/github/stars/lvimuser/lsp-inlayhints.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/lvimuser/lsp-inlayhints.nvim.svg?style=for-the-badge)
* [modes.nvim](https://github.com/mvllow/modes.nvim) ![](https://img.shields.io/github/stars/mvllow/modes.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/mvllow/modes.nvim.svg?style=for-the-badge)
* [murmur.lua](https://github.com/nyngwang/murmur.lua) ![](https://img.shields.io/github/stars/nyngwang/murmur.lua.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/nyngwang/murmur.lua.svg?style=for-the-badge)
* [sentiment.nvim](https://github.com/utilyre/sentiment.nvim) ![](https://img.shields.io/github/stars/utilyre/sentiment.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/utilyre/sentiment.nvim.svg?style=for-the-badge)
* [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) ![](https://img.shields.io/github/stars/folke/todo-comments.nvim.svg?style=for-the-badge) ![](https://img.shields.io/github/last-commit/folke/todo-comments.nvim.svg?style=for-the-badge)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## language servers

### installed by mason: 

* bashls
* clangd
* cmake
* cssls
* gopls
* html
* jsonls
* lemminx
* marksman
* svelte
* texlab
* tsserver
* typst_lsp
* yamlls
* zls

### installed manually: 

* lua_ls
* rust_analyzer

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TODO: -->
## inspirations

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TODO: -->
## todos

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## contact

chiddy - [@chiddy_](https://twitter.com/chiddy_) - <chiddy@chiddy.xyz>

dotfiles: [https://github.com/chidddy/dotfiles](https://github.com/chidddy/dotfiles)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS -->
[url]: https://github.com/chidddy/nvim-config
[contributors-shield]: https://img.shields.io/github/contributors/chidddy/nvim-config.svg?style=for-the-badge
[contributors-url]: https://github.com/chidddy/nvim-config/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/chidddy/nvim-config.svg?style=for-the-badge
[forks-url]: https://github.com/chidddy/nvim-config/network/members
[stars-shield]: https://img.shields.io/github/stars/chidddy/nvim-config.svg?style=for-the-badge
[stars-url]: https://github.com/chidddy/nvim-config/stargazers
[issues-shield]: https://img.shields.io/github/issues/chidddy/nvim-config.svg?style=for-the-badge
[issues-url]: https://github.com/chidddy/nvim-config/issues
[neovim-git]: https://aur.archlinux.org/packages/neovim-git
[codesize-shield]: https://img.shields.io/github/languages/code-size/chidddy/nvim-config?style=for-the-badge
[hsluv]: https://github.com/hsluv/hsluv-lua/blob/master/hsluv.lua
[profile.nvim]: https://github.com/stevearc/profile.nvim
[stacktraceplus]: https://github.com/ignacio/StackTracePlus/
