require 'rails_helper'

RSpec.describe IpAddress, type: :model do
  describe 'validation' do
    it { should respond_to(:ip) }
    it { should respond_to(:name) }

    it { should validate_presence_of(:ip) }
    it { should validate_uniqueness_of(:ip) }
    it { should validate_presence_of(:name) }

    describe 'ip address format' do
      let(:ip_right) { build_stubbed(:ip_address) }
      let(:ip_wrong) { build_stubbed(:ip_address, :wrong_private_ip) }

      it 'accept if ip address has right format' do
        expect(ip_right).to be_valid
      end

      it 'rejects if ip address does not have rigth format' do
        expect(ip_wrong).not_to be_valid
      end
    end
  end
end
