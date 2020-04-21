require_relative '../my_map'
require_relative '../my_each'

class Array
  include CustomMap
  include CustomEach
end

RSpec.describe Array do
  subject { described_class.new([0, 1, 2, 3]) }

  describe '#my_map' do
    context 'when no block is given' do
      it 'returns start array' do
        expect(subject.my_map.to_a).to eq subject
      end
    end

    context 'when block is given' do
      it 'returns modified array' do
        expect(subject.my_map { |element| element + 2 }).to eq([2, 3, 4, 5])
      end
    end
  end
end
