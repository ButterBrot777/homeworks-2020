require_relative '../my_select'
require_relative '../my_each'

class Array
  include CustomSelect
  include CustomEach
end

RSpec.describe Array do
  subject { described_class.new([0, 1, 2, 3]) }

  describe '#my_select' do
    context 'when no block is given' do
      it 'returns start array' do
        expect(subject.my_select.to_a).to eq subject
      end
    end

    context 'when block is given' do
      it 'returns modified array' do
        expect(subject.my_select { |element| element != 0 }).to eq([1, 2, 3])
      end
    end
  end
end
