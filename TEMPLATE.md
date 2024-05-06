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

<!-- SCRIPT_PLUGINS -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## language servers

<!-- SCRIPT_LANGUAGESERVERS -->

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
