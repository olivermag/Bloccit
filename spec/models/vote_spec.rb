describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        
        v = Vote.new(value: 1)
        expect(v.valid?).to eq(true)

        v = Vote.new(value: 10)
        expect(v.valid?).to eq(false)

        v = Vote.new(value: -1)
        expect(v.valid?).to eq(true)

        v = Vote.new(value: 5)
        expect(v.valid?).to eq(false)
      end
    end
  end
end