# -*- encoding: UTF-8 -*-

class ConfigUser
	# ユーザクラス名から推測
  # デフォルト値は、適当な値入れておく
  # 関数名は、デフォルトで config
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
