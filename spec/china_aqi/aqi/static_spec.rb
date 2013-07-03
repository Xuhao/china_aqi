require 'spec_helper'

describe ChinaAqi do
  before(:each) { ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq' }

  ChinaAqi.token = '5j1znBVAsnSf5xQyNQyq'

  describe ChinaAqi::Global do
    include_examples "common static examples", ChinaAqi::Global
    include_examples "class attribute", ChinaAqi::Global, :all_cities
  end

  describe ChinaAqi::Ranking do
    include_examples "common static examples", ChinaAqi::Ranking
    include_examples "class attribute", ChinaAqi::Ranking, :aqi_ranking
  end
end