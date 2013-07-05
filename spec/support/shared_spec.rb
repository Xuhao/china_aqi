describe ChinaAqi do
  shared_examples "common examples" do |klass, obj|
    it 'should return URI::HTTP object own context when call "uri" method' do
      uri = obj.uri
      uri.should be_a(URI::HTTP)
      uri.host.should eq('www.pm25.in')
      uri.path.should eq("/api/querys/#{klass.method.to_s}.json")
    end

    it 'should return url string with own context when call "url" method' do
      obj.url.should be_a(String)
      obj.url.include?("http://www.pm25.in/api/querys/#{klass.method.to_s}.json").should be_true
    end
  end

  shared_examples 'class attribute' do |klass, value|
    it "should have class attribute 'method' equal #{value}" do
      klass.method.should eq(value)
    end
  end

  shared_examples 'get array' do |klass|
    before(:each) { ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq' }
    let(:obj) { klass.new('Shanghai') }

    it 'should return an array with aqi data when call "get" method' do
      data = obj.get
      data.should be_a(Array)
      data.all? {|aqi| aqi.key? 'aqi'}.should be_true
    end
  end

  shared_examples "common dynamic examples" do |klass|
    ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'
    obj = klass.new('Shanghai')

    include_examples "common examples", klass, obj

  end

  shared_examples "common static examples" do |klass|
    ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'
    obj = klass.new

    include_examples "common examples", klass, obj
  end
end