require 'spec_helper'
describe 'freenas_api' do

  context 'with defaults for all parameters' do
    it { should contain_class('freenas_api') }
  end
end
