module TesterControllers
  module StateMachine
    extend ActiveSupport::Concern

    included do
      def define_state_for_object
        x = controller_name.split('_').first
        y = x.classify.constantize

        obj = y.find(params[:pk])
        if params[:name] == 'state'
          if params[:value] == 'draft'
            obj.unpublish
          elsif params[:value] == 'published'
            obj.publish
          else
            obj.block
          end
        end
        
        render json: obj
      end
    end
  end

end