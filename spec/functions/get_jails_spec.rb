require 'spec_helper'
require 'webmock'
require 'json'
include WebMock::API

describe 'get_jails function' do

  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it 'should return some jails' do
    # mock credentials
    expect(YAML).to receive(:load_file).and_return({
      :base_url => 'http://freenasdummy.localdomain',
      :username => 'root',
      :password => 'hackme'
      })
    stub_request(:get, "http://root:hackme@freenasdummy.localdomain/api/v1.0/jails/jails/").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read('spec/data/get_jails.json'), :headers => {})
    expect(scope.function_get_jails([])).to eq(JSON.load(File.read('spec/data/get_jails.json')))
  end

end
