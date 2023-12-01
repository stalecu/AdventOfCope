require 'rspec'
require_relative '../lib/aoc'

RSpec.describe Day01 do
  shared_examples 'a solution' do |example_file, expected_part1, expected_part2, expected_modified_lines|
    context "with #{example_file}" do
      let(:lines) { File.readlines(example_file, chomp: true) }
      subject { described_class.new(lines) }

      describe '#part1_sum' do
        it 'calculates the sum for part 1' do
          expect(subject.part1_sum).to eq(expected_part1)
        end
      end

      describe '#part2_sum' do
        it 'calculates the sum for part 2' do
          expect(subject.part2_sum).to eq(expected_part2)
        end

        describe 'when modifying lines' do
          it 'modifies the lines as expected' do
            if expected_modified_lines
              expect { subject.part2_sum }.to change {
                                                lines
                                              }.to expected_modified_lines
            end
          end

          it 'doesn\'t modify the lines as expected' do
            expect { subject.part2_sum }.not_to(change { lines }) unless expected_modified_lines
          end
        end
      end
    end
  end

  it_behaves_like 'a solution', 'inputs/sim_example1', 185, 185, nil
  it_behaves_like 'a solution', 'inputs/sim_example2', 89, 241,
                  %w[o1e1o1e t2o3f4r s6xtyn9e n9eteene8tyf4r n4o1e5t3e]

  it_behaves_like 'a solution', 'inputs/example', 142, 142, nil
  it_behaves_like 'a solution', 'inputs/example2', 209, 281,
                  %w[t2o1n9e e8t2ot3e abco1e2t3exyz xt2o1e3f4r 4n9ee8ts7n2
                     zo1e8t234 7pqrsts6xteen]
end
