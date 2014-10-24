class AutoEvaluationsController < ApplicationController

def index
    @competences = Competence.all
    @forms = Form.all
end


end
