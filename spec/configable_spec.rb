# -*- encoding: UTF-8 -*-

class ConfigUser
	# ���[�U�N���X�����琄��
  # �f�t�H���g�l�́A�K���Ȓl����Ă���
  # �֐����́A�f�t�H���g�� config
  config do
    method :confs
    file   "cu.yaml"
    default "test" => "data", "any" => "value"
  end

  puts confs["test"]
  def any
    puts confs["any"]
  end
end

describe ConfigUser
  it { confs["test"].should == "data" }
end
