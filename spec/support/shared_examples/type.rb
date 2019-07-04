# frozen_string_literal: true

RSpec.shared_examples :type do
  it { expect(described_class).to be < AppStoreConnect::Type::Enum }
end
