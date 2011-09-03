export RUBYLIB=/usr/local/lib/ruby/gems/1.8:$RUBYLIB
export RUBYLIB=/usr/local/lib/ruby/site_ruby/1.8:$RUBYLIB
export RUBYLIB=/opt/local/lib/ruby/vendor_ruby/1.8:$RUBYLIB
export RUBYLIB=/opt/local/lib/ruby/vendor_ruby/1.8/i686-darwin10:$RUBYLIB

PATH=/opt/local/bin:$PATH
#rvm
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi

rvm use
export USE_BUNDLER=1

PATH=/opt/local/lib/mysql5/bin:$PATH

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=200000000
export RUBY_HEAP_FREE_MIN=2000000



# エイリアス
alias h='history 32'
alias ll='ls -laF | more'
alias mvimt='mvim --remote-tab-silent'

# cdコマンドの補完ではディレクトリのみを対象にする
complete -d cd

# ヒストリに保存するコマンド
HISTSIZE=10000
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad


# プロンプトの設定
# \u  : ユーザ名
# \h  : マシン名
# \W  : カレントディレクトリ
# \\$ : スーパーユーザは「#」一般ユーザは「$」で表示
#PS1="\[\033[36m\][\u@\h \W]\\$\[\033[00m\] "

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
  PROMPT="\[\033[36m\][\h@\u \W\$(parse_git_branch)]\$\[\033[00m\] "
}
function proml {
  PS1="\[\033[36m\][\h@\u \W\$(parse_git_branch)]\$\[\033[00m\] "
}
proml
