require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :model do

  let( :valid_attributes ) {
    {
      :name_user => "PAULO",
      :fub_registry => "110135431",
      :siape_registry => "110135431",
      :admission_date => "09-09-2014",
      :cost_center => "FGA"
    }
  }

  subject( :user ){
    user = User.new( valid_attributes )
  }

  describe '#search' do

    it "search by name" do
      search = "PAULO"
      search_option = "name"
      expect_result = User.where('name_user LIKE ?', "%#{search}%")
      search_result = User.search(search, search_option)
      expect(search_result).to eq(expect_result)
    end

    it "search by fub registry" do
      search = "110135431"
      search_option = "fub_registry"
      expect_result = User.where('fub_registry LIKE ?', "%#{search}%")
      search_result = User.search(search, search_option)
      expect(search_result).to eq(expect_result)
    end

    it "search no param" do
      search = nil
      search_option = nil
      search_result = User.search(search, search_option)
      expect(search_result).to eq( User.all )
    end

  end

  describe '#email_required' do

    it "email required return false" do
      result = user.email_required?
      expect(result).to eq(false)
    end

  end

  describe '#email_changed' do

    it "email changed return false" do
      result = user.email_changed?
      expect(result).to eq(false)
    end

  end

end
