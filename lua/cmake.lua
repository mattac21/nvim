require("cmake-tools").setup({
    cmake_command = "cmake",
    cmake_regenerate_on_save = true,
    cmake_build_directory = "",
    cmake_build_directory_prefix = "build/",
    cmake_build_options = {},
    cmake_soft_link_compile_commands = true,
    cmake_compile_commands_from_lsp = false,
    cmake_kits_path = nil,
    cmake_console_size = 10, -- cmake output window height
    cmake_show_console = "always", -- "always", "only_on_error"
    cmake_dap_configuration = {
      name = "cppdbg",
      type = "cpp",
      request = "launch",
      setupcommands = {
        {
          description = "enable pretty-printing for gdb",
          ignorefailures = true,
          text = "-enable-pretty-printing",
        },
      },
    },
    cmake_dap_open_command = require("dap").continue,
    cmake_variants_message = {
      short = { show = true },
      long = { show = true, max_length = 40 },
    },
    cmake_always_use_terminal = false,
    cmake_quickfix_opts = {
      show = "always",
      position = "belowright",
      size = 10,
    },
    cmake_executor = {
      name = "quickfix",
      opts = {},
      default_opts = {
        quickfix = {
          show = "always",
          position = "belowright",
          size = 10,
        },
        overseer = {
          new_task_opts = {},
          on_new_task = function(task) end,
        },
        terminal = {},
      },
    },
    cmake_terminal = {
      name = "terminal",
      opts = {
        name = "Main Terminal",
        prefix_name = "[CMakeTools]: ",
        split_direction = "horizontal",
        split_size = 11,

        -- Window handling
        single_terminal_per_instance = true,
        single_terminal_per_tab = true,
        keep_terminal_static_location = true,

        -- Running Tasks
        start_insert_in_launch_task = false,
        start_insert_in_other_tasks = false,
        focus_on_main_terminal = false,
        focus_on_launch_terminal = false,
      },
    },
    cmake_notifications = {
      enabled = true,
      spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      refresh_rate_ms = 100,
    },
})


