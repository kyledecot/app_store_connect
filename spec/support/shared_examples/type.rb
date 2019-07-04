# frozen_string_literal: true

RSpec.shared_examples :type do |parent:|
  it { expect(described_class).to be < parent }
end
