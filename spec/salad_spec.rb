require_relative '../salad.rb'

RSpec.describe SaladCypher do
  let(:msg) {'taargus'}
  let(:shift) {6}
  subject{described_class.new(:msg => msg, :shift => shift)}

  describe "#cypher" do
    it "returns shifted string" do
      expect(subject.cypher).to eql('zggxmay')
    end

    context "with capitals" do
      let(:msg) {'A'}
      it "downcases capital letter" do
        expect(subject.cypher).to eql('g')
      end
    end

    context "special characters" do
      let(:msg) {'R!r'}
      it "returns non-alphabet character without shifting" do
        expect(subject.cypher).to eql('x!x')
      end
    end

    context "capital wrap?" do
      let(:msg) {'Zz'}
      let(:shift) {1}
      it "returns mystery" do
        expect(subject.cypher).to eql('aa')
      end
    end

  end

end


