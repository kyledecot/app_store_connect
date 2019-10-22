# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client::Options do
  describe '#initialize' do
    let(:issuer_id) { '12345' }

    subject(:options) { described_class.new(issuer_id: issuer_id) }

    it { expect(options).to have_key(:schema) }

    context 'with config' do
      before do
        AppStoreConnect.config = { issuer_id: '67890' }
      end

      context 'without environment variables' do
        before do
          stub_const('ENV', {})
        end

        context 'with options' do
          let(:options) { described_class.new(issuer_id: '12345') }

          it { expect(options[:issuer_id]).to eq('12345') }
        end

        context 'without options' do
          let(:options) { described_class.new }

          it { expect(options[:issuer_id]).to eq('67890') }
        end
      end

      context 'with environment variables' do
        before do
          stub_const('ENV',
                     'APP_STORE_CONNECT_ISSUER_ID' => '54321')
        end

        context 'with options' do
          let(:options) { described_class.new(issuer_id: '12345') }

          it { expect(options[:issuer_id]).to eq('12345') }
        end

        context 'without options' do
          let(:options) { described_class.new }

          it { expect(options[:issuer_id]).to eq('67890') }
        end
      end
    end

    context 'without config' do
      before do
        AppStoreConnect.config = {}
      end

      context 'without environment variables' do
        before do
          stub_const('ENV', {})
        end

        context 'with options' do
          let(:options) { described_class.new(issuer_id: '12345') }

          it { expect(options[:issuer_id]).to eq('12345') }
        end

        context 'without options' do
          let(:options) { described_class.new }

          it { expect(options).to_not have_key(:issuer_id) }
        end
      end

      context 'with environment variables' do
        before do
          stub_const('ENV',
                     'APP_STORE_CONNECT_ISSUER_ID' => '54321')
        end

        context 'with options' do
          let(:options) { described_class.new(issuer_id: '12345') }

          it { expect(options[:issuer_id]).to eq('12345') }
        end

        context 'without options' do
          let(:options) { described_class.new }

          it { expect(options[:issuer_id]).to eq('54321') }
        end
      end
    end
  end
end
