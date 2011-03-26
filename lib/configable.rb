#!ruby -Ku
# -*- encoding: UTF-8 -*-
require 'ya2yaml'

class Module
  def define_class_method(name)
    (class << self; self end).module_eval { define_method(name) { yield } }
  end
end

module Configable
  def config(&block)
    config = ConfigFile.new
    config.instance_eval(&block)

    define_class_method(config.method) { config }
    define_method(config.method) { config }
  end
  
  class ConfigFile
    # 設定データのロード
    def load
      # ファイルの読み込み
      if File.exist?(@file)
        open(@file, "rb") do |f|
          l = YAML::load(f)
          @default = @default.merge(l) if l.is_a? Hash
        end
      end
      # 書き込む（初期値を変更した場合など。
      open(@file,"wb") {|f| f.puts @default.ya2yaml(:syck_compatible => true) }
      # 書き換わったデフォルト値を戻す
      @default
    end

    def [](*a)
      @values ||= load
      @values[*a]
    end
    def method(sym=nil)
      return @method if not sym
      @method = sym
    end
    def file(sym=nil)
      return @file if not sym
      @file = sym
    end
    def default(hash=nil)
      return @default if not hash
      @default = hash
    end
  end
end
