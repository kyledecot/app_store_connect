require_relative './relationships/bundle_id'
require_relative './relationships/certificates'
require_relative './relationships/devices'

module AppStoreConnect
  class ProfileCreateRequest 
    class Data 
      class Relationships
        attr_reader :bundle_id, :certificates, :devices

        def initialize(bundle_id:, certificate_ids:, device_ids: [])
          @bundle_id = BundleId.new(id: bundle_id)
          @certificates = Certificates.new(ids: certificate_ids)
          @devices = Devices.new(ids: device_ids)
        end 

        def to_h 
          {
            bundle_id: bundle_id.to_h,
            certificates: certificates.to_h,
            devices: devices.to_h
          }
        end 
      end 
    end 
  end
end 
