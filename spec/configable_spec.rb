#!ruby -Ku
# -*- encoding: UTF-8 -*-
$KCODE="UTF8"
require 'configable'
require 'yaml'

# �g�p��ł�
class ConfigUser
  extend Configable
	# ���[�U�N���X�����琄��
  # �f�t�H���g�l�́A�K���Ȓl����Ă���
  # �֐����́A�f�t�H���g�� config
  config do
    method :confs
    file   "cu.yaml"
    default "ConfigUser.test" => "data", "ConfigUser.any" => "value"
  end

  def any
    confs["ConfigUser.any"]
  end
end

class ConfigUser2
  extend Configable
	# ���[�U�N���X�����琄��
  # �f�t�H���g�l�́A�K���Ȓl����Ă���
  # �֐����́A�f�t�H���g�� config
  config do
    method :confs
    file   "cu.yaml"
    default "ConfigUser2.test" => "data2", "ConfigUser2.any" => "value2"
  end

  def any
    confs["ConfigUser2.any"]
  end
end

describe ConfigUser do
  context "when new" do
	  it { subject.confs["test"].should == "data" }
	  it { subject.confs.file.should == "cu.yaml" }
	  it { subject.any.should == "value" }
	end

	context "added class method" do
	  subject { ConfigUser }
	  it { subject.confs["test"].should == "data" }
	  it { subject.confs.file.should == "cu.yaml" }
	  it { subject.confs["any"].should == "value" }
	end
end

describe ConfigUser2 do
  context "when new" do
	  it { subject.confs["ConfigUser2.test"].should == "data2" }
	  it { subject.confs.file.should == "cu.yaml" }
	  it { subject.any.should == "value2" }
	end

	context "added class method" do
	  subject { ConfigUser2 }
	  it { subject.confs["ConfigUser2.test"].should == "data2" }
	  it { subject.confs.file.should == "cu.yaml" }
	  it { subject.confs["ConfigUser2.any"].should == "value2" }
	end
end
