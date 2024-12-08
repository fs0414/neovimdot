# frozen_string_literal: true

require('neovim')

Neovim.plugin do |plug|
  plug.command('RubyHello') do |nvim|
    nvim.command(":echo 'Hi!'")
  end
end
