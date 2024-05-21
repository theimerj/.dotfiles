-- NOTE: https://github.com/V13Axel/neotest-pest
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-plenary",
      "V13Axel/neotest-pest",
    },
    opts = {
      adapters = {
        -- "neotest-plenary",
        ["neotest-pest"] = {
          -- Root files
          root_files = { "tests/Pest.php" },

          -- Ignore these directories when looking for tests
          ignore_dirs = { "vendor", "node_modules" },

          -- Ignore any projects containing "phpunit-only.tests"
          root_ignore_files = {},

          -- Specify suffixes for files that should be considered tests
          test_file_suffixes = { "Test.php" },

          -- Enable Docker support
          sail_enabled = function()
            return true
          end,

          -- vim.fn.fnamemodify(require("lazyvim.util").root.get({ normalize = true }), ":h:t") .. "-api-fpm-1",

          -- Set custom docker command
          pest_cmd = {
            "docker",
            "compose",
            "-f",
            "../docker-compose.dev.yml",
            "exec",
            "api-fpm",
            "vendor/bin/pest",
          },

          -- Run N tests in parallel, <=1 doesn't pass --parallel to pest at all
          parallel = 0,

          -- Enable ["compact" output printer](https://pestphp.com/docs/optimizing-tests#content-compact-printer)
          compact = false,

          results_path = function()
            return "storage/app/tests/" .. os.date("pest-%Y%m%d-%H%M%S")
          end,
        },
      },
      discovery = {
        enabled = true,
        concurrent = 2,
        -- filter_dir = function(name, rel_path, root)
        --   return name ~= "vendor"
        -- end,
      },
      open = {
        enabled = true,
        open_on_run = true,
      },
      floating = {
        border = "rounded",
        max_height = 0.6,
        max_width = 0.6,
        options = {},
      },
      output_panel = {
        enabled = true,
        open = "botright split | resize 30",
      },
      log_level = vim.log.levels.INFO,
    },
  },
}
