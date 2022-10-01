local ok, project = pcall(require, 'project_nvim')
if not ok then return end

project.setup {
  patterns = { '.git', 'README.md', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json' },
}

local tel_ok, telescope = pcall(require, 'telescope')
if not tel_ok then return end

telescope.load_extension('projects')
