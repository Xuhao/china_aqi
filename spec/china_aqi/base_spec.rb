require 'spec_helper'

RSpec.shared_examples 'raise NotImplementedError' do |instance_method_name|
  it "should raise NotImplementedError when call #{instance_method_name} method" do
    ChinaAqi.token = token
    expect { ChinaAqi::Base.new.send instance_method_name }.to raise_error(ChinaAqi::NotImplementedError, "Please set value for 'method' class attributes in 'ChinaAqi::Base' class.")
  end
end

describe ChinaAqi do
  let(:token) { '5j1znBVAsnSf5xQyNQyq' }

  describe ChinaAqi::Base do
    before { ChinaAqi.token = nil }

    it 'raise error when initial a object if there is no token' do
      expect { ChinaAqi::Base.new }.to raise_error(ChinaAqi::TokenMissingError)
    end

    it 'have instance variable to store token if token was seted' do
      ChinaAqi.token = 'token_sample'
      obj = ChinaAqi::Base.new
      expect(obj).to have_attributes(token: 'token_sample')
    end

    include_examples 'raise NotImplementedError', 'uri'
    include_examples 'raise NotImplementedError', 'get'
    include_examples 'raise NotImplementedError', 'url'

    it 'raise error when call get class method' do
      expect { ChinaAqi::Base.get('Shanghai') }.to raise_error(ChinaAqi::TokenMissingError)
    end
  end

  describe ChinaAqi::DynamicBase do
    it 'have city and parmas instance variable' do
      ChinaAqi.token = token
      obj = ChinaAqi::DynamicBase.new('Shanghai')
      expect(obj).to have_attributes(city: 'Shanghai')
      expect(obj).to have_attributes(parmas: { avg: true, stations: :yes, city: 'Shanghai', token: '5j1znBVAsnSf5xQyNQyq' })
    end
  end

  describe ChinaAqi::StaticBase do
    it 'have parmas instance variable' do
      ChinaAqi.token = token
      obj = ChinaAqi::StaticBase.new
      expect(obj).to have_attributes(parmas: { token: ChinaAqi.token })
    end
  end
end
