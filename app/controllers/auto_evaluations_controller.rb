class AutoEvaluationsController < ApplicationController

def index
    @competences = Competence.all
    @forms = Form.all
    @working_conditions = WorkingCondition.all
    @goals = Goal.all
end


end
