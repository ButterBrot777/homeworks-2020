require_relative '../my_each'

class Array
  include CustomEach
end

RSpec.describe Array do
  subject { described_class.new([0, 1, 2, 3]) }

  describe '#my_each' do
    context 'when no block is given' do
      it 'returns start array' do
        expect(subject.my_each.to_a).to eq subject
      end
    end

    context 'when block is given' do
      it 'returns modified array' do
        expect(subject.my_each { |element| element + 1 }).to eq(0...4)
      end
    end
  end
end
