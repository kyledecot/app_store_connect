# frozen_string_literal: true

RSpec.describe AppStoreConnect::DependencyGraph do
  describe '#write!' do
    pending
  end

  describe '#tfsort' do
    it 'should return a correctly sorted array' do
      bundle_id_create_request = AppStoreConnect::ObjectSpecification.new(
        name: 'BundleIdCreateRequest',
        properties: {
          data: {
            object: 'BundleIdCreateRequest.Data'
          }
        }
      )
      bundle_id_create_request_data = AppStoreConnect::ObjectSpecification.new(
        name: 'BundleIdCreateRequest.Data',
        properties: {
          attributes: {
            object: 'BundleIdCreateRequest.Data.Attributes'
          }
        }
      )
      bundle_id_create_request_data_attributes = AppStoreConnect::ObjectSpecification.new(
        name: 'BundleIdCreateRequest.Data.Attributes',
        properties: {
          identifier: {},
          platform: {
            object: 'BundleIdPlatform'
          }
        }
      )
      bundle_id_platform = AppStoreConnect::ObjectSpecification.new(
        name: 'BundleIdPlatform',
        properties: {}
      )

      dependency_graph = described_class.new(
        specifications: [
          bundle_id_create_request,
          bundle_id_create_request_data,
          bundle_id_create_request_data_attributes,
          bundle_id_platform
        ]
      )

      expect(dependency_graph.tsort).to eq([
                                             bundle_id_platform,
                                             bundle_id_create_request_data_attributes,
                                             bundle_id_create_request_data,
                                             bundle_id_create_request
                                           ])
    end
  end

  describe '#object_specification_by' do
    context 'when object specification exists' do
      let(:object_specification) { create(:object_specification) }
      let(:dependency_graph) { described_class.new(specifications: [object_specification]) }

      it 'should return the object specification' do
        expect(dependency_graph.object_specification_by(name: object_specification.name))
          .to eq(object_specification)
      end
    end

    context 'when the object specification does not exist' do
      let(:object_specification) { create(:object_specification) }
      let(:dependency_graph) { described_class.new(object_specifications: []) }

      it 'should return nil' do
        expect(dependency_graph.object_specification_by(name: object_specification.name))
          .to be_nil
      end
    end
  end

  describe '#object_specification_by!' do
    context 'when object specification exists' do
      let(:object_specification) { create(:object_specification) }
      let(:dependency_graph) { described_class.new(object_specifications: [object_specification]) }

      it 'should return the object specification' do
        expect(dependency_graph.object_specification_by!(name: object_specification.name))
          .to eq(object_specification)
      end
    end

    context 'when the object specification does not exist' do
      let(:object_specification) { create(:object_specification) }
      let(:dependency_graph) { described_class.new(object_specifications: []) }

      it 'should raise ObjectSpecificationNotFound' do
        expect do
          dependency_graph.object_specification_by!(
            name: object_specification.name
          )
        end.to raise_error(described_class::ObjectSpecificationNotFound)
      end
    end
  end
end
