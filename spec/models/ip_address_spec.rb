require 'rails_helper'

RSpec.describe IpAddress, type: :model do
  describe 'validation' do
    it { should respond_to(:ip) }
    it { should respond_to(:name) }
    it { should respond_to(:building) }
    it { should respond_to(:room) }
    it { should respond_to(:mac) }
    it { should respond_to(:hardware_category) }
    it { should respond_to(:model) }
    it { should respond_to(:serial_number) }
    it { should respond_to(:user) }
    it { should respond_to(:password) }
    it { should respond_to(:additional_info) }

    it { should validate_presence_of(:ip) }
    it { should validate_uniqueness_of(:ip) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:building) }
    it { should validate_presence_of(:room) }
    it { should validate_presence_of(:hardware_category) }
    it { should validate_presence_of(:model) }

    describe 'ip address format' do
      let(:ip_right) { build_stubbed(:ip_address) }
      let(:ip_wrong) { build_stubbed(:ip_address, :wrong_private_ip) }

      it 'accepts if ip address has right format' do
        expect(ip_right).to be_valid
      end

      it 'rejects if ip address does not have rigth format' do
        expect(ip_wrong).not_to be_valid
      end
    end

    describe 'mac address format' do
      let(:mac_right) { build_stubbed(:ip_address) }
      let(:mac_wrong) { build_stubbed(:ip_address, :wrong_mac_address) }

      it 'accepts if mac address has right format' do
        expect(mac_right).to be_valid
      end

      it 'rejects if mac address does not have right format' do
        expect(mac_wrong).not_to be_valid
      end
    end
  end
end
