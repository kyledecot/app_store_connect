# frozen_string_literal: true

RSpec.describe AppStoreConnect::DependencyGraph do
  describe '#write!' do
    pending
  end

  describe '#tfsort' do
    it 'should return a correctly sorted array' do
      bundle_id_create_request = AppStoreConnect::Specification::Object.new(
        name: 'BundleIdCreateRequest',
        options: {
          properties: {
            data: {
              type: 'BundleIdCreateRequest.Data'
            }
          }
        }
      )
      bundle_id_create_request_data = AppStoreConnect::Specification::Object.new(
        name: 'BundleIdCreateRequest.Data',
        options: {
          properties: {
            attributes: {
              type: 'BundleIdCreateRequest.Data.Attributes'
            }
          }
        }
      )
      bundle_id_create_request_data_attributes = AppStoreConnect::Specification::Object.new(
        name: 'BundleIdCreateRequest.Data.Attributes',
        options: {
          properties: {
            identifier: {},
            platform: {
              type: 'BundleIdPlatform'
            }
          }
        }
      )
      bundle_id_platform = AppStoreConnect::Specification::Object.new(
        name: 'BundleIdPlatform',
        options: {
          properties: {}
        }
      )

      dependency_graph = described_class.new(
        specifications: [
          bundle_id_create_request,
          bundle_id_create_request_data,
          bundle_id_create_request_data_attributes,
          bundle_id_platform
        ]
      )
      expected_specifications = [
        bundle_id_create_request,
        bundle_id_create_request_data,
        bundle_id_create_request_data_attributes,
        bundle_id_platform
      ]

      expect(dependency_graph.tsort).to eq(expected_specifications)
    end
  end

  describe '#specification_by' do
    context 'when object specification exists' do
      let(:specification) { create(:object_specification) }
      let(:dependency_graph) { described_class.new(specifications: [specification]) }

      it 'should return the object specification' do
        expect(dependency_graph.specification_by(type: :object, name: specification.name))
          .to eq(specification)
      end
    end

    context 'when the specification does not exist' do
      let(:type) { :object }
      let(:specification) { create(:object_specification) }
      let(:dependency_graph) { described_class.new(specifications: []) }

      it 'should return nil' do
        expect(dependency_graph.specification_by(type: type, name: specification.name))
          .to be_nil
      end
    end
  end

  describe '#specification_by!' do
    context 'when object specification exists' do
      let(:specification) { create(:object_specification) }
      let(:dependency_graph) { described_class.new(specifications: [specification]) }

      it 'should return the object specification' do
        expect(dependency_graph.specification_by!(type: :object, name: specification.name))
          .to eq(specification)
      end
    end

    context 'when the object specification does not exist' do
      let(:specification) { create(:object_specification) }
      let(:dependency_graph) { described_class.new(specifications: []) }
      let(:expected_error) { described_class::SpecificationNotFound.new('TODO', specification.name) }

      it 'should raise SpecificationNotFound' do
        expect do
          dependency_graph.specification_by!(
            type: 'TODO',
            name: specification.name
          )
        end.to raise_error(described_class::SpecificationNotFound)
      end
    end
  end
end
