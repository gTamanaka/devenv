{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";
  claude.code.enable = true;

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.tmux
    pkgs.tmuxinator
    pkgs.cocogitto
  ];

  # https://devenv.sh/languages/
  # languages.python = {
  #   enable = true;
  #   uv.enable = true;
  # };

  # languages.javascript = {
  #   enable = true;
  #   pnpm.enable = true;
  #   bun.enable = true;
  # };


  # https://devenv.sh/processes/
  # processes.dev.exec = "${lib.getExe pkgs.watchexec} -n -- ls -la";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  # https://devenv.sh/basics/
  enterShell = ''
    cog install-hook --all --overwrite 2>/dev/null || true
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  scripts.gemini.exec = ''
    npx @google/gemini-cli "$@"
  '';

  scripts.claude.exec = ''
    npx @anthropic-ai/claude-code@next "$@"
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
