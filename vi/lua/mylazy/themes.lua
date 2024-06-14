-- vim: ts=2 sw=2

--------------------------------
--          Themes:           --
--------------------------{{{}}}

return {

  'AbdelrahmanDwedar/awesome-nvim-colorschemes',
  'gbprod/nord.nvim',

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour="macchiato",
      transparent_background=true,
    }
  },

  { "2nthony/vitesse.nvim", dependencies = { "tjdevries/colorbuddy.nvim" }, }, -- foresty
  { 'AlexvZyl/nordic.nvim', lazy = false, priority = 1000 }, -- beautiful
  { 'folke/tokyonight.nvim', branch = 'main' },
  { 'sonph/onehalf', config = function(plugin) vim.opt.rtp:append(plugin.dir .. "/vim") end }, -- Nice good tone HUGE

  'glepnir/porcelain.nvim',
  'haystackandroid/carbonized',
  'antonk52/lake.nvim',
  'xero/miasma.nvim',
  'nvimdev/oceanic-material',
  'maxmx03/FluoroMachine.nvim', -- neeooooon
  'felipeagc/fleet-theme-nvim',
  'uloco/bluloco.nvim', -- have transprent
  '2nthony/vitesse.nvim',
  'JoosepAlviste/palenightfall.nvim',
  'Yazeed1s/oh-lucy.nvim',
  'kvrohit/mellow.nvim',
  'sam4llis/nvim-tundra', -- needs lua require()
  'katawful/kat.nvim',
  'Tsuzat/NeoSolarized.nvim',
  'rebelot/kanagawa.nvim',
  'lukas-reineke/onedark.nvim',
  'projekt0n/github-nvim-theme',
  'AstroNvim/astrotheme',
  'savq/melange-nvim',
  'Yazeed1s/minimal.nvim',

  -- 'morhetz/gruvbox', -- best
  'sainnhe/gruvbox-material', -- improved
  '010penetrator/vim-colors-forplasma', -- collection
  'chriskempson/vim-tomorrow-theme', -- Nice dark+light
  'w0ng/vim-hybrid', -- beautiful
  'kristijanhusak/vim-hybrid-material', -- nice Sane dark
  'severij/vadelma', -- white good-con
  'https://gitlab.com/protesilaos/tempus-themes-vim.git',
  'cocopon/iceberg.vim', -- soft cold dark
  'AlessandroYorba/Alduin', -- brown lowcon
  'jonathanfilip/vim-lucius', -- day morning
  'rose-pine/neovim', -- fancy dark
  'romainl/Apprentice', -- nostrain
  'JarrodCTaylor/spartan', -- 'spartan,immortals
  'pbrisbin/vim-colors-off',
  -- 'jakwings/vim-colors', -- 'moody,garden,messy
  'bf4/vim-dark_eyes', -- NIGHT
  'beigebrucewayne/Turtles', -- funky
  'vim-scripts/C64.vim', -- joke
  'szorfein/fantasy.vim', -- dull
  'KimNorgaard/vim-frign', -- borland_style
  'KKPMW/sacredforest-vim', -- lowcont
  'logico-dev/typewriter', -- good!
  'wimstefan/vim-artesanal', -- good lowcon gray
  'beigebrucewayne/min_solo', -- grey bg subtle__
  'lithammer/vim-eighties', -- trueeeee
  'arzg/vim-substrata', -- cold neon
  'sainnhe/edge', -- good soft
  'sainnhe/everforest', -- cream lowcon
  'sainnhe/archived-colors', -- atlantis,cryslominsa,desert_night,fairy_garden,grimoire,ice_age,lost_shrine,vanilla_cake
  'flrnd/plastic.vim', -- solid dark
  'EdenEast/nightfox.nvim', -- fashy dark
  'colepeters/spacemacs-theme.vim', -- cool
  'relastle/bluewery.vim', -- low-con
  'stillwwater/vim-nebula', -- cold dark
  'franbach/miramare', -- coffee dark
  'mhartington/oceanic-next', -- soft nice
  -- 'nanotech/jellybeans.vim', -- good4html
  -- 'HenryNewcomer/vim-theme-underflow', -- consbroken
  -- 'jacoborus/tender.vim', -- sane soft dark
  -- 'AlessandroYorba/Sierra', -- softgray
  -- 'AlessandroYorba/Despacio', -- softdarkgrey
  -- 'dracula/vim', -- funky
  'vim-scripts/Spacegray.vim', -- darker
  -- 'jlund3/colorschemer', -- semibroken 'lucid
  -- 'srcery-colors/srcery-vim', -- fresh-dark consbroken HUGE
  -- 'dfrunza/vim', -- borland,muratori,pencil,vc6
  -- 'zefei/cake16', -- cool medium
  -- 'machakann/vim-colorscheme-tatami', -- fun green
  -- 'RussellBradley/vim-knicks' -- great blue 404
  -- 'aradunovic/perun.vim', -- consbroken 404
  -- 'the31k/vim-colors-tayra', -- Nice gray 404
  -- 'koirand/tokyo-metro.vim', -- pretty dark
  -- 'nightsense/rusticated', -- morning
  -- 'ajmwagar/vim-dues', -- soft coffee 'deus
  -- 'nightsense/snow', -- soft)
  -- 'nightsense/stellarized', -- nice! light+dark
  -- 'arzg/vim-mayanfog', -- light bone
  -- 'arzg/vim-plan9', -- trueeeee

  ---- Pretty but not useful -------------------------------
  -- 'sainnhe/sonokai', -- dark gui&nogui
  -- 'szorfein/fromthehell.vim', -- dark satur earth
  -- 'whatyouhide/vim-gotham', -- neon/green
  -- 'yuttie/inkstained-vim', -- very low con light
  'ayu-theme/ayu-vim',
  -- 'atelierbram/vim-colors_atelier-schemes', -- mindfuck
  -- 'bcicen/vim-vice', -- joke
  -- 'vim-scripts/swamplight', -- day

}
