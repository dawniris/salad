require_relative '../salad.rb'

RSpec.describe SaladCypher do
  let(:msg) {'taargus'}
  let(:shift) {6}
  subject{described_class.new(:msg => msg, :shift => shift)}

  describe "#cypher" do
    it "returns +shifted string" do
      expect(subject.cypher).to eql('zggxmay')
    end

    context "with capitals" do
      let(:msg) {'AZ'}
      it "retains capital letter" do
        expect(subject.cypher).to eql('GF')
      end
    end

    context "special characters" do
      let(:msg) {'R!r'}
      it "returns non-alphabet character without shifting" do
        expect(subject.cypher).to eql('X!x')
      end
    end

    context "capital wrap?" do
      let(:msg) {'Zz'}
      let(:shift) {1}
      it "returns appropriate capitalization" do
        expect(subject.cypher).to eql('Aa')
      end
    end

    context "negative integer" do
      let(:shift) {-2}
      it "shifts towards A instead of Z" do
        expect(subject.cypher).to eql('ryypesq')
      end
    end
  end

  describe "#initialize" do
    let(:shift) {0}
    it "errors out if shift == 0" do
      expect{subject}.to raise_error('WRONG FUCKING NUMBER, STUPID')
    end
  end

  describe "#reverse" do
    let(:shift) {1}
    it "returns -shifted string" do
      expect(subject.reverse).to eql('szzqftr')
    end
  end

end


