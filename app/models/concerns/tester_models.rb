module TesterModels

  module StateMachine
    extend ActiveSupport::Concern

    included do
      state_machine :initial => :draft do
        event :publish do
          transition :draft => :published
          transition :published => same
        end
        
        event :unpublish do
          transition any => :draft
          transition :draft => same
        end

        event :block do
          transition any => :blocked
          transition :blocked => same      
        end
      end
    end
  end

end