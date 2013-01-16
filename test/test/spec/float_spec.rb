describe "Float" do
  it "#to_f" do
    # issue 165
    1234567890.to_f.to_i.should == 1234567890
  end

  it "Time.now and NSDate" do
    # issue 275
    start = Time.now.to_f
    sleep 0.2
    (NSDate.date.timeIntervalSince1970 - start).should != 0

    # issue 193
    t1 = NSDate.dateWithNaturalLanguageString("midnight")
    t2 = Time.dateWithNaturalLanguageString("midnight")
    t1.to_f.should == t2.to_f
  end

  it "/" do
    # issue 214, 409
    (1350929196 * 1000.0).to_i.should == 1350929196000
    (288338838383383 / 1000.0).to_i.should == 288338838383
  end

  it "step" do
    # issue 425
    1356890400.step(1356908032.0, 7200.0).to_a.should == [1356890400.0, 1356897600.0, 1356904800.0]
  end

  it "NSDecimalNumber.decimalNumberWithMantissa" do
    # issue 427
    number = NSDecimalNumber.decimalNumberWithMantissa(3000000000, exponent: 0,isNegative: false)
    number.should == 3000000000
  end

  it "Range#eql?" do
    (0.5..2.4).eql?(0.5..2.4).should == true
  end

  it "fixfloat" do
    0.1.step(100.0, 0.1) do |f|
      f.__fixfloat__?.should == true
    end
  end
end