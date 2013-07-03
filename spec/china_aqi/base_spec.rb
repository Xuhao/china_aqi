require 'spec_helper'

describe ChinaAqi do
  let(:token) { '5j1znBVAsnSf5xQyNQyq' }

  describe ChinaAqi::Base do
    before(:each) { ChinaAqi.token = nil }

    shared_examples "raise NotImplementedError" do |instance_method_name|
      it "should raise NotImplementedError when call #{instance_method_name} method" do
        ChinaAqi.token = token
        expect { ChinaAqi::Base.new.send instance_method_name }.to raise_error(ChinaAqi::NotImplementedError, "Please set value for 'method' class attributes in 'ChinaAqi::Base' class.")
      end
    end

    context 'Instace variable' do
      it 'should raise error when initial a object if there is no token' do
        expect { ChinaAqi::Base.new }.to raise_error(ChinaAqi::TokenMissingError)
      end

      it 'should have instance variable to store token if token was seted' do
        ChinaAqi.token = 'token_sample'
        obj = ChinaAqi::Base.new
        obj.instance_variable_defined?(:@token).should be_true
        obj.token.should eq('token_sample')
      end
    end

    context 'Instace methods' do
      include_examples "raise NotImplementedError", 'uri'
      include_examples "raise NotImplementedError", 'get'
      include_examples "raise NotImplementedError", 'url'
    end

    context 'Class methods' do
      it "should raise error when call get class method" do
        expect { ChinaAqi::Base.get('Shanghai') }.to raise_error
      end
    end
  end

  describe ChinaAqi::DynamicBase do
    it 'should have city and parmas instance variable' do
      ChinaAqi.token = token
      obj = ChinaAqi::DynamicBase.new('Shanghai')
      obj.instance_variable_defined?(:@city).should be_true
      obj.instance_variable_defined?(:@parmas).should be_true
    end
  end

  describe ChinaAqi::StaticBase do
    it 'should have parmas instance variable' do
      ChinaAqi.token = token
      obj = ChinaAqi::StaticBase.new
      obj.instance_variable_defined?(:@parmas).should be_true
    end
  end
end