#!ruby -Ku
# -*- encoding: UTF-8 -*-
require 'ya2yaml'
require 'FileUtils'

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
    # �ݒ�f�[�^�̃��[�h
    def load
      val=nil
      # �t�@�C���̓ǂݍ���
      if File.exist?(@file)
        open(@file, "rb") do |f|
          l = YAML::load(f)
          val = @default.merge(l) if l.is_a? Hash
        end
      end
      # �������ށi�����l��ύX�����ꍇ�ȂǁB
      FileUtils.mkpath File.dirname(File.expand_path(@file))
      open(@file,"wb") {|f| f.puts val.ya2yaml(:syck_compatible => true) }
      # ������������f�t�H���g�l��߂�
      val
    end

    def load!
      @values = load
    end
    def save!
      # �������ށi�����l��ύX�����ꍇ�ȂǁB
      FileUtils.mkpath File.dirname(File.expand_path(@file))
      open(@file,"wb") {|f| f.puts @values.ya2yaml(:syck_compatible => true) }
    end

    def values
      @values ||= load
    end
    def [](*a)
      self.values[*a]
    end
    def method(sym=nil)
      return @method if not sym
      @method = sym
    end
    def file(sym=nil)
      return @file if not sym
      @file = sym
    end
    def default(hash)
      @default = hash
    end
  end
end
