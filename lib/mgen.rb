
module Mgen
  autoload  :CLI, 'mgen/cli.rb'
  autoload  :Utils, 'mgen/utils.rb'

  autoload  :Logger, 'mgen/logger.rb'
  autoload  :Version, 'mgen/version.rb'

  def self.root
    @root ||= Pathname(__FILE__).dirname.expand_path
  end
end
