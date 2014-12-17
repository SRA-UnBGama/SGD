require 'rails_helper'
require 'spec_helper'

RSpec.describe WorkingCondition, :type => :model do

  let( :valid_working_condition_attributes ) {
    {
      :name => "WORK",
      :is_active => false
    }
  }

  subject( :working_condition ) {
    WorkingCondition.new( valid_working_condition_attributes )
  }

  describe '#max_number_of_working_conditions' do

    before do
      for i in 0..10 do
        WorkingCondition.create([{:name => "WORK #{i}", :is_active => true}])
      end
    end

    after do
      WorkingCondition.destroy_all( :is_active => true )
    end

    it "should extend max number" do
      working_condition.valid?
      expect(working_condition.errors[:name]).to(
        include("O número de condições de trabalho deve ser menor que 10."))
    end

  end

end
