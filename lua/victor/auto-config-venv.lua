-- Mapeamento de diretórios e seus respectivos ambientes virtuais
local venvs = {
  ["/home/bart/my-coding-projects/utils/ml-utils"] = "/home/bart/my-coding-projects/utils/.venv/bin/python3.12",
  ["/home/bart/my-coding-projects/google_sheets_automation_script_biopsies/gsheets-biopsy"] = "/home/bart/my-coding-projects/google_sheets_automation_script_biopsies/.venv/bin/python3.12",
  ["/home/bart/my-coding-projects/leetcode_solutions/solutions"] = "/home/bart/my-coding-projects/leetcode_solutions/.venv/bin/python3.12",
  ["/home/bart/my-coding-projects/project2"] = "/home/bart/my-coding-projects/project2/.venv/bin/python3.8",
  -- Adicione mais projetos e seus ambientes virtuais aqui
}

-- Função para tentar encontrar o caminho correto para o ambiente virtual
local function find_venv_path(project_dir)
  local parent_dir = vim.fn.fnamemodify(project_dir, ":h")  -- Obtém o diretório pai
  local venv_path = parent_dir .. "/.venv/bin/python3.12"  -- Ajuste conforme a versão do seu Python

  if vim.fn.filereadable(venv_path) == 1 then
    return venv_path
  else
    return nil
  end
end

-- Autocomando para ativar o ambiente virtual quando o diretório específico for selecionado
vim.api.nvim_create_autocmd({"VimEnter", "DirChanged"}, {
  pattern = "*",  -- Aplica para todos os diretórios
  callback = function()
    local current_dir = vim.fn.getcwd()  -- Obtém o diretório atual

    -- Verifica se o diretório atual está na lista de venvs
    for dir, venv_python_path in pairs(venvs) do
      if current_dir == dir then
        -- Tentando localizar o venv a partir do diretório do projeto
        local venv_path = find_venv_path(current_dir)

        if venv_path then
          -- Define as variáveis de ambiente para usar o ambiente virtual
          vim.env.VIRTUAL_ENV = vim.fn.fnamemodify(venv_path, ":h:h")  -- Obtém o diretório .venv
          vim.env.PATH = vim.env.VIRTUAL_ENV .. "/bin:" .. vim.env.PATH
          vim.env.PYTHONPATH = vim.env.VIRTUAL_ENV .. "/lib/python3.12/site-packages"

          -- Atualiza o Python do Neovim para usar o Python do ambiente virtual
          vim.g.python3_host_prog = venv_python_path

          print("Ambiente virtual ativado para o projeto: " .. current_dir)
        else
          print("Ambiente virtual não encontrado para o projeto: " .. current_dir)
        end
        return
      end
    end
    print("Nenhum ambiente virtual encontrado para este diretório.")
  end
})

return {}

